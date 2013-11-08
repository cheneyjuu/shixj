<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
       .border{
           background-color: #f5f5f5;border: 1px solid rgba(0,0,0,0.15);padding: 5px; min-height: 30px;
       }
    </style>
</head>
<body>
<header class="panel-heading">查看批发产品</header>
<div class="form-horizontal">
    <div class="form-group">
        <label class="col-lg-3 control-label">所在栏目:</label>

        <div class="col-lg-4 border">${info.nav.navName}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品名称:</label>

        <div class="col-lg-4 border">${info.infoTitle}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品简介:</label>
        <div class="col-lg-4 border">
            ${info.infoIntro}
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">天猫链接:</label>
        <div class="col-lg-4 border">${info.infoExternalLinks}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品规格:</label>
        <div class="col-lg-4 border">${info.infoStandard}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">包装单位:</label>
        <div class="col-lg-4 border">${info.infoPackUnit}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品产地:</label>
        <div class="col-lg-4 border">${info.infoProduction}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">生产日期:</label>
        <div class="col-lg-4 border">${info.infoDateInProduced}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">保质期:</label>
        <div class="col-lg-4 border">${info.infoShelfLife}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">库存量:</label>
        <div class="col-lg-4 border">${info.infoInventoryLevel}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">零售价:</label>
        <div class="col-lg-4 border">${info.infoRetailPrice}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">批发价格:</label>
        <div class="col-lg-4 border">${info.infoWholesalePrice}</div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">首页显示:</label>
        <div class="col-lg-4 border">
            <c:choose>
                <c:when test="${info.infoShowIndex==0}">
                    不显示
                </c:when>
                <c:otherwise>
                    显示
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品描述:</label>

        <div class="col-lg-6 border">
            ${info.infoDetails}
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>

        <div class="col-lg-6">
            <a class="btn btn-info  pull-left" href="${ctx}/admin/info/list/${navType}">返回列表</a>
        </div>
    </div>
</div>
</body>
</html>