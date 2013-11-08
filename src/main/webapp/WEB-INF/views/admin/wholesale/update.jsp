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
            if ($("#infoTitle").val() == ""||$("#infoIntro").val() == ""||$("#infoExternalLinks").val() == ""
                    ||$("#infoStandard").val() == ""||$("#infoPackUnit").val() == ""||$("#infoProduction").val() == ""
                    ||$("#infoDateInProduced").val() == ""||$("#infoShelfLife").val() == ""||$("#infoInventoryLevel").val() == ""
                    ||$("#infoRetailPrice").val() == ""||$("#infoWholesalePrice").val() == ""||$("#fileNameList").val() == ""
                    ||$("#infoDetails").val() == "") {
                if ($("#infoTitle").val() == "") {
                    alert("产品名称不能为空");
                }else if ($("#infoIntro").val() == "") {
                    alert("产品简介不能为空");
                }else if ($("#infoExternalLinks").val() == "") {
                    alert("链接不能为空");
                }else if ($("#infoStandard").val() == "") {
                    alert("产品规格不能为空");
                }else if ($("#infoPackUnit").val() == "") {
                    alert("产品包装单位不能为空");
                }else if ($("#infoProduction").val() == "") {
                    alert("产品产地不能为空");
                }else if ($("#infoDateInProduced").val() == "") {
                    alert("产品生产日期不能为空");
                }else if ($("#infoShelfLife").val() == "") {
                    alert("产品保质期不能为空");
                }else if ($("#infoInventoryLevel").val() == "") {
                    alert("产品库存量不能为空");
                }else if ($("#infoRetailPrice").val() == "") {
                    alert("产品零售价不能为空");
                }else if ($("#infoWholesalePrice").val() == "") {
                    alert("产品批发价格不能为空");
                }else if ($("#fileNameList").val() == "") {
                    alert("产品图片不能为空");
                }else if ($("#infoDetails").val() == "") {
                    alert("产品描述不能为空");
                };
                return false;
            }else{
                if(isNaN($("#infoRetailPrice").val())){
                    alert("产品零售价必须为数字！");
                    return false;
                }
                if(isNaN($("#infoWholesalePrice").val())){
                    alert("产品批发价格必须为数字！");
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
<header class="panel-heading">更新批发产品</header>
<form id="addNav" action="${ctx}/admin/info/update/${navType}" method="post" class="form-horizontal" onsubmit="return validate()">
    <input type="hidden" value="${info.id}" name="id"/>
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
                                        <c:when test="${info.nav.id==nav.id}">
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
                                        <c:when test="${info.nav.id==nav.id}">
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
            <input type="text" id="infoTitle" name="infoTitle" placeholder="产品名称"
                   data-required="true" class="form-control" value="${info.infoTitle}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品简介:</label>
        <div class="col-lg-4">
            <textarea name="infoIntro" id="infoIntro" cols="30" rows="8" class="form-control">${info.infoIntro}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">天猫链接:</label>
        <div class="col-lg-4">
            <input type="text" id="infoExternalLinks" name="infoExternalLinks" placeholder="天猫链接"
                   data-required="true" class="form-control" value="${info.infoExternalLinks}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品规格:</label>
        <div class="col-lg-4">
            <input type="text" id="infoStandard" name="infoStandard" placeholder="产品规格"
                   data-required="true" class="form-control" value="${info.infoStandard}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">包装单位:</label>
        <div class="col-lg-4">
            <input type="text" id="infoPackUnit" name="infoPackUnit" placeholder="包装单位"
                   data-required="true" class="form-control" value="${info.infoPackUnit}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品产地:</label>
        <div class="col-lg-4">
            <input type="text" id="infoProduction" name="infoProduction" placeholder="产品产地"
                   data-required="true" class="form-control" value="${info.infoProduction}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">生产日期:</label>
        <div class="col-lg-4">
            <div class="controls input-append date form_datetime" data-date="2013-01-16T05:25:07Z"
                 data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
                <input size="16" name="infoDateInProduced" id="infoDateInProduced" type="text" value="${info.infoDateInProduced}"
                       readonly>
                <span class="add-on"><i class="icon-remove" style="display: inline"></i></span>
                <span class="add-on"><i class="icon-th" style="display: inline"></i></span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">保质期:</label>
        <div class="col-lg-4">
            <input type="text" id="infoShelfLife" name="infoShelfLife" placeholder="保质期"
                   data-required="true" class="form-control" value="${info.infoShelfLife}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">库存量:</label>
        <div class="col-lg-4">
            <input type="text" id="infoInventoryLevel" name="infoInventoryLevel" placeholder="库存量"
                   data-required="true" class="form-control" value="${info.infoInventoryLevel}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">零售价:</label>
        <div class="col-lg-4">
            <input type="text" id="infoRetailPrice" name="infoRetailPrice" placeholder="零售价"
                   data-required="true" class="form-control" value="${info.infoRetailPrice}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">批发价格:</label>
        <div class="col-lg-4">
            <input type="text" id="infoWholesalePrice" name="infoWholesalePrice" placeholder="批发价格"
                   data-required="true" class="form-control" value="${info.infoWholesalePrice}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">首页显示:</label>
        <div class="col-lg-4">
            <select name="infoShowIndex" class="form-control">
                <option value="0" <c:choose>
                    <c:when test="${info.infoShowIndex==0}">
                        selected="selected"
                    </c:when>
                </c:choose>>不显示
                </option>
                <option value="1" <c:choose>
                    <c:when test="${info.infoShowIndex==1}">
                        selected="selected"
                    </c:when>
                </c:choose>>显示
                </option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品描述:</label>

        <div class="col-lg-6">
            <textarea id="infoDetails" name="infoDetails">${info.infoDetails}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label"></label>
        <div class="col-lg-6">
            <a class="btn btn-info  pull-left" href="${ctx}/admin/info/list/${navType}">取消</a>
            <button type="submit" class="btn btn-info pull-right">修改</button>
        </div>
    </div>
    <script type="text/javascript">
        UE.getEditor('infoDetails');
    </script>
</form>

</body>
</html>