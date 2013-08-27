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
    <style type="text/css">@import url(${ctx}/static/plupload/js/jquery.plupload.queue/css/jquery.plupload.queue.css);</style>
</head>
<body>
<header class="panel-heading">新增故事</header>
<form id="addNav" action="${ctx}/admin/story/add" method="post" class="form-horizontal" onsubmit="return validate()">
    <div class="form-group">
        <label class="col-lg-3 control-label">故事名称:</label>
        <div class="col-lg-4">
            <input type="text" id="storyTitle" name="storyTitle" placeholder="产品名称"
                   data-required="true" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">故事图片:</label>
        <div class="col-lg-6">
            <div id="uploader">
                <p>You browser doesn't have Flash, Silverlight, Gears, BrowserPlus or HTML5 support.</p>
            </div>
        </div>
    </div>
    <div id="files"></div>
    <div class="form-group">
        <label class="col-lg-3 control-label">故事描述:</label>
        <div class="col-lg-6">
            <textarea id="storyContent" name="storyContent"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>
        <div class="col-lg-6">
            <button type="submit" class="btn btn-info pull-right">添加</button>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('storyContent');
    </script>
</form>
<script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/browserplus-min.js"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/plupload.full.js"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/i18n/zh.js"></script>
<script type="text/javascript">
    $(function() {
        $("#uploader").pluploadQueue({
            runtimes : 'flash,html5',
            url : '${ctx}/admin/image/multiUpload',
            max_file_size : '10mb',
            headers : 'contentType="image/jpeg;charset=UTF-8"',
            urlstream_upload:true,
            unique_names:false,
            filters : [
                {title : "图片文件", extensions : "jpg,gif,png,jpeg,bmp"}
            ],
            flash_swf_url : '${ctx}/static/plupload/js/plupload.flash.swf',
            init : {
                FileUploaded:function(up,b,res){
                    var fileName = res["response"];
                    console.info(fileName);
                    $('#files').append('<input type="hidden" name="fileNameList" value="'+fileName+'">');
                }
            }
        });
    });
</script>
</body>
</html>