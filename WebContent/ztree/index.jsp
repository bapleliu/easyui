<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath %>">
	<title>ztree</title>
	<!--
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css">
	--> 
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<!-- ztree的配置 -->
	<link rel="stylesheet" href="ztree/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="ztree/zTree_v3/js/jquery.ztree.core.min.js"></script>
	<!-- 显示ztree的checkbox，不使用可以不加 -->
	<script type="text/javascript" src="ztree/zTree_v3/js/jquery.ztree.excheck.min.js"></script>
	
	
</head>
<script>
function zTreeOnClick(event, treeId, treeNode) {
	console.log(treeNode.tId + ", " + treeNode.name + "   "+treeNode.id);
};

var zTreeObj;
// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
var setting = {
	check:{
		enable: true,
		chkStyle: "checkbox",
		chkboxType: { "Y": "p", "N": "s" }
	},
	callback: {
		onClick: zTreeOnClick
	}
		
		
};
// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
var zNodes = [
{name:"test1", open:true, children:[
   {name:"test1_1",checked:true}, {name:"test1_2"}]},
{name:"test2", open:true, children:[
   {name:"test2_1"}, {name:"test2_2"}]}
];
$(document).ready(function(){
   zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
});

function getSelected(){
	var nodes = zTreeObj.getCheckedNodes(true);
	alert("总共选中了：" + nodes.length + "个");
	$.each(nodes,function(i,item){
		console.log(item);
	});
}
</script>
<body>
<div>
	<button onclick="getSelected()">获取所有选中的对象</button>
	<ul id="treeDemo" class="ztree"></ul>
</div>
</body>
</html>