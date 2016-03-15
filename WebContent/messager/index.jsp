<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath %>">
	<title>messager</title>
	<!--
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css">
	--> 
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/bootstrap/easyui.css">
	 
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="messager/js/messager.js"></script>
</head>
<script>
function alert1(){
    $.messager.alert('My Title','Here is a message!');
}
function alert2(){
    $.messager.alert('My Title','Here is a error message!','error');
}
function alert3(){
    $.messager.alert('My Title','Here is a info message!','info');
}
function alert4(){
    $.messager.alert('My Title','Here is a question message!','question');
}
function alert5(){
    $.messager.alert('My Title','Here is a warning message!','warning');
}
function confirm(){
	$.messager.confirm('确定', '你是傻子嘛?', function(r){
        if (r){
        	$.messager.alert('提示','confirmed: '+r);
        }
    });
}
function prompt(){
	$.messager.prompt('提问', '写下你的梦想', function(r){
        if (r){
            $.messager.alert("梦想","你的梦想是:"+ r);
        }
    });
}
</script>
<body>
<div class="easyui-panel" title="要点" style="margin-bottom:10px">
1.将easyui提示信息改成中文：引入easyui-lang-zh_CN.js，并且该js必须在jquery.easyui.min.js的后面。
</div>
<a href="javascript:void(0);" class="easyui-linkbutton" onClick="javascript:showTips('内容6s后消失','自定义标题',6000);">右下角提示</a><br><br>
<a href="javascript:void(0);" class="easyui-linkbutton" onClick="javascript:showTips('只有内容');">右下角提示</a>
<hr/>
<a href="javascript:void(0);" class="easyui-linkbutton" onclick="alert1()">Alert</a>
<a href="javascript:void(0);" class="easyui-linkbutton" onclick="alert2()">Error</a>
<a href="javascript:void(0);" class="easyui-linkbutton" onclick="alert3()">Info</a>
<a href="javascript:void(0);" class="easyui-linkbutton" onclick="alert4()">Question</a>
<a href="javascript:void(0);" class="easyui-linkbutton" onclick="alert5()">Warning</a>
<hr/>
<a href="javascript:void(0);" class="easyui-linkbutton" onclick="confirm()">确认</a>
<a href="javascript:void(0);" class="easyui-linkbutton" onclick="prompt()">输入</a>
</body>
</html>