$(function() {
	$(".btn_group div").on("click", function() {
		$(this).siblings().removeClass("btn_press");
		$(this).addClass("btn_press");
	});
	
	// 点击更多触发的操作
	$(".more").on("click",function() {
				var curId = $(this).parent().parent().attr("id"); // 当前点击详情的模块id
				$(".all_device_list").hide();
				var ul = $(".fault_tab ul");
				ul.empty();
				$(".detail_page").show();
				if (curId == 'coldSite_one' || curId == 'coldSite_two' || curId == 'coldSite_three') { // 冷站1,2,3 | 常规制冷系统
					var name = '常规制冷系统';
					var li_1 = $("<li class='cur_tab' tip='lengzhan' style='width: 100%;'>")
							.append($("<div>")
							.append($("<img>"))
							.append($("<p>").html(name + ' | <span>冷水机组</span>'))
									.append($('<i>').addClass("downarrow_icon"))
							);
					li_1.appendTo(ul);	
					
					var totalNum = eval(curId + "Temp")[0].total; // 默认显示冷水机组的总台数
					getRunningChart(totalNum); // 运行趋势
//					name = '冰蓄冷系统';
//					var li_2 = $("<li style='width:433px;'>")
//							.append(
//									$("<div>")
//											.append($("<img>"))
//											.append(
//													$("<p>")
//															.html(
//																	name
//																			+ ' | <span>冷水机组</span>')))
//							.append($('<i>').addClass("downarrow_icon"));
//					li_2.appendTo(ul);
//				} else if ($(this).index(".more") == 3) {
//					$(".detail_page>input:eq(0)").val('1');
//					var name = '常规制冷系统';
//					var li_1 = $("<li style='width:433px;'>")
//							.append(
//									$("<div>")
//											.append($("<img>"))
//											.append(
//													$("<p>")
//															.html(
//																	name
//																			+ ' | <span>冷水机组</span>')))
//							.append($('<i>').addClass("downarrow_icon"));
//					li_1.appendTo(ul);
//					name = '冰蓄冷系统';
//					var li_2 = $(
//							"<li class='cur_tab' style='width:433px;'>")
//							.append(
//									$("<div>")
//											.append($("<img>"))
//											.append(
//													$("<p>")
//															.html(
//																	name
//																			+ ' | <span>冷水机组</span>')))
//							.append($('<i>').addClass("downarrow_icon"));
//					li_2.appendTo(ul);
				} else { // 空调箱详情
					var data = $(this).data('data');
					var width = 867 / data.length;
					for (var i = 0; i < data.length; i++) {
						if (i == 0) {
							clas = 'cur_tab';
						} else {
							clas = '';
						}
						li = $("<li title='" + data[i].name.substring(0,2) + "' class='" + clas + "' style='width:" + width + "px'>").append($("<div>").append($("<img>")).append($("<p>").html(data[i].name)));
						li.appendTo(ul);
					}
					
					// 空调箱模块
					if(curId == 'ahu') {
						
						// 增加层数，空调箱zzx
						$(".device_floor .tab_menu .cur_tab").siblings().find(".floor_list").remove();
						$(".device_floor .tab_menu .cur_tab").siblings().find(".ahu_flist").remove();
						var addText = $(".hidden_tool .ahu_fselect_block").clone(true);
						$(".device_floor .tab_menu .cur_tab").find(".ahu_fselect_block").remove();
						$(".device_floor .tab_menu .cur_tab").find("p").append(addText);
						
					} else {
						
						console.log('zzx-----' + curId);
						// 增加层数，空调箱zzx
						$(".device_floor .tab_menu .cur_tab").siblings().find(".floor_list").remove();
						var addText = $(".hidden_tool .floor_select_block").clone(true);
						$(".device_floor .tab_menu .cur_tab").find(".floor_select_block").remove();
						$(".device_floor .tab_menu .cur_tab").find("p").append(addText);
					
					}
					
					var bIndex = $(".detail_page > .device_floor > .tab_menu > ul > .cur_tab").index(); // 当前建筑对应的index
					var totalNum = eval(curId + "Temp")[bIndex].total;
					getRunningChart(totalNum); // 运行趋势
				}
				// 下拉箭头点击事件
				$(".downarrow_icon").on("click", function(event) {
					$(this).parent().addClass("cur_tab");
					$(this).parent().siblings().removeClass("cur_tab");
					// 设置下拉框位置
					if ($(this).index(".downarrow_icon") == 1) {
						$(".device_select_popover:eq(1)").show();
						$(".device_select_popover:eq(0)").hide();
						$(".detail_page>input:eq(0)").val('1');
					} else {
						$(".device_select_popover:eq(0)").show();
						$(".device_select_popover:eq(1)").hide();
						$(".detail_page>input:eq(0)").val('0');
					}
					event.stopPropagation();
				});

				// 点击顶部的建筑触发的事件
				$(".fault_tab").each(function() {
					$(this).find(".tab_menu li").each(function() {
								$(this).on("click",function() {
										console.log('click1');
										/* 保存被点击的tab的信息到隐藏的input中 */
										$(".detail_page > input:eq(0)").val($(this).index());
										$(this).siblings().removeClass("cur_tab");
										$(this).addClass("cur_tab");
										
										var curId = $(".detail_page").attr("tip"); // 当前模块
										if(curId == 'ahu') { // 控制只有在新风机组的时候执行
											$(".device_floor .tab_menu").find(".ahu_fselect_block").remove();
											$(".device_floor .tab_menu .cur_tab").siblings().find(".ahu_flist").remove();
											var addText = $(".hidden_tool .ahu_fselect_block").clone(true);
											$(".device_floor .tab_menu .cur_tab").find("p").append(addText);
											$(".device_floor .tab_menu li").find(".ahu_fselect_block").remove();
										} else {
											
											if(curId != 'coldSite_one' && curId != 'coldSite_two' && curId != 'coldSite_three') {
											
												$(".device_floor .tab_menu").find(".floor_select_block").remove();
												$(".device_floor .tab_menu .cur_tab").siblings().find(".floor_list").remove();
												var addText = $(".hidden_tool .floor_select_block").clone(true);
												$(".device_floor .tab_menu .cur_tab").find(".floor_select_block").remove();
												$(".device_floor .tab_menu .cur_tab").find("p").append(addText);
											
											}
										}
										
										ahu_detail_build = $(".device_floor .tab_menu .cur_tab").attr("title"); // 当前选择的建筑
										
										var place = $(".detail_page>input:eq(1)").val();
										if (place == 0|| place == 3) {
											var place_1 = $(".detail_page>input:eq(0)").val();
											if (place_1 == 0) {
												getEquipDetail(place_1,$(".device_select_popover:eq(0)>input").val());
											} else if (place_1 == 1) {
												getEquipDetail(place_1,$(".device_select_popover:eq(1)>input").val());
											}
										} else {
											
											if(curId == "ahu") { // 空调箱特殊处理
												var bIndex = $(".detail_page > .device_floor > .tab_menu > ul > .cur_tab").index(); // 当前建筑对应的index
												var totalNum = ahuTemp[bIndex].total;
												getRunningChart(totalNum); // 运行趋势
												opeaAhu(); // 处理空调箱的信息
											} else if(curId == 'light') { // 在照明回路中，选择楼层后，刷新对应的开启台数的图表
												detail_lightOpenNum_id = lightOpenNum_id + "_" + detail_floor + "_" + ahu_detail_build;
												dynamicBuildInfo('light'); // 显示各楼层照明回路的实时状态 
												getDevicesDetailChart('lightOpenNum'); // 显示照明开启状态的曲线图
											} else if(curId == 'fcu') { // 在风机盘管中，选择楼层后，刷新对应的开启台数的图表
												detail_fcuOpenNum_id = fcuOpenNum_id + "_" + detail_floor + "_" + ahu_detail_build;
												dynamicBuildInfo('fcu'); // 显示各楼层风机盘管的实时状态 
												getDevicesDetailChart('fcuOpenNum'); // 显示风机盘管状态的曲线图
											} else {
												getBoilerBay(curId, 0);
											}
											
										}

//										showDetails();
//									}
								});
						});
				});
			});

	// 点击楼层的时候显示对应的div
	$(".floor_select").on("click", function(event) {
										console.log('click2');
		$(".cur_tab .floor_list").remove();
		var addList = $(".hidden_tool .floor_list").clone(true);
		$(this).parent().parent().parent().parent().append(addList);
		event.stopPropagation();
	});
	// 具体系统-选择楼层 
	$(".floor_list li").each(function(index){
		$(this).click(function(){
			
										console.log('click3');
			dev_floor_text = $(this).text(); // 当前楼层对应的中文名字
			detail_floor = ahu_detail_floor = dev_cur_floor = $(this).attr("title"); // 设置为选择的楼层
			$(".hidden_tool > .floor_select_block > .floor_select").text(dev_floor_text); // 选择的楼层
			$(".cur_tab").find(".floor_select").text(dev_floor_text); // 设置当前选择的楼层
			$(".cur_tab .floor_list").remove();
			
			if($(".detail_page").attr("tip") == 'light') { // 在照明回路中，选择楼层后，刷新对应的开启台数的图表
				detail_lightOpenNum_id = lightOpenNum_id + "_" + detail_floor + "_" + ahu_detail_build;
				dynamicBuildInfo('light'); // 显示各楼层照明回路的实时状态 
				getDevicesDetailChart('lightOpenNum'); // 显示照明开启状态的曲线图
			} else if($(".detail_page").attr("tip") == 'fcu') { // 在风机盘管中，选择楼层后，刷新对应的开启台数的图表
				detail_fcuOpenNum_id = fcuOpenNum_id + "_" + detail_floor + "_" + ahu_detail_build;
				dynamicBuildInfo('fcu'); // 显示各楼层风机盘管的实时状态 
				getDevicesDetailChart('fcuOpenNum'); // 显示风机盘管状态的曲线图
			} else {
				getDetailData(); // 获取详细信息详情
			}
			
			event.stopPropagation();
		});
	});

	// 空调箱选择楼层
	$(".ahu_fselect").on("click", function(event) {
		$(".cur_tab .ahu_flist").remove();
		var addList = $(".hidden_tool .ahu_flist").clone(true);
		$(this).parent().parent().parent().parent().append(addList);
		event.stopPropagation();
	});
	
	// 具体系统-选择楼层 
	$(".ahu_flist li").each(function(index){
		$(this).click(function(){
			dev_floor_text = $(this).text(); // 当前楼层对应的中文名字
			ahu_detail_floor = dev_cur_floor = $(this).attr("title"); // 设置为选择的楼层
			$(".hidden_tool > .ahu_fselect_block > .ahu_fselect").text(dev_floor_text); // 选择的楼层
			$(".cur_tab").find(".ahu_fselect").text(dev_floor_text); // 设置当前选择的楼层
			$(".cur_tab .ahu_flist").remove();
			
			var bIndex = $(".detail_page > .device_floor > .tab_menu > ul > .cur_tab").index(); // 当前建筑对应的index
			var totalNum = ahuTemp[bIndex].total;
			getRunningChart(totalNum); // 运行趋势
			
			event.stopPropagation();
		});
	});
	
	$(".fault_tab").each(function() {
		var thisdom = $(this).find(".tab_menu li");
		var thisdomCount = $(this).find(".tab_menu li").length;
		var tabdom = $(".fault_tab");
		fitWidth(thisdom, thisdomCount, tabdom);
	});

	document.onclick = function() {
		$(".device_select_popover").hide();
	};

	// 运行监测-设备监测-冷站-常规制冷系统下的五个项
	$(".select_list > li").on("click", function() {
										console.log('click5');
		var modelName = $(this).parent().parent().parent().parent().attr("tip"); // 当前模块id
		var thisText = $(this).find("p").text();
		var curId = $(this).attr("tip"); // 当前选择的id
		var num = $(this).index();
		$(this).css('display', 'none');
		$(this).siblings().css('display', 'block');
		var place = $(".detail_page>input:eq(0)").val();
		$(".cur_device_ul>li:eq(0)").find("p").text(thisText);
		$(".cur_tab").find("span").text(thisText);
		$(this).parent().parent().siblings("input").val($(this).index());
		
		if(curId == 'coldSite'){ // 冷水机组
			opeaColdSite();
		} else if(curId == 'waterSystem'){ // 水系统
			opeaWaterSystem();
		} else if(curId == 'coldPump'){ // 冷冻水泵
			opeateRunningParam();
		} else if(curId == 'coolPump'){ // 冷却水泵
			opeateRunningParam();
		} else if(curId == 'coolTower'){ // 冷却塔
			opeaCoolTower();
		} 
		
		getEquipDetail(modelName, num);
	});
	
	$(".data").each(function() {
		var thisLen = $(this).width();
		var count = $(this).find(">div").length;

		var eachLen = (thisLen - (count - 1)) / count;
		$(this).find(">div").css({
			"width" : eachLen + "px"
		});
	});

	$(".dialog-more-btn").on("click", function() {
		$(".dialog-cancel_btn").trigger("click");
		$(".all_device_list").hide();
		$(".detail_page").show();
	});

	// 选择设备切换图形
	$("#chooseDevice").on("change", function() {
		var id = $(this).val();
		
		var curId = $(".detail_page").attr("tip"); // 当前模块的id
		if (curId == 'coldSite_one' || curId == 'coldSite_two' || curId == 'coldSite_three') { // 冷站1,2,3 | 常规制冷系统
			detail_coldSiteColdParam_id = id + "," + id + "," + id;
			opeaColdSite(); // 显示冷水机组
		}
		
		if (curId == 'boiler_room_P1' || curId == 'boiler_room_P2' || curId == 'boiler_room_A1') { // 锅炉房P1、P2、A1
			detail_hotWaterParam_id = id + "," + id;
			opeaBoiler(); // 显示锅炉房
		}
		
		if(curId == 'ahu') { // 空调箱
			detail_windTempParam_id = detail_windHumpParam_id = id + "," + id;
			opeaAhu(); // 处理空调箱的信息
		}
		
		if(curId == 'sendWind' || curId == 'exhaustWind') { // 送风机或者排风机
			opeaWindSite();
		}
	});
});
// 实时状态时间显示（5分钟刷新）
function setTimes() {
	var time = new Date();
	var date1 = '';
	if(publicTime != ""){
		date1 = publicTime;
	} else {
		date1 = time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
	}
	var minute = time.getMinutes();
	var date2 = time.getHours() + ":" + ((minute < 10) ? "0" + minute.toString() : minute) + " ";
	
	$("h5:even").html(date1);
	$("h5:odd").html(date2);
	setTimeout("setTimes()", 300000);
}

