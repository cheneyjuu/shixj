<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        function firm(id) {//利用对话框返回的值 （true 或者 false）
            if (confirm("请确定是否要删除？")) {
                location.href = "${ctx}/admin/nav/delete/" + id;
            }
        }
    </script>
</head>
<body>
<header class="panel-heading">查看栏目信息</header>
<input type="hidden" value="${nav.id}" name="id"/>
<div  class="form-horizontal media">
<div class="form-group">
    <label class="col-lg-3 control-label">上级栏目:</label>
    <div class="col-lg-4">
        <select name="parentNav" class="form-control" disabled="disabled">
            <option value="0">顶级目录</option>
            <c:forEach items="${navList}" var="tempNav">
                <%--判断不让显示自己栏目--%>
                <c:choose>
                    <c:when test="${nav.id!=tempNav.id}">
                        <option value="${tempNav.id}"
                            <%--判断默然选中当前栏目--%>
                                <c:choose>
                                    <c:when test="${nav.parentNav==tempNav.id}">
                                        selected="selected"
                                    </c:when>
                                </c:choose>
                                >${tempNav.navName}</option>
                    </c:when>
                </c:choose>
            </c:forEach>
        </select>
    </div>
</div>
<div class="form-group">
    <label class="col-lg-3 control-label">栏目名称:</label>
    <div class="col-lg-4">
        <input type="text" id="navName" name="navName" placeholder="栏目名称" data-required="true" class="form-control"
               value="${nav.navName}" disabled="disabled">
    </div>
</div>
<div class="form-group">
    <label class="col-lg-3 control-label">是否显示:</label>
    <div class="col-lg-4">
        <select name="isShowNav" class="form-control" disabled="disabled">
            <option value="0" <c:choose>
                <c:when test="${nav.showNav=='false'}">
                    selected="selected"
                </c:when>
            </c:choose>>不显示
            </option>
            <option value="1" <c:choose>
                <c:when test="${nav.showNav!='false'}">
                    selected="selected"
                </c:when>
            </c:choose>>显示
            </option>
        </select>
    </div>
</div>
<div class="form-group">
    <label class="col-lg-3 control-label">显示次序:</label>
    <div class="col-lg-4">
        <input type="text" id="navOrder" name="navOrder" placeholder="栏目前台显示次序" data-required="true"
               class="form-control" value="${nav.navOrder}" disabled="disabled">
    </div>
</div>
<div class="form-group">
    <label class="col-lg-3 control-label"></label>
    <div class="col-lg-4">
        <a class="btn btn-info  pull-left" href="${ctx}/admin/nav/navList">返回列表</a>
        <a class="btn btn-danger pull-right" onclick="firm(${nav.id})">删除</a>
    </div>
</div>
</div>
<script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>

</body>
</html>