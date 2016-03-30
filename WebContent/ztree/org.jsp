<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ztree的配置 -->
<link rel="stylesheet" href="ztree/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="ztree/zTree_v3/js/jquery.ztree.core.min.js"></script>
<!-- 显示ztree的checkbox，不使用可以不加 -->
<script type="text/javascript" src="ztree/zTree_v3/js/jquery.ztree.excheck.min.js"></script>

<%
String url = request.getParameter("url");
String checkbox = request.getParameter("checkbox");
String onlyLeafCheck = request.getParameter("onlyLeafCheck");
%>
<input type="hidden" id="zzjgId"/>
<input type="text" id="zzjgName" readonly/>&nbsp;&nbsp;<span id="openTree" style="background:red">︿</span>
<div id="treeDiv" style="width:250px;background:gray;position:absolute;z-index:999;display:none">
	<ul id="treeDemo" class="ztree"></ul>
</div>

<script type="text/javascript">
$(function(){
	$("#openTree").click(function(){
		$("#treeDiv").toggle();
	});
	/*
	$("html").click(function(e){
		//alert(1);
		var target = $(e.target);
		if(!target.is('#treeDiv') && !target.is("#openTree")){
			alert(1);
			$("#treeDiv").hide();
		}else{
			alert(2);
		}
		
	});
	*/
});
function zTreeOnClick(event, treeId, treeNode) {
	$("#zzjgName").val(treeNode.name);
	$("#zzjgId").val(treeNode.id);
	console.log(treeNode.tId + ", " + treeNode.name + "   "+treeNode.id);
};

var zTreeObj;
// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
var setting = {
	check:{
		enable: true,
		chkStyle: "checkbox",
		chkboxType: { "Y" : "s", "N" : "ps" }
	},
	callback: {
		onClick: zTreeOnClick
	}
};
// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
var zNodes = 
{
id:1,
name:'省',
open:false,
children:[
	{name:"test1", open:true, children:[
	   {name:"test1_1",checked:true}, {name:"test1_2"}]},
	{name:"test2", open:true, children:[
	   {name:"test2_1"}, {name:"test2_2"}]}
	]
};
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