<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/web/system/header.jsp" %>
</head>
<body>
<fieldset class="layui-elem-field">
<legend>地址管理：</legend>
<div class="layui-field-box">
    <form class="layui-form" lay-filter="upd" method="post">
    <div class="layui-form-item" >
    <label class="layui-form-label">收件人</label>
    <div class="layui-input-block">
      <input type="text"  name="user" placeholder="请输入收件人"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <input type="hidden" name="userCode" value="">
  <input type="hidden" name="id" value="">
  <div class="layui-form-item" >
    <label class="layui-form-label">电话</label>
    <div class="layui-input-block">
      <input type="text"  name="tel" placeholder="请输入电话"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
<div class="layui-form-item">
<label class="layui-form-label">地址信息</label>
<div class="layui-form-item" >
    <label class="layui-form-label ">省</label>
    <div class="layui-input-block">
        <input type="text"  name="province" placeholder="请输入省"  class="layui-input" lay-verify="required" required>
    </div>
</div>
<div class="layui-form-item" >
    <label class="layui-form-label">市</label>
    <div class="layui-input-block">
        <input type="text"  name="city" placeholder="请输入市"  class="layui-input" lay-verify="required" required>
    </div>
</div>
<div class="layui-form-item" >
    <label class="layui-form-label">区</label>
    <div class="layui-input-block">
        <input type="text"  name="district" placeholder="请输入区"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
 </div>
 <div class="layui-form-item" >
    <label class="layui-form-label">详细地址</label>
    <div class="layui-input-block">
      <input type="text"  name="detailedAddr" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
     <input type="reset" class="layui-btn"  value="重置"> 
       <input class="layui-btn" type="button" value="确定" lay-submit lay-filter="updById">
       <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
    </div>
  </div>
  </form>
  </div>
  	</fieldset>
<script type="text/javascript">
init();
function init() {
	var id=<%=request.getParameter("id")%>;
	ajax('/addrController/select.do',{id:id},'json',function(data){
		form.val("upd",{id:data.id,userCode:data.userCode,user:data.user,tel:data.tel,province:data.province,city:data.city,district:data.district,detailedAddr:data.detailedAddr})
	})
}
formSubmit('/addrController/update.do', 'submit(updById)', 'text', function(data) {
	if (data == 1) {
        layer.msg('修改成功');
        closeThis(3000);
    } else {
        layer.msg('修改失败');
    }
});
</script>
</body>
</html>