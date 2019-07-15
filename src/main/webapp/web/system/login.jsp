<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/web/system/header.jsp"%>
<style>
.window {
	width: 428px;
	position: absolute;
	margin-left: -200px;
	margin-top: -80px top: 50%;
	left: 80%;
	display: block;
	z-index: 2000;
	background: #fff;
	padding: 20 0;
}

.h_panel, .login_banner {
	width: 1130px;
	margin: 0 auto;
}

.h_logo {
	width: 200px;
	height: 98px;
}
.login_banner_panel {
    /* background: #1e2f40; */
    width: 100%;
    height: 588px;
    position: absolute;
    left: 0;
    top: 98px;
    background-repeat: no-repeat;
    background-position: top center;
}
.nav_tabs_panel {
    display: block;
}
.nav_tabs {
    padding: 27px 0 24px;
    text-align: center;
    font-size: 24px;
    color: #666;
}
a:-webkit-any-link {
	color: -webkit-link;
	cursor: pointer;
	text-decoration: underline;
}
.n-footer{height:80px;margin-top:650px;text-align:center}
.nf-intro{padding:10px}
.nf-link-area{text-align:center}
.nf-link-area li{display:inline-block;*display:inline;*zoom:1}
.nf-link-area a{display:inline-block;*display:inline;*zoom:1;padding:0 10px;color:#757575}
.nf-link-area a:hover,.nf-link-area a.current{color:#333}
</style>
</head>
<body>
	<div class="h_panel">
		<div class="h_logo">
			<a href="/BusinessToCustomer01/web/user/main.jsp"><img alt=""
				src="/BusinessToCustomer01/web/common/img/mistore_logo.png"></a>
		</div>
	</div>
	<div class="login_banner_panel" id="J_panel" style="background-image:url(/BusinessToCustomer01/web/common/img/f838fdcd77715410b441f2f56d8f10cd.jpg); ">
		<div class="window">
			<div class="nav_tabs_panel">
              <div id="nav-tabs" class="nav_tabs">
              <label>帐号登录</label>
              </div>
            </div>
				<div class="layui-field-box">
					<form class="layui-form layui-form-pane">
						<div style="position: relative; left: 10%">
							<div class="layui-form-item">
								<label class="layui-form-label">账号</label>
								<div class="layui-input-inline">
									<input type="text" name="code" placeholder="请输入账号"
										class="layui-input" lay-verify="required" required>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">密码</label>
								<div class="layui-input-inline">
									<input type="password" name="pass" placeholder="请输入密码"
										class="layui-input" lay-verify="required" required>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label"> <img
									src='/BusinessToCustomer01/userController/servlet.do'
									onclick="this.src='/BusinessToCustomer01/userController/servlet.do?'+Math.random();">
								</label>
								<div class="layui-input-inline">
									<input type="text" name="authCode" class="layui-input"
										lay-verify="required" required>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">请选择权限:</label>
								<div class="layui-input-block">
									<input type="radio" checked="checked" name="option" value="0"
										title="用户" /> <input type="radio" name="option" value="1"
										title="管理员" />
								</div>
							</div>
							<div class="layui-form-item">
							<div class="layui-input-inline" style="float: left;">
									<input class="layui-btn layui-btn-fluid" style="background-color: #FF5722;" type="button" value="登录" lay-filter="login"
										lay-submit> 
								
							</div>
								<div class="layui-input-inline" >
									<input type="button" class="layui-btn  layui-btn-primary" value="注册" onclick="window.location.href = '/BusinessToCustomer01/web/system/reg.jsp'">
								</div>
							</div>
						</div>
					</form>
				</div>
		</div>
	</div>
	<div id="custom_display_4" class="n-footer">
    <div class="nf-link-area clearfix">
      <ul class="lang-select-list">
        <li><a href="javascript:void(0)" data-lang="zh_CN" class="lang-select-li current">简体</a>|</li>
        <li><a href="" data-lang="zh_TW" class="lang-select-li">繁体</a>|</li>
        <li><a href="" data-lang="en" class="lang-select-li">English</a>|</li>
        <li><a href="" target="_blank">常见问题</a>|</li>
        <li><a id="msg-privacy" href="" target="_blank">隐私政策</a></li>
      </ul>
    </div>
    <p class="nf-intro">B2C仿小米商城<a class=""><span><img src="/BusinessToCustomer01/web/common/img/ghs.png"></span>© layui.com</a>©1903-java</p>
  </div>
	<script type="text/javascript">
		var form = layui.form;
		form.render();
		function login() {
			location.href = "/BusinessToCustomer01/web/system/reg.jsp";
		}
	</script>
	<script type="text/javascript">
	var type='<%=request.getParameter("type")%>';
	var goodsCode='<%=request.getParameter("goodsCode")%>';
	var prod='prod';
		formSubmit('/userController/login.do', 'submit(login)', 'text',
				function(data) {
					if (data == -2) {
						layer.msg('账号不存在');
					} else if (data == -1) {
						layer.msg('当前帐号权限不是所选权限');
					} else if (data == 0) {
						layer.msg('用户登录成功', {
							time : 2000
						}, function() {
							if (type==prod) {
								location.href ="/BusinessToCustomer01/prodController/selectPro.do?type=2&goodsCode="+goodsCode;
							}else {
							location.href = con.app + "/web/user/main.jsp";
							}
						});
					} else if (data == 1) {
						layer.msg('管理员登录成功', {
							time : 2000
						}, function() {
							location.href = con.app + "/web/system/index.jsp";
						});
					} else if (data == 2) {
						layer.msg('验证码错误');
					} else {
						layer.msg('密码错误');
					}
				});
	</script>
</body>
</html>