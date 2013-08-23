<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">@import url(${ctx}/static/plupload/js/jquery.plupload.queue/css/jquery.plupload.queue.css);</style>
</head>
<body>
<header class="panel-heading">修改栏目</header>
<form id="addNav" action="${ctx}/admin/nav/update" method="post" class="form-horizontal">
    <input type="hidden" value="${nav.id}" name="id"/>
    <div class="form-group"><label class="col-lg-3 control-label">选择上级目录:</label>
        <div class="col-lg-4">
            <select name="parentNav" class="form-control">
                <option value="0">顶级目录</option>
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
            <input type="text" name="navName" placeholder="栏目名称" data-required="true" class="form-control" value="${nav.navName}">
        </div>
    </div>
    <%--<div class="form-group"><label class="col-lg-3 control-label">栏目类型:</label>--%>
    <%--<div class="col-lg-4"><select name="navType" class="form-control">--%>
    <%--<option value="0" <c:choose>--%>
    <%--<c:when test="${nav.navType==0}">--%>
    <%--selected="selected"--%>
    <%--</c:when>--%>
    <%--</c:choose>>产品</option>--%>
    <%--<option value="1" <c:choose>--%>
    <%--<c:when test="${nav.navType==1}">--%>
    <%--selected="selected"--%>
    <%--</c:when>--%>
    <%--</c:choose>>信息</option>--%>
    <%--</select></div>--%>
    <%--</div>--%>
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
            <input type="text" name="navOrder" placeholder="栏目前台显示次序" data-required="true" class="form-control" value="${nav.navOrder}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">栏目图片:</label>
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
            <label class="col-lg-3 control-label"></label>
            <button type="submit" class="btn btn-primary pull-right">修改</button>
        </div>
    </div>
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
            url : '${ctx}/admin/image/singleUpload',
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
                    $('#files').append('<input type="hidden" name="fileNameList" value="'+fileName+'">');
                }
            }
        });
    });
</script>
</body>
</html>