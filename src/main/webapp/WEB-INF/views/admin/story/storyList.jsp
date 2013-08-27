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
                location.href="${ctx}/admin/story/delete/"+id;
            }
        }
    </script>
</head>
<body>
<section class="panel">
    <header class="panel-heading">故事列表</header>
    <form id="storyList" action="${ctx}/admin/story/storyList" method="post" class="form-horizontal">
        <div class="panel-body">
            <div class="row text-small">
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
                <th class="th-sortable" data-toggle="class">故事名称</th>
                <th width="100">创建日期</th>
                <th width="330">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${storyPage.content}" var="story">
                <tr height="40px">
                    <td style="vertical-align:middle">
                            ${story.storyTitle}
                    </td>
                    <td style="vertical-align:middle">
                            ${story.storyCreateDate}
                    </td>
                    <td style="vertical-align:middle">
                       <a class="btn btn-info" href="${ctx}/admin/story/look/${story.id}">查看</a>
                        &nbsp;&nbsp;<a class="btn btn-info" href="${ctx}/admin/story/update/${story.id}">修改内容</a>
                        &nbsp;&nbsp;<a class="btn btn-info" href="${ctx}/admin/storyImage/update/${story.id}">修改图片</a>
                        &nbsp;&nbsp;<a class="btn btn-danger"  onclick="firm(${story.id})">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <footer class="panel-footer">
        <div class="row">
            <c:choose>
                <c:when test="${fn:length(storyPage.content) > 0}">
                    <tags:pagination page="${storyPage}" paginationSize="15"/>
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