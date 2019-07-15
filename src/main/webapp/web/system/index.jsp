<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>网站后台管理</title>
<%@ include file="/web/system/header.jsp" %>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">商城后台</div>
			<ul class="layui-nav layui-layout-left"></ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
				    <a href="javascript:;"> 
				        <img src="<%=path%>/img/fei.png"
				        class="layui-nav-img"/>用户[${user.name}]
				    </a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:openUser()">基本资料</a>
						</dd>
						<dd>
							<a href="javascript:openPass()">修改密码</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item">
				    <a href="javascript:goLogout()">注销</a>
				</li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed">
					    <a href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" data-url="/web/admin/userlist.jsp"
								class="site-demo-active">用户信息维护</a>
								
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item layui-nav-itemed">
					    <a href="javascript:;">商品管理</a>
						<dl class="layui-nav-child">
						<dd>
								<a href="javascript:;" data-url="/web/admin/dict/dictlist.jsp"
								class="site-demo-active">商品分类维护</a>
								
							</dd>
							<dd>
								<a href="javascript:;" data-url="/web/product/productlist.jsp"
								class="site-demo-active">商品信息维护</a>
								
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item layui-nav-itemed">
					    <a href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" data-url="/web/order/orderlist.jsp"
								class="site-demo-active">订单信息维护</a>
								
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item layui-nav-itemed">
					    <a href="javascript:;">项目二</a>
					    <dl class="layui-nav-child">
					    	<dd></dd>
					    </dl>
					</li>
					<li class="layui-nav-item"><a href="javascript:;">基础配置
					</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">列表一</a>
							</dd>
							<dd>
								<a href="javascript:;">列表二</a>
							</dd>
							<dd>
								<a href="">超链接</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<div class="layui-body">
			<iframe name="rightframe" width="99%" height="99%" src=""></iframe>
			<!-- <div style="padding: 15px;">内容主体区域</div> -->
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			layui.com - 底部固定区域
		</div>
	</div>
	<script type="text/javascript" src="<%=path%>/layui/layui.all.js"></script>
	<script>
	$('.site-demo-active').click(function() {
		window.open(con.app+$(this).data('url'),"rightframe");
	});
		function openUrl(url){
						window.open(con.app+url,"rightframe");
					}
		$('.site-demo-active:first').click();
		
		function openUser(){
			openLayer('/web/page/employee/userupd.jsp?code=${user.code}'
				,function(){location.reload();})
		}
		function openPass(){
	        openLayer('/web/page/employee/userpass.jsp?code=${user.code}'
	       		,function(){})
		}
		function openPic(){
		        openLayer('/web/page/employee/pic.jsp?code=${user.code}'
		        		,function(){location.reload();})
		    }
		</script>
</body>
</html>