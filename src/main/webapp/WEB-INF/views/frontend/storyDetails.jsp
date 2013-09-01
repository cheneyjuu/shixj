<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="container">
    <h2 class="text-center">${infoModel.infoTitle}</h2>
    <blockquote>
        <p>
            ${infoModel.infoIntro}
        </p>
    </blockquote>
    <p>
        ${infoModel.infoDetails}
    </p>
</div>