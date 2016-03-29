<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath %>">
	<title>accordion</title>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="messager/js/messager.js"></script>
</head>
<script>
$(function(){
});
function leftMenuClick(url){
	showTips('页面跳转：'+url);
}
function initMenu(){
	var menuStr = "[{\"id\":1,\"name\":\"菜单一\",\"pid\":0},{\"id\":2,\"name\":\"菜单一1\",\"pid\":1},{\"id\":3,\"name\":\"菜单二\",\"pid\":0},{\"id\":4,\"name\":\"菜单二1\",\"pid\":3},{\"id\":5,\"name\":\"菜单三\",\"pid\":0}]";
	menuStr = eval(menuStr);
	console.log(menuStr);
	menuStr.reverse();//数组倒序
	$.each(menuStr,function(i,item){
		if(item.pid==0){
			menu="";
			if($("#"+item.id).length>0){//存在
				menu = "menu:'#"+item.id+"',";
			}
			$("#testMenu").append("<a onclick=\"leftMenuClick('"+item.name+"')\" href=\"javascript:void(0)\" class=\"easyui-menubutton\" style=\"width:100%;text-align:left\" data-options=\""+menu+"menuAlign:'right',plain:false,hasDownArrow:true\">&nbsp;&nbsp;"+item.name+"</a>");
		}else{
			if($("#"+item.pid).length<1){
				$("body").append("<div id='"+item.pid+"' style=\"width:150px;\"></div>");
			}
			$("#"+item.pid).append("<div onclick=\"leftMenuClick('"+item.name+"')\">"+item.name+"</div>");
		}
	});
	$.parser.parse('#testMenu');
}
</script>
<body>
	<div class="easyui-panel" title="说明" style="margin-bottom:15px;padding:5px">
		1.菜单由两部分构成。外面是accordion的手风琴样式，里面是menubutton。<br/><br/>
		2.点击测试菜单初始化通过js解析json动态生成菜单。
	</div>
	<a onclick="initMenu()" href="javascript:void(0)" class="easyui-linkbutton">测试菜单初始化</a>
	<!-- 手风琴菜单 -->
	<div id="aa" class="easyui-accordion" style="width:250px;height:600px;">
	    <div title="人员管理" data-options="" style="overflow:auto">
	    	<a onclick="leftMenuClick('人员管理')" href="javascript:void(0)" class="easyui-menubutton" style="width:100%;text-align:left" data-options="menuAlign:'right',plain:false,hasDownArrow:false">&nbsp;&nbsp;人员管理</a>
	    </div>
	    <div title="机构管理" data-options="iconCls:'icon-reload',selected:true">
	        <a onclick="leftMenuClick('新增机构')" href="javascript:void(0)" id="mb" class="easyui-menubutton" style="width:100%;text-align:left" data-options="menu:'#mm',menuAlign:'right',plain:false,hasDownArrow:true">&nbsp;&nbsp;新增机构</a>
	        <a onclick="leftMenuClick('机构查看')" href="javascript:void(0)" id="mb" class="easyui-menubutton" style="width:100%;text-align:left" data-options="menu:'#mm',menuAlign:'right',plain:false,hasDownArrow:false">&nbsp;&nbsp;机构查看</a>
	    </div>
	    <div title="质量考核">
	        <a onclick="leftMenuClick('考核1')" href="javascript:void(0)" id="mb" class="easyui-menubutton" style="width:100%;text-align:left" data-options="menu:'#mm',menuAlign:'right',plain:false,hasDownArrow:true">&nbsp;&nbsp;月度考核</a>
	        <a onclick="leftMenuClick('考核2')" href="javascript:void(0)" id="mb" class="easyui-menubutton" style="width:100%;text-align:left" data-options="menu:'#mm',menuAlign:'right',plain:false,hasDownArrow:false">&nbsp;&nbsp;年度考核</a>
	        <a onclick="leftMenuClick('考核3')" href="javascript:void(0)" id="mb" class="easyui-menubutton" style="width:100%;text-align:left" data-options="menu:'#mm',menuAlign:'right',plain:false,hasDownArrow:false">&nbsp;&nbsp;考核查看</a>
	    </div>
	    <div id="testMenu" title="测试菜单">
	    </div>
	</div>
	<!-- menuButton -->
	<div id="mm" style="width:150px;">
	    <div data-options="iconCls:'icon-undo'">Undo</div>
	    <div data-options="iconCls:'icon-redo'">Redo</div>
	    <div class="menu-sep"></div>
	    <div>Cut</div>
	    <div>Copy</div>
	</div>
</body>
</html>