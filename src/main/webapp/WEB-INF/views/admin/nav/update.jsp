<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script>
        function validate() {
            if ($("#navName").val() == "" || $("#navOrder").val() == "" || $("#fileNameList").val() == "") {
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
<header class="panel-heading">修改栏目</header>
<form id="addNav" action="${ctx}/admin/nav/update" method="post" class="form-horizontal"  onsubmit="return validate()">
    <input type="hidden" value="${nav.id}" name="id"/>
    <div class="form-group"><label class="col-lg-3 control-label">选择上级目录:</label>
        <div class="col-lg-4">
            <select name="parentNav" class="form-control">
                <%--<option value="0">顶级目录</option>--%>
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
            <input type="text" id="navName" name="navName" placeholder="栏目名称" data-required="true" class="form-control" value="${nav.navName}">
        </div>
    </div>
    <div class="form-group"><label class="col-lg-3 control-label">是否显示:</label>
        <div class="col-lg-4"><select name="isShowNav" class="form-control">
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
        </select></div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">显示次序:</label>
        <div class="col-lg-4">
            <input type="text" id="navOrder" name="navOrder" placeholder="栏目前台显示次序" data-required="true" class="form-control" value="${nav.navOrder}">
        </div>
    </div>
    <div id="files"><input type="hidden" name="fileNameList"></div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>
        <div class="col-lg-4">
            <a class="btn btn-info  pull-left"  href="${ctx}/admin/nav/list">取消</a>
            &nbsp;&nbsp;<button type="submit" class="btn btn-info pull-right">修改</button>
        </div>
    </div>
</form>
</body>
</html>