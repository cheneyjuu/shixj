<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
        <c:forEach items="${navHelperList}" var="nav">
            <c:choose>
                <c:when test="${fn:length(nav.navList) > 0}">
                    <li class="dropdown">
                </c:when>
                <c:otherwise>
                    <li>
                </c:otherwise>
            </c:choose>
                <div class="background-color menu-bg"></div>
                <a href="#">${nav.navName}</a>
                <c:if test="${nav.navList != null}">
                    <ul class="dropdown-menu">
                        <c:forEach items="${nav.navList}" var="cnav">
                            <li><a href="#">${cnav.navName}</a></li>
                        </c:forEach>
                    </ul>
                </c:if>
            </li>
        </c:forEach>

    </ul>
</aside>