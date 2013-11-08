<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
                location.href="${ctx}/admin/nav/delete/"+id;
            }
        }
    </script>
</head>
<body>
<section class="panel"  style="margin-left: 5px">
    <header class="panel-heading">栏目列表</header>
    <div>
        <table class="table table-striped b-t text-small">
            <thead>
                <tr>
                    <th class="th-sortable" data-toggle="class">栏目名称</th>
                    <th width="80">等级</th>
                    <th width="80">类型</th>
                    <th width="80">当前状态</th>
                    <th width="80">显示次序</th>
                    <th width="220">操作</th>
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
                            <c:when test="${nav.navType==1}">
                                食享食分
                            </c:when>
                            <c:when test="${nav.navType==2}">
                                团购实惠
                            </c:when>
                            <c:when test="${nav.navType==3}">
                                有礼有节
                            </c:when>
                            <c:when test="${nav.navType==4}">
                                食享课堂
                            </c:when>
                            <c:when test="${nav.navType==5}">
                                品牌故事
                            </c:when>
                            <c:when test="${nav.navType==6}">
                                合作伙伴
                            </c:when>
                            <c:when test="${nav.navType==7}">
                                关于我们
                            </c:when>
                            <c:when test="${nav.navType==8}">
                                商品批发
                            </c:when>
                            <c:otherwise>
                                关于我们
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
                        ${nav.navOrder}
                    </td>
                    <td style="vertical-align:middle">
                        <a class="btn btn-info" href="${ctx}/admin/nav/look/${nav.id}">查看</a>
                        &nbsp;&nbsp;<a class="btn btn-info" href="${ctx}/admin/nav/update/${nav.id}">修改</a>
                        <c:choose>
                            <c:when test="${nav.parentNav!=0}">
                                &nbsp;&nbsp;<a class="btn btn-danger " onclick="firm(${nav.id})">删除</a>
                            </c:when>
                        </c:choose>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>