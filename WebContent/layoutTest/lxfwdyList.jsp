<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<script src="layoutTest/test.js"></script>
</head>
<body>
<div id="div_center" class='easyui-layout' data-options='fit:true'>
<div data-options="region:'north'">
	<div class="locationDiv">
		当前位置：路线范围定义
	</div>
	<div class="queryDiv">
	</div>
	<div class="operDiv">
		<table border="0">
			<tr>
				<td>
				</td>
				<td align="right">
					<a href="javascript:void(0)" class="btn"><span>新增</span></a>
				</td>
			</tr>
		</table>
	</div>
</div>
<div data-options="region:'center'" style="background:green">
	<table class="easyui-datagrid" data-options="fit:true,pagination:true,singleSelect:true,url:'jquery-easyui-1.4.3/demo/datagrid/datagrid_data1.json',method:'get'">
        <thead>
            <tr>
                <th data-options="field:'itemid',width:80,align:'center'">序号</th>
                <th data-options="field:'productid',width:100">路线中文名称</th>
                <th data-options="field:'listprice',width:80,align:'right'">路线编码</th>
                <th data-options="field:'unitcost',width:80,align:'right'">路线排列方式</th>
                <th data-options="field:'attr1',width:250,align:'center'">操作</th>
            </tr>
        </thead>
    </table>
</div>
</div>
<script>
$(function(){
	alert(2);
});
</script>



</body>
</html>