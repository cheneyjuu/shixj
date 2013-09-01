<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script>
            function validate() {
                if ($("#navName").val() == "" || $("#navOrder").val() == ""||$("#fileNameList").val() == "") {
                    if ($("#navName").val() == "") {
                        alert("栏目名称不能为空");
                    }else if ($("#navOrder").val() == "") {
                        alert("显示次序不能为空");
                    }else if ($("#fileNameList").val() == "") {
                        alert("栏目图片不能为空");
                    };
                    return false;
                }
                return true;
            }
    </script>
</head>
<body>
<header class="panel-heading">新增栏目</header>
<form id="addNav" action="${ctx}/admin/nav/add" method="post" class="form-horizontal media" onsubmit="return validate()">
    <div class="form-group">
        <label class="col-lg-3 control-label">选择上级目录:</label>
        <div class="col-lg-4">
            <select name="parentNav" id="parentNav" class="form-control">
                <%--<option value="0">顶级目录</option>--%>
                <c:forEach items="${navList}" var="nav">
                    <option value="${nav.id}">${nav.navName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">栏目名称:</label>
        <div class="col-lg-4">
            <input type="text" id="navName" name="navName" placeholder="栏目名称" data-required="true" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">栏目类型:</label>
        <div class="col-lg-4">
            <select name="navType" class="form-control">
                <option value="1">食享食分</option>
                <option value="2">团购实惠</option>
                <option value="3">有礼有节</option>
                <option value="4">食享课堂</option>
                <option value="5">品牌故事</option>
                <option value="6">合作伙伴</option>
                <option value="7">关于我们</option>
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
        <label class="col-lg-3 control-label">显示次序:</label>
        <div class="col-lg-4">
            <input type="text" id="navOrder" name="navOrder" placeholder="栏目前台显示次序" data-required="true" class="form-control">
        </div>
    </div>
    <div id="files"><input type="hidden" name="fileNameList"></div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>
        <div class="col-lg-4">
            &nbsp;&nbsp;<button type="submit" class="btn btn-info  pull-right">添加</button>
        </div>
    </div>
</form>
</body>
</html>