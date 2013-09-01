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
    <style>
        .border {
            background-color: #f5f5f5;
            border: 1px solid rgba(0, 0, 0, 0.15);
            padding: 5px;
            min-height: 30px;
        }
    </style>
</head>
<body>
<header class="panel-heading">查看栏目信息</header>
<input type="hidden" value="${nav.id}" name="id"/>
<div class="form-horizontal media">
    <div class="form-group">
        <label class="col-lg-3 control-label">所属栏目:</label>
        <div class="col-lg-4 border">
            <c:choose>
                <c:when test="${nav.parentNav == 0}">
                    顶级栏目
                </c:when>
                <c:otherwise>
                    ${nav.navName}
                </c:otherwise>
            </c:choose>

        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">栏目名称:</label>
        <div class="col-lg-4 border">
            ${nav.navName}
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">是否显示:</label>
        <div class="col-lg-4 border">
            <c:choose>
                <c:when test="${nav.showNav=='false'}">
                    不显示
                </c:when>
                <c:otherwise>
                    显示
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">显示次序:</label>
        <div class="col-lg-4 border">
            ${nav.navOrder}
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>
        <div class="col-lg-4">
            <a class="btn btn-info  pull-left" href="${ctx}/admin/nav/list">返回列表</a>
        </div>
    </div>
</div>

</body>
</html>