<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<div class="span12">
		<%--  空调组 --%>
		<div class="span2 left_margin_padding">
			<div id="u1269" class="u1269_container" data-label="空调机组">
				<div id="u1269_img" class="u1269_selected"></div>
				<div id="u1270" class="u1270" style="top: 6px;">
					<div id="u1270_rtf">
						<p style="text-align: left;" id="cache14">
							<span
								style="font-family: 微软雅黑; font-size: 18px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(255, 0, 0);"
								id="cache15">空调</span><span
								style="font-family: 微软雅黑; font-size: 18px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(255, 0, 0);"
								id="cache16">机组</span><span
								style="font-family: 微软雅黑; font-size: 18px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(255, 0, 0);"
								id="cache17"> &gt;</span>
						</p>
					</div>
				</div>
			</div>

		</div>
		<div class="span4">
			<%-- 区域选择 --%>
			<select id="airGroupLevelSelect" onchange="airGroupLevelSelect()">
				<!-- 淘宝城的情况 -->
				<c:if test="${holocfg.itemName!='ChinaArts'}">
					<c:forEach items="${floorMap}" var="level">
						<option value="${level.value.regionId}">${level.value.regionName}</option>
					</c:forEach>
				</c:if>
				<!-- 中国馆情况 -->
				<c:if test="${holocfg.itemName=='ChinaArts'}">
					<c:forEach items="${region}" var="level">
						<option value="${level.regionId}">${level.regionName}</option>
					</c:forEach>
				</c:if>
			</select>
		</div>
	</div>

	<div id="ahuArea">
		<%-- 设备选择   日期选择 --%>
		<div class="span12 left_margin_padding">
			<div class="span4">
				<select id="ahuSelect" onchange="queryAHUData()">

					<c:forEach items="${ahus}" var="ahu">
						<option selected="selected" value="${ahu.id}">${ahu.id}</option>
					</c:forEach>

				</select>
			</div>
			<div class="span6 air_group_selectdate">
				<div class="text-right">
					<ul class="date_select" style="list-style-type: none;">
						<li onclick="changeAhuDate('month')" class="month_color">月</li>
						<li onclick="changeAhuDate('week')" class="week_color">周</li>
						<li onclick="changeAhuDate('day')" class="day_color">日</li>
					</ul>
				</div>
			</div>
		</div>
		<%-- end设备选择   日期选择 --%>

		<div class="span10">
			<hr class="air_group_hr">
			<div class="air_group_time_title">
				<span class="air_group_text_class"
					id="<portlet:namespace />air_group_text"></span>
			</div>
		</div>

		<span class="span12">&nbsp;</span>
		<div class="span12 chart_margin_left" id="ahuOnOffGraphic"></div>
		<span class="span12">&nbsp;</span>
		<div class="span12 chart_margin_left" id="supplyRtnWindTempGraphic"></div>
		<span class="span12">&nbsp;</span>
		<div class="span12 chart_margin_left"
			id="supplyRtnWindHumidityGraphic"></div>
		<%--  end空调组 --%>
	</div>

	<span class="span12"> <br> <br> <br>
	</span>


	<div id="fauArea">
		<%--FAU组 设备选择   日期选择 --%>
		<div class="span12 row left_margin_padding">
			<div class="span4">
				<select id="fauSelect" onchange="queryFAUData()">
					<c:forEach items="${faus}" var="fau">
						<option selected="selected" value="${fau.id}">${fau.id}</option>
					</c:forEach>
				</select>
			</div>
			<div class="span6 air_group_selectdate">
				<div class="text-right">
					<ul class="date_select" style="list-style-type: none;">
						<li onclick="changeFauDate('month')" class="month_color">月</li>
						<li onclick="changeFauDate('week')" class="week_color">周</li>
						<li onclick="changeFauDate('day')" class="day_color">日</li>
					</ul>
				</div>
			</div>

		</div>
		<%-- end设备选择   日期选择 --%>
		<div class="span10">
			<hr class="air_group_hr">
			<div class="air_group_time_title">
				<span class="air_group_text_class"
					id="<portlet:namespace />air_group_fau_text"></span>
			</div>
		</div>
		<span class="span12">&nbsp;</span>
		<%--  FAU开启状态 --%>
		<div class="span12 chart_margin_left" id="freshAirOnOffGraphic"></div>
		<span class="span12">&nbsp;</span>
		<div class="span12 chart_margin_left" id="freshAirTempGraphic"></div>
		<span class="span12">&nbsp;</span>
		<%--  end  FAU开启状态 --%>

	</div>
