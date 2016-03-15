<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="easyui-panel" style="padding:10px;">
    <form id="ff" action="form1_proc.php" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>Name:</td>
                <td><input name="name" class="f1 easyui-textbox"></input></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input name="email" class="f1 easyui-textbox"></input></td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td><input name="phone" class="f1 easyui-textbox"></input></td>
            </tr>
            <tr>
                <td>File:</td>
                <td><input name="file" class="f1 easyui-filebox"></input></td>
            </tr>
            <tr>
                <td><a id="closeBtn" class="easyui-linkbutton" href="javascript:void(0)">关闭</a></td>
                <td></td>
            </tr>
        </table>
    </form>
</div>