<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath %>">
	<title>window</title>
	<!--
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css">
	--> 
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/bootstrap/easyui.css">
	 
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
</head>
<script>
var windowMain = {
	initWindow:function(){
		$("#win").window({
			title:"一个弹出窗口",
			width:600,
		    height:400,
		    modal:true,
		    closed:true,
		    href:"window/window.jsp",
		    onLoad:function(){
		        console.log('页面加载完成调用！');
		        //为新加载的页面控件绑定事件
		        $("#closeBtn").click(function(){
		        	$("#win").window("close");
		        });
		    }
		});
	}
}
$(function(){
	windowMain.initWindow();
});

function openWin(){
	$("#win").window("open");
}
</script>
<body>
<a href="javascript:void(0);" class="easyui-linkbutton" onClick="javascript:openWin();">打开</a><br><br>
<div id="win"></div>
</body>
</html>