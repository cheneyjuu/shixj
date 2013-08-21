<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><sitemesh:title /></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ctx}/static/boilerplate/css/normalize.css"/>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.0.0-rc1/css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" href="${ctx}/static/styles/default.css"/>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="http://cdn.staticfile.org/respond.js/1.2.0/respond.min.js"></script>
    <![endif]-->
    <sitemesh:head />
</head>
<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<%--<div class="container-fluid">--%>
    <%--<%@include file="header.jsp"%>--%>
<%--</div>--%>
<sitemesh:body />

<script src="http://cdn.staticfile.org/jquery/2.0.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0-rc1/js/bootstrap.min.js"></script>

</body>
</html>
