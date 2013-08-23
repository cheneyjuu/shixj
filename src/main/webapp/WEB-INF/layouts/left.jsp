<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<header>

    <div class="logo-container">
        <a id="logo" title="Metro | Creative Design" href="/"><img src="${ctx}/static/images/logo.png" /></a>
    </div>

    <nav>
        <ul id="menu" class="menu">
            <li class=" current active background-color">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/home.png);" class="vg-menu-icon menu-specs">
                    <a href="/">首页</a><span>Home</span>
                </div>
            </li>
            <li class=" parent">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/aboutus.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="#">食享食分</a><span>Share Food</span>
                </div>
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
            <li class=" parent">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/portfolio.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="#menuportfolio">团购食惠</a>

                    <span>Subtitle possible</span></div>
                <ul>
                    <li class=""><a href="/themes/metrocreative/index.php/portfolio/1-column">1 Column</a></li>
                    <li class=""><a href="/themes/metrocreative/index.php/portfolio/2-columns">2 Columns</a>
                    </li>
                    <li class=""><a href="/themes/metrocreative/index.php/portfolio/4-columns">4 Columns</a>
                    </li>
                    <li class=""><a
                            href="/themes/metrocreative/index.php/portfolio/4-columns-w-full-${ctx}/static/images">4
                        Columns w/ Full ${ctx}/static/images</a></li>
                </ul>
            </li>
            <li class=" parent">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/blog.png);" class="vg-menu-icon menu-specs">
                    <a href="#menublog">有礼有节</a>

                    <span>Subtitle possible</span></div>
                <ul>
                    <li class=""><a href="/themes/metrocreative/index.php/blog/blog-w-full-width">Blog w/ Full
                        Width</a></li>
                    <li class=""><a href="/themes/metrocreative/index.php/blog/blog-w-right-bar">Blog w/ Right
                        Bar</a></li>
                    <li class=""><a href="/themes/metrocreative/index.php/blog/blog-w-left-bar">Blog w/ Left
                        Bar</a></li>
                    <li class=""><a href="/themes/metrocreative/index.php/blog/blog-w-both-bars">Blog w/ Both
                        Bars</a></li>
                    <li class=""><a href="/themes/metrocreative/index.php/blog/post-w-slideshow">Post w/
                        Slideshow</a></li>
                    <li class=""><a href="/themes/metrocreative/index.php/blog/post-w-vimeo">Post w/ Vimeo</a>
                    </li>
                    <li class=""><a href="/themes/metrocreative/index.php/blog/post-w-youtube">Post w/
                        Youtube</a></li>
                    <li class=""><a href="/themes/metrocreative/index.php/blog/post-w-map">Post w/ Map</a></li>
                    <li class=""><a href="/themes/metrocreative/index.php/blog/subcategories">Subcategories</a>
                    </li>
                </ul>
            </li>
            <li class="">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/contact.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="/themes/metrocreative/index.php/contact">食享课堂</a>
                    <span>Subtitle possible</span>
                </div>
            </li>
            <li class="">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/welcome-icon.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="/themes/metrocreative/index.php/login">品牌故事</a>
                    <span>Access for users</span>
                </div>
            </li>
            <li class="">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/welcome-icon.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="/themes/metrocreative/index.php/login">合作伙伴</a>
                    <span>Access for users</span>
                </div>
            </li>
            <li class="">
                <div class="menu-abs-bg background-color"></div>
                <div style="background-image:url(${ctx}/static/images/icons/welcome-icon.png);"
                     class="vg-menu-icon menu-specs">
                    <a href="#">关于我们</a>
                    <span>Access for users</span>
                </div>
            </li>
        </ul>
    </nav>

</header>
<!-- Left Side ENDS -->
<script type="text/javascript">

    $(function(){
        var windowWidth = document.body.clientWidth;
        if (windowWidth > 768){
            $("#menu > li").each(function(){
                $(this).mouseenter(function(){
                    $(this).siblings().find("ul").slideUp();
                    $(this).find("ul").slideDown().css("left", "250px").css("top", "0");
                });
                $(this).find("ul").mouseleave(function(){
                    $(this).slideUp();
                });
            });
        }

        if (windowWidth < 768){
            $("#menu > li").each(function(){
                $(this).on("click touchend", function(){
                    $(this).find("ul").slideToggle();
                });
            });
        }
    });
</script>
