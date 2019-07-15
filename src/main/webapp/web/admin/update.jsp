<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/system/header.jsp" %>
<title>用户维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>用户维护--修改信息</legend>
    <form class="layui-form" lay-filter="upduser" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" value="${user.code}" readonly lay-verify="required" placeholder="请输入账号" autocomplete="off"
                    class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" value="${user.name}" placeholder="请输入姓名" autocomplete="off"
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

formSubmit('/userController/update.do', 'submit(updUser)', 'text', function(data) {
	if (data == 1) {
// 		ajax('/DepartmentServlet',{action:'updCount',usercode:$("input[name='usercode']").val(),departmentId:$("select[name='departmentId']").val()},'json')
        layer.msg('修改成功');
        closeThis(2000);
    } else {
        layer.msg('修改失败');
    }
});
</script>
</body>
</html>