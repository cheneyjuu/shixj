<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>食享家</title>
    <style type="text/css">
        img{
            width: 100%;
        }
    </style>
</head>
<body>
<div class="container warp-carousel" style="">
    <div id="carousel-example-generic" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="${ctx}/static/images/slide-1.jpg" alt="">
                <div class="carousel-caption">
                    第一张图片的描述
                </div>
            </div>
            <div class="item">
                <img src="${ctx}/static/images/slide-2.jpg" alt="">
                <div class="carousel-caption">
                    第二张图片的描述
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
</div>
<div class="container visible-sm">
    <div class="col-xs-6 col-sm-6 col-md-6" style="border: 1px solid #000; float: left;"><span>菜单</span></div>
    <div class="col-xs-6 col-sm-6 col-md-6" style="border: 1px solid #f00; float: left;"><span>定制</span></div>
</div>
</body>
</html>