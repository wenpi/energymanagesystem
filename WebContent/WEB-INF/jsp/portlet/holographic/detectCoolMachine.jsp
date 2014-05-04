<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="span12" style="display: block;">
	<div class="span2 left_nav">
		<ul class="l_navigation" style="list-style-type: none;">
			<%--
			                    <li class="hovered">1#冷机</li>
			                    <c:forEach items="${chillers}" var="chiller">
			                    	<li >${chiller.name}</li>
			                    </c:forEach>
			                  --%>
		</ul>


	</div>
	<div class="span9 cool_machine_right_data">
		<select id="cmMachineSelect" onchange="coolerMachineClick()">

			<option selected="selected" value="S_output_base_machine1_run">基载冷机1#</option>
			<option selected="selected" value="S_output_base_machine2_run">基载冷机2#</option>
			<option selected="selected" value="S_output_base_machine3_run">基载冷机3#</option>
			<option selected="selected" value="S_output_ice_machine1_run">双工况冷机1#</option>
			<option selected="selected" value="S_output_ice_machine2_run">双工况冷机2#</option>
			<option selected="selected" value="S_output_ice_machine3_run">双工况冷机3#</option>
			<option selected="selected" value="LJYK_B_DDC_2_CH2_ENA">约克冷机1#</option>
			<option selected="selected" value="LJYK_B_DDC_2_CH1_ENA">约克冷机2#</option>

		</select>
		<div class="text-right">
			<ul class="date_select" style="list-style-type: none;">
				<li onclick="changeCoolMachineDate('month')" class="month_color">月</li>
				<li onclick="changeCoolMachineDate('week')" class="week_color">周</li>
				<li onclick="changeCoolMachineDate('day')" class="day_color">日</li>
			</ul>
		</div>
		<div class="span12 cool_machine_division"></div>
		<div class="span5 cool_marchine_chart_title">
			<div class="span7 text-left describe">
				<span id="<portlet:namespace />refrigerator_status"></span>
			</div>
			<div class="span3">

				<ul class="derail" style="list-style-type: none;">
					<%--
					<li><img src="${pageContext.request.contextPath}/public/images/legend1.png"></li>
					<li>开启</li>
					<li><img src="${pageContext.request.contextPath}/public/images/stops.png"></li>
					<li>关闭</li> --%>
				</ul>

			</div>
			<div class="span12 reikenli" style="margin-left: 0px;">
				<div class="current" style="display: inline;">
					<div>
						<table border="0px;"
							style="border-color: white; line-height: 36px; border-collapse: 3px;">
							<tr id="coolMachineStateTr" style="visibility: false"></tr>

						</table>
					</div>

					<div id="coolingMachineOnOffGraphic"></div>
					<div id="coolingWaterParamGraphic"></div>
					<div id="sealWaterParamGraphic"></div>
				</div>
				<div style="display: none;">12321321</div>
				<div style="display: none;">3</div>
				<div style="display: none;">4</div>
				<br /> <br /> <br /> <br />
			</div>
		</div>
	</div>
</div>


<%-- 点击冷机 回调方法 --%>
<portlet:resourceURL id="detectCoolMachine" var="detectCoolMachineURL">
</portlet:resourceURL>

<script>
	var cmName;
	function coolerMachineClick() {
		// 设置高度为135，目的是为了完整的显示版权信息 
		$('#hrefFm').height(135);

		setActiveFunction("cm");
		//界面显示
		$(".cold_module").siblings().hide();
		$(".cold_module").show();
		//
		$(".switch_device>div").hide();
		var switchDom = $($(".switch_device>div")[0]);
		switchDom.show();
		//
		$("#tabCm").siblings().removeClass("highlight");
		$("#tabCm").addClass("highlight");

		//数据渲染        
		cmName = $("#cmMachineSelect").val();

		$.post('${detectCoolMachineURL}', {
			tfrom : csTFrom,
			tto : csTTo,
			type : csType,
			id : 'chiller',
			name : cmName,
			hours : ""
		}, function(data) {
			var step = 12;
			if (csType === "day") {
				step = chart_day_step;
			} else if (csType === "week") {
				step = chart_week_step;
			} else if (csType === "month") {
				step = chart_month_step;
			}
			initCoolingMachineOnOffGraphic(data, step); // 渲染冷机开关状态图表 
			initCoolingWaterParamGraphic(data, step); // 渲染冷却水参数 图表
			initSealWaterParamGraphic(data, step); // 渲染冷冻水参数 图表 
		});

		// 高亮显示点击的时间  效果
		highlightDate(csType);

	}
</script>

