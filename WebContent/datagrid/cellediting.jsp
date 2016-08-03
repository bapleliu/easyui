<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath %>">
	<title>Cell Editing in DataGrid - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/bootstrap/easyui.css">
	 
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
</head>
<body>
	<h2>Cell Editing in DataGrid</h2>
	<p>Click a cell to start editing.</p>
	<div style="margin:20px 0;"></div>
	
	<table id="dg" title="Cell Editing in DataGrid" style="width:700px;height:auto"
			data-options="
				iconCls: 'icon-edit',
				singleSelect: true,
				url: 'datagrid/datagrid_data1.json',
				method:'get'
			">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80">Item ID</th>
				<th data-options="field:'productid',width:100,editor:'text'">Product</th>
				<th data-options="field:'listprice',width:80,align:'right',editor:{type:'text',options:{precision:1,validType:'email'}}">List Price</th>
				<th data-options="field:'unitcost',width:80,align:'right',editor:'numberbox'">Unit Cost</th>
				<th data-options="field:'attr1',width:250,editor:'text'">Attribute</th>
				<th data-options="field:'status',width:60,align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">Status</th>
			</tr>
		</thead>
	</table>

	<script type="text/javascript">
		$.extend($.fn.datagrid.methods, {
			editCell: function(jq,param){
				return jq.each(function(){
					var opts = $(this).datagrid('options');
					var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
					for(var i=0; i<fields.length; i++){
						var col = $(this).datagrid('getColumnOption', fields[i]);
						col.editor1 = col.editor;
						if (fields[i] != param.field){
							col.editor = null;
						}
					}
					$(this).datagrid('beginEdit', param.index);
                    var ed = $(this).datagrid('getEditor', param);
                    if (ed){
                        if ($(ed.target).hasClass('textbox-f')){
                            $(ed.target).textbox('textbox').focus();
                        } else {
                            $(ed.target).focus();
                        }
                    }
					for(var i=0; i<fields.length; i++){
						var col = $(this).datagrid('getColumnOption', fields[i]);
						col.editor = col.editor1;
					}
				});
			},
            enableCellEditing: function(jq){
                return jq.each(function(){
                    var dg = $(this);
                    var opts = dg.datagrid('options');
                    opts.oldOnClickCell = opts.onClickCell;
                    opts.onClickCell = function(index, field){
                        if (opts.editIndex != undefined){
                            if (dg.datagrid('validateRow', opts.editIndex)){
                                dg.datagrid('endEdit', opts.editIndex);
                                opts.editIndex = undefined;
                            } else {
                                return;
                            }
                        }
                        dg.datagrid('selectRow', index).datagrid('editCell', {
                            index: index,
                            field: field
                        });
                        opts.editIndex = index;
                        opts.oldOnClickCell.call(this, index, field);
                    }
                });
            }
		});

		$(function(){
			$('#dg').datagrid({
				onAfterEdit:function(index,row,changes){
					console.log(index);
					console.log(row);
					console.log(changes);
					
					var change = false;
		        	//console.log(row);
		        	//console.log(changes);
		        	for(x in changes){
		        		change = true;
		        		break;
		    		}
					if(change){
						console.log("在这里将改变提交到后台。");
						//执行正常就接受改变，否则撤销改变
						if(accept){
							accept = false;
							console.log("接受改变");
							$("#dg").datagrid("acceptChanges");
						}else{
							accept = true;
							console.log("回退改变");
							$("#dg").datagrid("rejectChanges");
						}
					}
				}
			}).datagrid('enableCellEditing');
		});
		var accept = true;
	</script>
</body>
</html>