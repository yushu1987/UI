<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>自动化测试报告</title>
    <!--饼图-->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="{{url}}/my_static/my_html_js.js"></script>
    <script type="text/javascript" src="{{local_url}}/my_static/my_html_js.js"></script>
    <script type="text/javascript" src="{{url}}/my_static/success.js"></script>
    <script type="text/javascript" src="{{local_url}}/my_static/success.js"></script>
    <script type="text/javascript" src="{{url}}/my_static/skipped.js"></script>
    <script type="text/javascript" src="{{local_url}}/my_static/skipped.js"></script>
    <script type="text/javascript" src="{{url}}/my_static/failed.js"></script>
    <script type="text/javascript" src="{{local_url}}/my_static/failed.js"></script>
    <script type="text/javascript" src="{{url}}/my_static/errors.js"></script>
    <script type="text/javascript" src="{{local_url}}/my_static/errors.js"></script>
    <script type="text/javascript" src="{{url}}/my_static/unexpectedSuccess.js"></script>
    <script type="text/javascript" src="{{local_url}}/my_static/unexpectedSuccess.js"></script>
    <script type="text/javascript" src="{{url}}/my_static/exceptionFail.js"></script>
    <script type="text/javascript" src="{{local_url}}/my_static/exceptionFail.js"></script>
    <link rel="stylesheet" href="{{url}}/my_static/my_html_css.css">
    <link rel="stylesheet" href="{{local_url}}/my_static/my_html_css.css">
