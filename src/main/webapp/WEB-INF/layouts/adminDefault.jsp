<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Mobile first web app theme | first</title>
    <meta name="description" content="mobile first, app, web app, responsive, admin dashboard, flat, flat ui">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/styles/backend/app.v3.css">
    <script type="text/javascript" src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <!--[if lt IE 9]> <script src="http://cdn.staticfile.org/respond.js/1.2.0/respond.min.js"></script> <script src="http://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script> <script src="js/ie/excanvas.js"></script> <![endif]-->
    <script src="${ctx}/static/script/backend/app.v3.js"></script>
    <sitemesh:head />
</head>

<body>
<%@include file="adminHeader.jsp"%>
<%@include file="adminLeft.jsp"%>
<section class="main padder" id="content">
    <sitemesh:body />
</section>
</body>
</html>