<%--冷机开关状态 --%>
<script type="text/javascript">
	function initCoolingMachineOnOffGraphic(data, step) {
		$('#coolingMachineOnOffGraphic')
				.highcharts(
						{
							chart : {
								height : 200,
								width : 840,
								type : 'area',
								spacingBottom : 30
							},
							title : {
								align : 'left',
								x : 80,
								text : '冷机启停状态'
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
									step : step
								// x轴显示的间隔(*12是因为每个小时有12个点，如果要显示间隔为？小时的话，则用12*?)
								},
								categories : data.cataList,
								gridLineDashStyle : 'LongDash' // 图表中，带虚线样式 
							},
							yAxis : {
								title : {
									text : '' // 写为空，则Y轴不显示数据
								},
								labels : {
									formatter : function() {
										return ""; // Y轴的坐标轴显示
									}
								},
								gridLineDashStyle : 'LongDash'// 图表中，带虚线样式 
							},
							tooltip : {
								formatter : function() {
									return '<b>' + this.series.name + '</b>'; // 提示信息 
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
									lineWidth : 1,// 线的本身宽度 
									marker : {
										enabled : false
									},
									shadow : false, // false表示不带阴影
									states : {
										hover : {
											lineWidth : 1
										// 鼠标浮上去线的宽度 
										}
									},
									threshold : null
								}
							},
							series : [ {
								name : '开启',
								data : data.opens
							} ]
						});
	}
</script>

<%--冷却水参数 --%>
<script type="text/javascript">
	function initCoolingWaterParamGraphic(data, step) {
		//alert( data.cSupplyTemp);
		//alert( data.cRtnTemp);
		$('#coolingWaterParamGraphic').highcharts({
			chart : {
				type : 'spline',
				width : 840,
				height : 228
			},
			credits : {
				enabled : false
			},
			legend : {
				x : 250,
				borderWidth : 0
			},
			title : {
				align : 'left',
				x : 80,
				text : '冷却水参数'
			},
			xAxis : {
				tickColor : '#FFFFFF',// 刻度线的颜色 
				labels : {
					rotation : -90,// X轴纵向显示
					y : 20,
					x : 10,
					step : step
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
				color : '#52B103',
				name : '冷却水供水温度',
				data : data.cSupplyTemp
			}, {
				name : '冷却水回水温度',
				data : data.cRtnTemp
			} ]

		});
	};
</script>

<%--冷冻水参数 --%>
<script type="text/javascript">
	function initSealWaterParamGraphic(data, step) {
		$('#sealWaterParamGraphic').highcharts({
			chart : {
				type : 'spline',
				width : 840,
				height : 228
			},
			title : {
				align : 'left',
				x : 80,
				text : '冷冻水参数'
			},
			legend : {
				x : 250,
				borderWidth : 0
			},
			xAxis : {
				tickColor : '#FFFFFF',// 刻度线的颜色 
				labels : {
					rotation : -90, // X轴纵向显示
					y : 20,
					x : 10,
					step : step
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
				color : '#EEBF27',
				name : '冷冻水供水温度',
				data : data.sSupplyTemp

			}, {
				color : '#FF0000',
				name : '冷冻水回水温度',
				data : data.sRtnTemp
			} ]

		});
	};
</script>
<%-- 冷机日期选择控件 --%>
<input id="coolMachinesDatepickerMonth" type="hidden" />
<script type="text/javascript">
	//冷机启停状态的文字切换
	$('#<portlet:namespace />refrigerator_status').text(prettyFrom);
	/** 点击日、周、月触发的事件  */
	function changeCoolMachineDate(type) {
		highlightDate(type);// 点击产生的高亮效果
		csType = type;

		var cool_text = ""; // 冷机启停状态的文字切换 
		WdatePicker({
			el : 'coolMachinesDatepickerMonth',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				// 根据选择的时间，填充对应的文字内容 
				switch (type) {
				case 'day':
					cool_text = from; // 冷机启停状态的文字切换 
					to = dp.$DV(from, {
						d : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'week':
					cool_text = showWeekFirstDay(from) + " ~ "
							+ showWeekLastDay(from); // 冷机启停状态的文字切换
					to = dp.$DV(from, {
						d : 7
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'month':
					cool_text = dp.cal.getDateStr("yyyy-MM") + "-01 ~ "
							+ showMonthLastDay(from); // 冷机启停状态的文字切换
					to = dp.$DV(from, {
						M : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				}

				// 冷机启停状态的文字切换
				$('#<portlet:namespace />refrigerator_status').text(cool_text);
				//赋值
				csTFrom = from;
				csTTo = to;
				//alert(ahuTFrom+"`"+ahuTTo);
				//刷新数据
				coolerMachineClick();
			}
		});

	};
</script>

<script type="text/javascript">
	function getCsDateStart() {
		//alert(csTFrom);
		parseDate = new Date(csTFrom);
		switch (csType) {

		case 'month':
			parseDate.setDate(1);
			break;
		case 'week':
			minus = parseDate.getDay();
			parseDate.setDate(parseDate.getDate() - minus + 1);
			break;

		}
		//alert(parseDate);
		return parseDate.getTime();
	}
	function getCsPointInterval() {
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
	//冷冻水参数
	function getCmCwPointInterval() {
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
</script>
