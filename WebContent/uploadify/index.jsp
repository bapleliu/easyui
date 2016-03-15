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
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="uploadify/uploadify/jquery.uploadify.min.js"></script>
	<link rel="stylesheet" type="text/css" href="uploadify/uploadify/uploadify.css" />
</head>
<script>
$(function(){
	$(function() {
		$(function() {
		    $('#file_upload').uploadify({
		    	'uploader' : '<%=basePath%>/UploadServlet',//服务端地址
		        'swf'      : 'uploadify/uploadify/uploadify.swf',
		        'buttonImage' : 'uploadify/uploadify/img/chooseFile.jpg',//重载按钮图片
		        'buttonClass' : 'some-class',//重载按钮样式
		        'height':19,//按钮宽度和高度
		        'width':76,
		        'queueID'  : 'file_queue',//显示文件队列的一个div，在页面定义
		        'formData' : {'parm1':'参数1','year':'2016'},//附加参数，可以在upload参数中更改
		        'buttonText':'选择文件',//按钮显示文字，如果有图片的话，会被图片挡住
		        'fileSizeLimit':'1MB',//文件最大
		        'auto':false,//自动提交
		        'fileTypeExts' : '*.gif; *.jpg; *.png',//文件类型
		        'fileTypeDesc' : '只能上传图片',//选择文件的时候的提示信息
		        'multi'    : false,//多选
		        'queueSizeLimit' : 1,//队列中文件的个数
	        	'onSelect' : function(file) {
	        		console.log(file);
	                alert("选择文件：" + file.name + "\n类型="+file.type+"\n大小="+file.size);
	            },
	            'onUploadSuccess' : function(file, data, response) {
	                alert('每个文件上传成功后触发 ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
	            },
	            'onUploadComplete' : function(file) {
	                alert('每个文件上传完成，无论对错都触发！ ' + file.name + ' finished processing.');
	            },
	            'onUploadError' : function(file, errorCode, errorMsg, errorString) {
	                alert('上传出错 ' + file.name + ' could not be uploaded: ' + errorString);
	            },
	            'onQueueComplete':function(queueData){
                    alert("队列中的所有文件上传完成后触发。\n"+queueData.uploadsSuccessful+'\n'+queueData.uploadsErrored)
                },
		    });
		});
	});
});
function upload(){
	$('#file_upload').uploadify("settings","formData",{"name1":"中文name","parm1":"修改后的参数"});
	$('#file_upload').uploadify('upload', '*');//上传所有文件
}
function cancel(){
	$('#file_upload').uploadify('cancel', '*');//取消所有文件
}
function destroy(){
	alert("取消upload上传，变成原来样式！");
	$('#file_upload').uploadify('destroy');//destory
}
</script>
<body>
	<div class="easyui-panel" title="说明" style="margin-bottom:15px">
	</div>
	<div class="easyui-panel" style="text-align:center;margin-bottom:15px">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="upload()">开始上传</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancel()">取消上传</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="destroy()">destroy</a>
		<input type="file" name="file_upload" id="file_upload" />
		<div id="file_queue" style="width:400px;height:10px;position:absolute;z-index:999"></div>
	</div>
</body>
</html>