<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>食享家 - <sitemesh:title /></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${ctx}/static/script/frontend/jquery.js"></script>

    <!--[if lt IE 9]>
    <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script src="${ctx}/static/script/frontend/ie.js"></script>
    <![endif]-->

    <!-- CSS -->
    <link href="${ctx}/static/styles/frontend/reset.css" rel="stylesheet"/>
    <%--<link href="${ctx}/static/styles/frontend/system.css" rel="stylesheet"/>--%>
    <link href="${ctx}/static/styles/frontend/grid.css" rel="stylesheet"/>
    <%--<link href="${ctx}/static/styles/frontend/nivo.css" rel="stylesheet"/>--%>
    <link href="${ctx}/static/styles/frontend/custom.css" rel="stylesheet"/>
    <link href="${ctx}/static/styles/frontend/joomla.css" rel="stylesheet"/>

    <style>

        *{ font-family:'Open Sans',Arial,sans-serif; }
        .color            {color: rgb(0,170,170) !important;}
        .background-color       {background-color: rgb(0,170,170) !important;}
        .background-color-trans {background-color: rgba(0,170,170,0.8) !important;}
        .background-color-darker{background-color: rgb(0,170,170) !important;}
        .border-color           {border-color: rgb(0,170,170) !important;}
        .border-left-color      {border-left-color: rgb(0,170,170) !important;}
        .border-top-color       {border-top-color: rgb(0,170,170) !important;}
        .border-color-darker    {   border-color: rgb(0,170,170) !important;}
        ::selection             { background: rgb(0,170,170); }
        .custom-class{}
    </style>

    <!-- JS -->
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <%--<script src="${ctx}/static/script/frontend/isotope.js"></script>--%>
    <script src="${ctx}/static/script/frontend/caroufredsel.js"></script>
    <%--<script src="${ctx}/static/script/frontend/nivo.js"></script>--%>
    <%--<script src="${ctx}/static/script/frontend/jquery.mousewheel.js"></script>--%>
    <script src="${ctx}/static/script/frontend/tinyscrollbar.js"></script>
    <script src="${ctx}/static/script/frontend/custom.js"></script>
    <!--[if lte IE 9]>
    <script src="http://cdn.staticfile.org/respond.js/1.2.0/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="page_wrap">
<%@include file="left.jsp"%>

<div class="rightSide">
<div class="row" id="vg-heading">

    <div class="twelve columns">

        <div class="heading-module">

            <div class="custom"  >
                <div class="announce announce-icon">Hey, my name is <span class="color">Metro</span>. With my amazing design i will amaze many people. But before you should <span class="color">pay for me.</span></div></div>
        </div>

    </div>


</div>



<div class="row" id="vg-showcase">

<div class="twelve columns">

<div class="metro-wrapper">
<div id="scrollbar1">
<div class="scrollbar"><div class="track"><div class="thumb background-color"><div class="end"></div></div></div></div>
<div class="viewport">
<div class="overview">

<div class="metro-slider">