</div>

<%-- 空调机组 --%>
<portlet:resourceURL id="detectAHUData" var="detectAHUDataURL">
</portlet:resourceURL>

<portlet:resourceURL id="getDevicesList" var="getDevicesListURL"></portlet:resourceURL>

<script type="text/javascript">
	var ahuTFrom = prettyFrom;
	var ahuTTo = '';
	var ahuType = "day";
	var ahuMachineId;
	var ahuLocation = "5_1";
	var ahuFlag = "0";
	function queryAHUData() {
		setActiveFunction("ahu");
		ahuMachineId = $("#ahuSelect").val();
		
		if(ahuMachineId == null || ahuMachineId == "")
			ahuMachineId = 'ahu_1MF_2A'; 
		
		//AHU
		$.post('${detectAHUDataURL}', {
			tfrom : ahuTFrom,
			tto : ahuTTo,
			type : ahuType,
			id : ahuMachineId,
			ispd : 1
		}, function(data) {
			initAHUOnOffGraphic(data);
			initSupplyRtnWindTempGraphic(data);
			initSupplyRtnWindHumidityGraphic(data);

			$("#swap_info").height($("#airConditionGroup").height() + 100);
		});
	}

	var air_group_step = 12; //定义全局变量，存储图表X轴显示的间隔
	
	// 点击0M/5M/33M/41M/49M触发的事件 
	function clickAcusRegion(id) {
		// 为下拉列表赋值 
		$('#airGroupLevelSelect').val(id);
		$('#acuLevelSelect').val(id);  
	}
</script>

<portlet:resourceURL id="detectFAUData" var="detectFAUDataURL">
</portlet:resourceURL>
<script type="text/javascript">
	var fauTFrom = prettyFrom;
	var fauTTo;
	var fauType = "day";
	var fauMachineId;

	// 刷新fau处的图表 
	function queryFAUData() {
		setActiveFunction("fau");
		//
		fauMachineId = $("#fauSelect").val();
		
		if(fauMachineId == null || fauMachineId == "")
			fauMachineId = 'fau_B1F_3';

		$.post('${detectFAUDataURL}', {
			tfrom : fauTFrom,
			tto : fauTTo,
			type : fauType,
			id : fauMachineId,
			ispd : 1
		}, function(data) {
			// 加载图表
			initFreshAirOnOffGraphic(data);
			initFreshAirTempGraphic(data);
		});
	}
</script>

<script type="text/javascript">
	// 点击0M/5M/33M/41M/49M触发的事件 
	function clickRegion(id) {
		//id = '0000010700010001';
		// 为下拉列表赋值 
		$('#airGroupLevelSelect').val(id);
	}

	// 初始化图表信息 
	function airConditionPageInit() {
		// 下拉列表触发事件  
		airGroupLevelSelect();

		$(".cold_module").siblings().hide();
		$("#airConditionGroup").show();

		// 刷新ahu的图表数据
		queryAHUData();

		// 刷新fau的图表数据
		queryFAUData();

		highlightDate(ahuType);
	}
</script>

<script type="text/javascript">
	function calcStep(len, type) {
		//alert(len + "`" +type);
		if (type == "month") {
			return parseInt(719 / 30);
		}
		if (type == "week") {
			return parseInt(24);
		}
		if (type == "day") {
			return parseInt(288 / 24);
		}
	}
