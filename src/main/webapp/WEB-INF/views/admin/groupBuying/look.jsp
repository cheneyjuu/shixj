<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript">
        $(function () {
            window.UEDITOR_HOME_URL = "${ctx}/static/ueditor/";
        });
        function firm(id) {//利用对话框返回的值 （true 或者 false）
            if (confirm("请确定是否要删除？")) {
                location.href = "${ctx}/admin/groupBuying/delete/" + id;
            }
        }
    </script>
</head>
<body>
<header class="panel-heading">查看产品</header>
<div  class="form-horizontal media">
    <input type="hidden" value="${product.id}" name="id"/>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品所在栏目:</label>
        <div class="col-lg-4">
            <select name="navId" class="form-control" disabled="disabled">
                <c:forEach items="${navList}" var="nav">
                    <c:choose>
                        <c:when test="${nav.parentNav==0}">
                            <option value="${nav.id}"
                                <%--------------------------默认选中---------------------------%>
                                    <c:choose>
                                        <c:when test="${product.nav.id==nav.id}">
                                            selected="selected"
                                        </c:when>
                                    </c:choose>
                                <%--------------------------缩进---------------------------%>
                                    <c:forEach items="${navList}" var="nav2">
                                        <c:choose>
                                            <c:when test="${nav.id==nav2.parentNav}">
                                                disabled="disabled"
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                <%-----------------------------------------------------%>
                                    >${nav.navName}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${nav.id}"
                                <%--------------------------默认选中---------------------------%>
                                    <c:choose>
                                        <c:when test="${product.nav.id==nav.id}">
                                            selected="selected"
                                        </c:when>
                                    </c:choose>
                                <%------------------------------------------------------------%>
                                    >&nbsp;&nbsp;&nbsp;&nbsp;${nav.navName}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品名称:</label>
        <div class="col-lg-4">
            <input type="text" id="productName" name="productName" placeholder="产品名称" data-required="true" class="form-control" value="${product.productName}" disabled="disabled">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">天猫链接:</label>
        <div class="col-lg-4">
            <input type="text" id="tmallLink" name="tmallLink" placeholder="天猫链接" data-required="true" class="form-control" value="${product.tmallLink}" disabled="disabled">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品价格:</label>
        <div class="col-lg-4">
            <input type="text" id="productPrice" name="productPrice" placeholder="产品价格" data-required="true" class="form-control" value="${product.productPrice}" disabled="disabled">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">首页显示:</label>
        <div class="col-lg-4">
            <select name="showIndex" class="form-control"  disabled="disabled">
                <option value="0" <c:choose>
                    <c:when test="${product.showIndex==0}">
                        selected="selected"
                    </c:when>
                </c:choose>>不显示
                </option>
                <option value="1" <c:choose>
                    <c:when test="${product.showIndex==1}">
                        selected="selected"
                    </c:when>
                </c:choose>>显示
                </option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">团购结束时间:</label>
        <div class="col-lg-4">
            <input type="text" id="endTime" name="endTime" placeholder="团购结束时间" data-required="true" class="form-control" value="${product.endTime}" disabled="disabled">
        </div>
    </div>
    <%--<div class="form-group">--%>
        <%--<label class="col-lg-3 control-label">产品图片:</label>--%>
        <%--<div class="col-lg-6">--%>
            <%--<div id="uploader">--%>
                <%--<p>You browser doesn't have Flash, Silverlight, Gears, BrowserPlus or HTML5 support.</p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div id="files"></div>--%>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品描述:</label>
        <div class="col-lg-6">
            <textarea id="details" name="details" disabled="disabled">${product.details}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>
        <div class="col-lg-6">
            <a class="btn btn-info  pull-left" href="${ctx}/admin/groupBuying/list">返回列表</a>
            <a class="btn btn-danger pull-right" onclick="firm(${product.id})">删除</a>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('details');
    </script>
</div>
<script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</body>
</html>