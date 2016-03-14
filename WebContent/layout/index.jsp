<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath %>">
	<title>layout</title>
	<!--
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css">
	--> 
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/bootstrap/easyui.css">
	 
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
</head>
<script>
$(function(){
	
});
function loadCenter(){
	alert(1);
	console.log($('#centerDiv').layout("options"));
	//alert($('#centerDiv').panel("options").href);
	$('#centerDiv').panel("href","test.html");
	$('#centerDiv').layout("option",'test.html');
	//$("#centerDiv").href="test.html";
}
</script>
<body class="easyui-layout">
    <div data-options="region:'north'" style="height:50px">logo</div>
    <div data-options="region:'west'" title="菜单" style="width:150px;">
    	<a href="javascript:void(0)" onclick="loadCenter()">加载</a>
    </div>
    <div data-options="region:'east'" style="width:100px;"></div>
    <div id="centerDiv" data-options="region:'center'"></div>
</body>
</html>