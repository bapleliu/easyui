<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<title>江苏公路路网管理系统</title>
	<base href="<%=basePath %>">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    
</head>
<style>
</style>
<body class="easyui-layout" data-options='fit:true'>
	<div style="height:104px;" data-options="region:'north',border:false">
		实现方式一：<br/>
		通过center的href加载目标文件layoutTest/lxfwdyList.jsp。<br/>
		这种方式是easyui封装的，只会引入body里面的标签，head中引入的js不会运行。可以在div中引入js，这样可以运行。
		目标页面可以不要body、head，只是div而已。
		<div class="north">
			<img class="logo" src="images/title.png">
		</div>
		<div class="navDiv">
			<ul>
				<li>路线范围定义</li>
				<li>指标集定义</li>
				<li>指标表定义</li>
				<li>编目编码定义</li>
				<li>进度管理</li>
			</ul>
			<a class="quit">退出</a>
		</div>
	</div>
	<div style="background:gray" data-options="region:'center',href:'layoutTest/lxfwdyList.jsp',border:false"">
	</div>
</body>
</html>