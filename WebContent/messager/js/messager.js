function showTips(msg,title,time){
    $.messager.show({
        title:title||'提示',
        msg:msg,
        showType:'show',
        timeout:time||4000
    });
}
function alert(){
	
}