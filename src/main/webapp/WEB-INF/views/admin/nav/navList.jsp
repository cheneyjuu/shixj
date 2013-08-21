<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: jpm
  Date: 13-8-19
  Time: 下午7:11
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title></title>
</head>
<body>
<section class="panel">
    <header class="panel-heading">栏目列表</header>

    <div>
        <table class="table table-striped b-t text-small">
            <thead>
            <tr>
                <th class="th-sortable" data-toggle="class">栏目名称</th>
                <th>等级</th>
                <th>类型</th>
                <th>当前状态</th>
                <th width="130">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${navList}" var="nav">
                <tr height="40px">
                    <td style="vertical-align:middle">
                        <c:choose>
                            <c:when test="${nav.parentNav==0}">
                                <span style="font-weight:bold">${nav.navName}</span>
                            </c:when>
                            <c:otherwise>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${nav.navName}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td style="vertical-align:middle">
                        <c:choose>
                            <c:when test="${nav.parentNav==0}">
                                一级
                            </c:when>
                            <c:otherwise>
                                二级
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td style="vertical-align:middle">
                        <c:choose>
                            <c:when test="${nav.navType==0}">
                                产品
                            </c:when>
                            <c:otherwise>
                                信息
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td style="vertical-align:middle">
                        <c:choose>
                            <c:when test="${nav.showNav=='false'}">
                                隐藏
                            </c:when>
                            <c:otherwise>
                                显示
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td style="vertical-align:middle">
                        <%--<c:choose>--%>
                            <%--<c:when test="${nav.showNav=='false'}">--%>
                                <%--<a href="#" id="showNav" onclick="getId('${nav.id}');">显示</a>--%>
                            <%--</c:when>--%>
                            <%--<c:otherwise>--%>
                                <%--<a href="#" id="hideNav">隐藏</a>--%>
                            <%--</c:otherwise>--%>
                        <%--</c:choose>--%>
                        &nbsp;&nbsp;<a href="${ctx}/admin/nav/update/${nav.id}">修改</a>
                        &nbsp;&nbsp;<a href="${ctx}/admin/nav/delete/${nav.id}">删除</a>
                        <input type="hidden" value="${nav.id}"/>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

</section>
<script type="text/javascript">

    var id;
    function getId(curid){
        id = curid;
        alert(id);
    }

    $(function(){
        $.ajax({
            url : "",
            type : "POST",
            data: {},
            success:function(response){
                if (response){
                    var isdel = window.confirm("确定删除吗");
                    if (isdel){
                        $("form").submit();
//                        window.location.href="";
                    }
                }
            }
        });
    });
</script>
</body>
</html>