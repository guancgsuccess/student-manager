<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="layui-container">
    <ul class="layui-nav">
        <li class="layui-nav-item">
            <a href="">在线人数<span class="layui-badge">9</span></a>
        </li>
        <li class="layui-nav-item">
            <a href="${path}">首页</a>
        </li>
        <c:if test="${user.status==1}">
            <li class="layui-nav-item">
                <a href="">信息录入</a>
                <dl class="layui-nav-child">
                    <dd><a href="${path}/leave/leaveView">请假录入</a></dd>
                    <dd><a href="">违纪录入</a></dd>
                </dl>
            </li>
        </c:if>

        <c:if test="${user.status==1}">
            <li class="layui-nav-item">
                <a href="">信息查询</a>
                <dl class="layui-nav-child">
                    <dd><a href="${path}/user/list">查询学生信息</a></dd>
                    <dd><a href="${path}/leave/list">请假记录</a></dd>
                </dl>
            </li>
        </c:if>

        <li class="layui-nav-item">
            <a href="">作业管理</a>
            <dl class="layui-nav-child">
                <dd><a href="${path}/file/uploadView">作业上传</a></dd>
                <c:if test="${user.status==1}">
                    <dd><a href="${path}/file/list">查看所有作业</a></dd>
                </c:if>
                <c:if test="${user.status==0}">
                    <dd><a href="">查看提交作业</a></dd>
                </c:if>
            </dl>
        </li>
        <c:if test="${user.status==1}">
            <li class="layui-nav-item">
                <a href="${path}/menu/list">菜单管理</a>
            </li>
        </c:if>
        <c:if test="${null==user}">
           <li class="layui-nav-item">
                <a href="${path}/user/registerView">注册</a>
            </li>
        </c:if>
        <c:if test="${user==null}">
            <li class="layui-nav-item">
                <a href="${path}/user/loginView">登录</a>
            </li>
        </c:if>

        <c:if test="${null!=user}">
            <li class="layui-nav-item">
                <a><img src="/Study/img/james.jpg" class="layui-nav-img">${user.realName}</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">修改信息</a></dd>
                    <dd><a href="javascript:;">安全管理</a></dd>
                    <dd><a href="${path}/user/exit">退了</a></dd>
                </dl>
            </li>
        </c:if>
    </ul>
</div>