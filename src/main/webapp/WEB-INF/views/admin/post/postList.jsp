<%--
  Created by IntelliJ IDEA.
  User: jpm
  Date: 13-8-19
  Time: 下午7:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title></title>
</head>
<body>
<section class="panel">
    <header class="panel-heading">文章列表</header>
    <div class="panel-body">
        <div class="row text-small">
            <div class="col-sm-4 m-b-mini">
                <label class="col-lg-3 control-label">选择栏目：</label>
                <select name="navId" class="input-sm inline form-control" style="width:130px"
                        onchange="changeNav(this.options[this.options.selectedIndex].value)">
                    <option value="0">全部</option>
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
            <div class="col-sm-4">
                <div class="input-group"><input type="text" class="input-sm form-control"
                                                placeholder="Search"><span class="input-group-btn"> <button
                        class="btn btn-sm btn-white" type="button">Go!
                </button> </span></div>
            </div>
        </div>
    </div>
    <div>
        <table class="table table-striped b-t text-small">
            <thead>
            <tr>
                <th class="th-sortable" data-toggle="class">文章标题</th>
                <th width="130">创建日期</th>
                <th width="130">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${postPage.content}" var="post">
                <tr height="40px">
                    <td style="vertical-align:middle">
                            ${post.postTitle}
                    </td>
                    <td style="vertical-align:middle">
                            ${post.postCreateDate}
                    </td>
                    <td style="vertical-align:middle">
                        &nbsp;&nbsp;<a href="${ctx}/admin/post/update/${post.id}">修改</a>
                        &nbsp;&nbsp;<a href="${ctx}/admin/post/delete/${post.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <footer class="panel-footer">
        <div class="row">
            <tags:pagination page="${postPage}" paginationSize="15"/>
        </div>
    </footer>
</section>

<script>
    function changeNav(navId) {
        alert(navId);
//        请求服务器改变栏目数据
    }
</script>
</body>
</html>