# easyui学习笔记

###tree学习
目录：/tree
实现功能点：
 * 通过jsp:include获取公共的组织机构树。
 * 树状图设置成position:absolute，防止打开后被其他元素遮挡。

###tab学习
目录：/tab
实现功能点：
 * 新建Tab页，根据名称判断是否重复，如果重复那么打开该页，否则新建。
 * 获取当前打开页面的index。
 * 关闭当前tab页。

###menu学习
目录：/menu
实现功能点：
* table右键出现菜单。
* 点击菜单操作对table进行行操作。

###layout学习
目录：/layout
实现功能点：
* 基本布局。
* 点击左侧菜单在中间center显示相应页面。

###window学习
目录：/window
实现功能点：
* 弹出关闭window。

###messager学习
目录：/messager
实现功能点：
* 右下角提示（提取公共方法）。
* alert
* confirm
* prompt

要点：
* 实现中文提示，将easyui提示信息改成中文：引入easyui-lang-zh_CN.js，并且该js必须在jquery.easyui.min.js的后面。