<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="display: none;" class="span12"
	id="<portlet:namespace />detect_water_sys">
	<div id="watSysDateSelectRegion">
		<div class="span9 water_right_data">
			<div class="text-right">
				<ul class="date_select" style="list-style-type: none;">
					<li onclick="changeSysWaterDate('month')" class="month_color">月</li>
					<li onclick="changeSysWaterDate('week')" class="week_color">周</li>
					<li onclick="changeSysWaterDate('day')" class="day_color">日</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="watSysPicRegion" class="water_right_data">
		<div class="water_width">
			<div class="water_hr">
				<hr>
			</div>
		</div>
		<div class="span12">
			<div class="water_system_title span7 text-left describe">
				<span id="<portlet:namespace />water_system"
					style="margin-left: 20px;"></span>
			</div>
		</div>
		<div class="span12" id="waterSysSupRtnGraphic"></div>
		<div class="span12">&nbsp;</div>
		<div class="span12" id="sealWaterValumnGraphic">冷冻水流量</div>
		<div class="span12">&nbsp;</div>
	</div>


</div>

<%-- 水系统 --%>
<portlet:resourceURL id="detectWaterSys" var="detectWaterSysURL">
</portlet:resourceURL>

<script type="text/javascript">
	// 刷新数据 
	function waterSysClick() {

		setActiveFunction("ws");
		//UI
		$(".cold_module").siblings().hide();
		$(".cold_module").show();
		//
		$(".switch_device>div").hide();
		var switchDom = $($(".switch_device>div")[1]);
		switchDom.show();
		//
		$("#tabWatSys").siblings().removeClass("highlight");
		$("#tabWatSys").addClass("highlight");

		//alert("点击水系统");
		$.post('${detectWaterSysURL}', {
			tfrom : csTFrom,
			tto : csTTo,
			type : csType,
			id : 'chiller'
		},
				function(data) {
					var step = 12;
					if (csType === "day") {
						step = 12 * 1;
					} else if (csType === "week") {
						step = 12 * 2;
					} else if (csType === "month") {
						step = 12 * 4;
					}

					// 初始化图表
					initWaterSysSupRtnGraphic(data, step);
					initSealWaterValumnGraphic(data, step);

					// 设置高度为50，目的是为了完整的显示版权信息 
					$('#hrefFm').height(
							$('#<portlet:namespace />detect_water_sys')
									.height() - 684);
				});

		highlightDate(csType);
	}
</script>

<%--冷冻水流量 --%>
<script type="text/javascript">
	function initSealWaterValumnGraphic(data, step) {
		$('#sealWaterValumnGraphic').highcharts({
			chart : {
				type : 'spline',
				width : 955,
				height : 300
			},
			title : {
				text : '冷冻水流量（m³/h)',
				align : 'left',
				x : 80
			},
			legend : {
				borderWidth : 0
			},
			xAxis : {
				tickColor : '#FFFFFF',
				labels : {
					rotation : -90,
					y : 20,
					x : 10,
					step : step
				// x轴显示的间隔(*12是因为每个小时有12个点，如果要显示间隔为？小时的话，则用12*?)
				},
				categories : data.cataList
			},
			yAxis : {
				title : {
					text : '冷冻水流量（m³/h)'
				},
				gridLineDashStyle : 'LongDash'
			},
			credits : {
				enabled : false
			},
			tooltip : {
				formatter : function() {
					return Highcharts.numberFormat(this.y, 2, '.') + 'm³/h';
				}
			},
			plotOptions : {
				spline : {
					lineWidth : 2,
					states : {
						hover : {
							lineWidth : 3
						}
					},
					marker : {
						enabled : false
					}
				}
			},
			series : [ {
				color : '#61AF93',
				name : '地区馆水系统冷冻水流量',
				data : data.S7_flow_display_Fi3

			}, {
				color : '#40c4f4',
				name : '国家馆水系统冷冻水流量',
				data : data.S7_flow_display_Fi4
			}, {
				color : '#FFC000',
				name : '办公区水系统冷冻水流量',
				data : data.S7_flow_display_Fi5
			} ]
		});
	};
