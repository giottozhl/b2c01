<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
	<form class="layui-form">
<div class="xiantiao"></div>
		<div class="gwcxqbj">
			<div class="gwcxd center">
				<div class="top2 center">
					<div class="sub_top fl">
						<input type="checkbox" value="quanxuan" lay-skin="primary" lay-filter="quanxuan0"/>全选
					</div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
					<div class="sub_top fr">操作</div>
					<div class="clear"></div>
				</div>
				<div id="tbody"></div>
<!-- 				<div class="content2 center"> -->
<!-- 					<div class="sub_content fl "> -->
<!-- 						<input type="checkbox" value="quanxuan" class="quanxuan" /> -->
<!-- 					</div> -->
<!-- 					<div class="sub_content fl"><img src="./image/gwc_xiaomi6.jpg"></div> -->
<!-- 					<div class="sub_content fl ft20">小米6全网通6GB内存+64GB 亮黑色</div> -->
<!-- 					<div class="sub_content fl ">2499元</div> -->
<!-- 					<div class="sub_content fl"> -->
<!-- 						<input class="shuliang" type="number" value="1" step="1" min="1" > -->
<!-- 					</div> -->
<!-- 					<div class="sub_content fl">2499元</div> -->
<!-- 					<div class="sub_content fl"><a href="">×</a></div> -->
<!-- 					<div class="clear"></div> -->
<!-- 				</div> -->
			</div>
			<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li><a href="./main.jsp">继续购物</a></li>
						<li>|</li>
						<li><a onclick="delcheck()">删除选中的商品</a></li>
						<li >共<span id="zongshu"></span>件商品，已选择<span id="xuanzhong"></span>件</li>
					</ul>
				</div>
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计（不含运费）：<span id="zonge"></span>&nbsp;元</div>
					<div class="jsanniu fr"><input class="jsan" type="button" name="jiesuan" onclick="tijiao()"  value="去结算"/></div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			
		</div>
 </form>
 <!-- 底部 start -->
 <div>
		<%@ include file="/web/user/bodyfooter.jsp" %>
		<!-- 底部 end -->
	</div>	
<script type="text/javascript">

init();
function init() {
	var userCode='${user.code}';
	if (userCode=='') {
		layer.msg("请先登录后再查看购物车",{time:1500},function(){location.href='/BusinessToCustomer01/web/system/login.jsp?'})
		return;
	}
$.ajax({
	type:'post',
	url:'/BusinessToCustomer01/orderCarController/selectCart.do',
	data:{userCode:userCode},
	dataType:'json',
	success:function(data){
		if (data.length==0) {
			layer.msg("请先添加商品")
		}
		var html = "" ;
		$.each(data.list,function(i,dom){
			var id=dom.id;
			html+='<div class="content2 center">';
			html+='<div class="sub_content fl"><input type="checkbox" value="'+id+'" name="quanxuan" lay-skin="primary" lay-filter="zonge" /></div>'
			html+='<div class="sub_content fl "><img style="height: 80px;width: 80px;" src="/image/'+dom.purl1+'"></div>'
			html+='<div class="sub_content fl ft20">'+dom.pname+'</div>'
			html+='<div class="sub_content fl ">'+dom.pcost+'</div>'
			html+='<div class="sub_content fl"><input class="shuliang" type="number" value="'+dom.number+'" step="1" min="1" onchange="sumchange(this,'+id+')")></div>'
			html+='<div class="sub_content fl">'+getValue(dom.pcost,dom.number)+'&nbsp;元</div>'
			html+='<div class="sub_content fl"><a href="javascript:del('+id+')">×</a></div><div class="clear"></div></div>'
		})
		$("#tbody").html(html);
		$("#zongshu").text(data.list.length);
		form.render();
	}
})

}
function getValue(price,num) {
	return new Number(parseFloat(price)*parseFloat(num)).toFixed(2);
}
function sumchange(obj,id){
	var v=obj.value;
	ajax('/orderCarController/sum.do',{id:id,sum:v},'json',function(data){
		if (data==1) {
			obj.value=v;
			var cost=$(obj).parent().prev().text();
			$(obj).parent().next().text(getValue(cost,v));
			zonge();
		}
	})
}
function del(id){
	ajax('/orderCarController/del.do',{id:id},'json',function(data){
		if (data==1) {
			init();
		}
	})
}
function delcheck() {
	var quanxuan=$("input[name='quanxuan']:checked");
	var num=[];
	quanxuan.each(function(index,dom){
		num.push($(this).val())
	})
	if (num.length==0) {
		layer.msg("请选择商品")
		return;
	}
	$("input[name='quanxuan']:checked").each(function(index,dom){
		del($(this).val())
	})
}
form.on('checkbox(quanxuan0)', function(data){
	$("input[type='checkbox']").prop('checked',$(this).prop('checked'));
	zonge();
	form.render();
	}); 
form.on('checkbox(zonge)', function(data){
	zonge();
	});
function zonge() {
	var quanxuan=$("input[name='quanxuan']:checked");
	$("#xuanzhong").text(quanxuan.length);
	var zonge=0.0;
	quanxuan.each(function (index,domEle) {
		var cost=$(this).parent().next().next().next().next().next().text();
		zonge+=parseFloat(cost);
	})
	$("#zonge").text(zonge.toFixed(2));
}
function tijiao() {
	var quanxuan=$("input[name='quanxuan']:checked");
	var ids=[];
	quanxuan.each(function(index,dom){
		ids.push($(this).val())
	})
	if (ids.length==0) {
		layer.msg("请选择商品")
		return;
	}
	location.href="/BusinessToCustomer01/web/user/dingdan.jsp?ids="+ids;
}
</script>
</body>
</html>