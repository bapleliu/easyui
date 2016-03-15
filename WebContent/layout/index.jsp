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
function loadCenter(url){
	var center = $("body").layout('panel','center');//获取center的panel
	center.panel('refresh',url);//更新panel的href
}
function getIdValue(id){
	console.log($("#"+id).val());
}
</script>
<body class="easyui-layout">
    <div data-options="region:'north'" style="height:50px">logo</div>
    <div data-options="region:'west'" title="菜单" style="width:150px;">
    	<a href="javascript:void(0)" onclick="loadCenter('test1.html')">加载页面1</a><br><br>
    	<a href="javascript:void(0)" onclick="loadCenter('test2.html')">加载页面2</a><br><br>
    	<a href="javascript:void(0)" onclick="getIdValue('id1')">获取id1</a><br><br>
    	<a href="javascript:void(0)" onclick="getIdValue('id2')">获取id2</a><br><br>
    </div>
    <div data-options="region:'east'" style="width:100px;"></div>
    <div id="centerDiv" data-options="region:'center'"></div>
</body>
</html>