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
</head>
<script type="text/javascript">
$(function(){
});
</script>
<body>
<div>
	<button onclick="getSelected()">获取所有选中的对象</button>
	<table border="1">
		<tr>
			<td width="100px" align="right">组织机构：</td>
			<td width="250px" align="left">
				<jsp:include page="./org.jsp">
					<jsp:param name="url" value="tree/js/tree_data.json"/>
					<jsp:param name="checkbox" value="false"/>
					<jsp:param name="onlyLeafCheck" value="false"/>
					<jsp:param name="url" value="tree/js/tree_data.json"/>
				</jsp:include>
			</td>
		</tr>
	</table>
	

	 
	 
</div>
</body>
</html>