</head>
<body>
    <h1>{{project}}测试报告</h1>
    <p>&nbsp</p>            <!--线条-->

    <!--测试基本信息div-->
    <div class="public_background base_all base_msg">
        <table class="base_font_x_y">
            <tr><th>测试基本信息:</th></tr>
        </table>
        <table class="border_x_y">
            <tr>
                <td class="border_style">测试工具:</td>
                <td class="border_style font_width ">{{tool}}</td>
                <td class="border_style">测试环境:</td>
                <td class="border_style font_width ">{{science}}</td>
            </tr>
            <tr>
                <td class="border_style">测试版本:</td>
                <td class="border_style font_width ">{{version}}</td>
                <td class="border_style" title="计算规则:（错误数+失败数+成功数+意外成功数+预期失败数）/ 总用例数">用例执行率:</td>
                <td class="border_style font_width ">{{efficiency}}%</td>
            </tr>
            <tr>
                <td class="border_style">开始时间:</td>
                <td class="border_style font_width ">{{start_time}}</td>
                <td class="border_style">结束时间:</td>
                <td class="border_style font_width ">{{ends_time}}</td>
            </tr>
            <tr>
                <td class="border_style">用例最长用时:</td>
                <td class="border_style font_width">{{long_time}}</td>
                <td class="border_style">用例最短用时:</td>
                <td class="border_style font_width ">{{sort_time}}</td>
            </tr>
            <tr>
                <td class="border_style">执行耗时:</td>
                <td class="border_style font_width">{{execute_time}}</td>
                <td class="border_style">执行方式:</td>
                <td class="border_style font_width ">{{execute_method}}</td>
            </tr>
            <tr>
                <td class="border_style">总用例数:</td>
                <td class="border_style font_width">{{total_case}}条</td>
                <td class="border_style">失败数:</td>
                <td class="border_style font_width ">{{failed_case}}条</td>
            </tr>
            <tr>
                <td class="border_style">错误数:</td>
                <td class="border_style font_width">{{error_case}}条</td>
                <td class="border_style">成功数:</td>
                <td class="border_style font_width ">{{success_case}}条</td>
            </tr><tr>
                <td class="border_style">预期失败数:</td>
                <td class="border_style font_width">{{failure_case}}条</td>
                <td class="border_style">意外成功数:</td>
                <td class="border_style font_width ">{{unexpected_success_case}}条</td>
            </tr>
            <tr>
                <td class="border_style">跳过数:</td>
                <td class="border_style font_width">{{skipped_case}}条</td>
                <td class="border_style" title="计算规则: (成功数+意外成功数) / 总用例数">本次测试打分:</td>
                <td class="border_style">{{fraction}}%</td>
        </table>
    </div>

    <!--饼型图形-->
    <div class="pie_style" id="container">
        <script>pie_img('{{error_case}}', '{{success_case}}', '{{skipped_case}}', '{{failed_case}}', '{{unexpected_success_case}}', '{{failure_case}}')</script>
    </div>

    <!--测试列表展示数据-->
    <div class="table_style">
        <div class="tab_title">

            <!--table-->
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a data-toggle="tab" href="#fail" class="button hover click"
                       style="background-color: #B87070">失败数({{failed_case}}条)</a>
                </li>
                <li>
                    <a data-toggle="tab" href="#error" class="button hover click"
                       style="background-color: #EA0000">错误数({{error_case}}条)</a>
                </li>
                <li>
                    <a data-toggle="tab" href="#skip" class="button hover click"
                       style="background-color: #8E8E8E">跳过数({{skipped_case}}条)</a>
                </li>
                <li>
                    <a data-toggle="tab" href="#success" class="button hover click"
                       style="background-color: #006000">成功数({{success_case}}条)</a>
                </li><li>
                    <a data-toggle="tab" href="#failure" class="button hover click"
                       style="background-color: #FFA500">预期失败数({{failure_case}}条)</a>
                </li><li>
                    <a data-toggle="tab" href="#unexpected_success" class="button hover click"
                       style="background-color: #00BFFF">意外成功数({{unexpected_success_case}}条)</a>
                </li>
            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="fail"> <!--失败用例集合-->
                    <table id="failed_page" class="table-hover">
                        <thead>
                            <tr>
                                <th class="list_th catalog">目录</th>
                                <th class="list_th modules">模块</th>
                                <th class="list_th case">用例方法</th>
                                <th class="list_th address">测试地址</th>
                                <th class="list_th status">状态</th>
                                <th class="list_th time">用时</th>
                                <th class="list_th member">负责人</th>
                                <th class="list_th info">操作</th>
                            </tr>
                        </thead>
                        <tbody id="hide-failed-page">
                            {{fail_list}}
                        </tbody>
                    </table>
                    <ul class="pager page_style" id="failed_next">
                    </ul>
                    <ul class="pager page_style" id="failed_pre">
                    </ul>
                <script>failedMethod('failed_page')</script>
                </div>
                <div class="tab-pane fade in" id="error"> <!--错误用例集合-->
                    <table id="errors_page" class="table-hover">
                        <thead>
                            <tr>
                                <th class="list_th catalog">目录</th>
                                <th class="list_th modules">模块</th>
                                <th class="list_th case">用例方法</th>
                                <th class="list_th address">测试地址</th>
                                <th class="list_th status">状态</th>
                                <th class="list_th time">用时</th>
                                <th class="list_th member">负责人</th>
                                <th class="list_th info">操作</th>
                            </tr>
                        </thead>
                        <tbody id="hide-errors-page">
                            {{error_list}}
                        </tbody>
                    </table>
                    <ul class="pager page_style" id="errors_next">
                    </ul>
                    <ul class="pager page_style" id="errors_pre">
                    </ul>
                <script>errorsMethod('errors_page')</script>
                </div>
                <div class="tab-pane fade in" id="skip"> <!--跳过用例集合-->
                    <table id="skipped_page" class="table-hover">
                        <thead>
                            <tr>
                                <th class="list_th catalog">目录</th>
                                <th class="list_th modules">模块</th>
                                <th class="list_th case">用例方法</th>
                                <th class="list_th address">测试地址</th>
                                <th class="list_th status">状态</th>
                                <th class="list_th time">用时</th>
                                <th class="list_th member">负责人</th>
                                <th class="list_th info">操作</th>
                            </tr>
                        </thead>
                        <tbody id="hide-skipped-page">
                            {{skip_list}}
                        </tbody>
                    </table>
                    <ul class="pager page_style" id="skip_next">
                    </ul>
                    <ul class="pager page_style" id="skip_pre">
                    </ul>
                <script>skippedMethod('skipped_page')</script>
                </div>

                <div class="tab-pane fade in" id="success"> <!--成功用例集合-->
                    <table id="success_page" class="table-hover">
                        <thead>
                            <tr>
                                <th class="list_th catalog">目录</th>
                                <th class="list_th modules">模块</th>
                                <th class="list_th case">用例方法</th>
                                <th class="list_th address">测试地址</th>
                                <th class="list_th status">状态</th>
                                <th class="list_th time">用时</th>
                                <th class="list_th member">负责人</th>
                                <th class="list_th info">操作</th>
                            </tr>
                        </thead>
                        <tbody id="hide-success-page">
                            {{success_list}}
                        </tbody>
                    </table>
                    <ul class="pager page_style" id="success_next">
                    </ul>
                    <ul class="pager page_style" id="success_pre">
                    </ul>
                <script>successMethod('success_page')</script>
                </div>

                <div class="tab-pane fade in" id="failure"> <!--期望失败用例集合-->
                    <table id="failure_page" class="table-hover">
                        <thead>
                            <tr>
                                <th class="list_th catalog">目录</th>
                                <th class="list_th modules">模块</th>
                                <th class="list_th case">用例方法</th>
                                <th class="list_th address">测试地址</th>
                                <th class="list_th status">状态</th>
                                <th class="list_th time">用时</th>
                                <th class="list_th member">负责人</th>
                                <th class="list_th info">操作</th>
                            </tr>
                        </thead>
                        <tbody id="hide-exceptionFail-page">
                            {{failure_list}}
                        </tbody>
                    </table>
                    <ul class="pager page_style" id="exceptionFail_next">
                    </ul>
                    <ul class="pager page_style" id="exceptionFail_pre">
                    </ul>
                <script>exceptionFailMethod('failure_page')</script>
                </div>

                <div class="tab-pane fade in" id="unexpected_success"> <!--意外成功用例集合-->
                    <table id="unexpected_page" class="table-hover">
                        <thead>
                            <tr>
                                <th class="list_th catalog">目录</th>
                                <th class="list_th modules">模块</th>
                                <th class="list_th case">用例方法</th>
                                <th class="list_th address">测试地址</th>
                                <th class="list_th status">状态</th>
                                <th class="list_th time">用时</th>
                                <th class="list_th member">负责人</th>
                                <th class="list_th info">操作</th>
                            </tr>
                        </thead>
                        <tbody id="hide-unexpectedSuccess-page">
                            {{unexpected_success_list}}
                        </tbody>
                    </table>
                    <ul class="pager page_style" id="unexpectedSuccess_next">
                    </ul>
                    <ul class="pager page_style" id="unexpectedSuccess_pre">
                    </ul>
                <script>unexpectedSuccessMethod('unexpected_page')</script>
                </div>
            </div>
        </div>
    </div>

    <!--弹窗详情-->
    {{popUP}}

</body>
</html>