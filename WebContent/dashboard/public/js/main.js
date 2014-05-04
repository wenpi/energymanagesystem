$(function(){
	/*tab左侧时间选择切换按钮效果*/
	$(".date_select>div").click(function(){
		$(this).siblings().removeClass("pressive");
		$(this).addClass("pressive");
	});

	/*表格hover效果*/
	$(".data>div").hover(function(){
		// $(this).siblings().removeClass("change_chart_data_bg");
		$(this).addClass("change_chart_data_bg");
		$(this).find(".info").addClass("change_chart_topbar_bg");
	},function(){
		$(this).removeClass("change_chart_data_bg");
		$(this).find(".info").removeClass("change_chart_topbar_bg");
	});

})