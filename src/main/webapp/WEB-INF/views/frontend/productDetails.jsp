<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>${productModel.infoTitle}</title>
    <style type="text/css">
        .product-title{
            background: #ffffff;
        }
        .row{
            border: 1px solid #ccc;
            border-right: 2px;
            margin-left: 10px;
            margin-right: 10px;
        }
        .product-title > .col-md-7{
            padding-left: 0;
        }
        .product-title > .col-md-7 > .title-wrap{
            border-right: 2px solid #f00;
            height: 100%;
            padding: 10px;
        }
        .product-title > .col-md-5{
            /*border: 1px solid #cccccc;*/
        }
        .product-title > .col-md-5 img{
            max-width: 100%;
            margin: 15px 0 15px 15px;
            height: 350px;
            max-height: 350px;
            overflow: hidden;
            float: left;
        }
        .product-title h3{
            border-bottom: 1px dashed #cccccc;
            line-height: 2em;
            text-align: center;
        }
        .product-title p span{
            color: #e23351;
            font-size: 1.5em;
        }
        .product-title a.btn-product{
            display: inline-block;
            margin: 15px;
        }
        .product-title a.btn-product:hover{
            color: #ffffff;
        }
        .btn-product{
            background: #e23351;
            color: #ffffff;
        }
        .product-title{
            border-bottom-width: 0px;
        }
        blockquote{
            color: #2A2C2E;
        }
        p{
            margin-left: 15px;
        }
        .col-md-5 .image-wrap{
            border: 1px solid #d1d4d7;
            padding: 15px;
            margin: 15px 0 15px 15px;
            max-width: 100%;
            width: 26em;
        }
        .col-md-5 .image-wrap:after{
            content: '';
            display: inline-block;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="row product-title">
    <c:if test="${productModel.nav.navType != 5}">
    <div class="col-md-5">
        <div class="image-wrap">
            <c:forEach items="${productModel.infoImages}" var="pimg" varStatus="pst">
                <c:choose>
                    <c:when test="${pst.index == 0}">
                        <img class="img-rounded" src="${ctx}${pimg.imagePath}${pimg.pcImageName}" alt=""/>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
    </div>
    <div class="col-md-7">
        <div class="title-wrap">
            <h3>${productModel.infoTitle}</h3>
            <blockquote>
                ${productModel.infoIntro}
            </blockquote>
            <p>
                <span>价格：${productModel.infoOriginalPrice}</span>
                <a href="${productModel.infoExternalLinks}" target="_blank" class="btn btn-product">购买</a>
            </p>
        </div>
    </div>
    </c:if>
    <div>
        <p>
            ${productModel.infoDetails}
        </p>
    </div>
</div>

</body>
</html>