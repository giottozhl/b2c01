<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/system/header.jsp" %>
<title>商品维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>商品维护--修改信息</legend>
    <form class="layui-form" lay-filter="upd" method="post">
    <div class="layui-form-item" >
    <label class="layui-form-label">一级分类</label>
    <div class="layui-input-inline">
        <select name="productType1" lay-filter="productType1"></select>
    </div>
    <label class="layui-form-label">二级分类</label>
    <div class="layui-input-inline">
        <select name="parentCode" lay-search ></select>
    </div>
  </div>
        <div class="layui-form-item" >
    <label class="layui-form-label">编号</label>
    <div class="layui-input-inline">
      <input type="text"  name="goodsCode" autocomplete="off" placeholder="请输入编号" readonly="readonly"  class="layui-input" l>
    </div>
    <label class="layui-form-label">名称</label>
    <div class="layui-input-inline">
      <input type="text"  name="name" autocomplete="off" placeholder="请输入名称"  class="layui-input" >
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">单价</label>
    <div class="layui-input-inline">
      <input type="text"  name="price" autocomplete="off" placeholder="请输入单价"  class="layui-input" >
    </div>
    <label class="layui-form-label">库存</label>
    <div class="layui-input-inline">
      <input type="text"  name="number" autocomplete="off" placeholder="请输入库存"  class="layui-input" >
    </div>
  </div>
  <div class="layui-form-item" >
  <label class="layui-form-label">状态</label>
    <div class="layui-input-inline">
        <select name="state" lay-search>
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
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="add" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
<script type="text/javascript">
getSelect('productType1','type1');
function getSelect(selectid,parentcode) {
	ajax('/dictController/getListUp.do',{parentCode:parentcode},'json',function(data){
		var html='';
		$.each(data,function(i,dom){
			html+="<option value='"+dom.code+"'>"+dom.name+"</option>";
		});
		$("select[name='"+selectid+"']").html(html);
		form.render('select');
	})
}
form.on('select(productType1)',function(data){
	getSelect('parentCode',data.value);
	
});
init()
function init() {
	var goodsCode = '<%=request.getParameter("goodsCode")%>';
	$.ajax({
        url:con.app+'/prodController/selectModel.do',
        data : {goodsCode:goodsCode},
        dataType : 'json',
        type : 'post',
        success : function(data) {
//         	getSelect('parentCode',data.parent);
        	ajax('/dictController/getListUp.do',{parentCode:data.parent},'json',function(d){
        		var html='';
        		$.each(d,function(i,dom){
        			html+="<option value='"+dom.code+"'>"+dom.name+"</option>";
        		});
        		$("select[name='parentCode']").html(html);
        		form.render('select');
        	form.val("upd", 
        		{goodsCode: data.goodsCode,name: data.name,price:data.price,number:data.number,state:data.state,descr:data.descr,parentCode:data.parentCode,productType1:data.parent})
        	})
        }
    })
}
formSubmit('/prodController/update.do', 'submit(add)', 'text', function(data) {
	if (data == 1) {
        layer.msg('修改成功');
        closeThis(2000);
    } else{
        layer.msg('修改失败');
    }
});
</script>
</body>
</html>