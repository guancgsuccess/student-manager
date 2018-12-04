<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8>
	<!--让浏览器使用最新的IE内核进行渲染页面-->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>资料下载</title>
	<link rel="stylesheet" type="text/css" href="${path}/layui/css/layui.css"/>
	<!-- zTree -->
	<link rel="stylesheet" href="${path }/zTree_v3/css/zTreeCustom.css" type="text/css">
	<link rel="stylesheet" href="${path }/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body bgColor="#F0F0F0">
	<%@include file="common/header.jsp"%>

	<div class="layui-container" style="margin-top:50px">
        <span class="layui-breadcrumb">
           <a href="">驰星教育</a>
           <a href="">预览和下载</a>
           <a><cite>点击节点</cite></a>
        </span>
	</div>

	<div class="layui-container">
		<div class="content_wrap">
			<div class="zTreeDemoBackground left">
				<ul id="treeDemo" class="ztree" style='height:auto'></ul>
			</div>
		</div>
	</div>
	
	<!--引入js文件-->
	<script src="${path}/js/jquery-3.2.1.min.js"></script>
	<script src="/Study/layui/layui.all.js" type="text/javascript"></script>
	<script type="text/javascript" src="${path }/zTree_v3/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${path }/zTree_v3/js/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="${path }/zTree_v3/js/jquery.ztree.exedit.js"></script>
	<script>
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use(['element'], function(){
		    var element = layui.element
		});

	    function info(){
	    	layui.use('layer', function(){
	    		  var layer = layui.layer;
	    		  layer.open({
	    			  type:0,
	    			  skin: 'layui-layer-lan',
	    			  title:'管成功',
	    			  //content:'sss'
	    			  content:'<div class="layui-container"><h3>驰星项目经理</h3><h4>QQ:849962874</h4><img width="280px" height="200px" src="/Study/img/houzi.jpg"/></div>'
	    		  })
	    	});   
	    }

        var setting = {
            async: {
                enable: true,
                url:"${path}/menu/query",
                autoParam:["id", "name", "level"],
                otherParam:{"otherParam":"zTreeAsyncTest"},
            },
            view: {expandSpeed:"",
                selectedMulti: false
            },
            edit: {
                enable: false
            },
            data : {
				/* keep: {
				 parent:true,
				 leaf:true
				 }, */
                key : {
                    name : "name"
                },
                simpleData : {
                    enable : true,
                    idKey : "id",
                    pIdKey : "pId",
                    rootPId : 1
                }
            },
            callback: {//操作前的回调函数
				beforeClick:beforeClick
            }
        };

        function initTree(){
            $.fn.zTree.init($("#treeDemo"), setting);
            setTimeout(function(){
                var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                treeObj.expandAll(true);
            },1000);//延迟加载
            // $("#menuForm")[0].reset();
        }

        $(document).ready(function(){
            initTree();
        });

        /**
         * 节点点击事件
         */
        function beforeClick(treeId,node){
            $.ajax({
                type:'post',
                url:'${path}/menu/getById',
                data:"id="+node.id,
                success:function(data){
                 	window.location='${path}'+data.mUrl;
                }
            });
		}

	  /*  $.ajax({
			type:'post',
			url:'{path}/menu/menuIndex',
			success:function(data){

			   layui.tree({
				   elem:'#demo',
				   nodes:eval(data.menuVo)
			   })
			}
		})*/

	   // layui.tree({
		//	  elem: '#demo' //传入元素选择器
			  //,nodes: JSON.parse($.getJSON('${path}/menu/menuIndex'))
			   /*[{ //节点
			    name: '在线预览'
			    ,children:
				[{
			      name: 'day01',
			      href:'/Study/corejava/build/day01.html',
			    },{
			      name: 'day02',
			      href:'/Study/corejava/build/day02.html'
			    },{
			      name: 'day03',
			      href:'/Study/corejava/build/day03.html'
			    },{
                    name: 'day04',
                    href:'/Study/corejava/build/day04.html'
                },{
                    name: 'day05',
                    href:'/Study/corejava/build/day05.html'
                }]
			  },{
			    name: '本地下载'
			    ,children: [{
			      name: '面试题目',
			      href:'/Study/soft/面试题目.zip'
			    },{
			      name: '笔记',
			      href:'/Study/code/note.zip'
			    },{
			      name: '工程代码',
			      href:'/Study/code/CoreJava.zip'
			    },{
                    name: '前端',
                    href:'/Study/soft/web.zip'
                },{
                    name: 'Java核心卷',
                    href:'/Study/soft/Java核心卷.zip'
                }]
			  }]*/
		//	});
	</script>
</body>
</html>