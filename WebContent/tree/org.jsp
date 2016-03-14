<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String url = request.getParameter("url");
String checkbox = request.getParameter("checkbox");
String onlyLeafCheck = request.getParameter("onlyLeafCheck");
%>
<div style="position:absolute;z-index:999;">
	<ul id="tt"></ul>
</div>
<script type="text/javascript">
$(function(){
	$('#tt').tree({
	    url:'<%=url %>',
	    checkbox:<%=checkbox%>,
	    onlyLeafCheck:<%=onlyLeafCheck%>
	});
});
function getOrg(){
	var ids = '';
	if($("#tt").tree("options").checkbox){//复选框模式
		var nodes = $('#tt').tree('getChecked');
	    for(var i=0; nodes && i<nodes.length; i++){
	        if (ids != '') {
	        	ids += ",";
	        }
	        ids += nodes[i].id;
	    }
	}else{
		var node = $('#tt').tree('getSelected');
		if (node){
            ids = node.id;
        }
	}
	return ids;
}
</script>