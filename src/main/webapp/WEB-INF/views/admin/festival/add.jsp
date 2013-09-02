<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.all.min.js"></script>
    <link href="${ctx}/static/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet" media="screen">
    <script type="text/javascript">
        $(function () {
            window.UEDITOR_HOME_URL = "${ctx}/static/ueditor/";
        });
        function validate() {
            if ($("#infoTitle").val() == ""||$("#infoIntro").val() == ""||$("#infoExternalLinks").val() == ""||$("#infoOriginalPrice").val() == ""||$("#fileNameList").val() == ""||$("#infoDetails").val() == "") {
                if ($("#infoTitle").val() == "") {
                    alert("产品名称不能为空");
                }else if ($("#infoIntro").val() == "") {
                    alert("产品简介不能为空");
                }else if ($("#infoExternalLinks").val() == "") {
                    alert("链接不能为空");
                }else if ($("#infoOriginalPrice").val() == "") {
                    alert("产品价格不能为空");
                }else if ($("#fileNameList").val() == "") {
                    alert("产品图片不能为空");
                }else if ($("#infoDetails").val() == "") {
                    alert("产品描述不能为空");
                };
                return false;
            }else{
                if(isNaN($("#infoOriginalPrice").val())){
                    alert("产品价格必须为数字！");
                    return false;
                }
                var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
                        + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@
                        + "(([0-9]{1,3}\\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
                        + "|" // 允许IP和DOMAIN（域名）
                        + "([0-9a-z_!~*'()-]+\\.)*" // 域名- www.
                        + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\\." // 二级域名
                        + "[a-z]{2,6})" // first level domain- .com or .museum
                        + "(:[0-9]{1,4})?" // 端口- :80
                        + "((/?)|" // a slash isn't required if there is no file name
                        + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
                var re = new RegExp(strRegex);
                if (!re.test($("#infoExternalLinks").val())) {
                    alert("输入的网址格式不对!");
                    return false;
                }
            }
            return true;
        }
    </script>
    <style type="text/css">@import url(${ctx}/static/plupload/js/jquery.plupload.queue/css/jquery.plupload.queue.css);</style>
</head>
<body>
<header class="panel-heading">新增产品</header>
<form id="addNav" action="${ctx}/admin/info/add/${navType}" method="post" class="form-horizontal" onsubmit="return validate()">
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
        <label class="col-lg-3 control-label">产品名称:</label>
        <div class="col-lg-4">
            <input type="text" id="infoTitle" name="infoTitle" placeholder="产品名称"
                   data-required="true" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品简介:</label>
        <div class="col-lg-4">
            <textarea name="infoIntro" id="infoIntro" cols="30" rows="8" class="form-control"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">天猫链接:</label>
        <div class="col-lg-4">
            <input type="text" id="infoExternalLinks" name="infoExternalLinks" placeholder="天猫链接"
                   data-required="true" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品价格:</label>
        <div class="col-lg-4">
            <input type="text" id="infoOriginalPrice" name="infoOriginalPrice" placeholder="产品价格"
                   data-required="true" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">首页显示:</label>
        <div class="col-lg-4">
            <select name="infoShowIndex" class="form-control">
                <option value="0">不显示</option>
                <option value="1">显示</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品描述:</label>
        <div class="col-lg-6">
            <textarea id="infoDetails" name="infoDetails"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>
        <div class="col-lg-6">
            <button type="submit" class="btn btn-info pull-right">添加</button>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('infoDetails');
    </script>
</form>

</body>
</html>