// 产生table
function detail_tables(array, obj, d_num) {
	var num = Math.ceil(array.length / 4); // 得到行数
	var d_class = ".data";
	if ($(obj).parent().attr("id") == 'mask') { // 放大后
		$(obj).append($("<div>").addClass("data data_"+d_num).css("display",'none').data('data',d_num-1));// 添加第一行
		for (var i = 0; i < num - 1; i++) {// 添加剩余行
			$(obj).append($("<div>").addClass("data noborder data_"+d_num).css("display",'none').data('data',d_num-1));
		}
		d_class = ".data_" + d_num;
	} else { // 放大前
		$(obj).append("<div class='data data_" + d_num + "'>");// 添加第一行
		for (var i = 0; i < num - 1; i++) {// 添加剩余行
			$(obj).append("<div class='data data_" + d_num + " noborder'>");
		}
	}
	var width = 0.247;
	if (num < 2) {
		// 确定列宽
		if (array.length < 4) {
			width = 0.33;
			if (d_num != '') {
				width = 0.33228;
			}
		} else if (array.length = 4) {
			if (d_num != '') {
				width = 0.249;
			}
		}
		for (var i = 1; i <= array.length; i++) {
			$(obj).find(d_class).append(
					$("<div>").addClass(i + "th_d").css('width',
							(width * 100) + "%").data('num', i).append(
							$("<div>").addClass("info info_" + i).html(
									"<p style='color:" + ((array[i - 1].total == 0) ? "#50597B;" : "") + "'>" + array[i - 1].current + "<span>/"
											+ array[i - 1].total
											+ "<sup>台</sup></span></p><h4>"
											+ array[i - 1].name + "</h4>")));
		}
		$(obj).find(d_class + ">div").first().addClass("chart_data1_bg");
		$(obj).find(d_class + ">div").last().addClass("reiken");
	} else {
		if (d_num != '') {
			width = 0.249;
		}
		for (var i = 1; i <= 4; i++) {
			$(obj).find(d_class + ":eq(0)").append(
					$("<div>").addClass(i + "th_d").attr("title", "" + all_build_list[i - 1]).css('width',
							(width * 100) + "%").data('num', i).append(
							$("<div>").addClass("info info_" + i).html(
									"<p style='color:" + ((array[i - 1].total == 0) ? "#50597B;" : "") + "'>" + array[i - 1].current + "<span>/"
											+ array[i - 1].total
											+ "<sup>台</sup></span></p><h4>"
											+ array[i - 1].name + "</h4>")));
		}
		$(obj).find(d_class + ">div").first().addClass("chart_data1_bg");
		$(obj).find(d_class + ">div").last().addClass("reiken");
		for (var i = 5; i <= array.length; i++) {
			if (i == 5) {
				$(obj)
						.find(d_class + ".noborder:eq(0)")
						.append(
								$("<div>")
										.addClass(parseInt(i - 4) + "th_d")
										.attr("title", "" + all_build_list[i - 1])
										.css('width', (width * 100) + "%")
										.data('num', i)
										.append(
												$("<div>")
														.addClass(
																"info info_"
																		+ parseInt(i - 4))
														.html(
																"<p style='color:" + ((array[i - 1].total == 0) ? "#50597B;" : "") + "'>"
																		+ array[parseInt(i - 1)].current
																		+ "<span>/"
																		+ array[parseInt(i - 1)].total
																		+ "<sup>台</sup></span></p><h4>"
																		+ array[parseInt(i - 1)].name
																		+ "</h4>")));
			} else if (i == 8) {
				$(obj)
						.find(d_class + ".noborder:eq(0)")
						.append(
								$("<div>")
										.addClass(
												parseInt(i - 4) + "th_d reiken")
										.attr("title", "" + all_build_list[i - 1])
										.css('width', (width * 100) + "%")
										.data('num', i)
										.append(
												$("<div>")
														.addClass(
																"info info_"
																		+ parseInt(i - 4))
														.html(
																"<p style='color:" + ((array[i - 1].total == 0) ? "#50597B;" : "") + "'>"
																		+ array[parseInt(i - 1)].current
																		+ "<span>/"
																		+ array[parseInt(i - 1)].total
																		+ "<sup>台</sup></span></p><h4>"
																		+ array[parseInt(i - 1)].name
																		+ "</h4>")));
			} else {
				$(obj)
						.find(d_class + ".noborder:eq(0)")
						.append(
								$("<div>")
										.addClass(parseInt(i - 4) + "th_d")
										.attr("title", "" + all_build_list[i - 1])
										.css('width', (width * 100) + "%")
										.data('num', i)
										.append(
												$("<div>")
														.addClass(
																"info info_"
																		+ parseInt(i - 4))
														.html(
																"<p style='color:" + ((array[i - 1].total == 0) ? "#50597B;" : "") + "'>"
																		+ array[parseInt(i - 1)].current
																		+ "<span>/"
																		+ array[parseInt(i - 1)].total
																		+ "<sup>台</sup></span></p><h4>"
																		+ array[parseInt(i - 1)].name
																		+ "</h4>")));
			}
		}
	}
	// 由于风机盘管的数据较大，字体大小特殊处理
	$("#fcu > .data").find("p").css("font-size", 18);
	$("#fcu > .data").find("p").find("span").css("font-size", 14);
	$("#fcu > .data").find("sup").remove();
	
	// 由于照明的数据较大，字体大小特殊处理
	$(".light_sys > div > .data").find("p").css("font-size", 18);
	$(".light_sys > div > .data").find("p").find("span").css("font-size", 14);
	$(".light_sys > div > .data").find("sup").remove();
}
// 创建实时状态表格--参数当前显示第place张小图的详细信息，小图Table上的第num个设备
function getEquipDetail(curId, num) {
	var equip = $(".more_" + curId).data('data');
	// 关于水系统的显示设置
	if (num == 1) {
		$(".single_tab_title>p").css('display', 'none');
		$(".tab").css('display', 'none');
		$(".sub_title_block:eq(1)").css('display', 'none');
		$(".yxsj").css('display', 'none');
		$(".filter_widget").css('display', 'none');
		$(".btn_group").last().css('margin-left', '190px');
		$(".sub_title_block:eq(2)>p:eq(0)").html('系统详情');
	} else {
		$(".single_tab_title>p").css('display', 'block');
		$(".tab").css('display', 'block');
		$(".sub_title_block:eq(1)").css('display', 'block');
		$(".yxsj").css('display', 'block');
		$(".filter_widget").css('display', 'block');
		$(".btn_group").last().css('margin-left', '');
		$(".sub_title_block:eq(2)>p:eq(0)").html('设备详情');
	}
	for (var i = 0; i < 7; i++) {
		$(".fault_content:eq(" + i + ")").css('display', 'block');
		if (num == 0 || num == 2 || num == 3 || num == 4) {
			if (i > 4) {
				$(".fault_content:eq(" + i + ")").css('display', 'none');
			}
		}
	}
	if (num > 1) {
		num = num - 1;
	}
//	$(".single_tab_title>p:eq(0) strong").html(equip[num].total);
//	$(".single_tab_title>p:eq(1) strong").html(equip[num].current);
//	getSsztTable(equip[num].total, equip);
}
// 锅炉房及之后
function getBoilerBay(curId, num) {
	var equip = $(".more_" + curId + "").data('data');
	$(".single_tab_title > p:eq(0) strong").html(equip[num].total);
	$(".single_tab_title > p:eq(1) strong").html(equip[num].current);
	for (var i = 0; i < 7; i++) {
		$(".fault_content:eq(" + i + ")").css('display', 'block');
		if (curId == 'coldSite_one' || curId == 'coldSite_two' || curId == 'coldSite_three') { // 冷站1,2,3 | 常规制冷系统
			if (num == 0) {
				if (i > 3) {
					$(".fault_content:eq(" + i + ")").css('display', 'none');
				}
			}
			if (num == 1) {
				if (i > 4) {
					$(".fault_content:eq(" + i + ")").css('display', 'none');
				}
			}
		} else if (curId == 'sendWind' || curId == 'exhaustWind') { // 送风机和排风机
			if (i > 4) {
				$(".fault_content:eq(" + i + ")").css('display', 'none');
			}
		}
	}
	getSsztTable(equip[num].total, equip);
}
function getSsztTable(total, equip, devicesList) {
	var obj = $(".each_device_list");
	obj.empty();
	if (total > 4) {
		$("div").remove(".display_more");
		$("<div>").addClass("display_more").html('显示更多').appendTo($(".sszt"));
	} else {
		$("div").remove(".display_more");
	}
	
	var stateList = getDeviceStatus(total, devicesList);
	console.log("start--stateList");
	console.log(stateList);
	console.log("end");
	
	for (var i = 0; i < total; i++) {
		if (i % 3 == 0) {
			state = 'OFF';
		} else {
			state = 'ON';
		}
		var str = '';
		try{
			str = devicesList[i];
			state = stateList[i];
		} catch(e) {}
		$("<div>").addClass("each_device " + state)
						.append($("<div>").addClass("device_number").append(
								$("<h3>").html(str)).append(
								$("<p>").addClass(state).html(state)))
							.append($("<div>")
								.addClass("device_para")
									.append($("<div>")
										.append($("<table>")
											.append($("<tbody>")
												.append($("<tr>")
																.append($("<td>").html(''))
																.append($("<td>").html('')))
												.append($("<tr>").append($("<td>").html(''))
																.append($("<td>").html('')))
												.append($("<tr>").append($("<td>").html(''))
																.append($("<td>").html('')))))))
				.appendTo(obj);
	}
	
	// 根据total的值确定是否需要增加空白页签
	var _number = total % 4;
	if(_number != 0) {
		for (var i = 0; i < (4 - _number); i++) {
			$("<div>").addClass("each_device ")
							.append($("<div>").addClass("device_number").append(
									$("<h3>").html('')).append(
									$("<p>").html('')))
								.append($("<div>")
									.addClass("device_para")
										.append($("<div>")
											.append($("<table>")
												.append($("<tbody>")
													.append($("<tr>")
																	.append($("<td>").html(''))
																	.append($("<td>").html('')))
													.append($("<tr>").append($("<td>").html(''))
																	.append($("<td>").html('')))
													.append($("<tr>").append($("<td>").html(''))
																	.append($("<td>").html('')))))))
					.appendTo(obj);
		}
	}
	
	$(".each_device").each(function() {
		if (($(this).index() + 1) % 4 == 0) {
			$(this).addClass("noborderright");
		}
	});
	$(".display_more").toggle(function() {
		$(this).prev().css({
			"height" : "auto"
		});
		$(this).text("收起");
	}, function() {
		$(this).prev().css({
			"height" : "230px"
		});
		$(this).text("显示更多");
	});
}
















