<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">
        .product-row{
            border: 1px solid #cccccc;
            border-radius: 2px;
            background: #ffffff;
            box-shadow: 0 1px 10px #999;
            height: 22em;
            max-height: 22em;
            margin: 15px;
            width: 30%;
            float: left;
        }
        .product-row > a:first-child{
            display: block;
            text-align: center;
        }
        .product-row img{
            max-width: 100%;
            padding: 15px;
            height: 250px;
            max-height: 250px;
            margin: 0 auto;
        }
        .product-row h4{
            margin-top: 0;
            padding-left: 15px;
            text-align: left;
        }
        .product-row h4 a{
            font-weight: bold;
            font-family: "Microsoft YaHei";
            line-height: 1.45em;
            font-size: 14px;
            color: #333;
        }
        .product-row h4 a:hover{
            color: #e23351;
        }
        .product-row span{
            font-size: 1.5em;
            padding-left: 15px;
            color: #e23351;
            text-align: left;
        }
        .product-row a.btn-product{
            display: inline-block;
            float: right;
            margin-bottom: 10px;
            margin-right: 15px;
        }
        .product-row a.btn-product:hover{
            color: #ffffff;
        }
        .btn-product{
            background: #e23351;
            color: #ffffff;
        }
        .sub-nav{
            margin-top: 0;
            margin-bottom: 0;
            height: 120px;
            text-indent: -9999px;
            position: relative;
            overflow: hidden;
            background: url("${ctx}/static/images/sub-nav-bg.png");
        }
        .grid{
            padding-top: 0;
        }
        .breadcrumbs {
            background: black;
            padding: 0 20px;
            color: white;
            position: relative;
            text-align: center;
        }
        .breadcrumbs a {
            color: white;
            padding: 5px 0;
            display: inline-block;
            margin: 0 5px;
            text-align: center;
            text-decoration: none;
        }
    </style>
</head>
<body>
<header>
    <c:choose>
        <c:when test="${fn:length(subNav) > 0}">
            <h1 class="sub-nav">
                <span>导航</span>
            </h1>
            <nav class="breadcrumbs">
            <c:forEach items="${subNav}" var="snav">
                <a href="${ctx}/views/${snav.id}">${snav.navName}</a>
            </c:forEach>
            </nav>
        </c:when>
    </c:choose>

</header>
<div class="container">
    <c:forEach items="${productPage.content}" var="p" varStatus="st">
        <div class="product-row">

            <c:forEach items="${p.infoImages}" var="pimg" varStatus="pst">
                <c:if test="${pst.index == 0}">
                    <c:choose>
                        <c:when test="${p.nav.navType != 2}">
                            <a href="${ctx}/details/${p.id}">
                        </c:when>
                        <c:otherwise>
                            <a href="${ctx}/groupBuying/${p.id}">
                        </c:otherwise>
                    </c:choose>

                        <img class="img-rounded" src="${ctx}${pimg.imagePath}${pimg.pcImageName}" alt=""/>
                    </a>
                </c:if>
            </c:forEach>

            <h4>
                <c:choose>
                <c:when test="${p.nav.navType != 2}">
                <a href="${ctx}/details/${p.id}">
                    </c:when>
                    <c:otherwise>
                    <a href="${ctx}/groupBuying/${p.id}">
                        </c:otherwise>
                        </c:choose>
                ${p.infoTitle}
                </a>
            </h4>
            <span>${p.infoOriginalPrice}</span>
                            <c:choose>
                            <c:when test="${p.nav.navType != 2}">
                            <a class="btn btn-product" href="${ctx}/details/${p.id}">
                                </c:when>
                                <c:otherwise>
                                <a class="btn btn-product" href="${ctx}/groupBuying/${p.id}">
                                    </c:otherwise>
                                    </c:choose>查看详情</a>
        </div>
    </c:forEach>
</div>
</body>
</html>