<div class="col">
    <div class="metro-item full">

        <a class="metro-image" href="/themes/metrocreative/index.php/11-showcase/showcase-a/3-narnia-really-exists-on-the-closet" title=""><img src="${ctx}/static/images/showcase/metro-slider-1.png" alt=""></a>

        <div class="metro-description background-color-trans">
            <div class="metro-icon deactive vg-showcase-icon" style="background-image:url(${ctx}/static/images/icons/aboutus.png);"></div>

            <div class="metro-misc">

                <div class="metro-date">Published on Friday, 22 February 2013 04:32</div>
                <a class="metro-title" href="/themes/metrocreative/index.php/11-showcase/showcase-a/3-narnia-really-exists-on-the-closet" title="">Narnia really exists on the closet</a>

                <div class="metro-text"><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p>
                    <!--br><br>
        <a class="link vg-readmore-showcase" href="/themes/metrocreative/index.php/11-showcase/showcase-a/3-narnia-really-exists-on-the-closet" title="">Read more...</a-->
                </div>

            </div>

        </div>

    </div><div class="metro-item half">

    <a class="metro-image" href="/themes/metrocreative/index.php/11-showcase/showcase-a/4-just-a-little-dream" title=""><img src="${ctx}/static/images/showcase/metro-slider-2.png" alt=""></a>

    <div class="metro-description background-color-trans">
        <div class="metro-icon deactive vg-showcase-icon" style="background-image:url(${ctx}/static/images/icons/aboutus.png);"></div>

        <div class="metro-misc">

            <div class="metro-date">Published on Friday, 22 February 2013 04:32</div>
            <a class="metro-title" href="/themes/metrocreative/index.php/11-showcase/showcase-a/4-just-a-little-dream" title="">Just a little dream</a>

            <div class="metro-text"><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p>
                <!--br><br>
    <a class="link vg-readmore-showcase" href="/themes/metrocreative/index.php/11-showcase/showcase-a/4-just-a-little-dream" title="">Read more...</a-->
            </div>

        </div>

    </div>

</div><div class="metro-item half">

    <a class="metro-image" href="/themes/metrocreative/index.php/11-showcase/showcase-a/5-house-is-in-the-house" title=""><img src="${ctx}/static/images/showcase/metro-slider-3.png" alt=""></a>

    <div class="metro-description background-color-trans">
        <div class="metro-icon deactive vg-showcase-icon" style="background-image:url(${ctx}/static/images/icons/aboutus.png);"></div>

        <div class="metro-misc">

            <div class="metro-date">Published on Friday, 22 February 2013 04:32</div>
            <a class="metro-title" href="/themes/metrocreative/index.php/11-showcase/showcase-a/5-house-is-in-the-house" title="">House is in... the house?</a>

            <div class="metro-text"><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p>
                <!--br><br>
    <a class="link vg-readmore-showcase" href="/themes/metrocreative/index.php/11-showcase/showcase-a/5-house-is-in-the-house" title="">Read more...</a-->
            </div>

        </div>

    </div>

</div>
</div>
<div class="col">
    <div class="metro-item half">

        <a class="metro-image" href="/themes/metrocreative/index.php/12-showcase/showcase-b/1-the-dark-side-is-even-better" title=""><img src="${ctx}/static/images/showcase/metro-slider-4.png" alt=""></a>

        <div class="metro-description background-color-trans">
            <div class="metro-icon deactive vg-showcase-icon" style="background-image:url(${ctx}/static/images/icons/aboutus.png);"></div>

            <div class="metro-misc">

                <div class="metro-date">Published on Friday, 22 February 2013 04:32</div>
                <a class="metro-title" href="/themes/metrocreative/index.php/12-showcase/showcase-b/1-the-dark-side-is-even-better" title="">The Dark side is even better</a>

                <div class="metro-text"><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p>
                    <!--br><br>
        <a class="link vg-readmore-showcase" href="/themes/metrocreative/index.php/12-showcase/showcase-b/1-the-dark-side-is-even-better" title="">Read more...</a-->
                </div>

            </div>

        </div>

    </div><div class="metro-item half">

    <a class="metro-image" href="/themes/metrocreative/index.php/12-showcase/showcase-b/2-lovely-angel-in-the-envato-bundle" title=""><img src="${ctx}/static/images/showcase/metro-slider-5.png" alt=""></a>

    <div class="metro-description background-color-trans">
        <div class="metro-icon deactive vg-showcase-icon" style="background-image:url(${ctx}/static/images/icons/aboutus.png);"></div>

        <div class="metro-misc">

            <div class="metro-date">Published on Friday, 22 February 2013 04:32</div>
            <a class="metro-title" href="/themes/metrocreative/index.php/12-showcase/showcase-b/2-lovely-angel-in-the-envato-bundle" title="">Lovely angel in the Envato bundle</a>

            <div class="metro-text"><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p>
                <!--br><br>
    <a class="link vg-readmore-showcase" href="/themes/metrocreative/index.php/12-showcase/showcase-b/2-lovely-angel-in-the-envato-bundle" title="">Read more...</a-->
            </div>

        </div>

    </div>

