<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>食享家</title>
</head>
<body>
<div id="carousel-example-generic" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
        <li data-target="#carousel-example-generic" data-slide-to="5"></li>
        <li data-target="#carousel-example-generic" data-slide-to="6"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="${ctx}/static/images/product/p1.jpg" alt="食享家图片">
            <div class="carousel-caption">
                <h3>食享家标题</h3>
                <p>食享家内容</p>
            </div>
        </div>

        <div class="item">
            <img src="${ctx}/static/images/product/p2.jpg" alt="食享家图片">
            <div class="carousel-caption">
                <h3>食享家标题</h3>
                <p>食享家内容</p>
            </div>
        </div>

        <div class="item">
            <img src="${ctx}/static/images/product/p3.jpg" alt="食享家图片">
            <div class="carousel-caption">
                <h3>食享家标题</h3>
                <p>食享家内容</p>
            </div>
        </div>

        <div class="item">
            <img src="${ctx}/static/images/product/p4.jpg" alt="食享家图片">
            <div class="carousel-caption">
                <h3>食享家标题</h3>
                <p>食享家内容</p>
            </div>
        </div>

        <div class="item">
            <img src="${ctx}/static/images/product/p5.jpg" alt="食享家图片">
            <div class="carousel-caption">
                <h3>食享家标题</h3>
                <p>食享家内容</p>
            </div>
        </div>

        <div class="item">
            <img src="${ctx}/static/images/product/p6.jpg" alt="食享家图片">
            <div class="carousel-caption">
                <h3>食享家标题</h3>
                <p>食享家内容</p>
            </div>
        </div>

        <div class="item">
            <img src="${ctx}/static/images/product/p7.jpg" alt="食享家图片">
            <div class="carousel-caption">
                <h3>食享家标题</h3>
                <p>食享家内容</p>
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

<div class="row ourstory">
    <h2><span class="glyphicon glyphicon-eye-open"></span> 品牌故事</h2>
    <p>
        食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.
        食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.
        食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.食享家的品牌故事.
    </p>
</div>

<div class="row partners">
    <h2><span class="glyphicon glyphicon-user"></span> 合作伙伴</h2>
</div>
</body>
</html>