</script>
<%--AHU开关状态 --%>
<script type="text/javascript">
	function initAHUOnOffGraphic(data) {
		$('#ahuOnOffGraphic')
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
								text : 'AHU开启状态'
							},
							credits : {
								enabled : false
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
									step : air_group_step
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
								}
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

<%--AHU送、回风温度（℃） --%>
<script type="text/javascript">
	function initSupplyRtnWindTempGraphic(data) {
		$('#supplyRtnWindTempGraphic').highcharts({
			chart : {
				type : 'spline',
				width : 850,
				height : 228
			},
			title : {
				align : 'left',
				x : 80,
				text : '送、回风温度（℃）'
			},
			legend : {
				x : 300,
				borderWidth : 0
			},
			credits : {
				enabled : false
			},
			xAxis : {
				tickColor : '#FFFFFF', // 刻度线的颜色 
				labels : {
					rotation : -90, // X轴纵向显示
					y : 20,
					x : 10,
					step : air_group_step
				// x轴显示的间隔(*12是因为每个小时有12个点，如果要显示间隔为？小时的话，则用12*?)
				},
				categories : data.cataList
			},
			yAxis : {
				title : {
					text : '温度 (℃)'
				},
				gridLineDashStyle : 'LongDash'
			},
			tooltip : {
				formatter : function() {
					return Highcharts.numberFormat(this.y, 2, '.') + '℃';
				}
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
				data : data.t_sa
			}, {
				name : '回风温度',
				data : data.t_ra
			} ]
		});

	};
</script>
<%--AHU送、回风湿度（%） --%>
<script type="text/javascript">
	function initSupplyRtnWindHumidityGraphic(data) {
		$('#supplyRtnWindHumidityGraphic').highcharts({
			chart : {
				type : 'spline',
				width : 850,
				height : 228
			},
			title : {
				align : 'left',
				x : 80,
				text : '回风湿度（%）'
			},
			legend : {
				x : 340,
				borderWidth : 0
			},
			credits : {
				enabled : false
			},
			xAxis : {
				tickColor : '#FFFFFF', // 刻度线的颜色 
				labels : {
					rotation : -90, // X轴纵向显示
					y : 20,
					x : 10,
					step : air_group_step
				// x轴显示的间隔(*12是因为每个小时有12个点，如果要显示间隔为？小时的话，则用12*?)
				},
				categories : data.cataList
			},
			yAxis : {
				title : {
					text : '湿度(%)'
				},
				gridLineDashStyle : 'LongDash'
			},
			tooltip : {
				formatter : function() {
					return Highcharts.numberFormat(this.y, 2, '.') + '%';
				}
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
				name : '回风湿度',
				data : data.rh_ra
			} ]

		});
	};
</script>


<%--FAU开启状态 --%>
<script type="text/javascript">
	function initFreshAirOnOffGraphic(data) {
		$('#freshAirOnOffGraphic')
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
								text : 'FAU开启状态'
							},
							credits : {
								enabled : false
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
									step : air_group_step
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

<%--FAU新风参数 --%>
<script type="text/javascript">
	function initFreshAirTempGraphic(data) {
		$('#freshAirTempGraphic').highcharts({
			chart : {
				type : 'spline',
				width : 850,
				height : 228
			},
			title : {
				align : 'left',
				x : 80,
				text : '新风参数'
			},
			legend : {
				x : 300,
				borderWidth : 0
			},
			credits : {
				enabled : false
			},
			xAxis : {
				tickColor : '#FFFFFF', // 刻度线的颜色 
				labels : {
					rotation : -90, // X轴纵向显示
					y : 20,
					x : 10,
					step : air_group_step
				// x轴显示的间隔(*12是因为每个小时有12个点，如果要显示间隔为？小时的话，则用12*?)
				},
				categories : data.cataList
			},
			yAxis : {
				title : {
					text : '温度 (℃)'
				},
				gridLineDashStyle : 'LongDash'
			},
			tooltip : {
				formatter : function() {
					return Highcharts.numberFormat(this.y, 2, '.') + '℃';
				}
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
				data : data.t_supply_fahu
			} ]
		});
	};
