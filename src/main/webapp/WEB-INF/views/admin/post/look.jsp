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
                location.href = "${ctx}/admin/post/delete/" + id;
            }
        }
    </script>
</head>
<body>
<header class="panel-heading">查看文章</header>
<div  class="form-horizontal media">
    <input type="hidden" value="${post.id}" name="id"/>
    <div class="form-group">
        <label class="col-lg-3 control-label">文章所在栏目:</label>
        <div class="col-lg-4">
            <select name="navId" class="form-control" disabled="disabled">
                <c:forEach items="${navList}" var="nav">
                    <c:choose>
                        <c:when test="${nav.parentNav==0}">
                            <option value="${nav.id}"
                                <%--------------------------默认选中---------------------------%>
                                    <c:choose>
                                        <c:when test="${post.nav.id==nav.id}">
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
                                        <c:when test="${post.nav.id==nav.id}">
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
            <input type="text" id="postTitle" name="postTitle" placeholder="" data-required="true" class="form-control" value="${post.postTitle}" disabled="disabled">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">文章内容:</label>
        <div class="col-lg-6">
            <textarea id="postContent" name="postContent" disabled="disabled">${post.postContent}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>
        <div class="col-lg-6">
            <a class="btn btn-info  pull-left" href="${ctx}/admin/post/postList">返回列表</a>
            <a class="btn btn-danger pull-right" onclick="firm(${post.id})">删除</a>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('postContent');
    </script>
</div>
</body>
</html>