</div><div class="metro-item half">

    <a class="metro-image" href="/themes/metrocreative/index.php/12-showcase/showcase-b/9-don-t-give-up-never" title=""><img src="${ctx}/static/images/showcase/metro-slider-6.png" alt=""></a>

    <div class="metro-description background-color-trans">
        <div class="metro-icon deactive vg-showcase-icon" style="background-image:url(${ctx}/static/images/icons/aboutus.png);"></div>

        <div class="metro-misc">

            <div class="metro-date">Published on Friday, 22 February 2013 04:32</div>
            <a class="metro-title" href="/themes/metrocreative/index.php/12-showcase/showcase-b/9-don-t-give-up-never" title="">Don't give up never</a>

            <div class="metro-text"><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p>
                <!--br><br>
    <a class="link vg-readmore-showcase" href="/themes/metrocreative/index.php/12-showcase/showcase-b/9-don-t-give-up-never" title="">Read more...</a-->
            </div>

        </div>

    </div>

</div><div class="metro-item half">

    <a class="metro-image" href="/themes/metrocreative/index.php/12-showcase/showcase-b/10-a-common-princess-story-tale" title=""><img src="${ctx}/static/images/showcase/metro-slider-7.png" alt=""></a>

    <div class="metro-description background-color-trans">
        <div class="metro-icon deactive vg-showcase-icon" style="background-image:url(${ctx}/static/images/icons/aboutus.png);"></div>

        <div class="metro-misc">

            <div class="metro-date">Published on Friday, 22 February 2013 04:32</div>
            <a class="metro-title" href="/themes/metrocreative/index.php/12-showcase/showcase-b/10-a-common-princess-story-tale" title="">A common princess story tale</a>

            <div class="metro-text"><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p>
                <!--br><br>
    <a class="link vg-readmore-showcase" href="/themes/metrocreative/index.php/12-showcase/showcase-b/10-a-common-princess-story-tale" title="">Read more...</a-->
            </div>

        </div>

    </div>

</div>
</div>
<div class="col">
    <div class="metro-item half">

        <a class="metro-image" href="/themes/metrocreative/index.php/13-showcase/showcase-c/6-on-the-edge-the-life-is-awesome" title=""><img src="${ctx}/static/images/showcase/metro-slider-8.png" alt=""></a>

        <div class="metro-description background-color-trans">
            <div class="metro-icon deactive vg-showcase-icon" style="background-image:url(${ctx}/static/images/icons/portfolio.png);"></div>

            <div class="metro-misc">

                <div class="metro-date">Published on Friday, 22 February 2013 04:32</div>
                <a class="metro-title" href="/themes/metrocreative/index.php/13-showcase/showcase-c/6-on-the-edge-the-life-is-awesome" title="">On the edge the life is awesome</a>

                <div class="metro-text"><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p>
                    <!--br><br>
        <a class="link vg-readmore-showcase" href="/themes/metrocreative/index.php/13-showcase/showcase-c/6-on-the-edge-the-life-is-awesome" title="">Read more...</a-->
                </div>

            </div>

        </div>

    </div><div class="metro-item half">

    <a class="metro-image" href="/themes/metrocreative/index.php/13-showcase/showcase-c/7-big-creatures-in-graphic-river" title=""><img src="${ctx}/static/images/showcase/metro-slider-9.png" alt=""></a>

    <div class="metro-description background-color-trans">
        <div class="metro-icon deactive vg-showcase-icon" style="background-image:url(${ctx}/static/images/icons/portfolio.png);"></div>

        <div class="metro-misc">

            <div class="metro-date">Published on Friday, 22 February 2013 04:32</div>
            <a class="metro-title" href="/themes/metrocreative/index.php/13-showcase/showcase-c/7-big-creatures-in-graphic-river" title="">Big creatures in Graphic River</a>

            <div class="metro-text"><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p>
                <!--br><br>
    <a class="link vg-readmore-showcase" href="/themes/metrocreative/index.php/13-showcase/showcase-c/7-big-creatures-in-graphic-river" title="">Read more...</a-->
            </div>

        </div>

    </div>

