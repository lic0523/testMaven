<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html class="iframe-h">

	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		<link rel="stylesheet" type="text/css" href="../static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../static/admin/css/admin.css" />
	</head>

	<body>
		<div class="wrap-container clearfix">
				<div class="column-content-detail">
					<form class="layui-form" action="">
						<div class="layui-form-item">
							<div class="layui-inline tool-btn">
								<button class="layui-btn layui-btn-small layui-btn-normal addBtn" data-url="article-add.html"><i class="layui-icon">&#xe654;</i></button>
								<button class="layui-btn layui-btn-small layui-btn-danger delBtn"  data-url="article-add.html"><i class="layui-icon">&#xe640;</i></button>
								<button class="layui-btn layui-btn-small layui-btn-warm listOrderBtn hidden-xs" data-url="article-add.html"><i class="iconfont">&#xe656;</i></button>
							</div>
							<div class="layui-inline">
								<input type="text" name="title" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" id="username" value="${name }">
							</div>
							<div class="layui-inline">
								<select name="states" lay-filter="status" id="states">
								</select>
							</div>
							<button class="layui-btn layui-btn-normal"  onclick="select()" type="button">搜索</button>
						</div>
					</form>
					<div class="layui-form" id="table-list">
						<table class="layui-table" lay-even lay-skin="nob">
							<colgroup>
								<col width="50">
								<col class="hidden-xs" width="50">
								<col class="hidden-xs" width="100">
								<col>
								<col class="hidden-xs" width="150">
								<col class="hidden-xs" width="150">
								<col width="80">
								<col width="150">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
									<th class="hidden-xs">ID</th>
									<th>名称</th>
									<th>年龄</th>
									<th class="hidden-xs">创建时间</th>
									<th class="hidden-xs">修改时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${!empty pageBean.list }">  
                				<c:forEach items="${pageBean.list}" var="user"> 
								<tr>
									<td><input type="checkbox" name="" lay-skin="primary" data-id="1"></td>
									<td class="hidden-xs">${user.id }</td>
									<td>${user.userName }</td>
									<th>${user.age }</th>
									<td class="hidden-xs">1989-10-14</td>
									<td class="hidden-xs"><%
								    java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(  
								     "yyyy-MM-dd");  
								   java.util.Date currentTime = new java.util.Date();  
								   String time = simpleDateFormat.format(currentTime).toString();
								   out.println(time);
								     %></td>
									<td><button class="layui-btn layui-btn-mini layui-btn-normal">正常</button></td>
									<td>
										<div class="layui-inline">
											<button class="layui-btn layui-btn-small layui-btn-normal go-btn" data-id="1" data-url="article-detail.html"><i class="layui-icon">&#xe642;</i></button>
											<button class="layui-btn layui-btn-small layui-btn-danger del-btn" data-id="${user.id }" data-url="article-detail.html"><i class="layui-icon">&#xe640;</i></button>
										</div>
									</td>
								</tr>
								 </c:forEach>
								 </c:if>
							</tbody>
						</table>
						<div class="page-wrap">
							<ul class="pagination">
								<li class="disabled"><span>«</span></li>
								<li class="active"><span>1</span></li>
								<li>
									<a href="#">2</a>
								</li>
								<li>
									<a href="#">»</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
		</div>
		<script src="../static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		
	</body>
	
	<script type="text/javascript">
	
	
	var sele = document.getElementById("states");
	var defult = document.createElement("option");
	var defulttext = document.createTextNode("请选择一个年龄");
	defult.appendChild(defulttext);
	defult.value = 0;
	sele.appendChild(defult);
	for(var a=1;a<100 ;a++){
		var option  =  document.createElement("option");
		var text  =  document.createTextNode(a);
		option.appendChild(text);
		option.value = a ;
		sele.appendChild(option); 
	}	
	
	function select(){
		var usname = document.getElementById("username").value;
		var age = document.getElementById("states").value;
		var url="<%=basePath%>user/findByUname.do?userName=" + usname ;
		window.location.href = url;
	}
	
	
	layui.config({
		base: '../static/admin/js/module/'
	}).extend({
		dialog: 'dialog',
	});	
	
	layui.use(['form', 'jquery', 'laydate', 'layer', 'laypage', 'dialog',   'element'], function() {
		
		var form = layui.form(),
		layer = layui.layer,
		$ = layui.jquery,
		dialog = layui.dialog;	
	
	

	$('.addBtn').click(function() {
		
		var usname = document.getElementById("username").value;
		var age = document.getElementById("states").value;
		//将iframeObj传递给父级窗口,执行操作完成刷新
		alert(111)
		$.ajax({
			url:"<%=basePath%>user/checkregist.do",
			type:"post",
			data:{"userName":usname,"password":123456,"age":age},
			dataType:"json",
			success:function(data){
				if(data == "index"){
					layer.msg('添加成功了')
					window.location.reload();
				}
				else{
					layer.msg('添加失败')
				}
			}
			
		})
	}).mouseenter(function() {
		dialog.tips('添加用户', '.addBtn');

	})
	
		$('#table-list').on('click', '.del-btn', function() {
			var url=$(this).attr('data-url');
			var id = $(this).attr('data-id');
			dialog.confirm({
				message:'您确定要进行删除吗？',
				success:function(){
				$.get("<%=basePath%>user/delUser.do?id=" + id,function(data){  
			            if("success" == data.result){  
			                layer.msg('删除成功了')  
			                window.location.reload();  
			            }else{  
			                layer.msg('删除失败了')  
			            }  
			        }); 
				},
				cancel:function(){
					layer.msg('取消了')
				}
			})
			return false;
		})	
	
	})
	
	</script>

</html>