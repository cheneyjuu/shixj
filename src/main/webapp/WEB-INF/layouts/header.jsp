<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="navbar navbar-inverse navbar-fixed-top bs-docs-nav">
    <div class="container">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a href="#" class="navbar-brand"></a>
        <div class="nav-collapse collapse bs-navbar-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#">首页</a>
                </li>
                <li>
                    <a href="#">热门产品</a>
                </li>
                <li class="active">
                    <a href="#">当季热卖</a>
                </li>
                <li>
                    <a href="#">定制</a>
                </li>
                <li>
                    <a href="#">关于我们</a>
                </li>
            </ul>
        </div>
    </div>
</div>