<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 顶部导航 start -->
		<%@ include file="/web/user/bodyheader.jsp" %>
	<!-- 顶部导航 end -->
	<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">管理收货地址</div>
			<div class="subddzx">
				<ul>
					<li><a href="./dingdanxiangqing.jsp">我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="./addrlist.jsp" style="color:#ff6700;font-weight:bold;">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="ddzxbt">收货地址<input type="button" class="layui-btn" onclick="add()" value="添加收货地址" style="float: right; margin-right: 10px;margin-top: 10px;"></div>
			<table class="layui-table" style="margin-left:10px; margin-right: 20px;width: 960px;height: 100px;">
			<colgroup>
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>收货人</th><th>电话</th><th>省</th>
					<th>市</th><th>区</th><th>详细地址</th><th>操作</th>
				</tr>
			</thead>
			<tbody id="tbody" style="margin-left:10px; margin-right: 20px;width: 960px;height: 200px;"></tbody>
		</table>
		</div>
		<div class="clear"></div>
		</div>
	</div>
		<div id="pageInfoUser" style="text-align: right;padding-right: 30px; margin-right: 60px;"></div>
		<input type="hidden" name="pageIndex" value="1" />
		<input type="hidden" name="pageLimit" value="10" />
<!-- self_info -->
<!-- 底部 start -->
		<%@ include file="/web/user/bodyfooter.jsp" %>
		<!-- 底部 end -->
		
<script type="text/javascript">
init();
function init() {
	var userCode='${user.code}';
	if (userCode=='') {
		layer.msg("请先登录")
		return;
	}
	$.ajax({
		type:'post',
		url:'/BusinessToCustomer01/addrController/selectAll.do',
		data:{userCode:userCode},
		dataType:'json',
		success:function(data){
			var html='';
			$.each(data,function(i,dom){
				var d={id:dom.id,user:dom.user,tel:dom.tel,province:dom.province,city:dom.city,district:dom.district,detailedAddr:dom.detailedAddr}
				html += getlaytpl('#tradd',d);
			})
			$("#tbody").html(html);
		}
	})
}

function add() {
	layer.msg("请注意--收货地址最多添加十条",{time:2000},function(){
		openLayer('/web/user/addaddr.jsp',init)
	})
}
function openUpd(id) {
	openLayer('/web/user/updaddr.jsp?id='+id,init)
}
function del(id) {
	var userCode='${user.code}';
	ajax('/addrController/delete.do',{id:id,userCode:userCode},'text',function(data){
		if (data==1) {
			layer.msg('删除成功')
			init();
		}else {
			layer.msg('删除失败')
		}
	})
}
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.user }}</td><td>{{ d.tel }}</td><td>{{ d.province }}</td>
<td>{{d.city}}</td><td>{{d.district}}</td><td>{{d.detailedAddr}}</td>
<td><input type="button" class="layui-btn" onclick="openUpd('{{d.id}}')" value="修改">&nbsp;
<a href="javascript:del('{{ d.id }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
</td>
</tr>
</script>
</body>
</html>