<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="span12" style="display: none;"
	id="<portlet:namespace />detect_cool_pump">
	<div>
		<div class="span9 cool_pump_right_data">
			<div class="text-right">
				<ul class="date_select" style="list-style-type: none;">
					<li onclick="changeCoolPumpDate('month')" class="month_color">月</li>
					<li onclick="changeCoolPumpDate('week')" class="week_color">周</li>
					<li onclick="changeCoolPumpDate('day')" class="day_color">日</li>
				</ul>
			</div>
		</div>

		<div class="span10 cool_pump_width">
			<hr>
		</div>
		<div class="span12">&nbsp;</div>

		<div id="coolingPumpOnOffGraphic" class="span12">

			<div class="span10 cool_pump_chart_title">
				<div class="span7 text-left describe">
					<span id="<portlet:namespace />cool_water_pump_status"></span>
				</div>
				<div class="span3">
					<%--
		            				<ul class="derail" style="list-style-type:none;">
										<li><img src="${pageContext.request.contextPath}/public/images/legend1.png"></li>
										<li>开启</li>
										<li><img src="${pageContext.request.contextPath}/public/images/stops.png"></li>
										<li>关闭</li>
									</ul>
									 --%>
				</div>
			</div>

		</div>
		<div class="span12">
			<table border="0px;"
				style="border-color: white; line-height: 36px; border-collapse: 3px;">
				<tr id="coolPumpStateTr" style="visibility: false"></tr>
			</table>

			<div id="coolPumpOnOffBlock" class="span12">&nbsp;</div>
		</div>
		<div class="span12" id="coolingPumpRateGraphic"></div>

	</div>
</div>

<%-- 冷却泵 --%>
<portlet:resourceURL id="detectCoolingPump" var="detectCoolingPumpURL">
</portlet:resourceURL>
<script type="text/javascript">
	var cool_water_pump_step = 12; //定义全局变量，存储图表X轴显示的间隔  
	function coolingPumpClick() {

		setActiveFunction("cp");

		//UI
		$(".cold_module").siblings().hide();
		$(".cold_module").show();
		//
		$(".switch_device>div").hide();
		var switchDom = $($(".switch_device>div")[2]);
		switchDom.show();
		//
		$("#tabCp").siblings().removeClass("highlight");
		$("#tabCp").addClass("highlight");

		//alert("点击冷却泵");
		$.post('${detectCoolingPumpURL}', {
			tfrom : csTFrom,
			tto : csTTo,
			type : csType,
			defaultRegionId : '' // 默认显示的区域 
		}, function(data) {
			try {
				//initCoolingPumpRateGraphic(data);
			} catch (e) {
				alert("初始化冷却泵图表异常：" + e);
			}

			// 初始化图表
			initCoolingPumpOnOffGraphic(data);
		});

		highlightDate(csType);

	}
</script>
<%--冷却泵频率状态 --%>
<script type="text/javascript">
	function initCoolingPumpRateGraphic(data) {

		option = {
			chart : {
				type : 'spline',
				renderTo : 'coolingPumpRateGraphic',
				width : 800,
				height : 228
			},
			title : {
				text : '冷却水泵频率',
				align : 'left',
				x : 80
			},
			legend : {
				align : 'center',

				borderWidth : 1
			},
			subtitle : {
				text : ''
			},
			credits : {
				enabled : false
			},
			xAxis : {
				tickmarkPlacement : 'on',
				tickPosition : 'outside',
				tickColor : 'FFFFFF',
				type : 'datetime',
				labels : {
					formatter : function() {
						format = "";
						switch (csType) {
						case 'day':
							format = '%H:%M';
							break;
						case 'week':
							format = '%m/%d';
							break;
						case 'month':
							format = '%m/%d';
							break;
						}

						return Highcharts.dateFormat(format, this.value);
					},
					rotation : -90,
					y : 20
				}
			},
			yAxis : {
				title : {
					text : '水泵频率HZ'
				},
				gridLineDashStyle : 'LongDash'

			},
			tooltip : {
				formatter : function() {
					return Highcharts.numberFormat(this.y, 2, '.') + 'HZ';
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
				pointStart : getCsDateStart(),
				pointInterval : getCsPointInterval()
			}, {

				pointStart : getCsDateStart(),
				pointInterval : getCsPointInterval()
			} ]

		};
		//
		//
		option.series = new Array();
		$.each(data.series, function(i, value) {
			//alert(data.series[i].color);

			option.series[i] = new Object();
			option.series[i].data = value.data[0];
			option.series[i].name = value.name;
			option.series[i].color = value.color;
		});
		sealPumpRateChart = new Highcharts.Chart(option);

	}
