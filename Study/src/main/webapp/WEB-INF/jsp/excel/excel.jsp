<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/2 0002
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请假记录</title>
    <link rel="stylesheet" type="text/css" href="${path}/layui/css/layui.css"/>
    <style>
        h3{
            color: white;
            text-shadow: 2px 2px 4px #000;
            font-size: 25px;
            text-align: center;
        }
    </style>
</head>
<body>
    <%@include file="../common/header.jsp"%>
    <div class="layui-container" style="margin-top:50px">
        <span class="layui-breadcrumb">
           <a href="">驰星教育</a>
           <a href="">信息导出</a>
           <a><cite>学生记录</cite></a>
        </span>
    </div>

    <div class="layui-container" style="margin-top:50px">
        <a href="${path}/excel/exportDefault" class="layui-btn"><i class="layui-icon">&#xe629;</i>默认导出Excel</a>
    </div>

    <div class="layui-collapse layui-container" lay-filter="test" style="margin-top: 20px">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title" style="background-color: white">点击更多可以设置更多的Excel样式.</h2>
            <div class="layui-colla-content">
                <div style="border: 1px dashed #ccc;padding: 20px;margin-top: 20px">
                    <form class="layui-form">
                        <div class="layui-form-item layui-row">
                            <label class="layui-form-label">Excel标题</label>
                            <div class="layui-input-block layui-col-md4">
                                <input type="text" name="title" placeholder="请输入Excel标题" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item layui-row">
                            <label class="layui-form-label">标题背景色</label>
                            <div class="layui-input-block layui-col-md4">
                                <input type="text" name="titleBgColor" placeholder="Excel标题行背景色" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item layui-row">
                            <label class="layui-form-label">标题字体</label>
                            <div class="layui-input-block layui-col-md4">
                                <input type="checkbox" name="titleFontStyle" title="粗体">
                                <input type="checkbox" name="titleFontStyle" title="斜体">
                                <input type="checkbox" name="titleFontStyle" title="下划线">
                            </div>
                        </div>
                        <div class="layui-form-item layui-row">
                            <label class="layui-form-label">标题字大小</label>
                            <div class="layui-input-block layui-col-md4">
                                <input name="titleFontSize" type="number" class="layui-input" value="12" min="12" max="32"/>
                            </div>
                        </div>
                        <div class="layui-form-item layui-row">
                            <label class="layui-form-label">标题字颜色</label>
                            <div class="layui-input-block layui-col-md4">
                                <input name="titleColor" type="text" class="layui-input"/>
                            </div>
                        </div>
                        <div class="layui-form-item layui-row">
                            <label class="layui-form-label">行背景色</label>
                            <div class="layui-input-block layui-col-md4">
                                <input type="text" name="rowBgColor" placeholder="Excel内容行背景色" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item layui-row">
                            <label class="layui-form-label">行字体字体</label>
                            <div class="layui-input-block layui-col-md4">
                                <input type="checkbox" name="rowFontStyle" title="粗体">
                                <input type="checkbox" name="rowFontStyle" title="斜体">
                                <input type="checkbox" name="rowFontStyle" title="下划线">
                            </div>
                        </div>
                        <div class="layui-form-item layui-row">
                            <label class="layui-form-label">行字体大小</label>
                            <div class="layui-input-block layui-col-md4">
                                <input type="number" name="rowFontSize" class="layui-input" value="12" min="12" max="32">
                            </div>
                        </div>
                        <div class="layui-form-item layui-row">
                            <label class="layui-form-label">行字体颜色</label>
                            <div class="layui-input-block layui-col-md4">
                                <input name="rowColor" type="text" class="layui-input"/>
                            </div>
                        </div>
                        <div class="layui-form" style="text-align: right">
                            <a href="${path}/excel/exportSet" class="layui-btn"><i class="layui-icon">&#xe629;</i>自定义样式导出Excel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <!--引入js文件-->
    <script src="${path}/dist/js/jquery.min.js"></script>
    <script src="${path}/layui/layui.js" type="text/javascript"></script>
    <script>
        layui.use(['element','form','layer'],function(){
            var element = layui.element;
            var form = layui.form;
            var layer= layui.layer;
        })
    </script>
</body>
</html>
