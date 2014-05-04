var tb = tb = tb || {};

$(function(){
	
	// 移除报表页面的tr标签的big_tr样式
	$("tr:even").removeClass("big_tr"); 
	
	$(".select_condition>li:eq(0),.select_condition>li:eq(8)").css({"color":"#00f", "font-size":"13px"});
	$(".select_condition>li:gt(9)").addClass("imitate_btn");
	$(".form_detail>tbody>tr:odd").css("background-color","#d7d2ca");
	$(".form_detail>tbody>tr:even").css("background-color","#f0f0f0");
	$(".form_detail>tbody>tr:eq(0)").css({"background-color":"#e76e66","color":"#fff","font-size": "14px;"});
	// $(".select_condition>li:gt(9")




});