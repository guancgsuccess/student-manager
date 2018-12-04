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
    <title>登录界面</title>
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
    <!--jsp代码块 - 获取cookie中的值-->
    <%
        Cookie[] cookies = request.getCookies();
        //判断cookies是否存在
        if(null!=cookies && cookies.length>0){
            for(Cookie c:cookies){
                if("login".equals(c.getName())){
                    String[] arr = c.getValue().split(":");
                    String uname = arr[0];
                    String pwd = arr[1];
                    request.setAttribute("uname",uname);
                    request.setAttribute("pwd",pwd);
                }
            }
        }
    %>

    <%@include file="../common/header.jsp"%>

    <div class="layui-container" style="margin-top: 50px">
        <span class="layui-breadcrumb">
               <a href="">驰星教育</a>
               <a href="">信息统计</a>
               <a><cite>用户登录</cite></a>
        </span>
    </div>

    <div class="layui-container" id="login">
        <form class="layui-form" id="loginForm" method="post">
            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">用户名</label>
                </div>
                <div class="layui-col-md4">
                    <input value="${uname}" type="text" name="username" id="username" required  lay-verify="required|username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
                <%--<div class="layui-form-mid layui-word-aux">*用户名不存在</div>--%>
            </div>

            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">密码</label>
                </div>
                <div class="layui-col-md4">
                    <input value="${pwd}" type="password" id="password" name="password" required lay-verify="password|required" placeholder="请输入有效密码" autocomplete="off" class="layui-input">
                </div>
               <%-- <div class="layui-form-mid layui-word-aux" >*密码错误</div>--%>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md-6 layui-col-lg-offset2">
                    <input type="checkbox" name="flag" title="记住密码">
                </div>
            </div>

            <div class="layui-form-item layui-row">
                <div class="layui-input-block" style="margin-left: 300px">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                </div>
            </div>
        </form>
    </div>

    <!--引入js文件-->
    <script src="${path}/dist/js/jquery.min.js"></script>
    <%--<script src="${path}/layui/layui.all.js" type="text/javascript"></script>--%>
    <script src="${path}/layui/layui.js" type="text/javascript"></script>
    <script>
        layui.use('element', function(){
            var element = layui.element;
        });

        //登录
        layui.use(['form', 'layedit', 'laydate'], function() {
            var form = layui.form;
            form.on('submit(formDemo)', function(){
               var formData = $("#loginForm").serialize();
                $.ajax({
                   type:'post',
                    data:formData,
                    url:'${path}/user/login',
                    success:function(data){
                        if(data=="0"){
                            layer.msg("对不起,用户名不存在!")
                        }else if(data=="2"){
                            layer.msg("对不起,密码错误!")
                        }else{
                            window.location="${path}"
                        }
                    }
                });
               return false;
            });
        });
    </script>
</body>
</html>
