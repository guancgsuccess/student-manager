<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/12 0012
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!--列表主体开始-->
    <div class="container">
        <div class="table-responsive">
            <table class="table table-hover">
                <caption>作业提交信息</caption>
                <thead>
                <tr class="active">
                    <th><input type="checkbox">
                    <th style="width: 50px">编号</th>
                    <th>真名</th>
                    <th>用户名</th>
                    <th>提交路径</th>
                    <th>作业标题</th>
                    <th>提交时间</th>
                    <th style="width: 50px">删除</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.list}" var="task" varStatus="vs">
                    <tr>
                        <td><input type="checkbox" value="${task.id }" class="cks" name="cks" /></td>
                        <td>${vs.count }</td>
                        <td><a href="#">${task.realName}</a></td>
                        <td>${task.userName }</td>
                        <td>${task.taskUrl }</td>
                        <td>${task.title }</td>
                        <td><fmt:formatDate value="${task.createDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                           <a href="#" class="text-danger"><span class="glyphicon glyphicon-trash"></span></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <!--列表主体结束-->
    <c:if test="${page.pageNow+2>=page.pageCount}">
        <c:set var="startPage" value="${page.pageCount-2}"></c:set>
    </c:if>

    <c:if test="${page.pageNow+2<page.pageCount}">
        <c:set var="startPage" value="${page.pageNow}"></c:set>
    </c:if>

    <!--分页-->
    <div class="container" align="center">
        <ul class="pagination">

            <c:if test="${page.pageNow>1}">
                <li><a href="#" onclick="query(${page.pageNow-1})">&laquo;</a></li>
            </c:if>

            <c:if test="${page.pageNow<=1}">
                <li class="disabled"><a href="#">&laquo;</a></li>
            </c:if>

            <c:forEach begin="${startPage<=0?1:startPage}" var="p" end="${startPage+2}" >
                <c:if test="${page.pageNow==p}">
                    <li class="active"><a href="#" onclick="query(${p})">${p}</a></li>
                </c:if>

                <c:if test="${page.pageNow!=p}">
                    <li><a href="#" onclick="query(${p})">${p}</a></li>
                </c:if>

            </c:forEach>

            <c:if test="${page.pageNow>=page.pageCount}">
                <li class="disabled"><a href="#">&raquo;</a></li>
            </c:if>
            <c:if test="${page.pageNow<page.pageCount}">
                <li><a href="#" onclick="query(${page.pageNow+1})">&raquo;</a></li>
            </c:if>

            <li><a style="border: 0px;margin-left: 0px;">当前页${page.pageNow }/${page.pageCount }总页</a></li>
        </ul>
    </div>

