<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/styles/normalize.css">
    <link rel="stylesheet" href="${ctx}/static/styles/main.css">
    <script src="${ctx}/static/script/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<header class="top" id="top">
    <div class="logo">
        <img src="${ctx}/static/images/logo.png" alt=""/>
    </div>
</header>

<div class="page-wrap container">
    <nav>
        <ul>
            <li><a href="#">Link1</a></li>
            <li><a href="#">Link2</a></li>
            <li><a href="#">Link3</a></li>
            <li><a href="#">Link4</a></li>
            <li><a href="#">Link5</a></li>
            <li><a href="#">Link6</a></li>
            <li><a href="#">Link7</a></li>
            <li><a href="#">Link8</a></li>
        </ul>
    </nav>
    <section class="slider-section" id="slider-section">
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
                <h3>品牌故事</h3>
                <p>
                    L'Atelier Du Chocolat巧克力工场是上海乐施芙餐饮管理有限公司旗下品牌。乐施芙公司自2010年创办以来，公司已发展成为集高品质巧克力、西点、意式冰淇淋和咖啡为一体的连锁经营团体。坚持“以高品质原料，经严格制作工艺，提供高品质产品”为宗旨，为顾客提供原汁原味的欧式美食体验。目前公司进入稳定成长期，在上海淮海路无限度广场、南方商业区以及杭州人气旺盛的万象城购物中心开设连锁店，打破传统商业模式，将发展重心聚集在创意、个性和潮流上，打造出集法式巧克力、欧式西点、意式冰淇淋和意式咖啡为一体的欧系甜品连锁，满足追求时尚的消费群体的诉求。
                </p>
                <button class="btn btn-warning">故事未完，点击继续阅读</button>
            </div>
            <img class="story-logo col-md-5" src="${ctx}/static/images/timewriting.jpg" alt=""/>
        </div>
    </section>
</div>

<script src="http://cdn.staticfile.org/jquery/2.0.3/jquery.min.js"></script>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/static/script/plugins.js"></script>
<script src="${ctx}/static/script/main.js"></script>

<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<script>
    var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
        g.src='//www.google-analytics.com/ga.js';
        s.parentNode.insertBefore(g,s)}(document,'script'));
</script>
</body>
</html>