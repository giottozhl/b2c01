<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/web/system/header.jsp" %>
<style type="text/css">
.wrapper {
    width: 100%;
    min-height: 100%;
    height: auto;
    display: -webkit-box;
    -webkit-box-align: center;
    -webkit-box-pack: center;
}
body {
    font-size: 14px;
    font-family: arial,"Hiragino Sans GB", "Microsoft YaHei","微軟正黑體","儷黑 Pro", sans-serif;
}
.wrap {
    padding-bottom: 80px;
}
.layout {
    width: 854px;
    margin: 0 auto;
    padding-bottom: 10px;
}
.device-frame {
    padding-bottom: 30px;
}
.device-frame {
    border: none;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    -o-border-radius: 0;
    border-radius: 0;
    padding-top: 0;
}
.n-frame {
    background: #fff;
    padding: 34px 34px 0;
    border: 1px solid #e6e6e6;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    -o-border-radius: 10px;
    border-radius: 10px;
    min-height: 400px;
    _height: 400px;
}
.external_logo_area {
    padding-bottom: 40px;
    display: block;
}
.milogo {
    width: 49px;
    height: 48px;
    margin: 0 auto;
    display: block;
    cursor: default;
    background-image: url(/BusinessToCustomer01/web/common/img/milogo.png);
}
.device-frame .title-item {
    border-bottom: none;
    padding-bottom: 0;
    margin-bottom: 0;
}
.title_big30 {
    font-size: 30px;
    font-weight: normal;
    color: #333;
    line-height: 1.5;
}
.t_c {
    text-align: center;
}
.regbox {
    padding: 30px 0;
    line-height: 20px;
}
.privacy_box {
    text-align: center;
    padding-top: 5px;
}
.msg {
    color: #9d9d9d;
}
.n_checked {
    padding: 10px 0;
    cursor: pointer;
    display: inline-block;
}
.n-footer{height:80px;text-align:center}
.nf-intro{padding:10px}
.nf-link-area{text-align:center}
.nf-link-area li{display:inline-block;*display:inline;*zoom:1}
.nf-link-area a{display:inline-block;*display:inline;*zoom:1;padding:0 10px;color:#757575}
.nf-link-area a:hover,.nf-link-area a.current{color:#333}
</style>
</head>
<body>
<div class="wrapper">
<div class="wrap">
<div class="layout">
  <div class="n-frame device-frame reg_frame" id="main_container">
    <div class="external_logo_area"><a class="milogo" href="javascript:void(0)"></a></div>
    <div class="title-item t_c">
      <h4 class="title_big30">注册帐号</h4>          
    </div>  
  <div>
  <div class="regbox">
<div class="layui-field-box">
    <form class="layui-form layui-form-pane" >
<div style="position :relative; left:30%"> 
 <div class="layui-form-item" >
    <label class="layui-form-label">账号</label>
    <div class="layui-input-inline">
      <input type="text"  name="code" placeholder="请输入账号"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-inline">
      <input type="text"  name="name" placeholder="请输入姓名"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="password"  name="pass" placeholder="请输入密码"  class="layui-input" lay-verify="required" required>
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">识别码</label>
    <div class="layui-input-inline">
      <input type="text"  name="uuid" placeholder="请输入识别码"  class="layui-input">
    </div>
  </div>
   <div class="layui-form-item" >
     <label class="layui-form-label">
     <img src='/BusinessToCustomer01/userController/servlet.do' onclick="this.src='/BusinessToCustomer01/userController/servlet.do?'+Math.random();">
     </label>
    <div class="layui-input-inline" >
      <input type="text" name="authCode" class="layui-input" lay-verify="required" required>
    </div>   
  </div>
  <div class="layui-form-item">
  	<div class="layui-input-inline">
  		 <input class="layui-btn layui-btn-fluid" style="background-color: #FF5722;" type="button" value="注册"  lay-filter="reg" lay-submit>
  	</div>
    <div class="layui-input-inline">
        <a class="layui-btn layui-btn-primary"  value="返回登录" href="javascript:login();" >返回登录</a>
    </div>
  </div>
   </div> 
  </form>
 </div>
 </div>
  <div class="privacy_box">
    <div class="msg">
      <label class="n_checked select-privacy">
        <i class="icon_select"></i>注册帐号即表示您同意并愿意遵守小米 <a href="https://static.account.xiaomi.com/html/agreement/account/cn.html" class="inspect_link agreement_link" title="用户协议" target="_blank">用户协议</a>和<a href="https://www.mi.com/about/privacy/" class="inspect_link privacy_link" title=" 隐私政策 " target="_blank"> 隐私政策 </a>
      </label>
    </div>
  </div>
</div></div>
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
	  function login(){
		  location.href="/BusinessToCustomer01/web/system/login.jsp";
	  }
</script>
<script type="text/javascript">
formSubmit('/userController/reg.do','submit(reg)','text',function(data){
	if (data==0) {
		layer.msg('注册成功', {
			time : 2000
		}, function() {
			location.href = con.app + "/web/system/login.jsp";
		});
	}else if (data==1) {
		layer.msg('账号已存在');
	}else {
		layer.msg('注册失败');
	}
});
	</script>
</body>
</html>