</script>
<%--水系统供水回水温度 --%>
<script type="text/javascript">
	function initWaterSysSupRtnGraphic(data, step) {
		$('#waterSysSupRtnGraphic').highcharts({
			chart : {
				type : 'spline',
				width : 955,
				height : 300
			},
			title : {
				text : '供、回水温度（℃）',
				align : 'left',
				x : 80
			},
			legend : {
				borderWidth : 0
			},
			xAxis : {
				tickColor : '#FFFFFF',
				labels : {
					rotation : -90,
					y : 20,
					x : 10,
					step : step
				// x轴显示的间隔(*12是因为每个小时有12个点，如果要显示间隔为？小时的话，则用12*?)
				},
				categories : data.cataList
			},
			yAxis : {
				//max : 20,
				//min : 0,
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
					lineWidth : 2,
					states : {
						hover : {
							lineWidth : 3
						}
					},
					marker : {
						enabled : false
					}
				}
			},
			credits : {
				enabled : false
			},
			series : [ {
				color : '#FF33CC',
				name : '水系统冷冻水供水温度',
				data : data.S7_temp_display_Ti7
			}, {
				color : '#40c4f4',
				name : '地区馆水系统冷冻水回水温度',
				data : data.S7_temp_display_Ti12
			}, {
				color : '#60c4f4',
				name : '国家馆水系统冷冻水回水温度',
				data : data.S7_temp_display_Ti11
			}, {
				color : '#FFC000',
				name : '办公区水系统冷冻水回水温度',
				data : data.S7_temp_display_Ti10
			} ]

		});
	};
</script>


<script type="text/javascript">
	function initCTPGraphic(divId, seriesInput) {
		selecter = '#' + divId;
		//alert(selecter);
		$(selecter).highcharts(
				{
					chart : {
						type : 'spline',
						width : 800,
						height : 300
					},
					title : {
						text : '冷却水参数',

						align : 'left',
						x : 80
					},
					legend : {
						align : 'center',
						x : 270,
						borderWidth : 0
					},
					subtitle : {
						text : ''
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

								return Highcharts
										.dateFormat(format, this.value);
							},
							rotation : -90,
							y : 20
						}
					},
					yAxis : {
						title : {
							text : '温度 (℃)'
						},
						gridLineDashStyle : 'LongDash'

					},
					tooltip : {
						formatter : function() {
							return Highcharts.numberFormat(this.y, 2, '.')
									+ '℃';
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
					credits : {
						enabled : false
					},
					series : [
							{
								color : '#52B103',
								name : '冷却水供水温度',
								data : [ 33, 35, 40, 32, 34, 37, 35, 21, 26,
										24, 19, 11, 29, 29, 25, 27, 17, 27, 14,
										20, 21, 18, 19, 14, 25, 18.5, 19.4, 33,
										10, 40 ]

							},
							{
								name : '冷却水回水温度',
								data : [ 21, 24, 25, 26, 21, 19, 28, 23, 20,
										22, 27, 21, 22, 24, 22, 21, 23, 24, 25,
										26, 27, 21, 22, 21, 21, 24, 25, 26 ]
							} ]

				});
	};
</script>
</script>
<%-- 冷冻泵日期选择控件 --%>
<input id="waterSysDatepickerMonth" type="hidden" />
<script type="text/javascript">
	//水系统的文字切换
	$('#<portlet:namespace />water_system').text(prettyFrom);
	/** 点击日、周、月触发的事件  */
	function changeSysWaterDate(type) {
		highlightDate(type);
		//
		csType = type;
		var cool_text = ""; // 水系统的文字切换 
		WdatePicker({
			el : 'waterSysDatepickerMonth',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				//日期修正
				switch (type) {
				case 'day':
					cool_text = from; // 水系统的文字切换 
					to = dp.$DV(from, {
						d : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'week':
					cool_text = showWeekFirstDay(from) + " ~ "
							+ showWeekLastDay(from); // 水系统的文字切换
					to = dp.$DV(from, {
						d : 7
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'month':
					cool_text = dp.cal.getDateStr("yyyy-MM") + "-01 ~ "
							+ showMonthLastDay(from); // 水系统的文字切换
					to = dp.$DV(from, {
						M : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				}
				// 水系统的文字切换
				$('#<portlet:namespace />water_system').text(cool_text);
				//赋值
				csTFrom = from;
				csTTo = to;
				//刷新数据
				waterSysClick();
			}
		});

	};
</script>

<script type="text/javascript">
<!--
	//冷冻水流量
	function getCmWatSysPointInterval() {
		switch (csType) {
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
//-->
</script>