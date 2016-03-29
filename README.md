# easyui学习笔记

###tree学习
**目录：**/tree

**实现功能点：**
 * 通过jsp:include获取公共的组织机构树。
 * 树状图设置成position:absolute，防止打开后被其他元素遮挡。

###tab学习
**目录：**/tab

**实现功能点：**
 * 新建Tab页，根据名称判断是否重复，如果重复那么打开该页，否则新建。
 * 获取当前打开页面的index。
 * 关闭当前tab页。

###menu学习
**目录：**/menu

**实现功能点：**
* table右键出现菜单。
* 点击菜单操作对table进行行操作。

###layout学习
**目录：**/layout

**实现功能点：**
* 基本布局。
* 点击左侧菜单在中间center显示相应页面。

###window学习
**目录：**/window

**实现功能点：**
* 弹出关闭window。

###messager学习
**目录：**/messager

**实现功能点：**
* 右下角提示（提取公共方法）。
* alert
* confirm
* prompt

**要点：**
* 实现中文提示，将easyui提示信息改成中文：引入easyui-lang-zh_CN.js，并且该js必须在jquery.easyui.min.js的后面。


###accordion手风琴菜单
**目录：**/accordion
**实现功能点：**
* 菜单，带子菜单。
* 点击测试菜单初始化通过js解析json动态生成菜单。

**要点：**
* 菜单由两部分构成。外面是accordion的手风琴样式，里面是menubutton。



###uploadify学习
**目录：**/uploadify

**实现功能点：**
* 使用uploadify插件上传文件。

**要点：**
* 服务端需要jar包：
	* `/EasyUiLearn/WebContent/WEB-INF/lib/commons-fileupload-1.3.1.jar`
	* `/EasyUiLearn/WebContent/WEB-INF/lib/commons-io-2.2.jar`

###Java解析Excel公共类
**路径：**`src/com/excel/utils/AnalyseExcelUtil.java`

**实现功能点：**
* 只需要excel的路径和需要解析的sheet页的个数，便能将excel的内容解析到一个map对象中。
* 调用方法`new AnalyseExcelUtil().excel2Obj(result, filePath,0);`，result是解析后的结果，filePath是excel的实际路径，0是解析sheet页的个数（**0代表全部解析，其他数字代表解析的具体个数**）
 
**要点：**
* 需要jar包：
	* `/EasyUiLearn/WebContent/WEB-INF/lib/dom4j-1.6.1.jar`
	* `/EasyUiLearn/WebContent/WEB-INF/lib/poi-3.8.jar`
	* `/EasyUiLearn/WebContent/WEB-INF/lib/poi-ooxml-3.8.jar`
	* `/EasyUiLearn/WebContent/WEB-INF/lib/poi-ooxml-schemas-3.8.jar`
	* `/EasyUiLearn/WebContent/WEB-INF/lib/xmlbeans-2.3.0.jar`


