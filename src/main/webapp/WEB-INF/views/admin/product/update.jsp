<%--
  Created by IntelliJ IDEA.
  User: jpm
  Date: 13-8-20
  Time: 下午12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript">
        $(function () {
            window.UEDITOR_HOME_URL = "${ctx}/static/ueditor/";
        });
    </script>
</head>
<body>
<form id="addNav" action="${ctx}/admin/product/update" method="post" class="form-horizontal">
    <input type="hidden" value="${product.id}" name="id"/>
    <div class="form-group">
        <label class="col-lg-3 control-label">选择目录:</label>

        <div class="col-lg-4">
            <select name="navId" class="form-control">
                <c:forEach items="${navList}" var="nav">
                    <c:choose>
                        <c:when test="${nav.parentNav==0}">
                            <option value="${nav.id}"
                                <%--------------------------默认选中---------------------------%>
                                    <c:choose>
                                        <c:when test="${post.navId==nav.id}">
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
                                        <c:when test="${post.navId==nav.id}">
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

        <div class="col-lg-8">
            <input type="text" name="productName" placeholder=""
                   data-required="true" class="form-control" value="${product.productName}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">天猫链接:</label>

        <div class="col-lg-8">
            <input type="text" name="tmallLink" placeholder=""
                   data-required="true" class="form-control" value="${product.tmallLink}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品价格:</label>

        <div class="col-lg-8">
            <input type="text" name="productPrice" placeholder=""
                   data-required="true" class="form-control" value="${product.productPrice}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品描述:</label>

        <div class="col-lg-4">
            <textarea id="details" name="details">${product.details}</textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-9 col-lg-offset-3">
            <button type="submit" class="btn btn-primary pull-right">修改</button>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('details');
    </script>

</form>
</body>
</html>