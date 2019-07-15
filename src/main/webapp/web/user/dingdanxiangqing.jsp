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
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="./dingdanxiangqing.jsp" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
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
					<li><a href="./addrlist.jsp">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="ddzxbt">交易订单</div>
			<table class="layui-table" style="margin-left:10px; margin-right: 20px;width: 960px;height: 100px;">
			<colgroup>
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>订单编号</th><th>下单时间</th>
					<th>状态</th><th>地址</th><th>详情</th>
				</tr>
			</thead>
			<tbody id="tbody" style="margin-left:10px; margin-right: 20px;width: 960px;height: 200px;"></tbody>
		</table>
				
<!-- 			<div class="ddxq"> -->
<!-- 				<div class="ddspt fl"><img src="./image/liebiao_hongmin4_dd.jpg" alt=""></div> -->
<!-- 				<div class="ddbh fl">订单号:170526435444865</div> -->
<!-- 				<div class="ztxx fr"> -->
<!-- 					<ul> -->
<!-- 						<li>已发货</li> -->
<!-- 						<li>￥1999.00</li> -->
<!-- 						<li>2017/05/26 14:02</li> -->
<!-- 						<li><a href="">订单详情></a></li> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 				<div class="clear"></div> -->
<!-- 			</div> -->
		</div>
		<div class="clear"></div>
		</div>
	</div>
		<div id="pageInfoUser" style="text-align: right;padding-right: 30px; margin-right: 60px;"></div>
		<input type="hidden" name="pageIndex" value="1" />
		<input type="hidden" name="pageLimit" value="6" />
<!-- self_info -->
<!-- 底部 start -->
		<%@ include file="/web/user/bodyfooter.jsp" %>
		<!-- 底部 end -->
		
<script type="text/javascript">
init();
function init() {
	var userCode='${user.code}';
	var pageLimit=$("input[name='pageLimit']").val();
	var pageIndex=$("input[name='pageIndex']").val();
	if (userCode=='') {
		layer.msg("请先登录")
		return;
	}
	$.ajax({
		type:'post',
		url:'/BusinessToCustomer01/orderController/select.do',
		data:{userCode:userCode,pageLimit:pageLimit,pageIndex:pageIndex},
		dataType:'json',
		success:function(data){
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
// 		    setPageInfo('pageInfoUser',data.count,curr,limit
// 		    		,function(obj, first){
// 		        $("input[name='pageIndex']").val(obj.curr);
// 		        $("input[name='pageLimit']").val(obj.limit);
// 		        if(!first){refresh();}//首次不执行
// 		    })
		    var html = "" ;
		    $.each(data.list,function(i,dom){
		    	var d={orderCode:dom.orderCode,state:dom.state,time:dom.time,addrCode:dom.addrCode}
		    	html += getlaytpl('#tradd',d);
		    });
		    $("#tbody").html(html);
		}
	})
}

function openProd(code){
	openLayer('/web/order/orderprodlist.jsp?orderCode='+code)
}
</script>
<script id="tradd" type="text/html">
<tr>
<td>{{ d.orderCode }}</td><td>{{ d.time }}</td><td>{{ d.state }}</td>
<td>{{d.addrCode}}</td>
<td style="width:30px;"><input type="button" class="layui-btn" onclick="openProd('{{d.orderCode}}')" value="查看订单商品"></td>
</tr>
</script>
</body>
</html>