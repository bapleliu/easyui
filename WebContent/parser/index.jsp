<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath %>">
	<title></title>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
</head>
<script>
function add(){
	$("#testDiv").append("<div class='easyui-panel' title='"+Math.random()+"'>Math.random()</div>");
}
function parser(){
	//$.parser.parse();       // parse all the page
	$.parser.parse('#testDiv');
}
</script>
<body>
	<div class="easyui-panel" title="说明" style="margin-bottom:15px">
		1.parser将普通html渲染成easyui样式。
		
	</div>
	<div class="easyui-panel" style="text-align:center;margin-bottom:15px">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add()">新建</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="parser()">parser</a>
	</div>
	<div id="testDiv" class="easyui-panel" title="测试区域">
	
	</div>
</body>
</html>