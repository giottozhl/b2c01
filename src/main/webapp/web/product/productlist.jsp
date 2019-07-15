<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <h2 class="layui-colla-title">商品信息-查询条件</h2>
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
		<legend>商品信息-查询条件</legend>
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">编号</label>
				<div class="layui-input-inline">
					<input type="text" name="goodsCode" placeholder="请输入编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入名称" autocomplete="off" class="layui-input">
				</div>
				
				<span> 
				<input type="button" class="layui-btn" lay-submit lay-filter="search" value="查询" /> 
				<input type="reset" class="layui-btn" value="重置" /> 
				<input type="button" class="layui-btn" value="添加" onclick="openUserAdd()" />
				</span>
			</div>
			<div>
				
			</div>
			<input type="hidden" name="action" value="list" />
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
					<th>序号</th><th>编号</th><th>名称</th><th>单价</th>
					<th>库存</th><th>描述</th><th>状态</th><th>所属分类</th><th>操作</th>
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right;padding-right: 30px"></div>
	</div>
<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
<script>
formSubmit('/prodController/select.do','submit(search)','json'
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
    	var code = dom.goodsCode?dom.goodsCode:'';
        var name = dom.name?dom.name:'';
        var price=dom.price?dom.price:'';
        var num=dom.number?dom.number:'';
        var descr=dom.descr?dom.descr:'';
        var state=dom.state?dom.state:'';
        var parentCode=dom.parentCode?dom.parentCode:'';
        var parentName=dom.parentName?dom.parentName:'';
        var d={i:(i+1+(curr-1)*limit),name:name,code:code,price:price,num:num,descr:descr,
        		state:state,parentCode:parentCode,parentName:parentName};
        html += getlaytpl('#tradd',d);// html += laytpl($("#tradd").html()).render(d);
    });
    $("#user_tbody").html(html);
});
refresh();
function refresh(){
    $("input[value='查询']").click();
}
function openUserAdd(){
	openLayer('/web/product/add.jsp',refresh)
}
function openUpd(code){
	openLayer('/web/product/upd.jsp?goodsCode='+code,refresh)
}
function openImage(code){
	openLayer('/web/product/upload.jsp?goodsCode='+code,refresh)
}
function delUser(code){
	openConfirm(function(index){
		ajax('/prodController/delete.do', {goodsCode:code}, 'text', function(data){
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
<td>{{ d.i }}</td><td>{{ d.code }}</td><td>{{ d.name }}</td><td>{{ d.price }}</td>
<td>{{ d.num }}</td><td>{{ d.descr }}</td><td>{{ d.state }}</td><td>{{ d.parentName }}</td>
<td>
    <input type='button' value='修改' class='layui-btn layui-btn-xs' 
           onclick='openUpd("{{ d.code }}")'/>&nbsp;
    <a href="javascript:delUser('{{ d.code }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
    <input type='button' class='layui-btn layui-btn-xs' value='添加图片' 
           onclick='openImage("{{ d.code }}")'/>
</td>
</tr>
</script>
</body>
</html>