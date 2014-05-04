<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<%--  空调组 --%>
	<div class="span12">
		<div class="span3">
			<div id="u1269" class="u1269_container" data-label="恒温恒湿空调箱">
				<div id="u1269_img" class="u1269_selected"></div>
				<div id="u1270" class="u1270" style="top: 6px;">
					<div id="u1270_rtf">
						<p style="text-align: left;" id="cache14">
							<span class="air_case_class" id="cache15">恒温恒湿空调箱 &gt;</span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="span6">
			<%-- 区域选择 --%>
			<select onchange="acuLevelSelect()" id="acuLevelSelect">
				<c:forEach items="${region}" var="level">
					<option value="${level.regionId}">${level.regionName}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<%-- 设备选择   日期选择 --%>
	<div class="span12">
		<div class="span4 left_margin_padding">
			<select onchange="acuEquipSelect()" id="acuEquipSelect">
				<c:forEach items="${acus}" var="acu">
					<option selected="selected" value="${acu.id}">${acu.id}</option>
				</c:forEach>
			</select>
		</div>
		<div class="span6 air_group_selectdate">
			<div class="text-right">
				<ul class="date_select" style="list-style-type: none;">
					<li onclick="changeFcuDate('month')" class="month_color">月</li>
					<li onclick="changeFcuDate('week')" class="week_color">周</li>
					<li onclick="changeFcuDate('day')" class="day_color">日</li>
				</ul>
			</div>
		</div>
	</div>
	<%-- end设备选择   日期选择 --%>

	<div class="span10">
		<hr class="air_group_hr">
		<div class="air_group_time_title">
			<span class="air_group_text_class"
				id="<portlet:namespace />acus_text"></span>
		</div>
	</div>
	<span class="span12">&nbsp;</span>

	<div id="acuOnOffGraphic" class="span12 chart_margin_left"></div>
	<span class="span12">&nbsp;</span>
	<div id="acuSupplyRtnWindTempGraphic" class="span12 chart_margin_left"></div>

	<%--  end空调组 --%>

	<span class="span12"> <br> <br> <br>
	</span>

</div>
<%-- 变更区域 --%>
<script type="text/javascript">
	var acus_step = 12; //定义全局变量，存储图表X轴显示的间隔
	var airCdtEndRegion = "0m";
	function acuLevelSelect() {
		airCdtEndRegion = $("#acuLevelSelect").val();
		key = airCdtEndRegion;
		// 
		html = "";
		$.each(regEqpMap.acu, function(regionId, eqpList) {
			if (key == regionId) {
				$.each(eqpList, function(idx, eqp) {
					if (eqp.id != "acu_0" && eqp.id != "acu_5"
							&& eqp.id != "acu_33" && eqp.id != "acu_41"
							&& eqp.id != "acu_49") {
						html += "<option selected='selected' value="+eqp.id+">"
								+ eqp.id + "</option>";
					}

				});
			}

		});
		$("#acuEquipSelect").html(html);
	}
</script>

<%--ACU开关状态 --%>
<script type="text/javascript">
	function initACUOnOffGraphic(data) {
		$('#acuOnOffGraphic')
				.highcharts(
						{
							chart : {
								height : 200,
								width : 850,
								type : 'area',
								spacingBottom : 30
							},
							title : {
								align : 'left',
								x : 80,
								text : 'ACU开启状态'
							},
							legend : {
								layout : 'vertical',
								align : 'left',
								verticalAlign : 'top',
								borderWidth : 1,
								backgroundColor : '#FFFFFF'
							},
							xAxis : {
								tickColor : '#FFFFFF', // 刻度线的颜色 
								labels : {
									rotation : -90, // X轴纵向显示
									y : 20,
									x : 10,
									step : acus_step
								// x轴显示的间隔(*12是因为每个小时有12个点，如果要显示间隔为？小时的话，则用12*?)
								},
								categories : data.cataList
							},
							yAxis : {
								title : {
									text : ''
								},
								labels : {
									formatter : function() {
										return this.name;
									}
								},
								gridLineDashStyle : 'LongDash'
							},
							tooltip : {
								formatter : function() {
									return '<b>' + this.series.name + '</b>';
								}
							},
							plotOptions : {
								area : {
									fillColor : {
										linearGradient : {
											x1 : 0,
											y1 : 0,
											x2 : 0,
											y2 : 1
										},
										stops : [
												[
														0,
														Highcharts.getOptions().colors[0] ],
												[
														1,
														Highcharts
																.Color(
																		Highcharts
																				.getOptions().colors[0])
																.setOpacity(0)
																.get('rgba') ] ]
									},
									lineWidth : 1,
									marker : {
										enabled : false
									},
									shadow : false,
									states : {
										hover : {
											lineWidth : 1
										}
									},
									threshold : null
								}
							},
							credits : {
								enabled : false
							},
							series : [ {
								name : '开',
								data : data.opens
							} ]
						});
	}
