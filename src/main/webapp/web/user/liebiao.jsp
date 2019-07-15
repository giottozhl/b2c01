<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="layui-form" action="">
<!-- start banner_x -->
<%@ include file="/web/user/bodyheader.jsp" %>
	
<!-- end banner_x -->

	<!-- start banner_y -->
	<!-- end banner -->

	<!-- start danpin -->
	
		<div class="danpin center">
			<input type="hidden" name="pageIndex" value="1" />
			<input type="hidden" name="pageLimit" value="10" />
			<div class="biaoti center">商品列表</div>
			<div class="main center">
				<div id="tbody">
				</div>
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href="./xiangqing.html" target="_blank"><img src="./image/liebiao_xiaomi6.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="./xiangqing.html" target="_blank">小米6</a></div> -->
<!-- 					<div class="youhui">5.16早10点开售</div> -->
<!-- 					<div class="jiage">2499.00元</div> -->
<!-- 				</div> -->
			
<!-- 			<div class="main center mb20"> -->
<!-- 				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'"> -->
<!-- 					<div class="sub_mingxing"><a href=""><img src="./image/liebiao_hongmin4x.jpg" alt=""></a></div> -->
<!-- 					<div class="pinpai"><a href="">红米Note 4X 全网通版</a></div> -->
<!-- 					<div class="youhui">多彩金属 / 4100mAh 超长续航</div> -->
<!-- 					<div class="jiage">1299.00元</div> -->
<!-- 				</div> -->
<!-- 				<div class="clear"></div> -->
<!-- 				</div> -->
			</div>
		</div>
		<div class="layui-form">
					<div id="pageInfoUser" style="text-align: right;padding-right: 30px"></div>
				</div>
		
		
<!-- 底部 start -->
		<%@ include file="/web/user/bodyfooter.jsp" %>
		<!-- 底部 end -->
</form>
<script type="text/javascript">
var name="<%=request.getParameter("name")%>";
var parentCode="<%=request.getParameter("parentCode")%>";
var type="<%=request.getParameter("type")%>";
function getParam(){
	return {name:name,
		pageIndex: $("input[name='pageIndex']").val(),
		pageLimit: $("input[name='pageLimit']").val(),
		parentCode:parentCode,
		type:type};
}

refresh()
function refresh() {
	ajax('/prodController/selectType.do',getParam(),'json',getlist);
}
function getlist(data) {
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
    $("#tbody").html(html);
    var t='';
    var l=1;
    var da1='2px solid #fff';
	var da2='2px solid red';
    $.each(data.list,function(i,dom){
    	t+="<div class='mingxing fl mb20' style='border:2px solid #fff;width:230px;cursor:pointer;' onmouseout='this.style.border=\""+da1+"\"' onmousemove='this.style.border=\""+da2+"\"'>";
    	t+="<div class='sub_mingxing' id='"+dom.goodsCode+"'></div>";
    	t+="<div class='pinpai'><a href='javascript:xiangqing(\""+dom.goodsCode+"\")'>"+dom.name+"</a></div>"
    	t+="<div class='youhui'>"+dom.descr+"</div>"
    	t+="<div class='jiage'>"+dom.price+"&nbsp;元</div></div>"
    	l++;
    	if (l%6==0) {
			html='<div class="main center mb20">'+t+'</div>';
			$("#tbody").append(html);
			html='';
			t='';
		}
    })
    
    if (t!='') 
    	$("#tbody").append('<div class="main center mb20">'+t+'</div>');
    pic(data)
}
function pic(data) {
	var p='';
    $.each(data.pic,function(ii,dd){
    	p="<a href='javascript:xiangqing(\""+dd.goodsCode+"\")'><img src='/image/"+ dd.url +"' alt='"+ dd.url +"'></a>";
    	$("#"+dd.goodsCode).append(p);
    })
}
function xiangqing(code) {
	location.href="/BusinessToCustomer01/prodController/selectPro.do?type=2&goodsCode="+code;
}
</script>
</body>
</html>