</div><div class="metro-item full">

    <a class="metro-image" href="/themes/metrocreative/index.php/13-showcase/showcase-c/8-the-cutest-litle-pegasus" title=""><img src="${ctx}/static/images/showcase/metro-slider-10.png" alt=""></a>

    <div class="metro-description background-color-trans">
        <div class="metro-icon deactive vg-showcase-icon" style="background-image:url(${ctx}/static/images/icons/portfolio.png);"></div>

        <div class="metro-misc">

            <div class="metro-date">Published on Friday, 22 February 2013 04:32</div>
            <a class="metro-title" href="/themes/metrocreative/index.php/13-showcase/showcase-c/8-the-cutest-litle-pegasus" title="">The cutest litle pegasus</a>

            <div class="metro-text"><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p><p>Ut pellentesque rutrum fermentum. Sed sit amet libero a enim dapibus pharetra quis sit amet dui. Ut consequat condimentum nunc et dignissim. Duis iaculis iaculis justo, eget mollis ipsum fermentum eu. Donec posuere justo vel leo vehicula volutpat. Praesent leo urna, ultrices in rutrum consectetur.</p>
                <!--br><br>
    <a class="link vg-readmore-showcase" href="/themes/metrocreative/index.php/13-showcase/showcase-c/8-the-cutest-litle-pegasus" title="">Read more...</a-->
            </div>

        </div>

    </div>

</div>
</div>

</div>

</div>
</div>
</div>
</div>

</div>

</div>


<div class="row" id="vg-body">


    <div class="twelve columns">




        <div id="system-message-container">
        </div>
        <div class="blog-featured vg-home-class">
            <h1>
                + Welcome to Metro Creative Joomla Template.	</h1>




        </div>




    </div>


</div>



<div class="row" id="vg-bottom">


    <div class="three columns">

        <div class="vg-bottom"><div class="title pencil-icon">Design Arts</div><div class="text margin-tb-20">

            <div class="custom"  >
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt commodo consequat labore et dolore magna aliqua.<br><br></p>
                <p>Ut enim ad minim veniam, quis nostrud commodo consequat. <br><br></p>
                <p><a href="#" class="link color" title="read"></div>
        </div></div>

    </div>


    <div class="three columns">

        <div class="vg-bottom"><div class="title connection-icon">Development</div><div class="text margin-tb-20">

            <div class="custom"  >
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt commodo consequat labore et dolore magna aliqua.<br><br></p>
                <p>Ut enim ad minim veniam, quis nostrud commodo consequat. <br><br></p>
                <p><a href="#" class="link color" title="read"></div>
        </div></div>

    </div>


    <div class="three columns">

        <div class="vg-bottom"><div class="title android-icon">Mobile Apps</div><div class="text margin-tb-20">

            <div class="custom"  >
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt commodo consequat labore et dolore magna aliqua.<br><br></p>
                <p>Ut enim ad minim veniam, quis nostrud commodo consequat. <br><br></p>
                <p><a href="#" class="link color" title="read"></div>
        </div></div>

    </div>


    <div class="three columns">

        <div class="vg-bottom"><div class="text margin-tb-20">

            <div class="custom"  >
                <div class="plus-with-hard-text">

                    <div class="hard-text">Final design<br>Dont splajeus</div>
                    <div class="plus-sign color">+</div>

                </div></div>
        </div></div>

    </div>


