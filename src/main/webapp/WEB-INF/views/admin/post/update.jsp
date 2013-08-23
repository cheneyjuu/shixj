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
        function validate() {
            if ($("#postTitle").val() == "" || $("#postContent").val() == "") {
                if ($("#postTitle").val() == "") {
                    alert("文章标题不能为空");
                }else if ($("#postContent").val() == "") {
                    alert("文章内容不能为空");
                };
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<header class="panel-heading">修改文章</header>
<form id="addNav" action="${ctx}/admin/post/update" method="post" class="form-horizontal" onsubmit="return validate()">
    <input type="hidden" value="${post.id}" name="id"/>
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
        <label class="col-lg-3 control-label">文章标题:</label>
        <div class="col-lg-4">
            <input type="text" id="postTitle" name="postTitle" placeholder="" data-required="true" class="form-control" value="${post.postTitle}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">文章内容:</label>
        <div class="col-lg-6">
            <textarea id="postContent" name="postContent">${post.postContent}</textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-9">
            <button type="submit" class="btn btn-primary pull-right">修改</button>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('postContent');
    </script>
</form>
</body>
</html>