<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/system/header.jsp" %>
<title>分类维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>分类维护--修改信息</legend>
    <form class="layui-form" lay-filter="upd" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">编号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" readonly lay-verify="required" placeholder="请输入编号" autocomplete="off"
                    class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" placeholder="请输入名称" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label">所属类别</label>
            <div class="layui-input-inline">
                    <select name="parentCode" lay-search></select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-inline">
                <input type="text" name="descr" placeholder="请输入描述" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="updUser" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
<script type="text/javascript">
ajax('/dictController/getListUp.do',{parentCode:"type1"},'json',function(data){
	var html='';
	html+='<option value="type1">一级分类</option>';
	$.each(data,function(i,dom){
		html+="<option value='"+dom.code+"'>"+dom.name+"</option>";
	});
	$("select[name='parentCode']").html(html);
	form.render('select');
	init();
})

function init() {
	var code = '<%=request.getParameter("code")%>';
	$.ajax({
        url:con.app+'/dictController/selectModel.do',
        data : {code:code},
        dataType : 'json',
        type : 'post',
        success : function(data) {
        	form.val("upd", 
        		{code: data.code,name: data.name,descr:data.descr,parentCode:data.parentCode})
        }
    })
}
formSubmit('/dictController/update.do', 'submit(updUser)', 'text', function(data) {
	if (data == 1) {
// 		ajax('/DepartmentServlet',{action:'updCount',usercode:$("input[name='usercode']").val(),departmentId:$("select[name='departmentId']").val()},'json')
        layer.msg('修改成功');
        closeThis(2000);
    }else if (data == 3) {
    	layer.msg('修改失败-一级分类不允许修改');
	} else {
        layer.msg('修改失败');
    }
});
</script>
</body>
</html>