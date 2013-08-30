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
    <div class="form-group">
        <label class="col-lg-3 control-label">团购结束时间:</label>
        <div class="col-lg-4">
            <div class="controls input-append date form_datetime" data-date="2013-01-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
                <input size="16" name="endTime" type="text" value="" readonly>
                <span class="add-on"><i class="icon-remove"></i></span>
                <span class="add-on"><i class="icon-th"></i></span>
            </div>
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