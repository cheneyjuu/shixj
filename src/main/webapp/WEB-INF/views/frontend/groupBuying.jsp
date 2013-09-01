<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">
        .price-wrap{
            border: 1px solid #888;
            border-radius: 2px;
            padding: 15px;
            height: auto;
            text-align: center;
        }
        .price-wrap:first-line{
            color: #e3383e;
        }
        .price-wrap span{
            color: #e3383e;
            font-size: 1.5em;
        }
        .price-wrap:after{
            content: '';
            display: inline-block;
            width: 100%;
        }
        .price-wrap .btn-block{
            width: 60%;
            height: 2em;
            font-size: 2em;
            letter-spacing: 0.2em;
            margin: 10px auto;
        }
        .price-wrap > div{
            border-right: 1px solid #888;
            text-align: center;
        }
        .price-wrap > div:last-child{
            border-right: none;
        }
        .has-time{
            border: 1px solid #888;
            border-radius: 2px;
            padding: 15px;
            margin-top: 10px;
        }
        .has-time div{
            text-align: center;
        }
        .has-time div:nth-child(2){
            margin-bottom: 10px;
        }
        .buy-count{
            color: #e3383e;
            font-size: 1.5em;
            text-align: center;
            border: 1px solid #888;
            margin-top: 10px;
        }
        .buy-count span{
            color: #777;
            font-size: 0.6em;
        }
        .col-md-8.image-wrap img{
            max-width: 100%;
            height: 350px;
            max-height: 350px;
            float: right;
            margin-right: 20px;
        }
        .col-md-8.image-wrap:after{
            content: '';
            display: inline-block;
            width: 100%;
        }
        .row.content{
            margin: 15px;
        }
    </style>
</head>
<body>
<div class="container">
            <blockquote>
                ${productModel.infoIntro}
            </blockquote>
            <div class="col-md-4">
                <div class="price-wrap">
                    价格：<span>￥ ${productModel.infoCurrentPrice}</span>
                    <button class="btn btn-block btn-circle btn-s-large btn-danger">团购</button>
                    <div class="col-md-4">原价 <div>￥ ${productModel.infoOriginalPrice}</div></div>
                    <c:set var="zhekou" value="${productModel.infoCurrentPrice/productModel.infoOriginalPrice*10}" />
                    <div class="col-md-4">折扣 <div>￥ ${fn:substringBefore(".", zhekou)}</div></div>
                    <div class="col-md-4">节省 <div>￥ ${productModel.infoOriginalPrice-productModel.infoCurrentPrice}</div></div>
                </div>
                <div class="has-time">
                    <div id="remainSeconds" style="display:none">${productModel.infoGroupbuyingEndtime}</div>
                    <div>剩余时间：</div>
                    <div id="remainTime"></div>
                </div>
                <div class="buy-count">${productModel.infoClicks} <span>人已购买</span></div>
            </div>
            <div class="col-md-8 image-wrap">
                <c:forEach items="${productModel.infoImages}" var="infoImg" varStatus="st">
                    <c:if test="${st.index == 0}">
                        <img src="${ctx}${infoImg.imagePath}${infoImg.pcImageName}" alt=""/>
                    </c:if>
                </c:forEach>
            </div>
            <div class="row content">
                ${productModel.infoDetails}
            </div>
</div>
<script src="http://cdn.staticfile.org/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript">
    var SysSecond;
    var InterValObj;

    $(document).ready(function() {
        SysSecond = parseInt($("#remainSeconds").html()); //这里获取倒计时的起始时间
        InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
    });

    //将时间减去1秒，计算天、时、分、秒
    function SetRemainTime() {
        if (SysSecond > 0) {
            SysSecond = SysSecond - 1;
            var second = Math.floor(SysSecond % 60);             // 计算秒
            var minite = Math.floor((SysSecond / 60) % 60);      //计算分
            var hour = Math.floor((SysSecond / 3600) % 24);      //计算小时
            var day = Math.floor((SysSecond / 3600) / 24);        //计算天

            $("#remainTime").html(day + "天" + hour + "小时" + minite + "分" + second + "秒");
        } else {//剩余时间小于或等于0的时候，就停止间隔函数
            window.clearInterval(InterValObj);
            //这里可以添加倒计时时间为0后需要执行的事件
        }
    }
</script>
</body>
</html>