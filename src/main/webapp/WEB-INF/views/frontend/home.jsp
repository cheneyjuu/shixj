<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<section class="slider-section" id="slider-section">
    <div class="col-md-12 slider-wrap">
        <!-- Start Slider Show-->
        <div id="carousel-example-generic" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <c:forEach items="${productList}" var="p" varStatus="st">
                    <c:choose>
                        <c:when test="${st.index == 0}">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        </c:when>
                        <c:otherwise>
                            <li data-target="#carousel-example-generic" data-slide-to="${st.index}"></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" style="height: 500px;">
                <c:forEach items="${productList}" var="p" varStatus="st">
                        <c:choose>
                        <c:when test="${st.index == 0}">
                        <div class="item active">
                        </c:when>
                        <c:otherwise>
                        <div class="item">
                        </c:otherwise>
                        </c:choose>

                            <div class="carousel-title">
                                <a href="${p.tmallLink}">${p.productName}</a>
                            </div>
                            <c:forEach items="${p.productImages}" var="image" varStatus="st">
                                <img src="${ctx}${image.imagePath}${image.pcImageName}" alt="">
                            </c:forEach>

                            <div class="carousel-caption col-md-5">
                                    ${p.details}
                            </div>

                        </div>
                    </c:forEach>

                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="icon-prev"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="icon-next"></span>
                </a>
            </div>
            <!-- End Slider Show -->
        </div>
</section>

<section class="story-section" id="story-section">
    <div class="row col-md-12">
        <div class="col-md-7">
            <c:choose>
                <c:when test="${storyModel != null}">
                    <h3>${storyModel.storyTitle}</h3>

                    <p>
                            ${storyModel.storyIntro}
                    </p>
                    <a href="${ctx}/story/details/${storyModel.id}" class="btn btn-warning">故事未完，点击继续阅读</a>
                </c:when>
                <c:otherwise>
                    您还没有添加品牌故事。
                </c:otherwise>
            </c:choose>
        </div>
        <img class="story-logo col-md-5" src="${ctx}/static/images/timewriting.jpg" alt=""/>
    </div>
</section>