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
            if ($("#productName").val() == "" || $("#productPrice").val() == "" || $("#details").val() == "") {
                if ($("#productName").val() == "") {
                    alert("产品名称不能为空");
                }else if ($("#productPrice").val() == "") {
                    alert("产品价格不能为空");
                } else if ($("#details").val() == "") {
                    alert("产品描述不能为空");
                }
                ;
                return false;
            } else {
                if (isNaN($("#productPrice").val())) {
                    alert("产品价格必须为数字！");
                    return false;
                }
                var url = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
                if(!url.test($("#tmallLink").val())){
                    alert("输入的网址格式不对!");
                    return false;
                }
            }
            return true;
        }
    </script>
    <%--<style type="text/css">@import url(${ctx}/static/plupload/js/jquery.plupload.queue/css/jquery.plupload.queue.css);</style>--%>
</head>
<body>
<header class="panel-heading">更新产品</header>
<form id="addNav" action="${ctx}/admin/product/update" method="post" class="form-horizontal"
      onsubmit="return validate()">
    <input type="hidden" value="${product.id}" name="id"/>
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
                                        <c:when test="${product.nav.id==nav.id}">
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
                                        <c:when test="${product.nav.id==nav.id}">
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
        <label class="col-lg-3 control-label">产品名称:</label>
        <div class="col-lg-4">
            <input type="text" id="productName" name="productName" placeholder="产品名称" data-required="true"
                   class="form-control" value="${product.productName}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">天猫链接:</label>
        <div class="col-lg-4">
            <input type="text" id="tmallLink" name="tmallLink" placeholder="天猫链接" data-required="true"
                   class="form-control" value="${product.tmallLink}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品价格:</label>
        <div class="col-lg-4">
            <input type="text" id="productPrice" name="productPrice" placeholder="产品价格" data-required="true"
                   class="form-control" value="${product.productPrice}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">首页显示:</label>
        <div class="col-lg-4">
            <select name="showIndex" class="form-control">
                <option value="0" <c:choose>
                    <c:when test="${product.showIndex==0}">
                        selected="selected"
                    </c:when>
                </c:choose>>不显示
                </option>
                <option value="1" <c:choose>
                    <c:when test="${product.showIndex==1}">
                        selected="selected"
                    </c:when>
                </c:choose>>显示
                </option>
            </select>
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
        <label class="col-lg-3 control-label">产品描述:</label>

        <div class="col-lg-6">
            <textarea id="details" name="details">${product.details}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>

        <div class="col-lg-6">
            <a class="btn btn-info  pull-left" href="${ctx}/admin/product/productList">取消</a>
            <button type="submit" class="btn btn-info pull-right">修改</button>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('details');
    </script>
</form>
<script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<%--<script type="text/javascript" src="${ctx}/static/plupload/js/browserplus-min.js"></script>--%>
<%--<script type="text/javascript" src="${ctx}/static/plupload/js/plupload.full.js"></script>--%>
<%--<script type="text/javascript" src="${ctx}/static/plupload/js/jquery.plupload.queue/jquery.plupload.queue.js"></script>--%>
<%--<script type="text/javascript" src="${ctx}/static/plupload/js/i18n/zh.js"></script>--%>
<%--<script type="text/javascript">--%>
<%--$(function() {--%>
<%--$("#uploader").pluploadQueue({--%>
<%--runtimes : 'flash,html5',--%>
<%--url : '${ctx}/admin/image/multiUpload',--%>
<%--max_file_size : '10mb',--%>
<%--headers : 'contentType="image/jpeg;charset=UTF-8"',--%>
<%--urlstream_upload:true,--%>
<%--unique_names:false,--%>
<%--filters : [--%>
<%--{title : "图片文件", extensions : "jpg,gif,png,jpeg,bmp"}--%>
<%--],--%>
<%--flash_swf_url : '${ctx}/static/plupload/js/plupload.flash.swf',--%>
<%--init : {--%>
<%--FileUploaded:function(up,b,res){--%>
<%--var fileName = res["response"];--%>
<%--//                    inputImage = document.getElementById("fileNameList");--%>
<%--//                    inputImage.value=fileName;--%>
<%--$('#files').append('<input type="hidden" name="fileNameList" value="'+fileName+'">');--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--});--%>
<%--</script>--%>
</body>
</html>