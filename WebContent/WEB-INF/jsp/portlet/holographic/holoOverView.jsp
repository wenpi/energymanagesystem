<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body {
	font: 12px/20px "Microsoft YaHei", "SimSun", "宋体", "Arial Narrow",
		HELVETICA;
}

h4 {
	font-size: 17.5px;
}
</style>

<div class="span12 basic_imformation" id="quanxitu"
	style="height: 1010px;">
	<div>

		<!-- 显示顶部的两个图表  -->
		<%@include file="holoOverViewInner/twoParts.jsp"%>

		<!-- 园区全息图  -->
		<div class="inner_content cur" id="all_region_view">
			<h1 class="span12 detail_title">园区全息图</h1>
			<%-- 中国馆 全息图全景图 --%>
			<div id="chinaArts_holo">
				<%@include file="chinaPavilionHolo.jsp"%>
			</div>

			<!-- 淘宝城园区全息图  -->
			<div id="taobao_holo">
				<%@include file="taobaochenHolo.jsp"%>
			</div>
		</div>

		<div class="inner_content module cur">
			<div class="span12 build_para">
				<div
					class="taobao_a1_details taobao_p1_details taobao_p2_details taobao_t1_details taobao_t2_details taobao_t3_details taobao_t4_details taobao_t5_details chinaArts_m0_details chinaArts_m5_details chinaArts_m33_details chinaArts_m41_details chinaArts_m49_details">
					<div class="span12">
						<div class="span3" style="margin-left: 0px;">
							<select id="holoDetialLevelSelector"
								onchange="changeHoloDetailLevel()"
								style="background-color: #3366cc; background-image: none;"
								class="floor_select text-left">
								<c:forEach items="${region}" var="level">
									<option value="${level.regionName}">${level.regionName}</option>
								</c:forEach>
							</select>
						</div>

						<div class="span6" style="margin-left: 110px;">
							<div class="text-right">
								<ul class="date_select nopoint" style="list-style-type: none;">
									<li onclick="changeHoloDate('month')" class="month_color">月</li>
									<li onclick="changeHoloDate('week')" class="week_color">周</li>
									<li onclick="changeHoloDate('day')" class="day_color">日</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="span10" style="width: 791px;">
						<hr>
					</div>
					<div class="span12" style="margin-top: 20px;">
						<h4 style="font-size: 17.5px;">平面图</h4>
					</div>

					<div class="span12 device_site">
						<img id="plantImg"
							src="${pageContext.request.contextPath}/public/images/image0M.png" />
					</div>
					<%-- 空调设备列表			
						<h4>空调设备列表</h4>
						<div class="span12 device_table">
							<div class="span10 poistion_center">
								<div class="span4">
									<table class="table table-striped fir_t">
										<tr id="oddTr">
											<th>设备编号</th>
											<th>台数</th>
											<th>详情</th>
										</tr>
										<tr>
											<td>AHU-1</td>
											<td>4</td>
											<td class="machine ahu">查看运行状态</td>
											
										</tr>
										<tr>
											<td>FAU-1</td>
											<td>4</td>
											<td class="machine fau">查看运行状态</td>
										</tr>
									</table>
								</div>
								<div class="span4">
									<table class="table table-striped">
										<tr id="evenTr">
											<th>设备编号</th>
											<th>台数</th>
											<th>详情</th>
										</tr>
										<tr>
											<td>FCU-1</td>
											<td>4</td>
											<td class="machine fcu">查看运行状态</td>
											
										</tr>
										<tr>
											<td>VAV-1</td>
											<td>4</td>
											<td class="machine vav">查看运行状态</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
 --%>
					<div class="span12" style="margin-top: 20px;">
						<h4>室内温度及耗电量</h4>
					</div>
					<div class="span12 indoor_para">
						<div class="parameter_1">
							<table class="indoor_table">
								<tr>
									<td>当<span class="dateUnit">日</span><span
										class="holoLevel"></span>平均温度
									</td>
									<td><span style="font-size: 28px;" id="holoInnerTemp"></span><sup>&nbsp;&#176;C</sup></td>
								</tr>
								<tr>
									<td>当<span class="dateUnit">日</span>总用电量
									</td>
									<td><span style="font-size: 28px;" id="holoOutdoorTemp"></span><sup>kWh</sup></td>
								</tr>
							</table>
						</div>
						<div class="client_pic_1" style="border: 1px solid #CCCCCC;">
							<div id="<portlet:namespace />Chart"></div>
						</div>
					</div>

					<!-- 耗冷量 -->
					<div id="<portlet:namespace />costCool">
						<div class="span12" style="margin-top: 20px;">
							<h4>耗冷量</h4>
						</div>
						<div class="span12 indoor_para"
							style="height: 230px; width: 795px;" id="cost_ele_cool"></div>
					</div>

					<%-- 						
						<h4><span class="holoLevel"></span>耗电量、耗冷量</h4>
						<br>
 <div id="<portlet:namespace />Chart3"  > </div>
  --%>
				</div>
			</div>
		</div>
		<div class="inner_content cold_module">reikenreikenreiken</div>
	</div>
