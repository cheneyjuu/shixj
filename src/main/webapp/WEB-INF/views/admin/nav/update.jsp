<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: jpm
  Date: 13-8-19
  Time: 下午7:10
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title></title>
</head>
<body>
<form id="addNav" action="${ctx}/admin/nav/update" method="post" class="form-horizontal">
    <input type="hidden" value="${nav.id}" name="id"/>

    <div class="form-group"><label class="col-lg-3 control-label">选择上级目录:</label>

        <div class="col-lg-4"><select name="parentNav" class="form-control">
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

        </select></div>
    </div>
    <div class="form-group">
        <label class="col-lg-3 control-label">栏目名称:</label>

        <div class="col-lg-8">
            <input type="text" name="navName" placeholder=""
                   data-required="true" class="form-control" value="${nav.navName}"></div>
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
        <div class="col-lg-9 col-lg-offset-3">
            <button type="submit" class="btn btn-primary pull-right">修改</button>
        </div>
    </div>
</body>
</html>