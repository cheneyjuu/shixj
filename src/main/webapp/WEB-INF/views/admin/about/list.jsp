<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        function firm(id)
        {//利用对话框返回的值 （true 或者 false）
            if(confirm("请确定是否要删除？"))
            {
                location.href="${ctx}/admin/info/delete/"+id+"/"+${navType};
            }
        }
    </script>
</head>
<body>
<section class="panel">
    <header class="panel-heading">产品列表</header>
    <form id="productList" action="${ctx}/admin/info/list/${navType}" method="post" class="form-horizontal">
        <div class="panel-body">
            <div class="row text-small">
                <div class="col-sm-4 m-b-mini">
                    <label class="col-lg-3 control-label column-label">选择栏目：</label>
                    <select name="navId" class="input-sm inline form-control" style="width:130px">
                        <option value="0">全部</option>
                        <c:forEach items="${navList}" var="nav">
                            <c:choose>
                                <c:when test="${nav.parentNav==0}">
                                    <option value="${nav.id}"
                                        <%--------------------------默认选中---------------------------%>
                                            <c:choose>
                                                <c:when test="${selectNavId==nav.id}">
                                                    selected="selected"
                                                </c:when>
                                            </c:choose>
                                        <%--------------------------默认选中---------------------------%>
                                        <%--------------------------不可选中---------------------------%>
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
                                                <c:when test="${selectNavId==nav.id}">
                                                    selected="selected"
                                                </c:when>
                                            </c:choose>
                                        <%--------------------------默认选中---------------------------%>
                                            >&nbsp;&nbsp;&nbsp;&nbsp;${nav.navName}</option>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-4">
                    <div class="input-group">
                        <input type="text" class="input-sm form-control" placeholder="搜索" name="parameter" value="${parameter}">
                        <span class="input-group-btn">
                             <button class="btn btn-sm btn-white" type="submit">搜索</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div>
        <table class="table table-striped b-t text-small">
            <thead>
            <tr>
                <th class="th-sortable" data-toggle="class">创建日期</th>
                <th width="330">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${infoPage.content}" var="info">
                <tr height="40px">
                    <td style="vertical-align:middle">
                            ${info.infoCreateDate}
                    </td>
                    <td style="vertical-align:middle">
                       <a class="btn btn-info" href="${ctx}/admin/info/look/${info.id}/${navType}">查看</a>
                        &nbsp;&nbsp;<a class="btn btn-info" href="${ctx}/admin/info/update/${info.id}/${navType}">修改内容</a>
                        &nbsp;&nbsp;<a class="btn btn-danger"  onclick="firm(${info.id})">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <footer class="panel-footer">
        <div class="row">
            <c:choose>
                <c:when test="${fn:length(infoPage.content) > 0}">
                    <tags:pagination page="${infoPage}" paginationSize="15"/>
                </c:when>
                <c:otherwise>
                    <ul class="pagination pull-right">
                        <li class="disabled"><a href="#">&lt;&lt;</a></li>
                        <li class="disabled"><a href="#">&lt;</a></li>
                        <li class="disabled"><a href="#">1</a></li>
                        <li class="disabled"><a href="#">&gt;</a></li>
                        <li class="disabled"><a href="#">&gt;&gt;</a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </footer>
</section>
</body>
</html>