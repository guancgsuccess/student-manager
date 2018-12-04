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
       <a><cite>请假录入</cite></a>
    </span>
    </div>
    <div class="layui-container" id="register">
        <form class="layui-form" id="registerForm" action="${path}/leave/save" method="post">
         <div class="layui-form-item layui-row">
             <div class="layui-col-md2">
                 <label class="layui-form-label">请假人</label>
             </div>
            <div class="layui-col-md4">
             <input type="text" name="realName" id="username" required  lay-verify="required|username" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
           </div>
             <div class="layui-form-mid layui-word-aux">*必填</div>
          </div>

            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">联系方式</label>
                </div>
                <div class="layui-col-md4">
                    <input readonly type="text" id="phone" name="phone" required  lay-verify="required|phone" placeholder="请输入真实联系方式" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">*必填</div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">请假事由</label>
                </div>
                <div class="layui-col-md4">
                   <textarea class="layui-textarea" lay-verify="required" name="remarks"></textarea>
                </div>
                <div class="layui-form-mid layui-word-aux">*必填</div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">开始时间</label>
                </div>
                <div class="layui-col-md4">
                    <input class="layui-input"  lay-verify="required" type="text" name="start" id="start-date">
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">结束时间</label>
                </div>
                <div class="layui-col-md4">
                    <input class="layui-input"  lay-verify="required" name="end" type="text" id="end-date">
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">请假天数</label>
                </div>
                <div class="layui-col-md4">
                    <input class="layui-input"  lay-verify="required" name="day" type="number" value="0">
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-col-md2">
                    <label class="layui-form-label">请假时长</label>
                </div>
                <div class="layui-col-md4">
                    <input class="layui-input"  lay-verify="required|number" name="hours" type="text" value="0.0">
                </div>
            </div>
            <div class="layui-form-item layui-row">
                <div class="layui-input-block" style="margin-left: 300px">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">请假录入</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>

    <!--引入js文件-->
    <script src="${path}/dist/js/jquery.min.js"></script>
    <script src="${path}/layui/layui.js" type="text/javascript"></script>
    <script>
        var flag = true;
        $(function(){
            $("#username").blur(function(){
                    $.ajax({
                        type:'post',
                        url:'${path}/user/getPhone',
                        data:"realName="+this.value,
                        success:function(data){
                            if(data=="error"){
                                layer.msg("sorry,请输入真实姓名.");
                                flag = false;
                                return false;
                            }else{
                                $("#phone").val(data);
                                flag = true;
                            }
                        }
                    });
            })
        })

        //提交按钮的监听事件
        layui.use('form',function(){
            var form = layui.form;
            form.on('submit(formDemo)',function(){
                if(!flag){
                    layer.msg("sorry,请输入真实姓名!");
                    return false;
                }
                return flag;
            });
        });

        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function(){
            var element = layui.element;
        });
        $(function(){
            layui.use('laydate',function (laydate) {
                var laydate = layui.laydate;
                var startDate = laydate.render({
                   elem:"#start-date",
                   type:'datetime',
                   done:function(value,dates){
                       endDate.config.min = {
                           date:dates.date,
                           year:dates.year,
                           month:dates.month-1,
                           hours:dates.hours,
                           minutes:dates.minutes,
                           seconds:dates.seconds
                       }
                   }
               });
               var endDate = laydate.render({
                   elem:"#end-date",
                   type:'datetime',
                   done:function(value,dates){
                       startDate.config.max={
                           year:dates.year,
                           month:dates.month-1,
                           date:dates.date,
                           hours:dates.hours,
                           minutes:dates.minutes,
                           seconds:dates.seconds
                       }
                   }
               })
            });
        })
    </script>
</body>
</html>