</script>

<%-- fau日期选择控件 --%>
<input id="fauDatepickerMonth" type="hidden" />
<script type="text/javascript">
	function changeFauDate(type) {
		highlightDate(type);
		//
		fauType = type;

		var v_text = ""; // fau的文字切换
		WdatePicker({
			el : 'fauDatepickerMonth',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");

				//日期修正
				switch (type) {
				case 'day':
					air_group_step = 12 * 1; // 图表X轴显示的间隔 
					v_text = from; // 文字切换 
					break;
				case 'week':
					air_group_step = 12 * 2; // 图表X轴显示的间隔 
					v_text = showWeekFirstDay(from) + " ~ "
							+ showWeekLastDay(from); // 文字切换
					break;
				case 'month':
					air_group_step = 12 * 4; // 图表X轴显示的间隔 
					v_text = dp.cal.getDateStr("yyyy-MM") + "-01 ~ "
							+ showMonthLastDay(from); // 文字切换
					break;
				}

				// 文字切换
				$('#<portlet:namespace />air_group_fau_text').text(v_text);

				//赋值
				fauTFrom = from;
				//刷新数据
				queryFAUData();
			}
		});

	};
</script>
<%-- ahu日期选择控件 --%>
<input id="ahuDatepickerMonth" type="hidden" />
<script type="text/javascript">
	//空调机组的文字切换
	$('#<portlet:namespace />air_group_text').text(prettyFrom);
	$('#<portlet:namespace />air_group_fau_text').text(prettyFrom);
	// 点击日、周、月触发的事件
	function changeAhuDate(type) {
		highlightDate(type);

		ahuType = type;

		var v_text = ""; // 空调机组的文字切换 
		WdatePicker({
			el : 'ahuDatepickerMonth',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				var to = from;
				//日期修正
				switch (type) {
				case 'day':
					air_group_step = 12 * 1; // 图表X轴显示的间隔 
					v_text = from; // 文字切换 
					to = dp.$DV(from, {
						d : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'week':
					air_group_step = 12 * 2; // 图表X轴显示的间隔 
					v_text = showWeekFirstDay(from) + " ~ "
							+ showWeekLastDay(from); // 文字切换
					to = dp.$DV(from, {
						d : 7
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'month':
					air_group_step = 12 * 4; // 图表X轴显示的间隔 
					v_text = dp.cal.getDateStr("yyyy-MM") + "-01 ~ "
							+ showMonthLastDay(from); // 文字切换
					to = dp.$DV(from, {
						M : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				}

				// 文字切换
				$('#<portlet:namespace />air_group_text').text(v_text);
				//赋值
				ahuTFrom = from;
				ahuTTo = to;
				//刷新数据
				queryAHUData();
			}
		});

	};

	// 高亮显示点击的效果 
	function highlightDate(type) {
		$(".month_color").siblings().addClass("highlight");
		$(".day_color").siblings().addClass("highlight");
		$(".week_color").siblings().addClass("highlight");

		if (type == "month") {
			$(".month_color").removeClass("highlight");
		}
		if (type == "day") {
			$(".day_color").removeClass("highlight");
		}
		if (type == "week") {
			$(".week_color").removeClass("highlight");
		}
	}

	// 选择ahu的下拉列表 
	function airGroupLevelSelect() {
		if (!isNotChinaArts) { // 淘宝城项目
			taoBaoAirGroup();
		} else { // 如果是中国馆的话，则需要区域和key值 一致 
			chinaArtsAirGroup();
		}
	}

	// 中国馆选择区域 
	function chinaArtsAirGroup() {
		key = $("#airGroupLevelSelect").val(); // 获取下拉列表中的值 
		// 隐藏
		$("#ahuArea").hide();
		$("#fauArea").hide();
		// 处理acu下拉列表中的数据  
		html = "";
		$.each(regEqpMap.ahu, function(regionId, eqpList) {
			if (key == regionId) {
				$.each(eqpList, function(idx, eqp) {
					if (eqp.id != "ahu_0" && eqp.id != "ahu_33"
							&& eqp.id != "ahu_5" && eqp.id != "ahu_41"
							&& eqp.id != "ahu_49") {
						html += "<option selected='selected' value="+eqp.id+">"
								+ eqp.id + "</option>";
						$("#ahuArea").show();
					}
				});
			}
		});
		$("#ahuSelect").html(html);

		// 处理fau下拉列表中的值 
		html = "";
		$.each(regEqpMap.fau, function(regionId, eqpList) {
			if (key == regionId) {
				$.each(eqpList, function(idx, eqp) {
					if (eqp.id != "fau_0" && eqp.id != "fau_33"
							&& eqp.id != "fau_5" && eqp.id != "fau_41"
							&& eqp.id != "fau_49") {
						html += "<option selected='selected' value="+eqp.id+">"
								+ eqp.id + "</option>";
						$("#fauArea").show();
					}
				});
			}
		});
		$("#fauSelect").html(html);
	}

	// 淘宝城 选择区域 
	function taoBaoAirGroup() {
		key = $("#airGroupLevelSelect").val(); // 获取下拉列表中的值 
		// 隐藏
		$("#ahuArea").hide();
		$("#fauArea").hide();
		// 处理acu下拉列表中的数据  
		html = "";
		
		$.post('${getDevicesListURL}', {
			"buildId" : "000001070001", // ${holocfg.buildId}",
			"devs" : "ahu",
			"regionId" : default_regionId
		}, function(data) {
			// console.log("1--------------------"+"${holocfg.buildId}");
			// debugger;
			// console.log("2--------------------"+data);
		});
		
		$.each(regEqpMap.ahu, function(regionId, eqpList) {
			$.each(eqpList, function(idx, eqp) {
				if (eqp.id != "ahu_0" && eqp.id != "ahu_33"
						&& eqp.id != "ahu_5" && eqp.id != "ahu_41"
						&& eqp.id != "ahu_49") {
					html += "<option selected='selected' value="+eqp.id+">"
							+ eqp.id + "</option>";
					$("#ahuArea").show();
				}
			});
		});
		$("#ahuSelect").html(html);

		// 处理fau下拉列表中的值 
		html = "";
		$.each(regEqpMap.fau, function(regionId, eqpList) {
			$.each(eqpList, function(idx, eqp) {
				if (eqp.id != "fau_0" && eqp.id != "fau_33"
						&& eqp.id != "fau_5" && eqp.id != "fau_41"
						&& eqp.id != "fau_49") {
					html += "<option selected='selected' value="+eqp.id+">"
							+ eqp.id + "</option>";
					$("#fauArea").show();
				}
			});
		});
		$("#fauSelect").html(html);
	}

	function getAhuOnOffPointInterval(type) {
		switch (type) {
		case 'day':
			span = 5 * 60 * 1000;
			break;
		case 'week':
			span = 3600 * 1000;
			break;
		case 'month':
			span = 3600 * 1000;
			break;
		}
		return span;
	}
	function getAhuWindTempPointInterval(type) {
		switch (type) {
		case 'day':
			span = 5 * 60 * 1000;
			break;
		case 'week':
			span = 60 * 60 * 1000;
			break;
		case 'month':
			span = 3600 * 1000;
			break;
		}
		return span;
	}
	function getFauOnOffPointInterval(type) {
		switch (type) {
		case 'day':
			span = 5 * 60 * 1000;
			break;
		case 'week':
			span = 3600 * 1000;
			break;
		case 'month':
			span = 3600 * 1000;
			break;
		}
		return span;
	}
</script>

