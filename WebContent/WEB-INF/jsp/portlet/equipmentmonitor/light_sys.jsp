<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="light_sys">
	<div class="device_modle" id="light">
		<div class="chart_title has_border_radius_top">
			照明回路
			<div class="more more_light" onclick="showDetails('照明系统','照明回路', 7, 'light')"></div>
			<div class="zoomin"></div>
		</div>
		<div class="chart">
			<div class="btn_group" style="display: none;">
				<input type="hidden" id="D_1" value="1"> <input
					type="hidden" id="D_2" value="1">
				<!-- <div class="btn_press">开启回路</div>
				<div>开启功率</div> -->
			</div>
			<div class="chartArea" id="<portlet:namespace/>chart_light" style="height: 178px"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		// 照明回路
		var equip_light = [{name : 'A1号楼', total : 3169, current : 4}, 
						 {name : 'P1号楼', total : 0, current : 0}, 
						 {name : 'P2号楼', total : 0, current : 0}, 
						 {name : 'T1号楼', total : 2624, current : 3}, 
						 {name : 'T2号楼', total : 3008, current : 2}, 
						 {name : 'T3号楼', total : 3217, current : 6}, 
						 {name : 'T4号楼', total : 3152, current : 1}, 
						 {name : 'T5号楼', total : 3088, current : 5}];
		var obj_light = $("#light");
		
		// 获取各建筑的风机盘管台数
		$.ajax({
			type : "POST",
			async : false, // 同步
			url : "<portlet:resourceURL id='getDatasForBuilds'></portlet:resourceURL>",
			data : {
				from : ('${equipmentMonitor.defaulttime}'==''?date0:'${equipmentMonitor.defaulttime}'),
				name : light_t_name,
				id : light_t_id,
				ispd : light_t_ispd,
				type : (publicTime != "" ? 'test_span' : 'span'),
				decimals : '0',
				region_id : 'total',
				build_id : all_build_list.join()
			},
			success : function(result) {
				var dataList = result.data;
				equip_light = [{name : 'A1号楼', total : 3169, current : parseFloat(dataList[0][0])}, 
								 {name : 'P1号楼', total : 0, current : parseFloat(dataList[1][0])}, 
								 {name : 'P2号楼', total : 0, current : parseFloat(dataList[2][0])}, 
								 {name : 'T1号楼', total : 2624, current : parseFloat(dataList[3][0])}, 
								 {name : 'T2号楼', total : 3008, current : parseFloat(dataList[4][0])}, 
								 {name : 'T3号楼', total : 3217, current : parseFloat(dataList[5][0])}, 
								 {name : 'T4号楼', total : 3152, current : parseFloat(dataList[6][0])}, 
								 {name : 'T5号楼', total : 3088, current : parseFloat(dataList[7][0])}];
			},
			error : function(result) {
				console.log('getDatasForBuilds + error');
			}
		});

		detail_tables(equip_light, obj_light, '');
		detail_tables(equip_light, $(".dialog-popover"), 7);
		$(".more_light").data("data", equip_light);
		smallChartAndBuild('<portlet:namespace/>chart_light', null, ahu_build_id);
	});
	

	// 动态生成照明回路
	function dynamicBuildInfo(name) {
		var floor_list = ['一层', '二层', '三层', '四层', '五层', '六层'];
		var floor_code = ['1F', '2F', '3F', '4F', '5F', '6F'];
		if(ahu_build_id == "A1"){
			floor_list.push("七层");
			floor_code.push("7F");
		}
		
		// 获取各建筑的风机盘管台数
		$.ajax({
			type : "POST",
			// async : false, // 同步
			url : "<portlet:resourceURL id='getDatasForRegions'></portlet:resourceURL>",
			data : {
				from : ('${equipmentMonitor.defaulttime}'==''?date0:'${equipmentMonitor.defaulttime}'),
				name : eval("detail_" + name + "OpenNum_name"),
				id : eval(name + "OpenNum_id"),
				ispd : eval("detail_" + name + "OpenNum_ispd"),
				type : (publicTime != "" ? 'test_span' : 'span'),
				decimals : '0',
				region_id : floor_code.join(),
				build_id : ahu_detail_build
			},
			success : function(result) {
				var dataList = result.data;
				
				var numList = eval(name + "_" + ahu_build_id); // 照明回路的灯具
				var total = floor_list.length;
				var obj = $(".each_device_list");
				obj.empty();
				if (total > 4) {
					$("div").remove(".display_more");
					$("<div>").addClass("display_more").html('显示更多').appendTo($(".sszt"));
				} else {
					$("div").remove(".display_more");
				}
				for (var i = 0; i < total; i++) {
					$("<div>").addClass("each_device " + state)
									.append($("<div>").addClass("device_number").append(
											$("<h3>").html(floor_list[i])).append(
											$("<p>").html('')))
										.append($("<div>")
											.addClass("device_para")
												.append($("<div>")
													.append($("<table>")
														.append($("<tbody>")
															.append($("<tr>").append($("<td>").addClass("value_floor").html(dataList[i][0])))
															.append($("<tr>").append($("<td>").addClass("total_floor").html('开启数')))
															.append($("<tr>").append($("<td>").addClass("value_floor").html(numList[i].total)))
															.append($("<tr>").append($("<td>").addClass("total_floor").html('总数')))))))
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
				
				$(".display_more").css("display", "block");
				$(".each_device_list > .each_device").css("height", "230px");
				$(".each_device_list > .each_device > .device_para").css("height", "190px");
				$(".sszt > .each_device_list").css("height", "230px");
				
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

				
				
			},
			error : function(result) {
				console.log('getDatasForBuilds + error');
			}
		});
		
		
		
		
		
	}
</script>