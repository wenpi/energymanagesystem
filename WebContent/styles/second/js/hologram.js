$(function(){
	
	document.onclick = function(){
		$(".tab_menu > ul > li").find(".floor_list").remove();
	};

	$(".build_select .tab_menu > ul > li").on("click", function(event){
		if($(this).find(".floor_select_block").length> 0){
			return false;
		} else {
			$(this).siblings().find(".floor_list").remove();
			var addText = $(".hidden_tool .floor_select_block").clone(true);
			$(".build_select .tab_menu > ul > li").find(".floor_select_block").remove();
			$(this).find("p").append(addText);
		}
		event.stopPropagation();
	});

	// 选择楼层
	$(".floor_select").on("click", function(event){
		$(".tab_menu > ul > li").find(".floor_list").remove();
		var addList = $(".floor_list").clone(true);
		$(this).parent().parent().parent().parent().append(addList);
		event.stopPropagation();
	});

	// 全息图-区域参数-选择区域
	$("#choose_region").on("change", function(a){
		var val = $("#choose_region").val();
		r_region_id = $(this).children('option:selected').attr("region");
		r_co2_id = val;
		getRegionInfo(); // 获取区域的图形等信息
	});
});