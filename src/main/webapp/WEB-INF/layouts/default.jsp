<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>食享家 <sitemesh:title /></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="${ctx}/static/styles/normalize.css">--%>
    <link rel="stylesheet" href="${ctx}/static/styles/main.css">
    <script src="${ctx}/static/script/vendor/modernizr-2.6.2.min.js"></script>
    <style type="text/css">

    </style>
    <sitemesh:head />
</head>
<body class="home">
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<%@include file="header.jsp"%>

<div class="page-wrap">
    <nav class="main-nav" id="main-nav">
        <a class="home" href="${ctx}/home">首页</a>
        <c:forEach items="${navHelperList}" var="nav" varStatus="st">
            <a href="${ctx}/views/${nav.id}">${nav.navName}</a>
        </c:forEach>
        <a href="#main-nav" class="show-hide-navigation" id="show-hide-navigation">
            导航
        </a>
    </nav>
    <div class="grid group">
        <sitemesh:body />
    </div>
</div>

<script src="http://cdn.staticfile.org/jquery/2.0.3/jquery.min.js"></script>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/static/script/plugins.js"></script>
<script src="${ctx}/static/script/main.js"></script>

<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<script>
    var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
        g.src='//www.google-analytics.com/ga.js';
        s.parentNode.insertBefore(g,s)}(document,'script'));
</script>
</body>
</html>
