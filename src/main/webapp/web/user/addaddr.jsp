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
<legend>地址管理：</legend>
<div class="layui-field-box">
    <form class="layui-form" >
    <div class="layui-form-item" >
    <label class="layui-form-label">收件人</label>
    <div class="layui-input-block">
      <input type="text"  name="user" placeholder="请输入收件人"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
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
       <input class="layui-btn" type="button" value="确定"  onclick="input()">
       <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
    </div>
  </div>
  </form>
  </div>
  	</fieldset>
<script type="text/javascript">
function input() {
	var userCode='${user.code}';
	var user=$("input[name='user']").val();
	var tel=$("input[name='tel']").val();
	var province=$("input[name='province']").val();
	var city=$("input[name='city']").val();
	var district=$("input[name='district']").val();
	var detailedAddr=$("input[name='detailedAddr']").val();
	if (userCode=='') {
		layer.msg("请先登录")
		return;
	}
	$.ajax({
		type:'post',
		url:'/BusinessToCustomer01/addrController/insert.do',
		data:{userCode:userCode,user:user,tel:tel,province:province,city:city,district:district,detailedAddr:detailedAddr},
		dataType:'text',
		success:function(data){
			if (data==1) {
				layer.msg('添加成功');
				closeThis(2000);
			}else if(data==3){
				layer.msg('添加失败--添加收货地址达到最多限制');
			}else {
				layer.msg('添加失败')
			}
		}
		
	})
}
	</script>
</body>
</html>