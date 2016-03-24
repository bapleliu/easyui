<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<script src="/easyui/jquery-easyui-1.4.3/jquery.min.js"></script>
<script src="page.js"></script>

<script>
function query(queryPage){
	//ajax查询表格需要的数据
	var queryPage = queryPage||1;
	console.log("query page=" + queryPage);
	//重新生成pageDiv
	displayPage('#pageDiv','goPage','query',10,1,100);
}
</script>
<body>
<button onclick="query()">查询</button>
<div>
用js实现的一个翻页。<br/>
主要使用场景：table中的数据通过ajax查询，查询完毕之后调用js生成翻页控件。<br/>
<code>
displayPage('#pageDiv','goPage','query',10,1,100);
</code>
<br/>
</div>
<div id="pageDiv"></div>
</body>