<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/11 0011
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看所有的作业</title>
    <link rel="stylesheet" type="text/css" href="${path}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/layui/css/layui.css"/>
</head>
<body>
    <%@include file="../common/header.jsp"%>

    <div class="layui-container" style="margin-top:30px">
    <span class="layui-breadcrumb" style="visibility: visible">
       <a href="">驰星教育</a>
        <span lay-separator="">/</span>
        <a href="">信息统计</a>
         <span lay-separator="">/</span>
       <a><cite>作业提交</cite></a>
    </span>
    </div>

    <div class="layui-container layui-row" style="margin-top: 20px;margin-bottom: 10px">
        <div class="layui-col-md3">
            <input type="text" placeholder="请您输入学生真实姓名查询" name="realName" id="realName" class="layui-input">
        </div>
        <div class="layui-col-md2">
            <button class="layui-btn" onclick="query()">查询</button>
        </div>
    </div>

    <div id="content">

    </div>

    <!--引入js文件-->
    <script src="${path}/dist/js/jquery.min.js"></script>
    <script src="${path}/dist/js/bootstrap.min.js"></script>
    <script src="${path}/layui/layui.js" type="text/javascript"></script>
    <script>
        layui.use(['layer','element'],function(){
            var layer = layui.layer;
            var element = layui.element;
        })

        $(function(){
           $("#content").load("${path}/file/queryPage");
        });

        function query(p){
            //获取查询文本输入框中的数据
            var data = $("#realName").val();
            //加载层默认风格
            layer.load();
            $("#content").load("${path}/file/queryPage",{"pageNow":p,"realName":data},function(){
                layer.closeAll();
            });
        }
    </script>
</body>
</html>
