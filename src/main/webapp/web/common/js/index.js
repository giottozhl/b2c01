/** banner **/
var banner = document.getElementById("banner");
var circleList = document.getElementById("circle-list");
var lis = banner.children[0].children;
var cirLis = circleList.children[0].children;
var bannerLeft = document.getElementById("banner-left");
var bannerRight = document.getElementById("banner-right");
//设置圆点总的宽度
var cirLisWidth = (cirLis.length)*11+14;
circleList.style.width = cirLisWidth+"px";
//设置圆点的个数
var index = 0;
//轮播图自动轮播
var run;
autoRun();
function autoRun (){		
	run = setInterval(function(){
			lis[index].removeAttribute("class");
			cirLis[index].removeAttribute("class");
			index++;
			if(index == lis.length){
				index = 0;
			}
			lis[index].setAttribute("class","active");
			cirLis[index].setAttribute("class","active-circle");
		},2000)	
}
//鼠标移入banner
banner.onmouseenter = function(){
	clearInterval(run);
}
banner.onmouseleave = function(){
	autoRun();
}
//鼠标移入圆点
for(var i=0; i<cirLis.length; i++){
	cirLis[i].onmouseover = (function(i){
		return function(){
			lis[index].removeAttribute("class");
			cirLis[index].removeAttribute("class");
			index = i;
			lis[i].setAttribute("class","active");
			cirLis[i].setAttribute("class","active-circle");
		}
	})(i)
}
//向左点击
//bannerLeft.onclick = function(){
//	lis[index].removeAttribute("class");
//	cirLis[index].removeAttribute("class");
//	index--;
//	if(index < 0){
//		index = lis.length-1;
//	}
//	lis[index].setAttribute("class","active");
//	cirLis[index].setAttribute("class","active-circle");
//}
//向右点击
//bannerRight.onclick = function(){
//	lis[index].removeAttribute("class");
//	cirLis[index].removeAttribute("class");
//	index++;
//	if(index == lis.length){
//		index = 0;
//	}
//	lis[index].setAttribute("class","active");
//	cirLis[index].setAttribute("class","active-circle");
//}

/** tab **/
var houseElectricalTitle = document.getElementById("houseElectricalTitle").getElementsByTagName("li");
var houseElectricalDiv = document.getElementById("houseElectricalDiv").getElementsByClassName("wiring_right_con");
var tabLen = houseElectricalTitle.length;
for(var i=0; i<tabLen; i++) {
	houseElectricalTitle[i].index = i;
	houseElectricalTitle[i].onmouseover = function(){
		var num = parseInt(this.index);
		for(var j=0; j<tabLen; j++) {
			houseElectricalTitle[j].className = "";
			houseElectricalDiv[j].className = "wiring_right_con hide";
		}
		houseElectricalTitle[num].className = "active";
		houseElectricalDiv[num].className = "wiring_right_con show";
	}
}