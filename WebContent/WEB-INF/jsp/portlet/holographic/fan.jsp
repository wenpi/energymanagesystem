<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<%-- 设备选择   日期选择 --%>
	<div>
		<div>
			<span class="fan_case_class">送排风机 > </span> <select
				id="fanRegionSelect">
				<c:forEach items="${region}" var="level">
					<option value="${level.regionId}">${level.regionName}</option>
				</c:forEach>
			</select>
		</div>
		<div class="span9 fan_right_data">
			<div class="text-right">
				<ul class="date_select" style="list-style-type: none;">
					<li onclick="changeFanDate('month')" class="month_color">月</li>
					<li onclick="changeFanDate('week')" class="week_color">周</li>
					<li onclick="changeFanDate('day')" class="day_color">日</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 送风机状态 -->
	<div class="span10">
		<hr class="fan_hr_class">
	</div>
	<div class="span12">
		<div class="fan_time_title span7 text-left describe">
			<span id="<portlet:namespace />fan_text" style="margin-left: 20px;"></span>
		</div>
	</div>

	<div class="span12 fan_status_text">
		<span>送风机状态</span>
	</div>
	<div id="fanchart">&nbsp;</div>

	<!-- 排风机状态 -->
	<div class="span12 fan_status_text fan_margin_top">排风机状态</div>
	<div id="out_fanchart">&nbsp;</div>

	<div class="span12" style="height: 50px;">&nbsp;</div>
	<!-- 日期选择控件 -->
	<input id="fanDatepickerMonth" type="hidden" />
</div>

<portlet:resourceURL id="detectFanData" var="detectFanDataURL">
</portlet:resourceURL>

<script type="text/javascript">
	var holoDateFrom = pubDateFrom; // 设置初始化的开始时间 
	$('#<portlet:namespace />fan_text').text(holoDateFrom); // 显示当前查询的时间

	// 刷新图标数据 
	function fanPageInit() {
		highlightDate(holoDateType); // 高亮显示当前查询的类型 
		$(".cold_module").siblings().hide();
		$("#fan_form").show(); // 显示 送排风机，显示对应的div
		$.post('${detectFanDataURL}', {
			type : holoDateType,
			build : holoBuilding,
			floor : holoLevel,
			tspan : holoSpan,
			tfrom : holoDateFrom,
			flag : holoFlag,
			defaultRegionId : '' // 默认显示的区域 
		}, function(data) {
			initFanChart(data, 'fanchart', '#FF9900'); // 初始化图表
			initFanChart(data, 'out_fanchart', '#3300FF'); // 初始化图表
		});
	}

	//点击日、周、月选择时间后触发的函数 
	function changeFanDate(type) {
		holoDateType = type;
		highlightDate(holoDateType);

		var fan_temp_text = ''; // 存放显示的时间信息
		WdatePicker({
			el : 'fanDatepickerMonth',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				switch (type) {
				case 'day':
					fan_temp_text = from;
					break;
				case 'week':
					fan_temp_text = showWeekFirstDay(from) + " ~ "
							+ showWeekLastDay(from); // 存放显示的时间信息
					break;
				case 'month':
					fan_temp_text = dp.cal.getDateStr("yyyy-MM") + "-01 ~ "
							+ showMonthLastDay(from); // 存放显示的时间信息
					break;
				}

				holoDateFrom = from;//赋值
				$('#<portlet:namespace />fan_text').text(fan_temp_text); // 显示当前查询的时间

				fanPageInit(); //刷新图表数据 
			}
		});
	};

	// 图表状态
	fanOnOffOption = {
		chart : {
			height : 100,
			width : 830,
			type : 'area'
		},
		title : {
			text : ''
		},
		credits : {
			enabled : false
		},
		legend : {
			enabled : false
		},
		xAxis : {
			tickColor : '#FFFFFF',
			labels : {
				step : 30,
				rotation : -90,
				x : 10,
				y : 30
			},
			categories : []
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
		legend : {
			layout : 'horizontal',
			//align : 'ceneter',
			verticalAlign : 'top',
			borderWidth : 1,
			x : 365,
			y : 0
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
							[ 0, '#FF9900' ],
							[
									1,
									Highcharts.Color('#FF9900').setOpacity(0)
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
		series : [ {
			name : '开',
			color : '#FF9900',
			data : []
		}, {
			name : '关',
			color : '#F5E2E2'
		} ]
	};

	// 初始化图表
	function initFanChart(data, id, tempColor) {
		var nullCata = [];
		for ( var k = 0; k < data.cate.length; k++) {
			nullCata.push("");
		}
		var num = 0;
		$
				.each(
						data.stateMap,
						function(key, value) {
							num++;
							if (num < 4) {
								$('#fan_div_' + (id + num)).remove(); // 移除原有的动态增加的div
								$("#" + id)
										.before(
												"<div class='span12' style='width: 100%;' id='fan_div_"
														+ (id + num)
														+ "'><div class='fan_text_css' id='<portlet:namespace />fan_temp_text"
														+ (id + num)
														+ "'>SF-1-"
														+ num
														+ "</div><div id='<portlet:namespace />"
														+ (id + num)
														+ "' class='span12 fan_chart_css'></div></div>");

								fanOnOffOption.chart.renderTo = '<portlet:namespace />'
										+ (id + num);
								if (num == 3) {
									fanOnOffOption.chart.height = 150; // 图表的高度 
									fanOnOffOption.xAxis.categories = data.cate; // X轴显示 data.cate
								} else {
									if (num == 1) {
										fanOnOffOption.chart.height = 150; // 图表的高度 
									} else {
										fanOnOffOption.chart.height = 100; // 图表的高度 
									}
									fanOnOffOption.xAxis.categories = nullCata; // X轴显示 data.cate
								}

								var ptop = 40;
								if (num == 1) {
									ptop = 84;
									fanOnOffOption.legend.enabled = true; // 图表的图例
								} else {
									if (num == 3) {
										ptop = 52;
									}
									fanOnOffOption.legend.enabled = false; // 图表的图例							
								}

								$(
										"#<portlet:namespace />fan_temp_text"
												+ (id + num)).css({
									"paddingTop" : ptop + "px"
								}); // 设置文字对应的css

								fanOnOffOption.xAxis.labels.step = cool_water_pump_step; // X轴显示间隔 

								fanOnOffOption.series = new Array();
								fanOnOffOption.series[0] = new Object();
								fanOnOffOption.series[0].data = value;
								fanOnOffOption.series[0].name = '开启';
								fanOnOffOption.series[0].fillColor = tempColor;
								fanOnOffOption.series[0].color = tempColor;
								// fanOnOffOption.title.text = key;
								new Highcharts.Chart(fanOnOffOption);
							}
						});

		// 设置高度，目的是为了完整的显示版权信息 
		$('#devicemonitor_formdiv').height($('#fan_form').height() + 50);
	};
</script>