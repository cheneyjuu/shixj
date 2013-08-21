<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<header class="panel-heading">新增栏目</header>
<form id="addNav" action="${ctx}/admin/nav/add" method="post" class="form-horizontal media">
    <div class="form-group">
        <label class="col-lg-3 control-label">选择上级目录:</label>
        <div class="col-lg-4">
            <select name="parentNav" class="form-control">
                <option value="0">顶级目录</option>
                <c:forEach items="${navList}" var="nav">
                    <option value="${nav.id}">${nav.navName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">栏目名称:</label>
        <div class="col-lg-4">
            <input type="text" name="navName" placeholder="栏目名称" data-required="true" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">栏目类型:</label>
        <div class="col-lg-4">
            <select name="navType" class="form-control">
                <option value="0">产品</option>
                <option value="1">信息</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">是否显示:</label>
        <div class="col-lg-4">
            <select name="isShowNav" class="form-control">
                <option value="0">不显示</option>
                <option value="1">显示</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-3"></div>
        <div class="col-lg-4">
            <button type="submit" class="btn btn-primary">添加</button>
        </div>
    </div>
</form>
</body>
</html>