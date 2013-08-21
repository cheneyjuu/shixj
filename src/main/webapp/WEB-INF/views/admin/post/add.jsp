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
<form id="addNav" action="${ctx}/admin/post/add" method="post" class="form-horizontal">

    <div class="form-group">
        <label class="col-lg-3 control-label">选择目录:</label>
        <div class="col-lg-4">
            <select name="navId" class="form-control">
                <c:forEach items="${navList}" var="nav">
                    <c:choose>
                        <c:when test="${nav.parentNav==0}">
                            <option value="${nav.id}"
                            <%-----------------------------------------------------%>
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
                            <option value="${nav.id}">&nbsp;&nbsp;&nbsp;&nbsp;${nav.navName}</option>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">文章标题:</label>

        <div class="col-lg-8">
            <input type="text" name="postTitle" placeholder=""
                   data-required="true" class="form-control">
        </div>
    </div>

    <div class="form-group">
        <label class="col-lg-3 control-label">文章内容:</label>

        <div class="col-lg-4">
            <textarea id="postContent" name="postContent"></textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-9 col-lg-offset-3">
            <button type="submit" class="btn btn-primary pull-right">添加</button>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('postContent');
    </script>

</form>
</body>
</html>