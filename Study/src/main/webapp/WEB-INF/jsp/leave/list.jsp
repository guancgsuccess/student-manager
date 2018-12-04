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
</head>
<body>
    <%@include file="../common/header.jsp"%>
    <div class="layui-container" style="margin-top:50px">
        <span class="layui-breadcrumb">
           <a href="">驰星教育</a>
           <a href="">信息查询</a>
           <a><cite>请假记录</cite></a>
        </span>
    </div>

    <div class="layui-container">
        <table class="layui-hide" id="test" lay-filter="demo"></table>
    </div>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <!--引入js文件-->
    <script src="${path}/dist/js/jquery.min.js"></script>
    <script src="${path}/layui/layui.js" type="text/javascript"></script>
    <script>
        layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
            var laydate = layui.laydate //日期
                ,laypage = layui.laypage //分页
            layer = layui.layer //弹层
                ,table = layui.table //表格
                ,carousel = layui.carousel //轮播
                ,upload = layui.upload //上传
                ,element = layui.element; //元素操作

            //监听Tab切换
            element.on('tab(demo)', function(data){
                layer.msg('切换了：'+ this.innerHTML);
                console.log(data);
            });

            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,height:400
                ,url:'${path}/leave/query'
                ,page: true //开启分页
                ,cols: [[ //表头
                     {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                    ,{field: 'realName', title: '真实姓名', width:110}
                    ,{field: 'phone', title: '联系方式', width:150}
                    ,{field: 'remarks', title: '请假事由', width:230}
                    ,{field: 'hours', title: '请假时长', width:90}
                    ,{field: 'day', title: '请假天数', width:90}
                    ,{field: 'sDate', title: '开始时间', width:190}
                    ,{field: 'eDate', title: '结束时间', width:190}
                    /*,{fixed: 'right', width: 200, align:'center', toolbar: '#barDemo'}*/

                    /*,{field: 'sex', title: '性别', width:80, sort: true}
                     ,{field: 'city', title: '城市', width:80}
                     ,{field: 'sign', title: '签名', width: 170}
                     ,{field: 'experience', title: '积分', width: 80, sort: true}
                     ,{field: 'score', title: '评分', width: 80, sort: true}
                     ,{field: 'classify', title: '职业', width: 80}
                     ,{field: 'wealth', title: '财富', width: 135, sort: true}
                     */
                ]]
            });

            //监听工具条
            table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'detail'){
                    layer.msg('查看操作');
                } else if(layEvent === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        obj.del(); //删除对应行（tr）的DOM结构
                        layer.close(index);
                        //向服务端发送删除指令
                    });
                } else if(layEvent === 'edit'){
                    layer.msg('编辑操作');
                }
            });

            //执行一个轮播实例
            carousel.render({
                elem: '#test1'
                ,width: '100%' //设置容器宽度
                ,height: 200
                ,arrow: 'none' //不显示箭头
                ,anim: 'fade' //切换动画方式
            });

            //将日期直接嵌套在指定容器中
            var dateIns = laydate.render({
                elem: '#laydateDemo'
                ,position: 'static'
                ,calendar: true //是否开启公历重要节日
                ,mark: { //标记重要日子
                    '0-10-14': '生日'
                    ,'2017-11-11': '剁手'
                    ,'2017-11-30': ''
                }
                ,done: function(value, date, endDate){
                    if(date.year == 2017 && date.month == 11 && date.date == 30){
                        dateIns.hint('一不小心就月底了呢');
                    }
                }
                ,change: function(value, date, endDate){
                    layer.msg(value)
                }
            });

            //分页
            laypage.render({
                elem: 'pageDemo' //分页容器的id
                ,count: 100 //总页数
                ,skin: '#1E9FFF' //自定义选中色值
                //,skip: true //开启跳页
                ,jump: function(obj, first){
                    if(!first){
                        layer.msg('第'+ obj.curr +'页');
                    }
                }
            });

            //上传
            upload.render({
                elem: '#uploadDemo'
                ,url: '' //上传接口
                ,done: function(res){
                    console.log(res)
                }
            });
        });
    </script>
</body>
</html>
