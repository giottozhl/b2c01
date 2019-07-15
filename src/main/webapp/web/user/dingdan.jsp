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
	
<div class="xiantiao"></div>
		<div class="gwcxqbj">
			<div class="gwcxd center">
				<div class="top2 center">
					<div class="sub_top fl"></div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
					<div class="clear"></div>
				</div>
				<div id="tbody"></div>
			</div>
			<form class="layui-form">
			<div class="layui-form">
			<input type="button" style="float:left; margin:10px 60px 10px;" class="layui-btn" value="添加收货地址" onclick="addaddr()">
		<table class="layui-table" style="margin: 10px 60px;">
			<colgroup>
				<col width="1%">
			</colgroup>
			<thead>
				<tr>
					<th>选择收货地址</th><th>收件人</th><th>电话</th><th>省</th>
					<th>市</th><th>区</th><th>详细地址</th>
				</tr>
			</thead>
			<tbody id="tfoot"></tbody>
		</table>
	</div>
	</form>
			<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li><a href="./main.jsp">继续购物</a></li>
						<li>|</li>
						<li >共<span id="zongshu"></span>件商品</li>
					</ul>
				</div>
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计（不含运费）：<span id="zonge"></span>元</div>
					<div class="jsanniu fr"><input class="jsan" type="button" name="jiesuan" onclick="tijiao()"  value="确认下单"/></div>
					<div class="clear"></div>
				<div class="clear"></div>
			</div>
		</div>
		</div>
 		<div id=""></div>
 <!-- 底部 start -->
 <div>
		<%@ include file="/web/user/bodyfooter.jsp" %>
		<!-- 底部 end -->
	</div>	
	
<script type="text/javascript">
var tt='<%=request.getParameter("ids")==null?"":request.getParameter("ids")%>';	
init();
function init() {
	if (tt=='') {
		layer.msg("请选择商品")
		location.href='/BusinessToCustomer01/web/user/main.jsp';
		return;
	}
	ajax('/orderCarController/getList.do',{ids:tt},'json',function(data){
		var html = "" ;
		$.each(data,function(i,dom){
			var id=dom.id;
			html+='<div class="content2 center">';
			html+='<div class="sub_content fl "><input type="hidden" name="id" value='+id+'></div>'
			html+='<div class="sub_content fl "><img name="img_gwc" style="height: 80px;width: 80px;" src="/image/'+dom.purl1+'"></div>'
			html+='<div class="sub_content fl ft20">'+dom.pname+'</div>'
			html+='<div class="sub_content fl ">'+dom.pcost+'</div>'
			html+='<div class="sub_content fl ">'+dom.number+'</div>'
			html+='<div class="sub_content fl ">'+getValue(dom.pcost,dom.number)+'</div>'
			html+='</div>'
		})
		$("#tbody").html(html);
		$("#zongshu").text(data.length);
		zonge();
	})
	addr();
}
function getValue(price,num) {
	return new Number(parseFloat(price)*parseFloat(num)).toFixed(2);
}
function zonge() {
	var d=$("img[name='img_gwc']");
	var zonge=0.0;
	d.each(function (index,domEle) {
		var cost=$(this).parent().next().next().next().next().text();
		zonge+=parseFloat(cost);
	})
	$("#zonge").text(zonge.toFixed(2));
}
function addr(){
	var userCode='${user.code}';
	if (userCode=='') {
		layer.msg("请先登录再进行操作")
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
				var d={id:dom.id,user:dom.user,tel:dom.tel,province:dom.province,city:dom.city,district:dom.district,detailedAddr:dom.detailedAddr};
				html += getlaytpl('#tradd',d);
			})
			$("#tfoot").html(html);
			form.render();
			}
		})
}

function tijiao() {
	var userCode='${user.code}';
	if (userCode=='') {
		layer.msg("请先登录再进行操作")
		return;
	}
	var goods=$("input[name='id']");
	var addr=$("input[type='radio']:checked").val();//地址主键id
	if (addr==null) {
		layer.msg("请选择收货地址")
		return;
	}
	var ids=[];//购物车id
	goods.each(function(index,dom){
		ids.push($(this).val());
	})
	var i=ids.toString();
	ajax('/orderCarController/input.do',{addrCode:addr,ids:i,userCode:userCode},'json',function(data){
		if (data==1) {
			layer.msg('下单成功', {
				time : 2000
			}, function() {
				location.href="/BusinessToCustomer01/web/user/dingdanxiangqing.jsp";
			})
		}else if (data==2) {
			layer.msg('生成订单失败')
		}else {
			layer.msg('订单商品添加失败')
		}
	})
}
function addaddr() {
	openLayer('/web/user/addaddr.jsp',init)
}
</script>
<script id="tradd" type="text/html">
<tr>
<td><div class='layui-input-block'><input type="radio" name="addr" value="{{d.id}}"></div></td><td>{{ d.user }}</td><td>{{d.tel}}</td><td>{{ d.province }}</td><td>{{ d.city }}</td>
<td>{{ d.district }}</td><td>{{ d.detailedAddr }}</td>
</tr>
</script>
</body>
</html>