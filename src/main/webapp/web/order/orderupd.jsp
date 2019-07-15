<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/system/header.jsp" %>
<title>订单维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>订单维护--修改信息</legend>
    <form class="layui-form" lay-filter="upduser" method="post">
    <div class="layui-form-item" >
   		<label class="layui-form-label">订单编号</label>
    	<div class="layui-input-inline">
     	 	<input type="text"  name="orderCode" value="${user.orderCode}" autocomplete="off" placeholder="请输入订单编号" readonly class="layui-input">
    	</div>
    	<label class="layui-form-label">用户编号</label>
    	<div class="layui-input-inline">
    	  <input type="text"  name="userCode" value="${user.userCode}" autocomplete="off" placeholder="请输入用户编号" readonly class="layui-input" >
   	 	</div>
    </div>
    <div class="layui-form-item" >
    	<label class="layui-form-label">下单时间</label>
    	<div class="layui-input-inline">
      		<input type="text"  name="time" value="${user.time}" autocomplete="off" placeholder="请输入下单时间" readonly class="layui-input" >
    	</div>
    	<label class="layui-form-label">地址编号</label>
    	<div class="layui-input-inline">
      		<input type="text"  name="addrCode" value="${user.addrCode}" autocomplete="off" placeholder="请输入地址编号" readonly class="layui-input" >
   		 </div>
   	</div>
   	<div class="layui-form-item" >
   <label class="layui-form-label">状态</label>
    <div class="layui-input-inline">
        <select name="state" lay-search>
        </select>
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
init()
function init() {
	var state='${user.state}';
	var html='<option value="${user.state}">${user.state}</option>';
	if (state=='未发货') {
		html+='<option value="已发货">已发货</option>';
	}else {
		html+='<option value="未发货">未发货</option>';
	}
	$("select[name='state']").html(html);
}
form.render();
formSubmit('/orderController/update.do', 'submit(updUser)', 'text', function(data) {
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