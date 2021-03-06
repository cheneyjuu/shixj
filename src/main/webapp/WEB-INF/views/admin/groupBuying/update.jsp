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
            if ($("#infoTitle").val() == ""||$("#infoIntro").val() == ""
                    ||$("#infoExternalLinks").val() == ""||$("#infoOriginalPrice").val() == ""
                    ||$("#infoCurrentPrice").val() == ""||$("#fileNameList").val() == ""
                    ||$("#infoGroupbuyingEndtime").val() == ""||$("#infoClicks").val() == ""||$("#infoDetails").val() == "") {
                if ($("#infoTitle").val() == "") {
                    alert("产品名称不能为空");
                }else if ($("#infoIntro").val() == "") {
                    alert("产品简介不能为空");
                }else if ($("#infoExternalLinks").val() == "") {
                    alert("链接不能为空");
                }else if ($("#infoOriginalPrice").val() == "") {
                    alert("产品原价不能为空");
                }else if ($("#infoCurrentPrice").val() == "") {
                    alert("产品现价不能为空");
                }else if ($("#infoClicks").val() == "") {
                    alert("点击次数不能为空");
                }else if ($("#fileNameList").val() == "") {
                    alert("产品图片不能为空");
                }else if ($("#infoGroupbuyingEndtime").val() == "") {
                    alert("团购结束时间不能为空");
                }else if ($("#infoDetails").val() == "") {
                    alert("产品描述不能为空");
                };
                return false;
            }else{
                if(isNaN($("#infoOriginalPrice").val())){
                    alert("产品原价必须为数字！");
                    return false;
                }
                if(isNaN($("#infoCurrentPrice").val())){
                    alert("产品现价必须为数字！");
                    return false;
                }
                if(isNaN($("#infoClicks").val())){
                    alert("点击次数必须为数字！");
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
</head>
<body>
<header class="panel-heading">更新产品</header>
<form id="addNav" action="${ctx}/admin/info/update/${navType}" method="post" class="form-horizontal"
      onsubmit="return validate()">
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
        <label class="col-lg-3 control-label">团购结束时间:</label>
        <div class="col-lg-4">
            <div class="controls input-append date form_datetime" data-date="2013-01-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
                <input size="16" name="infoGroupbuyingEndtime" id="infoGroupbuyingEndtime" type="text" value="${info.infoGroupbuyingEndtime}" readonly>
                <span class="add-on"><i class="icon-remove" style="display: inline"></i></span>
                <span class="add-on"><i class="icon-th" style="display: inline"></i></span>
            </div>
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
        <label class="col-lg-3 control-label">产品原价:</label>
        <div class="col-lg-4">
            <input type="text" id="infoOriginalPrice" name="infoOriginalPrice" placeholder="产品原价"
                   data-required="true" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">产品现价:</label>
        <div class="col-lg-4">
            <input type="text" id="infoCurrentPrice" name="infoCurrentPrice" placeholder="产品现价"
                   data-required="true" class="form-control">
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
        <label class="col-lg-3 control-label">当前购买次数:</label>
        <div class="col-lg-4">
            <input type="text" id="infoClicks" name="infoClicks" placeholder="购买次数"
                   data-required="true" class="form-control">
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

<script type="text/javascript" src="${ctx}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${ctx}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${ctx}/static/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
</script>
</body>
</html>