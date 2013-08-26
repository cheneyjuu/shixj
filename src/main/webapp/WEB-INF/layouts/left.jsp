<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="col-sm-3 hidden-xs">
    <ul class="navbar navbar-default side-bar">
        <li>
            <img class="logo" src="${ctx}/static/images/logo.png" alt=""/>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">首页</a>
        </li>
        <li class="dropdown parent">
            <div class="background-color menu-bg"></div>
            <a href="#">食享食分</a>
            <ul class="dropdown-menu">
                <li><a href="#">虾客行</a></li>
                <li><a href="#">灵山净素</a></li>
            </ul>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">团购食惠</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">有礼有节</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">食享课堂</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">品牌故事</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">合作伙伴</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">关于我们</a>
        </li>
    </ul>
</aside>