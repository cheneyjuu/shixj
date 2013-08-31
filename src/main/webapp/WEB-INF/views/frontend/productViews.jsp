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
    </style>
</head>
<body>
<div class="container">
    <c:forEach items="${productList}" var="p" varStatus="st">
        <div class="product-row">

            <c:forEach items="${p.productImages}" var="pimg" varStatus="pst">
                <c:if test="${pst.index == 0}">
                    <a href="${ctx}/details/${p.id}" target="_blank">
                        <img class="img-rounded" src="${ctx}${pimg.imagePath}${pimg.pcImageName}" alt=""/>
                    </a>
                </c:if>
            </c:forEach>

            <h4><a href="${ctx}/details/${p.id}" target="_blank">${p.productName}</a></h4>
            <span>${p.productPrice}</span>
            <a href="${ctx}/details/${p.id}" class="btn btn-product">查看详情</a>
        </div>
    </c:forEach>
</div>
</body>
</html>