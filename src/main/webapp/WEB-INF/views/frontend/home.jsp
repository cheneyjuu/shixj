<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:if test="${fn:length(infoList) > 0}">
    <section class="col-xs-12 col-md-6">
        <c:if test="${infoList != null}">
            <c:forEach items="${infoList}" var="info" varStatus="st">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>${info.infoTitle}</h4>
                    </div>
                    <div class="panel-body">
                        <p>${info.infoIntro}</p>
                        <p><a href="${ctx}/details/${info.id}">查看详情</a></p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </section>
    <aside class="col-md-3">
        <c:if test="${groupBuyingList != null}">
            <c:forEach items="${groupBuyingList}" var="groupBuying" varStatus="st">
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <h4>${groupBuying.infoTitle}</h4>
                    </div>
                    <div class="panel-body">
                        <p>${groupBuying.infoIntro}</p>
                        <p><a href="${ctx}/groupBuying/${groupBuying.id}">查看详情</a></p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </aside>
    <aside class="col-md-3">
        <c:if test="${ylyjList != null}">
            <c:forEach items="${ylyjList}" var="ylyj" varStatus="st">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h4>${ylyj.infoTitle}</h4>
                    </div>
                    <div class="panel-body">
                        <p>${ylyj.infoIntro}</p>
                        <p><a href="#">查看详情</a></p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </aside>
</c:if>