</script>


<%--冷却泵开关状态 --%>
<script type="text/javascript">
	onOffOption = {
		chart : {
			height : 200,
			width : 950,
			type : 'area',
			spacingBottom : 30
		},
		title : {
			align : 'left',
			x : 80,
			text : '开启状态'
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
			tickColor : '#FFFFFF',
			labels : {
				step : 30,
				rotation : -90,
				x : 10,
				y : 20
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
							[ 0, Highcharts.getOptions().colors[0] ],
							[
									1,
									Highcharts.Color(
											Highcharts.getOptions().colors[0])
											.setOpacity(0).get('rgba') ] ]
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
			color : '#CC33CC',
			data : [],
			pointStart : "",
			pointInterval : 0
		}, {
			name : '关',
			color : '#FFFFFF'

		} ]
	};

	// 初始化图表
	function initCoolingPumpOnOffGraphic(data) {
		// 移除相应的样式 
		$(".beforeOnOfBlock").remove();

		coolPumpOnOffCount = 0;
		$
				.each(
						data.stateMap,
						function(key, value) {
							coolPumpOnOffCount++;
							$("#coolPumpOnOffBlock")
									.before(
											"<div id="+coolPumpOnOffCount+" class='beforeOnOfBlock'></div>");

							onOffOption.chart.renderTo = ''
									+ coolPumpOnOffCount;
							onOffOption.xAxis.categories = data.cate; // X轴显示
							onOffOption.xAxis.labels.step = cool_water_pump_step; // X轴显示间隔 

							onOffOption.series = new Array();
							onOffOption.series[0] = new Object();
							onOffOption.series[0].data = value;
							onOffOption.series[0].name = '开启';
							onOffOption.title.text = key;
							new Highcharts.Chart(onOffOption);
						});

		// 设置高度，目的是为了完整的显示版权信息 
		$('#hrefFm').height(
				$('#<portlet:namespace />detect_cool_pump').height() - 680);
	};
</script>
<%-- 冷却泵日期选择控件 --%>
<input id="coolPumpDatepickerMonth" type="hidden" />
<script type="text/javascript">
	//冷却水泵开启状态的文字切换
	$('#<portlet:namespace />cool_water_pump_status').text(prettyFrom);
	/** 点击日、周、月触发的事件  */
	function changeCoolPumpDate(type) {
		highlightDate(type);
		//
		csType = type;

		var cool_text = ""; // 冷机启停状态的文字切换 
		WdatePicker({
			el : 'coolPumpDatepickerMonth',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				//日期修正
				switch (type) {
				case 'day':
					cool_water_pump_step = 12 * 1; // 图表X轴显示的间隔 
					cool_text = from; // 冷却水泵开启状态的文字切换 
					to = dp.$DV(from, {
						d : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'week':
					cool_water_pump_step = 12 * 2; // 图表X轴显示的间隔 
					cool_text = showWeekFirstDay(from) + " ~ "
							+ showWeekLastDay(from); // 冷却水泵开启状态的文字切换
					to = dp.$DV(from, {
						d : 7
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'month':
					cool_water_pump_step = 12 * 4; // 图表X轴显示的间隔 
					cool_text = dp.cal.getDateStr("yyyy-MM") + "-01 ~ "
							+ showMonthLastDay(from); // 冷却水泵开启状态的文字切换
					to = dp.$DV(from, {
						M : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				}

				// 冷却水泵开启状态的文字切换
				$('#<portlet:namespace />cool_water_pump_status').text(
						cool_text);
				//赋值
				csTFrom = from;
				csTTo = to;
				//alert(ahuTFrom+"`"+ahuTTo);
				//刷新数据
				coolingPumpClick();
			}
		});

	};
</script>
