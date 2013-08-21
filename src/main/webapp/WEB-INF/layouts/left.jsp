<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<header>

    <div class="logo-container">
        <a id="logo" title="Metro | Creative Design" href="/"><img src="${ctx}/static/images/logo.png" /></a>
    </div>

    <nav>
        <ul id="menu" class="menu">
            <li class="item-101 current active background-color">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/home.png);" class="vg-menu-icon menu-specs">
                    <a href="/themes/metrocreative/">首页</a><span>Home</span></div>
            </li>
            <li class="item-102 deeper parent">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/aboutus.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="#menufeatures">食享食分</a>

                    <span>Share Food</span></div>
                <ul>
                    <li><a href="/themes/metrocreative/index.php/features/about-us">About Us</a></li>
                    <li><a href="/themes/metrocreative/index.php/features/services">Services</a></li>
                    <li><a href="/themes/metrocreative/index.php/features/last-works-extension">Last
                        Works Extension</a></li>
                    <li><a href="/themes/metrocreative/index.php/features/my-isotope-extension">My
                        Isotope Extension</a></li>
                    <li><a href="/themes/metrocreative/./">Metro Slider</a></li>
                    <li><a href="/themes/metrocreative/index.php/features/normal-slider">Normal
                        Slider</a></li>
                    <li><a href="/themes/metrocreative/index.php/features/module-positions">Module
                        Positions</a></li>
                </ul>
            </li>
            <li class="item-104 deeper parent">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/portfolio.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="#menuportfolio">团购食惠</a>

                    <span>Subtitle possible</span></div>
                <ul>
                    <li class="item-131"><a href="/themes/metrocreative/index.php/portfolio/1-column">1 Column</a></li>
                    <li class="item-130"><a href="/themes/metrocreative/index.php/portfolio/2-columns">2 Columns</a>
                    </li>
                    <li class="item-127"><a href="/themes/metrocreative/index.php/portfolio/4-columns">4 Columns</a>
                    </li>
                    <li class="item-132"><a
                            href="/themes/metrocreative/index.php/portfolio/4-columns-w-full-${ctx}/static/images">4
                        Columns w/ Full ${ctx}/static/images</a></li>
                </ul>
            </li>
            <li class="item-105 deeper parent">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/blog.png);" class="vg-menu-icon menu-specs">
                    <a href="#menublog">有礼有节</a>

                    <span>Subtitle possible</span></div>
                <ul>
                    <li class="item-107"><a href="/themes/metrocreative/index.php/blog/blog-w-full-width">Blog w/ Full
                        Width</a></li>
                    <li class="item-150"><a href="/themes/metrocreative/index.php/blog/blog-w-right-bar">Blog w/ Right
                        Bar</a></li>
                    <li class="item-151"><a href="/themes/metrocreative/index.php/blog/blog-w-left-bar">Blog w/ Left
                        Bar</a></li>
                    <li class="item-155"><a href="/themes/metrocreative/index.php/blog/blog-w-both-bars">Blog w/ Both
                        Bars</a></li>
                    <li class="item-129"><a href="/themes/metrocreative/index.php/blog/post-w-slideshow">Post w/
                        Slideshow</a></li>
                    <li class="item-156"><a href="/themes/metrocreative/index.php/blog/post-w-vimeo">Post w/ Vimeo</a>
                    </li>
                    <li class="item-157"><a href="/themes/metrocreative/index.php/blog/post-w-youtube">Post w/
                        Youtube</a></li>
                    <li class="item-158"><a href="/themes/metrocreative/index.php/blog/post-w-map">Post w/ Map</a></li>
                    <li class="item-133"><a href="/themes/metrocreative/index.php/blog/subcategories">Subcategories</a>
                    </li>
                </ul>
            </li>
            <li class="item-106">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/contact.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="/themes/metrocreative/index.php/contact">食享课堂</a>
                    <span>Subtitle possible</span>
                </div>
            </li>
            <li class="item-128">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/welcome-icon.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="/themes/metrocreative/index.php/login">品牌故事</a>
                    <span>Access for users</span>
                </div>
            </li>
            <li class="item-128">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/welcome-icon.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="/themes/metrocreative/index.php/login">合作伙伴</a>
                    <span>Access for users</span>
                </div>
            </li>
            <li class="item-128">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/welcome-icon.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="/themes/metrocreative/index.php/login">关于我们</a>
                    <span>Access for users</span>
                </div>
            </li>
        </ul>


    </nav>

</header>
<!-- Left Side ENDS -->

<div id="subLevel" class="border-color background-color">

    <div id="opener" class="border-left-color border-top-color">
        <div class="opener-plus"></div>
    </div>
    <!--ul id="vg-submenu" class="menu"-->
    <ul id="menufeatures">
        <li class="item-109"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/features/about-us">About Us</a></li>
        <li class="item-139"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/features/services">Services</a></li>
        <li class="item-152"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/features/last-works-extension">Last Works
            Extension</a></li>
        <li class="item-153"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/features/my-isotope-extension">My Isotope
            Extension</a></li>
        <li class="item-137"><a class="border-color-darker vg-level-2" href="/themes/metrocreative/./">Metro Slider</a>
        </li>
        <li class="item-135"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/features/normal-slider">Normal Slider</a></li>
        <li class="item-159"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/features/module-positions">Module Positions</a>
        </li>
    </ul>
    </li>
    <ul id="menuportfolio">
        <li class="item-131"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/portfolio/1-column">1 Column</a></li>
        <li class="item-130"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/portfolio/2-columns">2 Columns</a></li>
        <li class="item-127"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/portfolio/4-columns">4 Columns</a></li>
        <li class="item-132"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/portfolio/4-columns-w-full-${ctx}/static/images">4
            Columns w/ Full ${ctx}/static/images</a></li>
    </ul>
    </li>
    <ul id="menublog">
        <li class="item-107"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/blog/blog-w-full-width">Blog w/ Full Width</a>
        </li>
        <li class="item-150"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/blog/blog-w-right-bar">Blog w/ Right Bar</a></li>
        <li class="item-151"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/blog/blog-w-left-bar">Blog w/ Left Bar</a></li>
        <li class="item-155"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/blog/blog-w-both-bars">Blog w/ Both Bars</a></li>
        <li class="item-129"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/blog/post-w-slideshow">Post w/ Slideshow</a></li>
        <li class="item-156"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/blog/post-w-vimeo">Post w/ Vimeo</a></li>
        <li class="item-157"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/blog/post-w-youtube">Post w/ Youtube</a></li>
        <li class="item-158"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/blog/post-w-map">Post w/ Map</a></li>
        <li class="item-133"><a class="border-color-darker vg-level-2"
                                href="/themes/metrocreative/index.php/blog/subcategories">Subcategories</a></li>
    </ul>
    </li><!--/ul-->


</div>