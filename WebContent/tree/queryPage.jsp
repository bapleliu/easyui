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
<body>
	<div class="easyui-panel" title="说明" style="margin-bottom:15px">
		1.通过jsp:include获取公共的组织机构树。<br/>
		2.树状图设置成position:absolute，防止打开后被其他元素遮挡。
	</div>
	<div class="easyui-panel" title="查询">
	<table>
		<tr>
			<td width="100px" align="right">机构：</td>
			<td width="150px" align="left" valign="top" style="padding-top:4px">
				<jsp:include page="./org.jsp">
					<jsp:param name="url" value="tree/js/tree_data.json"/>
					<jsp:param name="checkbox" value="false"/>
					<jsp:param name="onlyLeafCheck" value="false"/>
					<jsp:param name="url" value="tree/js/tree_data.json"/>
				</jsp:include>
			</td>
			<td width="100px" align="right">姓名：</td>
			<td><input type="text"/></td>
			<td>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="alert(getOrg())">获取选中</a>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>