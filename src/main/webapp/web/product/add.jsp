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
<legend>添加分类：</legend>
<div class="layui-field-box">
    <form class="layui-form layui-form-pane" >
<div style="position :relative; left:10%"> 
<div class="layui-form-item" >
    <label class="layui-form-label">一级分类</label>
    <div class="layui-input-inline">
        <select name="productType1" lay-filter="productType1"></select>
    </div>
    <label class="layui-form-label">二级分类</label>
    <div class="layui-input-inline">
        <select name="productType" ></select>
    </div>
  </div>
 <div class="layui-form-item" >
    <label class="layui-form-label">编号</label>
    <div class="layui-input-inline">
      <input type="text"  name="goodsCode" placeholder="请输入编号"  class="layui-input" lay-verify="required" required>
    </div>
    <label class="layui-form-label">名称</label>
    <div class="layui-input-inline">
      <input type="text"  name="name" placeholder="请输入名称"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">单价</label>
    <div class="layui-input-inline">
      <input type="text"  name="price" placeholder="请输入单价"  class="layui-input" lay-verify="required" required>
    </div>
    <label class="layui-form-label">库存</label>
    <div class="layui-input-inline">
      <input type="text"  name="number" placeholder="请输入库存"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
  <label class="layui-form-label">状态</label>
    <div class="layui-input-inline">
        <select name="state">
        	<option value="上架">上架</option>
        	<option value="下架">下架</option>
        </select>
    </div>
    <label class="layui-form-label">描述</label>
    <div class="layui-input-inline">
      <input type="text"  name="descr" placeholder="请输入描述"  class="layui-input" >
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-item">
     <input type="reset" class="layui-btn"  value="重置"> 
       <input class="layui-btn" type="button" value="确定"  lay-filter="add" lay-submit>
       <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
    </div>
  </div>
   </div> 
  </form>
  </div>
  	</fieldset>
<script type="text/javascript">
getSelect('productType1','type1');
function getSelect(selectid,parentcode) {
	if (parentcode=='') {
		$("select[name^='productType']").empty();
		form.render('select');
		return;
	}
	ajax('/dictController/getListUp.do',{parentCode:parentcode},'json',function(data){
		var html='';
		html+="<option value=''>请选择</option>";
		$.each(data,function(i,dom){
			html+="<option value='"+dom.code+"'>"+dom.name+"</option>";
		});
		$("select[name='"+selectid+"']").html(html);
		form.render('select');
	})
}
form.on('select(productType1)',function(data){
	getSelect('productType',data.value);
});
formSubmit('/prodController/add.do','submit(add)','text',function(data){
	if (data==0) {
		layer.msg('添加成功');
		closeThis(2000);
	}else if (data==1) {
		layer.msg('编号已存在');
	}else {
		layer.msg('添加失败-名称已存在');
	}
});
	</script>
</body>
</html>