</div>



<div class="row" id="vg-carrousel">

    <div class="twelve columns">

        <div class="carousel margin-tb-20">

            <div class="vg-carrousel"><div><div class="item">

                <img src="${ctx}/static/images/portfolio/3-thumb.png" alt="" />

                <div class="item-background background-color"></div>

                <a href="/themes/metrocreative/index.php/portfolio-menu/15-web-design/11-landing-page-is-awesome" class="itemtitle" title="">Web Design</a>
                <a href="/themes/metrocreative/index.php/portfolio-menu/15-web-design/11-landing-page-is-awesome" class="itemsubtitle" title="">Landing Page is awesome</a>

            </div><div class="item">

                <img src="${ctx}/static/images/portfolio/4-thumb.png" alt="" />

                <div class="item-background background-color"></div>

                <a href="/themes/metrocreative/index.php/portfolio-menu/15-web-design/12-life-is-great" class="itemtitle" title="">Web Design</a>
                <a href="/themes/metrocreative/index.php/portfolio-menu/15-web-design/12-life-is-great" class="itemsubtitle" title="">Life is great!</a>

            </div><div class="item">

                <img src="${ctx}/static/images/portfolio/2-thumb.png" alt="" />

                <div class="item-background background-color"></div>

                <a href="/themes/metrocreative/index.php/portfolio-menu/16-joomla-development/13-finding-neverland" class="itemtitle" title="">Joomla Development</a>
                <a href="/themes/metrocreative/index.php/portfolio-menu/16-joomla-development/13-finding-neverland" class="itemsubtitle" title="">Finding neverland</a>

            </div><div class="item">

                <img src="${ctx}/static/images/portfolio/5-thumb.png" alt="" />

                <div class="item-background background-color"></div>

                <a href="/themes/metrocreative/index.php/portfolio-menu/16-joomla-development/14-the-important-things" class="itemtitle" title="">Joomla Development</a>
                <a href="/themes/metrocreative/index.php/portfolio-menu/16-joomla-development/14-the-important-things" class="itemsubtitle" title="">The important things</a>

            </div><div class="item">

                <img src="${ctx}/static/images/portfolio/1-thumb.png" alt="" />

                <div class="item-background background-color"></div>

                <a href="/themes/metrocreative/index.php/portfolio-menu/17-user-experience/15-project-title" class="itemtitle" title="">User Experience</a>
                <a href="/themes/metrocreative/index.php/portfolio-menu/17-user-experience/15-project-title" class="itemsubtitle" title="">Project Title</a>

            </div><div class="item">

                <img src="${ctx}/static/images/portfolio/7-thumb.png" alt="" />

                <div class="item-background background-color"></div>

                <a href="/themes/metrocreative/index.php/portfolio-menu/17-user-experience/16-happy-thoughts" class="itemtitle" title="">User Experience</a>
                <a href="/themes/metrocreative/index.php/portfolio-menu/17-user-experience/16-happy-thoughts" class="itemsubtitle" title="">Happy thoughts</a>

            </div><div class="item">

                <img src="${ctx}/static/images/portfolio/2-thumb.png" alt="" />

                <div class="item-background background-color"></div>

                <a href="/themes/metrocreative/index.php/portfolio-menu/17-user-experience/17-castle-in-heaven" class="itemtitle" title="">User Experience</a>
                <a href="/themes/metrocreative/index.php/portfolio-menu/17-user-experience/17-castle-in-heaven" class="itemsubtitle" title="">Castle in Heaven</a>

            </div><div class="item">

                <img src="${ctx}/static/images/portfolio/5-thumb.png" alt="" />

                <div class="item-background background-color"></div>

                <a href="/themes/metrocreative/index.php/portfolio-menu/17-user-experience/18-another-clue" class="itemtitle" title="">User Experience</a>
                <a href="/themes/metrocreative/index.php/portfolio-menu/17-user-experience/18-another-clue" class="itemsubtitle" title="">Another clue</a>

            </div><div class="item">

                <img src="${ctx}/static/images/portfolio/8-thumb.png" alt="" />

                <div class="item-background background-color"></div>

                <a href="/themes/metrocreative/index.php/portfolio-menu/15-web-design/19-get-stronger" class="itemtitle" title="">Web Design</a>
                <a href="/themes/metrocreative/index.php/portfolio-menu/15-web-design/19-get-stronger" class="itemsubtitle" title="">Get stronger</a>

            </div><div class="item">

                <img src="${ctx}/static/images/portfolio/3-thumb.png" alt="" />

                <div class="item-background background-color"></div>

                <a href="/themes/metrocreative/index.php/portfolio-menu/15-web-design/20-nobody-lies" class="itemtitle" title="">Web Design</a>
                <a href="/themes/metrocreative/index.php/portfolio-menu/15-web-design/20-nobody-lies" class="itemsubtitle" title="">Nobody lies</a>

            </div></div></div>

        </div>

    </div>