</div>
<script type="text/javascript">
	// 建筑耗冷量
	function Build_Ele_Cool_Chart() {
		$
				.post(
						'<portlet:resourceURL id="getSingleChartData"></portlet:resourceURL>',
						{
							from : holoDateFrom,
							name : cool_name, // 存放在twoParts.jsp
							id : cool_id,// 存放在twoParts.jsp
							ispd : cool_ispd,// 存放在twoParts.jsp
							decimals : decimals,// 存放在twoParts.jsp
							type : holoDateType
						}, function(data) {
							// 生成图表
							renderToColumnAndLineCharts('cost_ele_cool',
									"area", temp_cost_text, "制冷量(KW)",
									"#ECC9AC", temp_cost_step, "#ECC9AC", "",
									data.cataList, data.dataList);
						}, 'json');
	};

	// 室内温度及耗电量图表 
	function initTempreature<portlet:namespace />(data) {
		// debugger;
		$('#<portlet:namespace />Chart')
				.highcharts(
						{
							chart : {
								type : 'spline',
								width : 498,
								height : 228
							//, backgroundColor : '#F2F2F2'
							},
							title : {
								text : temp_cost_text
							},
							tooltip : {
								formatter : function() {
									return '<b>'
											+ this.series.name
											+ '</b>:'
											+ Highcharts.numberFormat(this.y,
													2, '.')
											+ (this.series.name == "耗电量" ? "kWh"
													: "°C");
								}
							},
							xAxis : {
								labels : {
									step : temp_cost_step
								//4就是x轴显示的间隔
								},
								categories : data.md.cataList
							},
							yAxis : [ {
								gridLineDashStyle : 'LongDash',
								title : {
									text : '温度 (°C)'
								}
							}, {
								opposite : true,
								title : {
									text : '耗电量(kWh)'
								}
							} ],
							credits : {
								enabled : false
							},
							series : [ {
								name : '耗电量',
								color : '#FF33CC',
								marker : {
									enabled : true,
									lineWidth : 2,
									lineColor : '#FF33CC',
									fillColor : 'white',
									radius : 4
								},
								data : data.md.cost.series[1].data[0],
								yAxis : 1
							}, {
								name : '室内平均温度',
								color : '#00DBF0',
								marker : {
									enabled : true,
									lineWidth : 2,
									lineColor : '#00DBF0',
									fillColor : 'white',
									radius : 4
								},
								data : data.md.temp.series[1].data[0]
							} ],
							legend : {
								x : 120,
								itemStyle : {
									fontSize : '10px'
								},
								itemMarginTop : 10,
								borderWidth : 0
							}
						});
	};
</script>

<!-- ajax 请求全息图细节数据 -->
<portlet:resourceURL id="graphicsJson" var="jsonHolographicDataURL">
</portlet:resourceURL>

