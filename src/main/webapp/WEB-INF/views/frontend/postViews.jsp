<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">
        p{
            margin-left: 15px;
            margin-right: 15px;
        }
    </style>
</head>
<body>
    <div class="row">
        <c:forEach items="${productPage.content}" var="post" varStatus="st">
            <c:if test="${st.index == 0}">
                <p>
                     ${post.infoDetails}
                </p>
            </c:if>
        </c:forEach>
    </div>
</body>
</html>