</div>



<div class="row" id="vg-step">


    <div class="six columns">

        <div class="vg-step"><div class="title clients-icon">Client Testimonials</div>
            <hr><div class="text margin-tb-20">

                <div class="custom"  >
                    <div class="testimonials"><div class="customer-image"><img alt="customer" src="/themes/metrocreative/${ctx}/static/images/customer.png"></div>
                        <div>
                            <b>Erkan Giris :</b>  To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it ?<br>
                            <span class="color">http://www.erkangiris.com</span>
                        </div>
                    </div></div>
            </div></div><div class="vg-step"><div class="text margin-tb-20">
        <form class="gray-box" id="formAcymailing92511" action="/themes/metrocreative/index.php" onsubmit="return submitacymailingform('optin','formAcymailing92511')" method="post" name="formAcymailing92511"  >
            <div class="acymailing_module_form" >

                <%--<label class="gray-box-title vg-acymailing-label" for="your-mail-address">Newsletter:</label>--%>
                <!--input class="gray-box-input" id="your-mail-address" type="email" name="e-mail" placeholder="Your mail address" required="" />
<input class="gray-box-submit background-color" type="submit" value="Subscribe"-->


                <input id="user_email_formAcymailing92511"  onfocus="if(this.value == 'Your mail address') this.value = '';" onblur="if(this.value=='') this.value='Your mail address';" class="gray-box-title" type="text" name="user[email]" style="width:66%" value="Your mail address" />



                <input class="gray-box-submit background-color" type="submit" value="Subscribe" name="Submit" onclick="try{ return submitacymailingform('optin','formAcymailing92511'); }catch(err){alert('The form could not be submitted '+err);return false;}"/>


                <input type="hidden" name="ajax" value="0"/>
                <input type="hidden" name="ctrl" value="sub"/>
                <input type="hidden" name="task" value="notask"/>
                <input type="hidden" name="redirect" value="http%3A%2F%2Fwww.htmgarcia.com%2Fthemes%2Fmetrocreative%2F"/>
                <input type="hidden" name="redirectunsub" value="http%3A%2F%2Fwww.htmgarcia.com%2Fthemes%2Fmetrocreative%2F"/>
                <input type="hidden" name="option" value="com_acymailing"/>
                <input type="hidden" name="hiddenlists" value="1"/>
                <input type="hidden" name="acyformname" value="formAcymailing92511" />
            </div>
        </form></div></div>

    </div>


    <div class="six columns">

        <div class="vg-step"><div class="title twitter-icon">Latest Tweets</div>
            <hr><div class="text margin-tb-20"><style>
                .twitter-timeline{ width:100%; }
            </style><a class="twitter-timeline" data-dnt="true" href="https://twitter.com/envato"  data-widget-id="345039525816459264">Tweets por @envato</a>
            </div></div><div class="vg-step"><div class="text margin-tb-20">

        <div class="custom"  >
            <div class="gray-box">

                <div class="gray-box-title" style="font-size:16px; color:#000;">Follow me : </div>

                <a class="social-icons social-facebook" title="Join Our Facebook Group" href="#">121.624</a>
                <a class="social-icons social-twitter" title="Join Our Twitter Group" href="#">121.624</a>
                <a class="social-icons social-youtube" title="Subscribe To Our Channel" href="#">121.624</a>
                <a class="social-icons social-whale" title="Pet The Whale" href="#">121.624</a>

            </div></div>
    </div></div>

    </div>


