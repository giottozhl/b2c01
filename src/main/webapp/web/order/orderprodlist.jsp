<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/web/system/header.jsp" %>
</head>
<body>
<div class="layui-collapse">
  <div class="layui-colla-item">
<!--     <h2 class="layui-colla-title">订单商品信息-查询条件</h2> -->
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
<!-- 		<legend>订单商品信息-查询条件</legend> -->
		<form class="layui-form">
			<div class="layui-form-item">
				<input type="button" class="layui-btn" onclick="closeThis()" value="关闭窗口" />
			</div>
			<div>
				
			</div>
			<input type="hidden" name="pageIndex" value="1" />
			<input type="hidden" name="pageLimit" value="10" />
		</form>
	</fieldset>
	</div></div></div>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="20%"><col width="25%">
				<col width="20%"><col width="20%">
<%-- 				<col width="20%"> --%>
			</colgroup>
			<thead>
				<tr>
					<th>订单编号</th><th>商品编号</th><th>数量</th>
					<th>小计</th>
<!-- 					<th>操作</th> -->
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>
	</div>
<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
<script>

init();
function init() {
var orderCode='<%=request.getParameter("orderCode")%>';
if (orderCode=='') {
	return;
}
ajax('/orderProdController/select.do',{orderCode:orderCode},'json'
		,function(data) {
    var html = "" ;//加载表格中数据
    $.each(data.list,function(i, dom) {
    	var orderCode = dom.orderCode?dom.orderCode:'';
        var goodsCode = dom.goodsCode?dom.goodsCode:'';
        var number=dom.number?dom.number:'';
        var price=dom.price?dom.price:'';
        var d={orderCode:orderCode,goodsCode:goodsCode,number:number,price:price};
        html += getlaytpl('#tradd',d);// html += laytpl($("#tradd").html()).render(d);
    });
    $("#user_tbody").html(html);
});
}
refresh();
function refresh(){
    $("input[value='查询']").click();
}
function openUpd(code){
	openLayer('/orderController/selectModel.do?orderCode='+code,refresh)
}
function delUser(orderCode,goodsCode){
	openConfirm(function(index){
		ajax('/orderProdController/delete.do', {orderCode:orderCode,goodsCode:goodsCode}, 'text', function(data){
	        if (data == 1) {
	            layer.msg('删除成功');
	            $("input[name='pageIndex']").val(1);
	            refresh();
	        } else if (data == 2){
	            layer.msg('删除失败');
	        } 
	    })
	})
}
// <td>
// <input type='button' value='修改' class='layui-btn layui-btn-xs' 
//        onclick='openUpd("{{ d.orderCode }}")'/>&nbsp;
// </td>
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.orderCode }}</td><td>{{ d.goodsCode }}</td><td>{{ d.number }}</td>
<td>{{ d.price }}</td>

</tr>
</script>
</body>
</html>