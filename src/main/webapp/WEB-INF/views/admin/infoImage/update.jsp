<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>

    <script type="text/javascript">
        function validate() {
            if ($("#fileNameList").val() == "") {
                if ($("#fileNameList").val() == "") {
                    alert("产品图片不能为空");
                }
                return false;
            }
            return true;
        }
        function firm(id)
        {//利用对话框返回的值 （true 或者 false）
            if(confirm("请确定是否要删除？"))
            {
                location.href="${ctx}/admin/infoImage/delete/"+id;
            }
        }

    </script>
    <style type="text/css">@import url(${ctx} /static/plupload/js/jquery.plupload.queue/css/jquery.plupload.queue.css);</style>
</head>
<body>
<section class="panel">
    <header class="panel-heading">修改图片产品</header>
    <form id="addNav" action="${ctx}/admin/infoImage/update/${navType}" method="post" class="form-horizontal"
          onsubmit="return validate()">
        <input type="hidden" name="infoId" value="${infoId}">
        <div>
            <table class="table table-striped b-t text-small">
                <thead>
                <tr>
                    <th class="th-sortable" data-toggle="class">图片路径</th>
                    <th width="300">图片效果</th>
                    <th width="120">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${infoImageList}" var="infoImage">
                    <tr height="250px">
                        <td style="vertical-align:middle">
                                ${infoImage.imagePath}${infoImage.pcImageName}
                        </td>
                        <td style="vertical-align:middle">
                            <img src="${infoImage.imagePath}${infoImage.pcImageName}" width="280" height="240">
                        </td>
                        <td style="vertical-align:middle">
                            &nbsp;&nbsp;<a class="btn btn-info"  onclick="firm(${infoImage.id})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="form-group">
            <label class="col-lg-3 control-label">产品图片:</label>
            <div class="col-lg-6">
                <div id="uploader">
                    <p>You browser doesn't have Flash, Silverlight, Gears, BrowserPlus or HTML5 support.</p>
                </div>
            </div>
        </div>
        <div id="files"></div>
        <div class="form-group">
            <label class="col-lg-3 control-label"></label>
            <div class="col-lg-6">
                <a  class="btn btn-info  pull-left"  href="${ctx}/admin/info/list/${navType}">取消</a>
                <button type="submit" class="btn btn-info pull-right">添加</button>
            </div>
        </div>
    </form>
</section>
<script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/browserplus-min.js"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/plupload.full.js"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="${ctx}/static/plupload/js/i18n/zh.js"></script>
<script type="text/javascript">
    $(function () {
        $("#uploader").pluploadQueue({
            runtimes: 'flash,html5',
            url: '${ctx}/admin/image/multiUpload',
            max_file_size: '10mb',
            headers: 'contentType="image/jpeg;charset=UTF-8"',
            urlstream_upload: true,
            unique_names: false,
            filters: [
                {title: "图片文件", extensions: "jpg,gif,png,jpeg,bmp"}
            ],
            flash_swf_url: '${ctx}/static/plupload/js/plupload.flash.swf',
            init: {
                FileUploaded: function (up, b, res) {
                    var fileName = res["response"];
                    console.info(fileName);
                    $('#files').append('<input type="hidden" name="fileNameList" value="' + fileName + '">');
                }
            }
        });
    });
</script>
</body>
</html>