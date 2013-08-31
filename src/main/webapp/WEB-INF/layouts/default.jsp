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
    <link rel="stylesheet" href="${ctx}/static/styles/normalize.css">
    <link rel="stylesheet" href="${ctx}/static/styles/main.css">
    <script src="${ctx}/static/script/vendor/modernizr-2.6.2.min.js"></script>
    <style type="text/css">
        .dropdown-menu{
            -webkit-left:0;
        }
    </style>
    <sitemesh:head />
</head>
<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<header class="top" id="top">
    <div class="logo">
        <img src="${ctx}/static/images/logo.png" alt=""/>
    </div>
</header>

<div class="page-wrap container">
    <nav class="navbar navbar-default nav-outside" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav nav-justified nav-inside">
                <li>
                    <a href="${ctx}/home">首页</a>
                </li>
                <c:forEach items="${navHelperList}" var="nav">
                    <c:choose>
                        <c:when test="${fn:length(nav.navList) > 0}">
                            <li class="dropdown"><a href="${ctx}/views/${nav.id}" class="dropdown-toggle" data-toggle="dropdown">${nav.navName}</a>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${ctx}/views/${nav.id}">${nav.navName}</a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:if test="${nav.navList != null}">
                        <ul class="dropdown-menu">
                            <c:forEach items="${nav.navList}" var="cnav">
                                <li><a href="${ctx}/views/${cnav.id}">${cnav.navName}</a></li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    </li>
                </c:forEach>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
<sitemesh:body />
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
