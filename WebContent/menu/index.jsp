<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath %>">
	<title>menu</title>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/demo.css">
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
</head>
<script>
var rightSel;
var rightR;
$(function(){
	$('#mm').menu({
	    onClick:function(item){
	    }
	});
	$("#table1").datagrid({
		onRowContextMenu:function(e,index,row){
			$('#table1').datagrid('selectRow',index);
			rightR = index;
		    rightSel = $('#table1').datagrid('getSelected');
		    e.preventDefault();
		    $('#mm').menu('show', {
                left: e.pageX,
                top: e.pageY
            });
		}
	});
});
function del(){
	if(rightR>-1){
		$("#table1").datagrid("deleteRow",rightR);
	}
}

</script>
<body>
	<div class="easyui-panel" title="说明" style="margin-bottom:15px">
		1.table右键出现菜单。<br/>
		2.点击菜单操作对table进行行操作。<br/>
		注意：因为本例datagrid数据格式有问题，所以rightSel = $('#table1').datagrid('getSelected');获取不到值。
	</div>
	<div class="easyui-panel" style="text-align:center;margin-bottom:15px">
		<table id="table1">
		<thead>
            <tr>
                <th data-options="field:'itemid',width:80">标题</th>
            </tr>
        </thead>
			<tr>
				<td>1111111</td>
			</tr>
			<tr>
				<td>2222222</td>
			</tr>
			<tr>
				<td>3333333</td>
			</tr>
			<tr>
				<td>4444444</td>
			</tr>
		</table>
	</div>

<!-- menu div -->
<div id="mm" class="easyui-menu" style="width:120px;">
    <div onclick="javascript:del();">删除</div>
    <div>
        <span>Open</span>
        <div style="width:150px;">
            <div><b>Word</b></div>
            <div>Excel</div>
            <div>PowerPoint</div>
        </div>
    </div>
    <div data-options="iconCls:'icon-save'">Save</div>
    <div class="menu-sep"></div>
    <div>Exit</div>
</div>

</body>
</html>