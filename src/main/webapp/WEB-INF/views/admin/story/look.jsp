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
                location.href = "${ctx}/admin/story/delete/" + id;
            }
        }
    </script>
    <style type="text/css">@import url(${ctx}/static/plupload/js/jquery.plupload.queue/css/jquery.plupload.queue.css);</style>
</head>
<body>
<header class="panel-heading">查看故事</header>
<div class="form-horizontal media">
    <input type="hidden" value="${story.id}" name="id"/>

    <div class="form-group">
        <label class="col-lg-3 control-label">故事名称:</label>

        <div class="col-lg-4">
            <input type="text" id="storyTitle" name="storyTitle" placeholder="故事名称" data-required="true"
                   class="form-control" value="${story.storyTitle}" disabled="disabled">
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
        <label class="col-lg-3 control-label">故事描述:</label>

        <div class="col-lg-6">
            <textarea id="storyContent" name="storyContent" disabled="disabled">${story.storyContent}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>

        <div class="col-lg-6">
            <a class="btn btn-info  pull-left" href="${ctx}/admin/story/list">返回列表</a>
            <a class="btn btn-danger pull-right" onclick="firm(${story.id})">删除</a>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('storyContent');
    </script>
</div>
<script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</body>
</html>