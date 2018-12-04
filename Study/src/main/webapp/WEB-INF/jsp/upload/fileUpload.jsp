<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/2 0002
  Time: 19:51..
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>作业上传</title>
    <link rel="stylesheet" type="text/css" href="${path}/layui/css/layui.css"/>
    <style>
        #login{
            border: 1px dashed #ccc;
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%@include file="../common/header.jsp"%>

    <div class="layui-container" style="margin-top: 50px">
        <span class="layui-breadcrumb">
               <a href="">驰星教育</a>
               <a href="">资料上传</a>
               <a><cite>作业上传</cite></a>
        </span>
    </div>
    <div class="layui-container" style="margin-top: 50px;">
        <button type="button" class="layui-btn" id="test1">
            <i class="layui-icon">&#xe67c;</i>上传作业
        </button>
        <div class="layui-progress layui-progress-big" lay-filter="demo" lay-showPercent="true" style="margin-top: 20px">
            <div class="layui-progress-bar" lay-percent="0%"></div>
        </div>
    </div>

    <%--<script src="${path}/layui/layui.all.js" type="text/javascript"></script>--%>
    <script src="${path}/layui/layui.js" type="text/javascript"></script>
    <script>
      /*  layui.use('element', function(){
            var element = layui.element;
        });*/
        layui.use(['upload','element'], function(){
            var upload = layui.upload;
            var element = layui.element;

            //执行实例
            var uploadInst = upload.render({
                elem: '#test1' //绑定元素
                ,url: '${path}/file/upload' //上传接口
                ,accept:'file'
                //设置文件传大小
             /*   ,size:'102400'*/
                ,drag:true
                ,before:function(){
                    element.progress('demo', '0%');
                }
                ,done: function(res){
                    //上传完毕回调
                   layer.msg("作业上传成功!",{icon:6});
                   element.progress('demo', '100%');
                }
                ,error: function(res){
                  // alert(res);
                }
            });
        });
    </script>
</body>
</html>