</div>



<div class="row" id="vg-partner">

    <div class="twelve columns">

        <div class="vg-partner"><div class="partners-carousel-title background-color">Our Partners</div>
            <div class="partners-carousel-${ctx}/static/images"><a href="javascript:void(0)">
            <img class="an-item" src="${ctx}/static/images/partners/partner-1.png" alt="Partner One" />
        </a><a href="javascript:void(0)">
            <img class="an-item" src="${ctx}/static/images/partners/partner-2.png" alt="Partner Two" />
        </a><a href="javascript:void(0)">
            <img class="an-item" src="${ctx}/static/images/partners/partner-3.png" alt="Partner Three" />
        </a><a href="javascript:void(0)">
            <img class="an-item" src="${ctx}/static/images/partners/partner-4.png" alt="Partner Four" />
        </a><a href="javascript:void(0)">
            <img class="an-item" src="${ctx}/static/images/partners/partner-5.png" alt="Partner Five" />
        </a><a href="javascript:void(0)">
            <img class="an-item" src="${ctx}/static/images/partners/partner-5.png" alt="Partner Five (2)" />
        </a><a href="javascript:void(0)">
            <img class="an-item" src="${ctx}/static/images/partners/partner-4.png" alt="Partner Four (2)" />
        </a><a href="javascript:void(0)">
            <img class="an-item" src="${ctx}/static/images/partners/partner-1.png" alt="Partner One (2)" />
        </a><a href="javascript:void(0)">
            <img class="an-item" src="${ctx}/static/images/partners/partner-3.png" alt="Partner Three (2)" />
        </a></div><div class="background-color partners-carousel-controls">

            <div id="carousel-directioner-prev" class="partners-carousel-control deactive to-left-icon"></div>
            <div id="carousel-directioner-next" class="partners-carousel-control to-right-icon"></div>

        </div></div>

    </div>

</div>



<div class="row footer background-color" id="vg-footer">

    <div class="twelve columns">

        <div class="vg-footer footer-menu">
            <ul class="menu">
                <li class="item-123"><a href="/themes/metrocreative/?vg_color=0,170,170" >Green</a></li><li class="item-124"><a href="/themes/metrocreative/?vg_color=205,33,34" >Red</a></li><li class="item-125"><a href="/themes/metrocreative/?vg_color=204,204,204" >Gray</a></li><li class="item-126"><a href="/themes/metrocreative/?vg_color=21,146,204" >Blue</a></li><li class="item-160"><a href="/themes/metrocreative/?vg_color=255,184,72" >Yellow</a></li><li class="item-161"><a href="/themes/metrocreative/?vg_color=133,43,153" >Purple</a></li><li class="item-162"><a href="/themes/metrocreative/?vg_color=253,92,4" >Orange</a></li><li class="item-163"><a href="/themes/metrocreative/?vg_color=125,96,88" >Brown</a></li></ul>
        </div>

    </div>

</div>


</div><!-- RightSide ENDS -->

</div><!-- Page Wrap ENDS -->

<div id="toTop"></div>
<script type="text/javascript">
    if(document.body.clientWidth < 768){
        $("#vg-showcase").remove();
    }
</script>
</body>
</html>
