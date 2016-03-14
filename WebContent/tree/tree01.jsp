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
	var nodes = $('#tt').tree('getChecked');
    var s = '';
    var ids = '';
    for(var i=0; i<nodes.length; i++){
        if (ids != '') {
        	s += ',';
        	ids += ",";
        }
        s += nodes[i].text;
        ids += nodes[i].id;
    }
    alert("ids=" + ids + "\ntext=" + s);
}
</script>