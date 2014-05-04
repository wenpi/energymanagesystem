<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="display: none;" class="span12"
	id="<portlet:namespace />detect_cool_tower">
	<div class="span12" style="margin-left: 30px;">
		<div class="span9 tower_right_data">
			<div class="text-right">
				<ul class="date_select" style="list-style-type: none;">
					<li onclick="changeCoolTowerDate('month')" class="month_color">月</li>
					<li onclick="changeCoolTowerDate('week')" class="week_color">周</li>
					<li onclick="changeCoolTowerDate('day')" class="day_color">日</li>
				</ul>
			</div>
		</div>

		<div class="tower_hr">
			<hr>
		</div>
		<div class="span10">&nbsp;</div>

		<%-- 标头 --%>
		<div class="span10 cold_chart_title">
			<div class="span7 text-left describe">
				<span id="<portlet:namespace />cool_tower_status"></span>
			</div>
			<div class="span3">
				<ul class="derail" style="list-style-type: none;">
					<!-- 
										<li><img src="${pageContext.request.contextPath}/public/images/legend1.png"></li>
										<li>开启</li>
										<li><img src="${pageContext.request.contextPath}/public/images/stops.png"></li>
										<li>关闭</li>
									 -->
				</ul>
			</div>
		</div>


		<div id="cTbeforeOnOfBlock" class="span12"></div>

		<div class="span12">
			<%-- 
<span style="font-family:微软雅黑;font-size:18px;font-weight:normal;font-style:normal;text-decoration:none;color:#000000;">冷却塔冷却水参数</span>

 --%>
		</div>
		<div class="span12" id="coolingTowerWaterParamGraphic"></div>

	</div>
</div>

<%-- 冷却塔 --%>
<portlet:resourceURL id="detectCoolingTower" var="detectCoolingTowerURL">
</portlet:resourceURL>

<script type="text/javascript">
	var cool_tower_status_step = 12 * 1; // 图表X轴显示的间隔 
	function coolingTowerClick() {

		//ui
		$(".cold_module").siblings().hide();
		$(".cold_module").show();
		//
		$(".switch_device>div").hide();
		var switchDom = $($(".switch_device>div")[4]);
		switchDom.show();
		//
		$("#tabCt").siblings().removeClass("highlight");
		$("#tabCt").addClass("highlight");
		//

		//data render
		$.post('${detectCoolingTowerURL}', {
			tfrom : csTFrom,
			tto : csTTo,
			type : csType,
			defaultRegionId : '' // 默认显示的区域 
		}, function(data) {
			//开关状态初始化
			initCoolingTowerOnOffGraphic(data);
		});

		highlightDate(csType);
		//alert("点击冷却塔");

	}
</script>

