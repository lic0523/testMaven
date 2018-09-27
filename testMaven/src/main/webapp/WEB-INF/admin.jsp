<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <base href="<%=basePath%>">  
    <script type="text/javascript" src="js/jquery-1.7.1.js"></script>  
    <title>用户列表</title>  
      
    <script type="text/javascript">  
    function del(id){  
        $.get("<%=basePath%>user/delUser.do?id=" + id,function(data){  
            if("success" == data.result){  
                alert("删除成功");  
                window.location.reload();  
            }else{  
                alert("删除失败");  
            }  
        });  
    }  
    
    function find(){
    	event.stopPropagation();
    	var uname = findform.username.value;
    	alert("<%=basePath%>user/findByUname.do?username=" + uname);
    	window.location.href = "<%=basePath%>user/findByUname.do?username=" + uname ;
    }
</script>
<style>
A {text-decoration: NONE}
</style>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>  
    
  <body>  
    <h6><a href="<%=basePath%>user/regist.do">添加用户</a></h6> 
     <form action="" name="findform">
     <input name="username">
     <span class="glyphicon glyphicon-search" aria-hidden="true" onclick="find()"></span>
     </form>
    <table>  
        <tbody>  
            <tr>  
                <th>姓名</th>  
                <th>年龄</th>  
                <th>操作</th>  
            </tr>  
            <c:if test="${!empty pageBean.list }">  
                <c:forEach items="${pageBean.list}" var="user">  
                    <tr>  
                        <td>${user.userName }</td>  
                        <td>${user.age }</td>  
                        <td>  
                            <a href="<%=basePath%>user/getUser.do?id=${user.id}">编辑</a>  
                            <a href="javascript:del('${user.id}')">删除</a>
                        </td>  
                    </tr>               
                </c:forEach>
                  <div id="demo1">   
</div>
            </c:if>  
        </tbody>  
    </table> 
    
    <%-- 构建分页导航 --%>
            共有${requestScope.pageBean.totalRecord}个员工，共${requestScope.pageBean.totalPage }页，当前为${requestScope.pageBean.pageNum}页
            <br/>
            <a href="${pageContext.request.contextPath}/user/FindAllWithPage.do?pageNum=1">首页</a>
            <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
            <c:if test="${requestScope.pageBean.pageNum ==1}">
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>               
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="${pageContext.request.contextPath}/user/FindAllWithPage.do?pageNum=${i}">${i}</a>                                       
                    </c:if>                       
                </c:forEach>
                <a href="${pageContext.request.contextPath}/user/FindAllWithPage.do?pageNum=${requestScope.pageBean.pageNum+1}">下一页</a>                   
            </c:if>
             
            <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${requestScope.pageBean.pageNum > 1 && requestScope.pageBean.pageNum < requestScope.pageBean.totalPage}">
                <a href="${pageContext.request.contextPath}/user/FindAllWithPage.do?pageNum=${requestScope.pageBean.pageNum-1}">上一页</a>
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">   
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>           
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="${pageContext.request.contextPath}/user/FindAllWithPage.do?pageNum=${i}">${i}</a>                                       
                    </c:if>                       
                </c:forEach>
                <a href="${pageContext.request.contextPath}/user/FindAllWithPage.do?pageNum=${requestScope.pageBean.pageNum+1}">下一页</a>   
            </c:if>
             
            <%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
            <c:if test="${requestScope.pageBean.pageNum == requestScope.pageBean.totalPage}">
                <a href="${pageContext.request.contextPath}/user/FindAllWithPage.do?pageNum=${requestScope.pageBean.pageNum-1}">上一页</a>
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="${pageContext.request.contextPath}/user/FindAllWithPage.do?pageNum=${i}">${i}</a>                                       
                    </c:if>               
                </c:forEach>
            </c:if>
            <%--尾页 --%>
            <a href="${pageContext.request.contextPath}/user/FindAllWithPage.do?pageNum=${requestScope.pageBean.totalPage}">尾页</a> 
  </body>  
</html>
