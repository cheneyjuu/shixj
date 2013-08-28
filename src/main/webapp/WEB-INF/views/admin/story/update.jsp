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
            if ($("#storyTitle").val() == "" || $("#storyContent").val() == ""||$("#fileNameList").val() == "") {
                if ($("#storyTitle").val() == "") {
                    alert("故事名称不能为空");
                }else if ($("#storyContent").val() == "") {
                    alert("故事内容不能为空");
                }else if ($("#fileNameList").val() == "") {
                    alert("故事图片不能为空");
                };
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<header class="panel-heading">更新故事</header>
<form id="addNav" action="${ctx}/admin/story/update" method="post" class="form-horizontal"
      onsubmit="return validate()">
    <input type="hidden" value="${storyId}" name="storyId"/>
    <div class="form-group">
        <label class="col-lg-3 control-label">故事名称:</label>
        <div class="col-lg-4">
            <input type="text" id="storyTitle" name="storyTitle" placeholder="产品名称"
                   data-required="true" class="form-control" value="${story.storyTitle}">
        </div>
    </div>
    <%--<div class="form-group">--%>
        <%--<label class="col-lg-3 control-label">故事图片:</label>--%>
        <%--<div class="col-lg-6">--%>
            <%--<div id="uploader">--%>
                <%--<p>You browser doesn't have Flash, Silverlight, Gears, BrowserPlus or HTML5 support.</p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div id="files"></div>
    <div class="form-group">
        <label class="col-lg-3 control-label">故事描述:</label>
        <div class="col-lg-6">
            <textarea id="storyContent" name="storyContent">${story.storyContent}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>

        <div class="col-lg-6">
            <a class="btn btn-info  pull-left" href="${ctx}/admin/story/storyList">取消</a>
            <button type="submit" class="btn btn-info pull-right">修改</button>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('storyContent');
    </script>
</form>
<script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</body>
</html>