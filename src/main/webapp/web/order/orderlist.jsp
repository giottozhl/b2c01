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
    <h2 class="layui-colla-title">订单信息-查询条件</h2>
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
		<legend>订单信息-查询条件</legend>
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">订单编号</label>
				<div class="layui-input-inline">
					<input type="text" name="orderCode" placeholder="请输入订单编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">用户编号</label>
				<div class="layui-input-inline">
					<input type="text" name="userCode" placeholder="请输入用户编号" autocomplete="off" class="layui-input">
				</div>
				
				<span> 
				<input type="button" class="layui-btn" lay-submit lay-filter="search" value="查询" /> 
				<input type="reset" class="layui-btn" value="重置" /> 
				</span>
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
				<col width="10%"><col width="15%">
				<col width="10%"><col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>序号</th><th>订单编号</th><th>用户编号</th><th>下单时间</th>
					<th>地址编号</th><th>状态</th><th>操作</th>
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right;padding-right: 30px"></div>
	</div>
<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
<script>
formSubmit('/orderController/select.do','submit(search)','json'
		,function(data) {// console.log(data)
    var curr = $("input[name='pageIndex']").val();
    var limit = $("input[name='pageLimit']").val();
    laypage.render({
		elem : 'pageInfoUser',// id
		count : data.count,// 数据总数
		curr : curr,// 当前页
		limit : limit,// 每页显示的条数
		limits : [ 10, 20, 30, 40, 50 ],// 每页条数的选择项
		layout : [ 'count', 'prev', 'page', 'next', 'limit', 'refresh',
				'skip' ],
		jump : function(obj, first){
	        $("input[name='pageIndex']").val(obj.curr);
	        $("input[name='pageLimit']").val(obj.limit);
	        if(!first){refresh();}//首次不执行
	    }
	});
//     setPageInfo('pageInfoUser',data.count,curr,limit
//     		,function(obj, first){
//         $("input[name='pageIndex']").val(obj.curr);
//         $("input[name='pageLimit']").val(obj.limit);
//         if(!first){refresh();}//首次不执行
//     })
    var html = "" ;//加载表格中数据
    $.each(data.list,function(i, dom) {
    	var orderCode = dom.orderCode?dom.orderCode:'';
        var userCode = dom.userCode?dom.userCode:'';
        var time=dom.time?dom.time:'';
        var addrCode=dom.addrCode?dom.addrCode:'';
        var state=dom.state?dom.state:'';
        var d={i:(i+1+(curr-1)*limit),orderCode:orderCode,userCode:userCode,time:time,addrCode:addrCode,state:state};
        html += getlaytpl('#tradd',d);// html += laytpl($("#tradd").html()).render(d);
    });
    $("#user_tbody").html(html);
});
refresh();
function refresh(){
    $("input[value='查询']").click();
}
function openUpd(code){
	openLayer('/orderController/selectModel.do?orderCode='+code,refresh)
}
function openProd(code){
	openLayer('/web/order/orderprodlist.jsp?orderCode='+code,refresh)
}
function delUser(code){
	openConfirm(function(index){
		ajax('/orderController/delete.do', {orderCode:code}, 'text', function(data){
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
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.orderCode }}</td><td>{{ d.userCode }}</td><td>{{ d.time }}</td>
<td>{{ d.addrCode }}</td><td>{{ d.state }}</td>
<td>
    <input type='button' value='修改' class='layui-btn layui-btn-xs' 
           onclick='openUpd("{{ d.orderCode }}")'/>&nbsp;
    <a href="javascript:delUser('{{ d.orderCode }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
    <input type='button' class='layui-btn layui-btn-xs' value='显示订单商品' 
           onclick='openProd("{{ d.orderCode }}")'/>
</td>
</tr>
</script>
</body>
</html>