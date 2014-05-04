$(function(){
	$(".btn_group div").on("click", function(){
		$(this).siblings().removeClass("btn_press");
		$(this).addClass("btn_press");
	});
	
	$(".fault_tab").each(function(){
		var thisdom = $(this).find(".tab_menu li");
		var thisdomCount = $(this).find(".tab_menu li").length;
		var tabdom = $(".fault_tab");
		fitWidth(thisdom,thisdomCount,tabdom);	
	});

	$(".fault_tab").each(function(){
		$(this).find(".tab_menu li").each(function(index){
			$(this).on("click", function(){
				$(this).siblings().removeClass("cur_tab");
				$(this).addClass("cur_tab");
				$(".fault_tab_content").hide();
				$(".fault_tab_content:eq("+ index +")").show();
			});
		});
	});

	$(".downarrow_icon").on("click", function(event){
		$(".device_select_popover").show();
		event.stopPropagation();
	});

	document.onclick = function(){
		$(".device_select_popover").hide();
	};

	$(".each_device").each(function(index){
		if ((index+1)%4 == 0) {
			$(this).addClass("noborderright");
		}
	});

	$(".display_more").toggle(function(){
		$(this).prev().css({"height": "auto"})
	},function(){
		$(this).prev().css({"height": "230px"})
	});

	var eachDeviceLen = $(".each_device").length;
	if (eachDeviceLen > 4) {
		$(".display_more").show();
	} else {
		$(".display_more").hide();
	}

	$(".title_block .btn_group > div ").each(function(index){
		$(this).on("click", function(){
			$(".d_w_m_switch > div").removeClass("cur");
			$(".d_w_m_switch > div:eq("+ index +")").addClass("cur");
		});
	});

	$(".more").on("click", function(){
		$(".all_device_list").hide();
		$(".detail_page").show();
	});

	$(".edcs").mCustomScrollbar({
		scrollButtons:{
			enable:true
		},
		advanced:{
			updateOnContentResize:true,
		},
		theme : "dark"
	});
	
	$(".data").each(function(){
		var thisLen = $(this).width();
		var count = $(this).find(">div").length;

		var eachLen = ( thisLen - (count -1) )/count;
		$(this).find(">div").css({"width" : eachLen + "px"});
	});

	$(".view_switch_btn > div").on("click", function(){
		$(this).siblings().removeClass("btn_press");
		$(this).addClass("btn_press");
	});

	$(".zoomin").on("click", function(){
		var thisTitle = $(this).parent().text();
		$("#mask").show();
		$(".dialog-device-zoom").show();
		$(".dialog-device-zoom").find(".dialog-header > h3").text(thisTitle);
		$(".data").each(function(){
			var thisLen = $(this).width();
			var count = $(this).find(">div").length;

			var eachLen = ( thisLen - (count -1) )/count;
			$(this).find(">div").css({"width" : eachLen + "px"});
		});
	});

	$(".dialog-more-btn").on("click", function(){
		$(".dialog-cancel_btn").trigger("click");
		$(".all_device_list").hide();
		$(".detail_page").show();
	})
})