</script>

<%--ACU送、回风温度（℃） --%>
<script type="text/javascript">
	function initACUSupplyRtnWindTempGraphic(data) {
		$('#acuSupplyRtnWindTempGraphic').highcharts(
				{
					chart : {
						type : 'spline',
						width : 850,
						height : 228
					},
					credits : {
						enabled : false
					},
					title : {
						align : 'left',
						x : 80,
						text : '送风参数'
					},
					tooltip : {
						formatter : function() {
							return '<b>' + this.series.name + '</b>:' + this.y
									+ (this.series.name == "送风温度" ? "℃" : "%");
						}
					},
					xAxis : {
						tickColor : '#FFFFFF', // 刻度线的颜色 
						labels : {
							rotation : -90, // X轴纵向显示
							y : 20,
							x : 10,
							step : acus_step
						// x轴显示的间隔(*12是因为每个小时有12个点，如果要显示间隔为？小时的话，则用12*?)
						},
						categories : data.cataList
					},
					yAxis : {
						title : {
							text : ' '
						},
						labels : {
							formatter : function() {
								return this.name;
							}
						},
						gridLineDashStyle : 'LongDash'
					},
					plotOptions : {
						spline : {
							lineWidth : 1,
							states : {
								hover : {
									lineWidth : 2
								}
							},
							marker : {
								enabled : false
							}
						}
					},
					series : [ {
						color : '#52B103',
						name : '送风温度',
						tooltip : {
							valueSuffix : '℃'
						},
						data : data.t_supply_acu
					}, {
						name : '送风湿度',
						data : data.acuSupplyHumidity,
						tooltip : {
							valueSuffix : '%'
						}
					} ]

				});
	};
</script>

<script type="text/javascript">
	function airCdtEndPageInit() {
		$(".cold_module").siblings().hide();
		$("#airConditionEndGroup").show();
		acuLevelSelect();
		acuEquipSelect();
		//		queryACUData();

		highlightDate(acuType);
	}
</script>

<%-- ACU --%>
<script type="text/javascript">
	function acuEquipSelect() {
		acuMachineId = $("#acuEquipSelect").val();
		queryACUData();
	}
</script>
<portlet:resourceURL id="detectACUData" var="detectACUDataURL">
</portlet:resourceURL>
<script type="text/javascript">
	var acuTFrom = prettyFrom;
	var acuTTo;
	var acuType = "day";
	var acuMachineId;
	var acuFlag = "0";

	// 显示日期 
	$('#<portlet:namespace />acus_text').text(acuTFrom);
	// 查询acu的数据
	function queryACUData() {
		setActiveFunction("acu");
		//
		acuMachineId = $("#acuEquipSelect").val();
		
		if(acuMachineId == null || acuMachineId == "")
			acuMachineId = 'acu_B_1F_14'; 
		//ACU
		$.post('${detectACUDataURL}', {
			tfrom : acuTFrom,
			tto : acuTTo,
			type : acuType,
			id : acuMachineId,
			ispd : "1"
		}, function(data) {
			initACUSupplyRtnWindTempGraphic(data);
			initACUOnOffGraphic(data);

			// 设置div高度，以适应版权信息展示 
			$('#swap_info').height($('#airConditionEndGroup').height());
			$('#devicemonitor_formdiv').height(
					$('#airConditionEndGroup').height());
		});
	}

	// 点击0M/5M/33M/41M/49M触发的事件 
	function clickAcusRegion(id) {
		// 为下拉列表赋值 
		$('#airGroupLevelSelect').val(id);
		$('#acuLevelSelect').val(id);
	}
</script>
<%-- ACU日期选择控件 --%>
<input id="acuDatepicker" type="hidden" />
<script type="text/javascript">
	function changeFcuDate(type) {
		highlightDate(type);

		acuType = type;

		var v_text = ""; // 文字切换
		WdatePicker({
			el : 'acuDatepicker',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				//日期修正
				switch (type) {
				case 'day':
					acus_step = 12 * 1; // 图表X轴显示的间隔 
					v_text = from; // 文字切换 
					to = from;
					break;
				case 'week':
					acus_step = 12 * 2; // 图表X轴显示的间隔 
					v_text = showWeekFirstDay(from) + " ~ "
							+ showWeekLastDay(from); // 文字切换
					to = dp.$DV(from, {
						d : 7
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'month':
					acus_step = 12 * 4; // 图表X轴显示的间隔 
					v_text = dp.cal.getDateStr("yyyy-MM") + "-01 ~ "
							+ showMonthLastDay(from); // 文字切换
					to = dp.$DV(from, {
						M : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				}

				// 文字切换
				$('#<portlet:namespace />acus_text').text(v_text);
				//赋值
				acuTFrom = from;
				acuTTo = to;
				//刷新数据
				queryACUData();
			}
		});
	};
</script>