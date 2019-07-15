<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/BusinessToCustomer01/web/common/css/style.css">
<%@ include file="/web/system/header.jsp" %>
</head>
<body>
<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="/BusinessToCustomer01/web/user/main.jsp" target="_blank">小米商城</a></li>
						<li>|</li>
						<li><a href="">MIUI</a></li>
						<li>|</li>
						<li><a href="">米聊</a></li>
						<li>|</li>
						<li><a href="">游戏</a></li>
						<li>|</li>
						<li><a href="">多看阅读</a></li>
						<li>|</li>
						<li><a href="">云服务</a></li>
						<li>|</li>
						<li><a href="">金融</a></li>
						<li>|</li>
						<li><a href="">小米商城移动版</a></li>
						<li>|</li>
						<li><a href="">问题反馈</a></li>
						<li>|</li>
						<li><a href="">Select Region</a></li>
					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a onclick="cart()">购物车</a></div>
					<div class="fr">
						<ul>
						<% 	Object obj=session.getAttribute("user");
							if(obj==null){%>
							<li><a href="/BusinessToCustomer01/web/system/login.jsp" target="_blank">登录</a></li>
							<li>|</li>
							<li><a href="/BusinessToCustomer01/web/system/reg.jsp" target="_blank" >注册</a></li>
							<%}else { %>
							<li><a href="/BusinessToCustomer01/web/user/dingdanxiangqing.jsp" target="_blank">我的订单</a></li>
							<li>|</li>
							<li><a href="./register.html" target="_blank" >用户${user.code }</a></li>
							<li>|</li>
							<li><a href="javascript:goLogout()">注销</a></li>
							<%} %>
							<li>|</li>
							<li><a href="">消息通知</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
		
		<div class="banner_x center">
			<a href="/BusinessToCustomer01/web/user/main.jsp" target="_blank"><div class="logo fl"></div></a>
			<div class="nav fl">
				<ul id="type1">
				</ul>
			</div>
			<div class="search fr">
				<form action="" method="post">
					<div class="text fl">
						<input type="text" name="name" class="shuru"  placeholder="小米6&nbsp;小米MIX现货">
					</div>
					<div class="submit fl">
						<input type="button" class="sousuo" onclick="skip()" value="搜索"/>
					</div>
					<div class="clear"></div>
					<input type="hidden" name="pageIndex" value="1" />
					<input type="hidden" name="pageLimit" value="10" />
				</form>
				<div class="clear"></div>
			</div>
		</div>
		<script type="text/javascript">
		ajax('/dictController/getListUp.do',{parentCode:'type1'},'json',fenleishow)
		var t1='';
		function fenleishow(data) {
			$.each(data,function(i,d){
				t1+='<li><a href="javascript:fenlei(\''+d.code+'\',1)">'+d.name+'</a>';
			})
			$('#type1').html(t1);
		}
		function skip() {
			var name=$("input[name='name']").val();
			if (name==null||name=='') {
				layer.msg("请输入内容！")
				return;
			}else {
				window.location.href='./liebiao.jsp?type=2&name='+name;
			}
		}
		function fenlei(code) {
			window.location.href='/BusinessToCustomer01/web/user/liebiao.jsp?type=1&parentCode='+code;
		}
		function cart() {
			var userCode='${user.code}';
			if (userCode=='') {
				layer.msg("请先登录后再查看购物车！",
						{time:2000},
						function(){location.href='/BusinessToCustomer01/web/system/login.jsp'})
			}else {
				location.href="/BusinessToCustomer01/web/user/cart.jsp?";
			}
		}
		
		function goLogout() {
			var title;
			layer.confirm(title ? title :  '确定注销？', {
				icon : 3,
				title : '提示'
			}, function(index) {
				layer.close(index);
				toJsp("/userController/logout.do");
				// location.href = con.app + "/employeeServlet?action=logout";
			});
		}
		</script>
</body>
</html>