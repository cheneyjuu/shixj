<%@ page contentType="text/html;charset=UTF-8" %>
<!-- nav -->
<nav id="nav" class="nav-primary hidden-xs nav-vertical">
    <ul class="nav" data-spy="affix" data-offset-top="50">
        <li class="active"><a href="/admin/index"><i class="icon-dashboard icon-xlarge"></i><span>控制面板</span></a>
        </li>
        <li class="dropdown-submenu"><a href="#"><i class="icon-th icon-xlarge"></i><span>栏目管理</span></a>
            <ul class="dropdown-menu">
                <li><a href="/admin/nav/add">新增栏目</a></li>
                <li><a href="/admin/nav/navList">栏目列表</a></li>
            </ul>
        </li>
        <li class="dropdown-submenu"><a href="#"><i class="icon-shopping-cart icon-xlarge"></i><span>产品管理</span></a>
            <ul class="dropdown-menu">
                <li><a href="/admin/product/add">新增产品</a>
                </li>
                <li><a href="/admin/product/productList">产品列表</a>
                </li>
            </ul>
        </li>
        <li class="dropdown-submenu"><a href="#"><i class="icon-th-list icon-xlarge"></i><span>文章管理</span></a>
            <ul class="dropdown-menu">
                <li><a href="/admin/post/add">新增文章</a></li>
                <li><a href="/admin/post/postList">文章列表</a></li>
            </ul>
        </li>
    </ul>
</nav>
<!-- / nav -->