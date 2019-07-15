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
	
	<!-- xiangqing -->
	<div>
	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl">${list.name }</div>
			<nav class="fr">
			<ul>
				<li><a href="">概述</a></li>
				<li>|</li>
				<li><a href="">变焦双摄</a></li>
				<li>|</li>
				<li><a href="">设计</a></li>
				<li>|</li>
				<li><a href="">参数</a></li>
				<li>|</li>
				<li><a href="">F码通道</a></li>
				<li>|</li>
				<li><a href="">用户评价</a></li>
			</ul>
			</nav>
			<div class="clear"></div>
		</div>	
	</div>
	
	<div class="jieshao mt20 w">
		<div class="left fl" id="pic"><img src="/image/${pic.url }" style="width: 550px;height: 550px;"></div>
		<div class="right fr">
			<div class="h3 ml20 mt20">${list.name }</div>
			<div class="jianjie mr40 ml20 mt10">${list.descr }</div>
			<div class="jiage ml20 mt10">${list.price }</div>
			<div class="ft20 ml20 mt20">库存</div>
			<div class="xzbb ml20 mt10">
				<div class="banben fl">
					<a>
						<span>${list.number } </span>
					</a>
				</div>
				<div class="clear"></div>
			</div>
			<div class="ft20 ml20 mt20">状态</div>
			<div class="xzbb ml20 mt10">
				<div class="banben">
					<a>
						<span class="yuandian"></span>
						<span class="yanse">${list.state }</span>
					</a>
				</div>
				
			</div>
			<div class="xqxq mt20 ml20">
				<div class="top1 mt10">
					<div class="left1 fl">${list.name }</div>
					<div class="right1 fr">${list.price }元</div>
					<div class="clear"></div>
				</div>
				<div class="bot mt20 ft20 ftbc">总计：${list.price }元</div>
			</div>
			<div class="xiadan ml20 mt20">
<!-- 					<input class="jrgwc"  type="button" name="jrgwc" value="立即选购" /> -->
					<button class="jrgwc" onclick="submit()" >加入购物车</button>
				
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</div>
	<br>
		<!-- 底部 start -->
		<div>
		<%@ include file="/web/user/bodyfooter.jsp" %>
		</div>
		<!-- 底部 end -->
		<script type="text/javascript">
<%-- 		var goodsCode="<%=request.getParameter("goodsCode")%>"; --%>
<%-- 		var parentCode="<%=request.getParameter("parentCode")%>"; --%>
<%-- 		var type="<%=request.getParameter("type")%>"; --%>
// 		function getParam(){
// 			return {
// 				goodsCode:goodsCode,
// 				parentCode:parentCode,
// 				type:type};
// 		}
// 		refresh();
// 		function refresh() {
// 			ajax('/prodController/selectPro.do',getParam(),'json',getlist);
// 		}
// 		function getlist(data) {
// 			$.each(data.list,function(i,dom){
// 				
// 			})
// 		}

function submit() {
	var userCode='${user.code}';
	if (userCode=='') {
		layer.msg("请先登录后再添加商品！",
				{time:2000},
				function(){location.href='/BusinessToCustomer01/web/system/login.jsp?type=prod&goodsCode='+'${list.goodsCode}'})
	}else {
		$.ajax({
			type:"post",
			url:"/BusinessToCustomer01/orderCarController/insert.do",
			data:{goodsCode:'${list.goodsCode}',userCode:'${user.code}',number:"1"},
			dataType:'json',
			success:function(data){
				if (data==1) {
					layer.msg("添加成功")
				}else {
					layer.msg("添加失败")
				}
			}
		})
	}
}
		</script>
</body>
</html>