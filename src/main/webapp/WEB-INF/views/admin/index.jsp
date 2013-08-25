<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<h2>欢迎进入管理系统</h2>
<script>
    document.write("hello");
    function myFunction(){
        x = document.getElementById("aa").value;
//        x.innerHTML="啦啦";
//        x.style.color = "#ff0000"
        if(x==""){
            alert("是空");
        }else if(isNaN(x)){
            alert("不是数字"+x);
        }
    }



</script>
<%--<label id = "aa"></label>--%>
<input id = "aa" />
<button id="bb" value="button" onclick="myFunction()">点击我</button>

</body>
</html>