<%--冷却塔开关状态 --%>
<script type="text/javascript">
	ctOnOffOption = {
		chart : {
			height : 200,
			width : 946,
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
				lineWidth : 2,
				marker : {
					enabled : false
				},
				shadow : false,
				states : {
					hover : {
						lineWidth : 2
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
			data : []
		} ]
	};

	function initCoolingTowerOnOffGraphic(data) {

		$(".beforeOnOfBlock").remove();

		coolTowerOnOffCount = 0;
		$
				.each(
						data.stateMap,
						function(key, value) {

							//alert(key+"-"+value);
							coolTowerOnOffCount++;
							$("#cTbeforeOnOfBlock")
									.before(
											"<div id="+coolTowerOnOffCount+" class='beforeOnOfBlock'></div>");

							// 渲染位置 
							ctOnOffOption.chart.renderTo = ''
									+ coolTowerOnOffCount;

							ctOnOffOption.xAxis.categories = data.cate; // X轴显示
							ctOnOffOption.xAxis.labels.step = cool_tower_status_step; // X轴显示间隔 

							// 设置对应的数据项
							ctOnOffOption.series = new Array();
							ctOnOffOption.series[0] = new Object();
							ctOnOffOption.series[0].data = value;
							ctOnOffOption.series[0].name = '开启';
							ctOnOffOption.title.text = key;
							new Highcharts.Chart(ctOnOffOption);
						});

		// 设置高度，目的是为了完整的显示版权信息 
		$('#hrefFm').height(
				$("#<portlet:namespace />detect_cool_tower").height() - 700);

	};
</script>
<script type="text/javascript">
	function newGraphic(insertBefore, id, series) {
		$(insertBefore).before(
				"<div class=newAddGraphicDiv id='newGraphic"+id+"'> </div>");
		//

		option = {
			chart : {
				type : 'spline',
				renderTo : 'newGraphic' + id,
				width : 800,
				height : 228
			},
			title : {
				text : id + '冷却水参数',
				align : 'left',
				x : 80
			},
			subtitle : {
				text : ''
			},
			credits : {
				enabled : false
			},
			legend : {
				align : 'center',
				x : 250,
				borderWidth : 0
			},
			xAxis : {
				categories : series.cate,
				labels : {
					x : 10,
					step : parseInt(data.cate.length / 24)
				}
			},
			yAxis : {
				title : {
					text : '温度(℃)'
				},
				gridLineDashStyle : 'LongDash'

			},
			tooltip : {
				valueSuffix : '℃'
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
										Highcharts
												.Color(
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
			series : [ {
				name : '冷却水供水温度',
				color : '#32BF72'
			}, {
				name : '冷却水回水温度',
				color : '#F79B4F'
			} ]

		};
		//

		option.series[0].data = series.data[0];

		//

		option.series[1].data = series.data[1];

		sealPumpRateChart = new Highcharts.Chart(option);
	}
</script>

<%-- 冷却塔冷却水参数 --%>
<script type="text/javascript">
	function initCoolingTowerParamGraphic(data) {
		divId = "coolingTowerWaterParamGraphic1";
		seriesInput = "[{ color:'#52B103', name: '冷却水供水温度', data: [33, 35, 40, 32, 34, 37, 35, 21, 26, 24, 19, 11,29, 29, 25, 27, 17, 27, 14, 20, 21, 18, 19, 14, 25, 18.5, 19.4, 33, 10,40] }, { name: '冷却水回水温度', data: [21, 24, 25, 26, 21, 19, 28, 23,20, 22, 27,21,22, 24, 22, 21,23,24, 25,26,27, 21, 22,21,21, 24, 25, 26] }]";
		jsonObj = eval(seriesInput);
		//alert(jsonObj);
		initCTPGraphic(divId, jsonObj);

	}
</script>
<%-- 冷却塔选择控件 --%>
<input id="coolTowerDatepickerMonth" type="hidden" />
<script type="text/javascript">
	//冷却塔开启状态的文字切换
	$('#<portlet:namespace />cool_tower_status').text(prettyFrom);
	/** 点击日、周、月触发的事件  */
	function changeCoolTowerDate(type) {
		highlightDate(type);
		//
		csType = type;

		WdatePicker({
			el : 'coolTowerDatepickerMonth',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				//日期修正
				switch (type) {
				case 'day':
					cool_tower_status_step = 12 * 1; // 图表X轴显示的间隔 
					cool_text = from; // 冷却塔开启状态的文字切换 
					to = dp.$DV(from, {
						d : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'week':
					cool_tower_status_step = 12 * 2; // 图表X轴显示的间隔 
					cool_text = showWeekFirstDay(from) + " ~ "
							+ showWeekLastDay(from); // 冷却塔开启状态的文字切换
					to = dp.$DV(from, {
						d : 7
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'month':
					cool_tower_status_step = 12 * 4; // 图表X轴显示的间隔 
					cool_text = dp.cal.getDateStr("yyyy-MM") + "-01 ~ "
							+ showMonthLastDay(from); // 冷却塔开启状态的文字切换
					to = dp.$DV(from, {
						M : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				}
				// 冷却塔开启状态的文字切换
				$('#<portlet:namespace />cool_tower_status').text(cool_text);
				//赋值
				csTFrom = from;
				csTTo = to;
				//alert(ahuTFrom+"`"+ahuTTo);
				//刷新数据
				coolingTowerClick();
			}
		});

	};
</script>
