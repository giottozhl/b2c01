<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/web/system/header.jsp" %>
</head>
<body>
<fieldset class="layui-elem-field">
<legend>注册：</legend>
<div class="layui-field-box">
    <form class="layui-form layui-form-pane" >
<div style="position :relative; left:30%"> 
 <div class="layui-form-item" >
    <label class="layui-form-label">账号</label>
    <div class="layui-input-inline">
      <input type="text"  name="code" placeholder="请输入账号"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-inline">
      <input type="text"  name="name" placeholder="请输入姓名"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="password"  name="pass" placeholder="请输入密码"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
   <div class="layui-form-item" >
     <label class="layui-form-label">
     <img src='/BusinessToCustomer01/userController/servlet.do' onclick="this.src='/BusinessToCustomer01/userController/servlet.do?'+Math.random();">
     </label>
    <div class="layui-input-inline" >
      <input type="text" name="authCode" class="layui-input" lay-verify="required" required>
    </div>   
  </div>
  <div class="layui-form-item">
    <div class="layui-input-item">
     <input type="reset" class="layui-btn"  value="重置"> 
       <input class="layui-btn" type="button" value="确定"  lay-filter="reg" lay-submit>
       <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
    </div>
  </div>
   </div> 
  </form>
  </div>
  	</fieldset>
<script type="text/javascript">
formSubmit('/userController/reg.do','submit(reg)','text',function(data){
	if (data==0) {
		layer.msg('添加成功');
		closeThis(2000);
	}else if (data==1) {
		layer.msg('账号已存在');
	}else {
		layer.msg('添加失败');
	}
});
	</script>
</body>
</html>