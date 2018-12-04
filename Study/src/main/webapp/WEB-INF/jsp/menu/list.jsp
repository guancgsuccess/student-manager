<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/4 0004
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜单管理</title>
    <link rel="stylesheet" type="text/css" href="${path}/layui/css/layui.css">
    <!-- zTree -->
    <link rel="stylesheet" href="${path }/zTree_v3/css/zTreeCustom.css" type="text/css">
    <link rel="stylesheet" href="${path }/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <style>
        .ztree li span.button.add {
            margin-left:2px;
            margin-right: -1px;
            background-position:-144px 0;
            vertical-align:top;
            *vertical-align:middle
        }
    </style>
</head>
<body>
    <%@include file="../common/header.jsp"%>

    <div class="layui-container" style="margin-top:50px">
        <span class="layui-breadcrumb">
           <a href="">驰星教育</a>
           <a href="">菜单管理</a>
           <a><cite>CRUD</cite></a>
        </span>
    </div>
    <div class="layui-row layui-container">
        <div class="layui-col-md4 layui-sm-md4 layui-col-xs6">
                <div class="content_wrap">
                    <div class="zTreeDemoBackground left">
                        <ul id="treeDemo" class="ztree" style='height:auto'></ul>
                    </div>
                </div>
        </div>
        <div class="layui-col-md6 layui-col-sm6 layui-col-xs6" style="border:1px solid #ccc;margin-top: 80px;padding:30px 20px">
            <form class="layui-form" id="formData">
                <input type="hidden" id="mid" name="id">
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label layui-text">菜单名称</label>
                    <div class="layui-col-md8">
                        <input type="text" id="name" readonly="readonly" name="name" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label layui-text">菜单路径</label>
                    <div class="layui-col-md8">
                        <input type="text" id="mUrl" name="mUrl" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-disabled" disabled="disabled" id="updateBtn" lay-submit lay-filter="updateBtn">修改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="${path}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${path}/layui/layui.js"></script>
    <script type="text/javascript" src="${path }/zTree_v3/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${path }/zTree_v3/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${path }/zTree_v3/js/jquery.ztree.exedit.js"></script>
    <script>
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use(['layer','element'], function(){
            var layer = layui.layer;
            var element = layui.element;
        });

        var setting = {
            async: {
                enable: true,
                url:"${path}/menu/query",
                autoParam:["id", "name", "level"],
                otherParam:{"otherParam":"zTreeAsyncTest"},
            },
            view: {expandSpeed:"",
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                selectedMulti: false
            },
            edit: {
                enable: true
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
                beforeRemove: beforeRemove,
                beforeRename:beforeRename,
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

        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
                //新增节点入库
               saveNodes(treeNode.id,"new node" + (newCount++));
                return false;
            });
        };

        /**
         * 新增节点入库
         */
        function saveNodes(pId,name){
            $.ajax({
                type:'post',
                data:{"pId":pId,"name":name},
                url:'${path}/menu/saveNodes',
                success:function(data){
                    //重新加载...
                    initTree();
                }
            })
        }

        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };

        /**删除节点**/
        function beforeRemove(treeId,treeNode){
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.selectNode(treeNode);
            layer.confirm('确认删除'+treeNode.name+'节点吗？', {
                btn: ['yes','no'] //按钮
            }, function(){
                //layer.msg('的确很重要', {icon: 1});
                //调用删除节点的函数
                deleteNode(treeNode.id,treeNode.getParentNode().id);
            }, function(){
                layer.msg('也可以这样', {
                    time: 20000, //20s后自动关闭
                    btn: ['明白了', '知道了']
                });
            });
        }

        /**异步删除节点**/
        function deleteNode(id,pId,tId){
            $.ajax({
                type:'post',
                data:{"id":id,"pId":pId},
                url:'${path}/menu/deleteNodes',
                success:function(data){
                    if(data=="success"){
                        layer.msg("删除节点成功!",{icon:1});
                    }else{
                        layer.msg("找到子记录!删除失败",{icon:1});
                    }
                }
            });
        }

        /**
         * 修改节点名称
         */
        function beforeRename(treeId, treeNode, newName) {
            if (newName.length == 0) {
                setTimeout(function() {
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    zTree.cancelEditName();
                    alert("节点名称不能为空.");
                }, 0);
                return false;
            }
            //更新数据库
            updateNode(treeNode.id,newName);
            return true;
        }

        /**异步更新**/
        //更新数据库
        function updateNode(id,name){
            $.ajax({
                url:"${path}/menu/updateNodes",
                data:{"id":id,"name":name},
                type:"post",
                success:function(msg){
                    if(msg=="success"){
                        layer.msg("更新节点名称成功",{icon:1});
                        $("#name").val(name);
                    }
                }
            })
        }
        /**
         * 节点点击事件
         */
        function beforeClick(treeId,node){
            $.ajax({
               type:'post',
                url:'${path}/menu/getById',
                data:"id="+node.id,
                success:function(data){
                    $("#name").val(data.name);
                    $("#mUrl").val(data.mUrl);
                    $("#mid").val(data.id);
                    $("#updateBtn").attr("disabled",false).attr("class","layui-btn")
                }
            });
        }

        /**提交按钮的监听事件**/
       layui.use('form',function(){
            var form = layui.form;
            form.on('submit(updateBtn)',function(){
                var formData = $("#formData").serialize();
               $.ajax({
                   type:'post',
                    data:formData,
                   url:'${path}/menu/updateUrl',
                   success:function(data){
                       if(data=="success"){
                           layer.msg("菜单路径更新成功!");
                       }
                   }
               }) ;
               return false;
            });
       });
    </script>
</body>
</html>
