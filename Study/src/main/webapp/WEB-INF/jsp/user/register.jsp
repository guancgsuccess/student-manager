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
    <title>登录界面</title>
    <link rel="stylesheet" type="text/css" href="${path}/layui/css/layui.css"/>
    <style>
        #register{
            border: 1px dashed #ccc;
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%@include file="../common/header.jsp"%>
    <div class="layui-container" style="margin-top:50px">
    <span class="layui-breadcrumb">
       <a href="">驰星教育</a>
       <a href="">信息统计</a>
       <a><cite>用户注册</cite></a>
    </span>
    </div>
    <div class="layui-container" id="register">
        <form class="layui-form" id="registerForm" action="${path}/user/register" method="post">
         <div class="layui-form-item layui-row">
             <div class="layui-col-md2">
                 <label class="layui-form-label">用户名</label>
             </div>
            <div class="layui-col-md4">
             <input type="text" name="username" id="username" required  lay-verify="required|username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
           </div>
             <div class="layui-form-mid layui-word-aux">*数字字母组成,长度至少6位.</div>
          </div>

            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">真实姓名</label>
                </div>
                <div class="layui-col-md4">
                    <input type="text" name="realName" required  lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">*必填</div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">联系方式</label>
                </div>
                <div class="layui-col-md4">
                    <input type="text" name="phone" required  lay-verify="phone|required" placeholder="请输入真实手机" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">*必填</div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">性别</label>
                </div>
                <div class="layui-input-block">
                          <input type="radio" name="gender" value="M" title="男">
                         <input type="radio" name="gender" value="F" title="女" checked>
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">密码</label>
                </div>
                <div class="layui-col-md4">
                    <input type="password" id="password" name="password" required lay-verify="password|required" placeholder="请输入有效密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">*长度至少6位</div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">确认密码</label>
                </div>
                <div class="layui-col-md4">
                    <input type="password" name="pwd" lay-verify="pwd|required" required placeholder="请输入确认密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">*和密码保持一致</div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-input-block" style="margin-left: 300px">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>

    <!--引入js文件-->
    <script src="${path}/dist/js/jquery.min.js"></script>
    <%--<script src="${path}/layui/layui.all.js" type="text/javascript"></script>--%>
    <script src="${path}/layui/layui.js" type="text/javascript"></script>
    <script>
        var flag = true;
        //失去焦点事件.判断用户名是否重复
        $('#username').blur(function(){
            //发送数据到后台..
            $.ajax({
                type:'post',
                url:'${path}/user/checkUserName',
                data:'username='+this.value,
                success:function(data){
                   if(data=='error'){
                       flag = false;
                       layer.msg("sorry,username is aleary exist");
                   }else{
                       flag = true;
                   }
                }
            })
        })


        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function(){
            var element = layui.element;
        });

        layui.use(['form', 'layedit', 'laydate'], function(){
            var form = layui.form;
            var layer = layui.layer;
            var layedit = layui.layedit;
            var laydate = layui.laydate;

            form.verify({
                username:function(value){
                    var reg = /^[a-z0-9]{6,}$/;
                    if(!reg.test(value)){
                        return '数字字母组成,长度至少6位';
                    }
                }
                ,password:function(value){
                    if(value.trim().length<=5){
                        return '密码长度不足六位';
                    }
                },pwd:function(value){
                      if(value!=$("#password").val()){
                          return '两次密码不一致';
                      }
                }
            });

            //创建一个编辑器
           layedit.build('LAY_demo_editor');

            //监听提交
            form.on('submit(formDemo)', function(data){
               // layer.alert(JSON.stringify(data.field), {
                  //  title: '最终的提交信息'
              //  })
              //  alert("==")
                if(!flag){
                    layer.msg("用户名已经存在!");
                    return false;
                }
                return flag;
            });

        });
    </script>
</body>
</html>
