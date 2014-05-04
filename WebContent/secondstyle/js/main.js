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

	$(".tab").each(function(){
		$(this).find(".tab_menu li").each(function(index){
			$(this).on("click", function(){
				$(this).siblings().removeClass("cur_tab");
				$(this).addClass("cur_tab");
				var $fatherDiv = $(this).parent().parent().parent();
				$fatherDiv.find(".tab_content").hide();
				$fatherDiv.find(".tab_content:eq("+ index +")").show();
			})
		});
	});

	$(".outdoor_enviroment .btn_group > div").each(function(index){
		$(this).on("click", function(event){
			$(".outdoor_enviroment table").removeClass("cur_table");
			$($(".outdoor_enviroment table")[index]).addClass("cur_table");
		})
	});

	$(".dialog-popover .dialog-cancel_btn").on("click", function(){
		$(this).parent().parent().hide();
		$(this).parent().parent().find("input").val("");
		$("#measure_mask").hide();
	});

	$(".tab").each(function(){
		var thisdom = $(this).find(".tab_menu li");
		var thisdomCount = $(this).find(".tab_menu li").length;
		fitWidth(thisdom,thisdomCount);	
	});

	$(".report_form").each(function(index){
		$(this).find(".chart_switch_btn").each(function(index2){
			$(this).on("click", function(){
				$(".report_page_tab:eq("+ index +")").find(".tab_content").each(function(index3){
					$(this).find(".sub_content").hide();
					$(this).find(".sub_content:eq("+ index2 +")").show();
				})
			});
		})
	});

	// 报表点击放大事件
	$(".zoom_mask").on("click", function(){
		$("#measure_mask").show();
		var classArr = $(this).parentsUntil(".report_page_tab").parent().attr("class");
		var dialogTitle = $(this).parentsUntil(".report_page_tab").parent().prev().find(".block_title").text();
		$("#measure_mask .filter_widget").hide();
		showToolBar(classArr);
		$(".dialog-zoomin-table > .dialog-header h3").text(dialogTitle);
		$(".dialog-zoomin-table").show();
	});
	
	// 计量报表点击放大事件
	$(".measure_zoom_mask").on("click", function(){
		$("#measure_mask").show();
		var classArr = $(this).parentsUntil(".report_page_tab").parent().attr("class");
		var dialogTitle = $(this).parentsUntil(".report_page_tab").parent().prev().find(".block_title").text();
		$("#measure_mask .filter_widget").hide();
		showToolBar(classArr);
		$(".dialog-zoomin-table > .dialog-header h3").text(dialogTitle);
		$(".dialog-zoomin-table").show();
	});
	
	// 图形视图和表格视图切换效果
	$("#measure_table>.chart_switch_btn").on("click", function(){
		$(this).siblings().removeClass("btn_press");
		$(this).addClass("btn_press");

		// 调用生成表格的函数
		if(this.innerText == "表格视图")
			buildTableData();
	});
	
	// 故障诊断
	$(".first_layout .fault_content").each(function(){
		var faultCount = $(this).find(".fault_count").text();
		if (faultCount == 0) {
			$(this).find(".each_fault").css({"height":"300px"});
			$(this).find(".each_fault > table").hide();
			$(this).find(".each_fault > .no_fault").show();
		}
	});

	$(".fault_tab").each(function(){
		var thisdom = $(this).find(".tab_menu li");
		var thisdomCount = $(this).find(".tab_menu li").length;
		var tabdom = $(".fault_tab");
		faultWidth(thisdom,thisdomCount,tabdom);	
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
	
	//故障诊断层切换
	$(".each_fault .build_number").on("click", function(){
		$(".first_layout").hide();
		$(".second_layout").show();
		shouExpInfo(); // 点击故障对象后显示的内容
	});

	$(".return_btn").on("click", function(){
		$(".second_layout").hide();
		$(".first_layout").show();
	})
});

function showToolBar(classArr){
	if (classArr.indexOf("nhbb") != -1) {
		$(".tool_1,.tool_3,.tool_4").show();
	} else if(classArr.indexOf("nxzb") != -1) {
		$(".tool_1,.tool_3,.tool_4").show();
	} else if(classArr.indexOf("yxcs") != -1) {
		$(".tool_2,.tool_3,.tool_4").show();
	} else if(classArr.indexOf("sbtz") != -1) {
		$(".tool_5").show();
	} else if(classArr.indexOf("jzynzd") != -1) {
		$(".tool_1,.tool_6").show();
	} else {
		return false;
	}
}

function fitWidth(thisdom,count) {
	var width = $(".tab").css("width");
	width = width.substring(0,width.length-2);
	var eachLiWidth = width/count -10;
	thisdom.css("width",eachLiWidth);
}

function faultWidth(thisdom,count,tabdom) {
	var width = tabdom.css("width");
	width = width.substring(0,width.length-2);
	var eachLiWidth = width/count - (45 - count*4);
	thisdom.css("width",eachLiWidth);
}