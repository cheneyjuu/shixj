<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Mobile first web app theme | first</title>
    <meta name="description" content="mobile first, app, web app, responsive, admin dashboard, flat, flat ui">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/styles/backend/app.v3.css">
    <!--[if lt IE 9]> <script src="http://cdn.staticfile.org/respond.js/1.2.0/respond.min.js"></script> <script src="http://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script> <script src="js/ie/excanvas.js"></script> <![endif]-->
</head>

<body>
<%@include file="adminHeader.jsp"%>
<%@include file="adminLeft.jsp"%>
<section class="main padder" id="content">
    <div class="row">
        <div class="col-lg-6">
            <!-- scrollable inbox widget -->
            <section class="panel">
                <header class="panel-heading">合作伙伴</header>
                <section style="height:210px" class="panel-body scrollbar scroll-y m-b">
                    <article class="media">
                                <span class="pull-left thumb-small">
                                    <img src="images/avatar.jpg" alt="John said" class="img-circle">
                                </span>
                        <div class="media-body">
                            <div class="pull-right media-mini text-center text-muted">
                                <strong class="h4">12:18</strong>
                                <br>
                                <small class="label bg-light">pm</small>
                            </div> <a href="#" class="h4">Bootstrap 3.0 is comming</a>
                            <small class="block"><a href="#" class="">John Smith</a>
                                <span class="label label-success">Circle</span>
                            </small>
                            <small class="block">Sleek, intuitive, and powerful mobile-first front-end framework for faster and easier web development.</small>
                        </div>
                    </article>
                    <div class="line pull-in"></div>
                    <article class="media">
                                <span class="pull-left thumb-small"><i class="icon-user icon-2x text-muted"></i>
                                </span>
                        <div class="media-body">
                            <div class="pull-right media-mini text-center text-muted">
                                <strong class="h4">17</strong>
                                <br>
                                <small class="label bg-light">feb</small>
                            </div> <a href="#" class="h4">Bootstrap documents</a>
                            <small class="block"><a href="#" class="">John Smith</a>
                                <span class="label label-info">Friends</span>
                            </small>
                            <small class="block">There are a few easy ways to quickly get started with Bootstrap, each one appealing to a different skill level and use case. Read through to see what suits your particular needs.</small>
                        </div>
                    </article>
                    <div class="line pull-in"></div>
                    <article class="media">
                        <div class="media-body">
                            <div class="pull-right media-mini text-center text-muted">
                                <strong class="h4">09</strong>
                                <br>
                                <small class="label bg-light">jan</small>
                            </div> <a href="#" class="h4 text-success">Mobile first html/css framework</a>
                            <small class="block">Bootstrap, Ratchet</small>
                        </div>
                    </article>
                </section>
            </section>
            <!-- / scrollable inbox widget-->
        </div>
        <div class="col-lg-6">
            <!-- task -->
            <section class="panel">
                <header class="panel-heading">品牌故事</header>
                <ul class="list-group">
                    <li class="list-group-item" data-toggle="class:active" data-target="#todo-1">
                        <div class="media">
                                    <span class="pull-left thumb-small m-t-mini"> <i class="icon-code icon-xlarge text-default"></i>
                                    </span>
                            <div id="todo-1" class="pull-right text-primary m-t-small"> <i class="icon-circle icon-large text text-default"></i>  <i class="icon-ok-sign icon-large text-active text-primary"></i>
                            </div>
                            <div class="media-body">
                                <div><a href="#" class="h5">Coding on app</a>
                                </div>
                                <small class="text-muted">9:30 am every day</small>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item bg" data-toggle="class:active" data-target="#todo-2">
                        <div class="media">
                                    <span class="pull-left thumb-small m-t-mini"> <i class="icon-reply icon-xlarge text-default"></i>
                                    </span>
                            <div id="todo-2" class="pull-right text-primary m-t-small"> <i class="icon-circle icon-large text text-default"></i>  <i class="icon-ok-sign icon-large text-active text-primary"></i>
                            </div>
                            <div class="media-body">
                                <div><a href="#" class="h5">Reply email</a>
                                </div>
                                <small class="text-muted">Check Gmail and reply</small>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item" data-toggle="class:active" data-target="#todo-3">
                        <div class="media">
                                    <span class="pull-left thumb-small m-t-mini"> <i class="icon-coffee icon-xlarge text-default"></i>
                                    </span>
                            <div id="todo-3" class="pull-right text-primary m-t-small"> <i class="icon-circle icon-large text text-default"></i>  <i class="icon-ok-sign icon-large text-active text-primary"></i>
                            </div>
                            <div class="media-body">
                                <div><a href="#" class="h5">Coffee time</a>
                                </div>
                                <small class="text-muted">Freetime as you want</small>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item bg" data-toggle="class:active" data-target="#todo-4">
                        <div class="media">
                                    <span class="pull-left thumb-small m-t-mini"> <i class="icon-music icon-xlarge text-default"></i>
                                    </span>
                            <div id="todo-4" class="pull-right text-primary m-t-small"> <i class="icon-circle icon-large text text-default"></i>  <i class="icon-ok-sign icon-large text-active text-primary"></i>
                            </div>
                            <div class="media-body">
                                <div><a href="#" class="h5">Listen music</a>
                                </div>
                                <small class="text-muted">Listening and finding</small>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
            <!-- / task-->
        </div>
    </div>
</section>
<script src="${ctx}/static/script/backend/app.v3.js"></script>
</body>
</html>