<script type="text/javascript">
	var holoBuilding = "A1";
	var holoLevel = 0;
	var holoDevice;
	var holoDateType = "day";
	var holoDateFrom = prettyFrom;
	var holoDateTo;
	var holoSpan;
	var holoLocation = "A1_1";
	var gisUnit = "";
	var holoFlag = "0";
	var temp_cost_step = 4; // 定义一个全局的变量，存储温度的X轴之间的间隔 

	// 定义当前时间 
	var nowdate = new Date();
	var temp_cost_text = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1)
			+ "-" + nowdate.getDate();// 定义一个全局的变量，存储温度的图表的居中标题

	// 中国馆-点击全息图中的m触发此函数  
	// 淘宝城-点击对应的建筑也会触发此函数 
	function initHoloDetailGraphic(valueText) {
		setActiveFunction("holoView");

		$('#all_region_view').hide(); // 隐藏“园区全息图”div 
		$('#topDoubleChart').hide(); // 隐藏顶部的两个图表 
		$('#tb_build_list').hide(); // 隐藏全息图中的，顶部建筑列表
		$('#taobao_holo').hide(); // 隐藏全息图中的淘宝城的模型图
		$('#chinaArts_holo').hide(); // 显示全息图中的中国馆的模型图

		holoLevel = (!isNotChinaArts == true ? valueText.substring(0, 2)
				: valueText);
		// 后序代码表示，如果是淘宝项目的话，则需加上“号楼”才能定位到对应的下拉列表的值 
		$("#holoDetialLevelSelector").val(
				holoLevel + (!isNotChinaArts == true ? "号楼" : ""));

		//plantImg平面图
		srcLoc = "${pageContext.request.contextPath}/public/images/image"
				+ holoLevel + ".png";
		$("#plantImg").attr("src", srcLoc);

		if (!isNotChinaArts) { // 淘宝城项目，则显示 耗冷量 图表 
			holoLevel = '49M'; // 目前为测试 
			$('#<portlet:namespace />costCool').show();// 显示“制冷量”对应的div
			Build_Ele_Cool_Chart();
			$('#quanxitu').height(1050);// 设置高度，目的是为了完整的显示版权信息
		} else { // 中国馆项目情况 
			$('#<portlet:namespace />costCool').hide();// 隐藏“制冷量”对应的div
		}

		//请求全息图建筑细节数据
		$
				.post(
						'${jsonHolographicDataURL}',
						{
							tfrom : holoDateFrom,
							tspan : holoSpan,
							type : holoDateType,
							build : holoBuilding,
							floor : holoLevel,
							location : holoLocation,
							flag : holoFlag
						},
						function(data) {
							initTempreature<portlet:namespace />(data); // 室内温度及耗电量图表 

							var dateUnit = "日";
							if (holoDateType == "month") {
								dateUnit = "月";
							}
							if (holoDateType == "week") {
								dateUnit = "周";
							}
							$(".dateUnit").html(dateUnit);

							try {//展示两个温度

								$("#holoInnerTemp").html(
										parseInt(data.md.avgInnerTemp));
								$("#holoOutdoorTemp").html(
										parseInt(data.md.avgOutdoorTemp));

							} catch (e) {
							}
							try { //空调设备区 
								//clear原数据
								$('.newHoloTr').remove();
								i = 0;
								$
										.each(
												data.md.airConditions,
												function(key, values) {
													html = "<tr class='newHoloTr'> <td>"
															+ key
															+ "</td> <td>"
															+ parseInt(values)
															+ "</td> <td class='machine fcu'>查看运行状态</td> </tr>";

													if ((i++ % 2) == 0) {

														$("#oddTr").after(html);
													} else {
														$("#evenTr")
																.after(html);
													}
												});
							} catch (e) {
							}

						});
		//
		highlightDate(holoDateType);

		//
	}
</script>
<%--变更楼层事件 --%>
<script type="text/javascript">
	// 切换下拉列表触发的事件 
	function changeHoloDetailLevel() {
		var val = $("#holoDetialLevelSelector").find("option:selected").text();
		val = (!isNotChinaArts == true ? val.substring(0, 2) : val); // 如果是淘宝项目，则只保留前两位值(如P1)，否则不截取字符串 
		initHoloDetailGraphic(val);
	}
</script>

<%-- 日期选择控件 --%>
<input id="holoDatepickerMonth" type="hidden" />
<script type="text/javascript">
	function changeHoloDate(type) {
		highlightDate(type);
		holoDateType = type;

		WdatePicker({
			el : 'holoDatepickerMonth',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				//日期修正
				switch (type) {
				case 'day':
					to = from;
					temp_cost_step = 4;
					temp_cost_text = from;
					break;
				case 'week':
					temp_cost_text = showWeekFirstDay(from) + " ~ "
							+ showWeekLastDay(from);
					temp_cost_step = 1;
					to = dp.$DV(from, {
						d : 7
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'month':
					temp_cost_text = dp.cal.getDateStr("yyyy-MM") + "-01 ~ "
							+ showMonthLastDay(from);
					temp_cost_step = 4;
					to = dp.$DV(from, {
						M : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				}
				//赋值
				holoDateFrom = from;
				holoDateTo = to;
				// 刷新室内温度及耗电量数据
				initHoloDetailGraphic($("#holoDetialLevelSelector").find(
						"option:selected").text());

				if (!isNotChinaArts) { // 淘宝城项目，则显示 耗冷量 图表 
					Build_Ele_Cool_Chart();
				}
			}
		});

	};
</script>

<script type="text/javascript">
<!--
	function getPointInterval(type) {
		switch (type) {
		case 'day':
			span = 3600 * 1000;
			break;
		case 'week':
			span = 24 * 3600 * 1000;
			break;
		case 'month':
			span = 24 * 3600 * 1000;
			break;
		}
		return span;
	}
//-->
</script>