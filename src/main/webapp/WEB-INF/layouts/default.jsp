<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/styles/normalize.css">
    <link rel="stylesheet" href="${ctx}/static/styles/main.css">
    <script src="${ctx}/static/script/modernizr.js"></script>
    <style type="text/css">

    </style>
</head>
<body>

<!-- Add your site or application content here -->

<aside class="col-sm-3 hidden-xs">
    <ul class="navbar navbar-default side-bar">
        <li>
            <img class="logo" src="${ctx}/static/images/logo.png" alt=""/></li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">首页</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">食享食分</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">团购食惠</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">有礼有节</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">食享课堂</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">品牌故事</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">合作伙伴</a>
        </li>
        <li>
            <div class="background-color menu-bg"></div>
            <a href="#">关于我们</a>
        </li>
    </ul>
</aside>

<div class="col-xs-12 col-sm-9">
    <%@include file="nav.jsp"%>
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
</div>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="${ctx}/static/jquery/jquery-1.9.1.min.js"><\/script>')</script>
<script src="${ctx}/static/script/plugins.js"></script>
<script src="${ctx}/static/script/main.js"></script>

<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<script>
    var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
        g.src='//www.google-analytics.com/ga.js';
        s.parentNode.insertBefore(g,s)}(document,'script'));
</script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</body>
</html>
