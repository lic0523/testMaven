<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	
  	<script type="text/javascript">
  		function a(){
  			event.stopPropagation();
  			alert("111")
  			var result = myform.username.value;
  			alert(result);
  		}
  	</script>
  </head>
  
  <body>

    <form action="${pageContext.request.contextPath}/user/checkLogin" method="post">
        <table>
            <tr>
                <td>用户名:</td>
                <td><input id="username" name="username" type="text"></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input id="password" name="password" type="password"></td>
            </tr>
            <tr >
                <td><input type="submit" value="登录"  ></td>
                <td><input type="button" value="注册" onclick="window.location.href='${pageContext.request.contextPath}/user/regist.do'"> </td>
            </tr>

        </table>
    </form>
    
     <div class="progress">
  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
    <span class="sr-only">60% Complete</span>
  </div>
</div>

<span class="glyphicon glyphicon-search" aria-hidden="true" onclick="a()"></span>
<form action="" name="myform">
<input name="username" value="呵呵呵">
</form>
</body>
</html>
