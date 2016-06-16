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
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/demo.css">
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
</head>
<script>
$(function(){
	$("#tt").tabs({
		border:true,
	    onSelect:function(title){
	        
	    }
	});
});
function change(){
	/*	
	var tab = $('#tt').tabs('getTab',0);  // 取得第一个tab
    $('#tt').tabs('update', {
        tab: tab,
        options: {
            title: 'New Title'
        }
    });
    */
	/*获取title*/
	console.log( $('#tt').tabs('getTab',0).panel('options').title );
    console.log( $("#tt").tabs("tabs")[0].panel('options').title );
}
function add(){
	var title = "页面" + (Math.random()*10).toFixed(0);
	//遍历所有的tab，如果该tab已经存在，那么打开到该页，否则新建tab页。
	var tabs = $("#tt").tabs("tabs");
	for(var i=0; i<tabs.length; i++){
		if(tabs[i].panel('options').title==title){//已经存在，打开该页
			$("#tt").tabs("select",title);
			return;
		}
	}
	//该tab页不存在，那么新增
	$('#tt').tabs('add',{
	    title:title,
	    //content:'Tab Body',//tab页的内容
	    href:"test1.html",//tab页的内容来自一个引入的页面。
	    closable:true,
	    tools:[{
	        iconCls:'icon-mini-refresh',
	        handler:function(){
	            alert('refresh');
	        }
	    }]
	});
}
function getTab(){
	var tab = $('#tt').tabs('getSelected');
	var index = $('#tt').tabs('getTabIndex',tab);
	alert("索引="+index);
	if(index<0){
		alert("空");
	}else{
		var title = tab.panel('options').title;
		alert(title);
	}
}
function closeTab(){
	var tab = $('#tt').tabs('getSelected');
	var index = $('#tt').tabs('getTabIndex',tab);
	$("#tt").tabs("close",index);
}
function add100(){
	for(var i=0;i<50;i++){
		$('#tt').tabs('add',{
		    title:"页面" + i,
		    //content:'Tab Body',//tab页的内容
		    href:"test1.html",//tab页的内容来自一个引入的页面。
		    closable:true,
		    tools:[{
		        iconCls:'icon-mini-refresh',
		        handler:function(){
		            alert('refresh');
		        }
		    }]
		});
	}
}
</script>
<body>
	<div class="easyui-panel" title="说明" style="margin-bottom:15px">
		1.新建Tab页，根据名称判断是否重复，如果重复那么打开该页，否则新建。<br/>
		2.获取当前打开页面的index。<br/>
		3.关闭当前tab页。
	</div>
	<div class="easyui-panel" style="text-align:center;margin-bottom:15px">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add()">新建</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="getTab()">获取选中tab</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeTab()">关闭选中tab</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add100()">生成100个</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="change()">更改title</a>
	</div>
	<div id="tt"></div>
</body>
</html>