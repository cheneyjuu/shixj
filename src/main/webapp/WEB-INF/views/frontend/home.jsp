<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<section class="slider-section" id="slider-section">
    <%--<c:forEach items="${productList}" var="p">--%>
        <%--<div>--%>
            <%--${p.productName}--%>
        <%--</div>--%>
    <%--</c:forEach>--%>
    <div class="col-md-12 slider-wrap">
        <!-- Start Slider Show-->
        <div id="carousel-example-generic" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="carousel-title">这个是标题</div>
                    <img src="${ctx}/static/images/product/p1.png" alt="">
                    <div class="carousel-caption col-md-5">
                        L'Atelier Du Chocolat巧克力工场是上海乐施芙餐饮管理有限公司旗下品牌。乐施芙公司自2010年创办以来，公司已发展成为集高品质巧克力、西点、意式冰淇淋和咖啡为一体的连锁经营团体。坚持“以高品质原料，经严格制作工艺，提供高品质产品”为宗旨，为顾客提供原汁原味的欧式美食体验。目前公司进入稳定成长期，在上海淮海路无限度广场、南方商业区以及杭州人气旺盛的万象城购物中心开设连锁店，打破传统商业模式，将发展重心聚集在创意、个性和潮流上，打造出集法式巧克力、欧式西点、意式冰淇淋和意式咖啡为一体的欧系甜品连锁，满足追求时尚的消费群体的诉求。
                    </div>
                </div>

                <div class="item">
                    <div class="carousel-title">这个是标题</div>
                    <img src="${ctx}/static/images/product/p2.jpg" alt="">
                    <div class="carousel-caption">
                        这里是图片的描述
                    </div>
                </div>
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