<%@ page contentType="text/html;charset=UTF-8"%>
<style type="text/css">
    .navbar-brand{
        color: #3c3c3c;
        padding-left: 10px;
        padding-right: 20px;
    }
</style>
<!-- header -->
<header id="header" class="navbar">
    <ul class="nav navbar-nav navbar-avatar pull-right">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="hidden-xs-only"><i class="icon-user"></i>你好，管理员</span>
                    <b class="caret hidden-xs-only"></b>
            </a>
            <ul class="dropdown-menu">
                <li><a href="${ctx}/profile">个人资料</a></li>
                <li class="divider">
                <li><a href="${ctx}/logout">退出</a></li>
            </ul>
        </li>
    </ul><a class="navbar-brand" href="#">食享家后台管理系统</a>
    <button type="button" class="btn btn-link pull-left nav-toggle visible-xs" data-toggle="class:slide-nav slide-nav-left" data-target="body"> <i class="icon-reorder icon-xlarge text-default"></i>
    </button>
</header>
<!-- / header -->