<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>渠道商管理</title>
		<link rel="stylesheet" type="text/css" href="../../static/admin/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="../../static/admin/css/admin.css"/>
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
								<input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-inline">
								<select name="states" lay-filter="status">
									<option value="">请选择一个状态</option>
									<option value="010">正常</option>
									<option value="021">停止</option>
									<option value="0571">删除</option>
								</select>
							</div>
							<button class="layui-btn layui-btn-normal" lay-submit="search">搜索</button>
						</div>
					</form>
					<div class="layui-form" id="table-list">
						<table class="layui-table" lay-even lay-skin="nob" lay-data="{height:315, url:'<%=basePath%>part/getChannelPartnersList.do', page:true, id:'partInfoTable'}" lay-filter="partInfo" >
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
									<th class="hidden-xs" lay-data="{field:'partInd', width:80, sort: true}">ID</th>
									<th lay-data="{field:'partName', width:150, sort: true}">名称</th>
									<th class="hidden-xs" lay-data="{field:'addDate', width:120, sort: true}">创建时间</th>
									<th class="hidden-xs" lay-data="{field:'updateDate', width:120, sort: true}">修改时间</th>
									<th lay-data="{field:'isValidate', width:80, sort: true}">状态</th>
									<th>操作</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
		</div>
		<script src="<%=basePath%>js/jquery-1.7.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>


  layui.config({
    base: '../../../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['form', 'jquery', 'laydate', 'layer', 'laypage',  'element','table']], function(){
     var table = layui.table; 
	var form = layui.form(),
		layer = layui.layer,
		$ = layui.jquery,
		dialog = layui.dialog;
		
	//获取当前iframe的name值
	var iframeObj = $(window.frameElement).attr('name');
		
	table.render({
		elem: '#test-table-simple',
	  height: 300
	  ,url: '<%=basePath%>part/getChannelPartnersList.do'
	});     	
  })


</script>		

</body>
</html>