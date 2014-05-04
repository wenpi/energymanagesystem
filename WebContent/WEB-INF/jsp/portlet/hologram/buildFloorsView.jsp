<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-12-23 上午9点39分
	LastModified Date:
	Description: 全息图-建筑详情
 -->

<input id="<portlet:namespace />floorTime" type="hidden" />
<input id="<portlet:namespace />areaTime" type="hidden" />
<div class="floor_swap">
	<div class="cur">
		<div class="title_block sub_title_block">
			<p>层参数</p>
		</div>
		<div class="tab">
			<div class="tab_menu" id="<portlet:namespace />choose_chart">
				<ul>
					<li onclick="<portlet:namespace />getIndex(1)">
						<div>
							<img
								src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
							<p>层用电量及温度1</p>
						</div>
					</li>
					<li onclick="<portlet:namespace />getIndex(2)">
						<div>
							<img
								src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
							<p>层Co2浓度1</p>
						</div>
					</li>
					<!-- <li onclick="<portlet:namespace />getIndex(3)">
						<div>
							<img
								src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
							<p>层设备列表1</p>
						</div>
					</li> -->
				</ul>
			</div>

			<div class="floor_p_style">
				<h3 class="floor_param_h3">层用电量及温度</h3>
			</div>
			<div class="tab_content buildfloorview">
				<div class="date_select" id="<portlet:namespace />ect_choose">
					<div onclick="<portlet:namespace />floorDate('day', '1')">日视图</div>
					<div onclick="<portlet:namespace />floorDate('week', '1')">周视图</div>
					<div class="radius"
						onclick="<portlet:namespace />floorDate('month', '1')">月视图</div>
				</div>
				<div class="charts">
					<div class="look_other center_text">
						<label class="floor_times ect_time cursor_style "></label>
						<div class="download" onclick=""></div>
					</div>
					<div class="chart floor_chart"
						id="<portlet:namespace />floor_consumption"></div>
				</div>
				<div class="detail">
					<div>
						<table>
							<caption>层用电量及温度</caption>
							<tbody class="floor_top_params">
								<tr>
									<td><span>日</span>最大用电量</td>
									<td>250</td>
									<td class="tdClass"><sup>kWh</sup></td>
									<td></td>
								</tr>
								<tr>
									<td><span>日</span>最小用电量</td>
									<td>250</td>
									<td class="tdClass"><sup>kWh</sup></td>
									<td></td>
								</tr>
								<tr>
									<td><span>日</span>平均用电量</td>
									<td>15</td>
									<td class="tdClass"><sup>kWh</sup></td>
									<td></td>
								</tr>
								<!-- <tr>
									<td><span>日</span>最高层温度</td>
									<td>250</td>
									<td class="tdClass"><sup>℃</sup></td>
									<td></td>
								</tr>
								<tr>
									<td><span>日</span>最低层温度</td>
									<td>250</td>
									<td class="tdClass"><sup>℃</sup></td>
									<td></td>
								</tr>
								<tr>
									<td><span>日</span>平均层温度</td>
									<td>250</td>
									<td class="tdClass"><sup>℃</sup></td>
									<td></td>
								</tr> -->
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- 层Co2浓度 -->
			<div style="display: ${tbinfo.isShowCo2};" class="floor_p_style">
				<h3 class="floor_param_h3">层Co2浓度1</h3>
			</div>
			<div style="display: ${tbinfo.isShowCo2};"
				class="tab_content buildfloorview">
				<div class="date_select" id="<portlet:namespace />co2_choose">
					<div onclick="<portlet:namespace />floorDate('day', '2')">日视图</div>
					<div onclick="<portlet:namespace />floorDate('week', '2')">周视图</div>
					<div class="radius"
						onclick="<portlet:namespace />floorDate('month', '2')">月视图</div>
				</div>
				<div class="charts">
					<div class="look_other center_text">
						<label class="floor_times co2_time cursor_style "></label>
						<div class="download"></div>
					</div>
					<div class="chart floor_chart"
						id="<portlet:namespace />floor_concentration"></div>
				</div>
				<div class="detail">
					<div>
						<table>
							<caption>CO2浓度</caption>
							<tbody class="floor_top_co2">
								<tr>
									<td><span>日</span>最大值</td>
									<td>980</td>
									<td class="tdClass"><sup>pp/m</sup></td>
									<td></td>
								</tr>
								<tr>
									<td><span>日</span>最小值</td>
									<td>500</td>
									<td class="tdClass"><sup>pp/m</sup></td>
									<td></td>
								</tr>
								<tr>
									<td><span>日</span>平均值</td>
									<td>600</td>
									<td class="tdClass"><sup>pp/m</sup></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- <div class="floor_p_style">
				<h3 class="floor_param_h3">层设备列表</h3>
			</div>
			<div class="tab_content buildfloorview">
				<div class="date_select" id="<portlet:namespace />eqt_choose">
					<div onclick="<portlet:namespace />floorDate('day', '3')">日视图</div>
					<div onclick="<portlet:namespace />floorDate('week', '3')">周视图</div>
					<div class="radius"
						onclick="<portlet:namespace />floorDate('month', '3')">月视图</div>
				</div>
				<div class="charts">
					<div class="look_other center_text">
						<label class="floor_times equipment_time cursor_style "></label>
						<div class="download" onclick=""></div>
					</div>
					<div class="chart floor_chart"
						id="<portlet:namespace />equipmentChart"></div>
				</div>
				<div class="detail">
					<div>
						<table>
							<caption>层设备列表</caption>
						</table>
					</div>
				</div>
			</div> -->
		</div>

		<!-- 以下面平面图 -->
		<div style="display: ${tbinfo.isShowPlan};"
			class="title_block sub_title_block">
			<p>平面图</p>
		</div>
		<div style="display: ${tbinfo.isShowPlan};">
			<img id="pmPic"
				src="${pageContext.request.contextPath}/styles/second/images/u2_normal.png" />
		</div>

		<!-- 以下面区域 -->
		<div class="title_block sub_title_block">
			<p>区域参数</p>
			<p class="today"></p>
			<div>
				<div class="filter_widget">
					<div class="filter_label has_border_radius_left">选择区域</div>
					<select id="choose_region">
					</select>
				</div>
				<div class="btn_group">
					<div onclick="<portlet:namespace />areaDate('day')">日视图</div>
					<div onclick="<portlet:namespace />areaDate('week')">周视图</div>
					<div onclick="<portlet:namespace />areaDate('month')">月视图</div>
				</div>
				<div class="download"></div>
			</div>
		</div>
		<div class="block_swap">
			<div class="d_w_m_switch">
				<div class="cur">
					<div class="fault_content" style="display: ${tbinfo.isShowRegion};">
						<div class="fault_title area_title">
							<h3 class="fault_title_size">区域用电量及温度</h3>
						</div>
						<div class="detail left_information">
							<div>
								<table>
									<caption>层用电量及温度</caption>
									<tbody class="floor_region_data">
										<tr>
											<td><span>日</span>最大用电量</td>
											<td>250</td>
											<td class="tdClass"><sup>kWh</sup></td>
											<td></td>
										</tr>
										<tr>
											<td><span>日</span>最小用电量</td>
											<td>250</td>
											<td class="tdClass"><sup>kWh</sup></td>
											<td></td>
										</tr>
										<tr>
											<td><span>日</span>平均用电量</td>
											<td>15</td>
											<td class="tdClass"><sup>kWh</sup></td>
											<td></td>
										</tr>
										<!-- <tr>
											<td><span>日</span>最高层温度</td>
											<td>250</td>
											<td class="tdClass"><sup>℃</sup></td>
											<td></td>
										</tr>
										<tr>
											<td><span>日</span>最低层温度</td>
											<td>250</td>
											<td class="tdClass"><sup>℃</sup></td>
											<td></td>
										</tr>
										<tr>
											<td><span>日</span>平均层温度</td>
											<td>250</td>
											<td class="tdClass"><sup>℃</sup></td>
											<td></td>
										</tr> -->
									</tbody>
								</table>
							</div>
						</div>
						<div class="chart_content areaChart"
							id="<portlet:namespace />consumption_chart"></div>
					</div>
					<div class="fault_content">
						<div class="fault_title area_title">
							<h3 class="fault_title_size">区域CO2浓度</h3>
						</div>
						<div class="detail left_information">
							<div>
								<table>
									<caption>CO2浓度</caption>
									<tbody class="region_co2">
										<tr>
											<td><span>日</span>最大值</td>
											<td>980</td>
											<td class="tdClass"><sup>pp/m</sup></td>
											<td></td>
										</tr>
										<tr>
											<td><span>日</span>最小值</td>
											<td>500</td>
											<td class="tdClass"><sup>pp/m</sup></td>
											<td></td>
										</tr>
										<tr>
											<td><span>日</span>平均值</td>
											<td>600</td>
											<td class="tdClass"><sup>pp/m</sup></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="chart_content areaChart"
							id="<portlet:namespace />concentration_chart"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	if("${tbinfo.f_params_repeat}" == 'yes') { // 层参数平铺的情况
		$(".buildfloorview").addClass("current");
		$("#<portlet:namespace />choose_chart").css("display", "none");
		if("${tbinfo.isShowCo2}" == "block") { // 配置了层Co2浓度图表显示
			$(".floor_p_style").css("display", "block");
		}
	} else { // 层参数不平铺的情况
		$(".buildfloorview").removeClass("current");
		$(".buildfloorview:eq(0)").addClass("current");
		$("#<portlet:namespace />choose_chart").css("display", "block");
		$(".floor_p_style").css("display", "none");
	}
	
	
	//公共信息
	var <portlet:namespace />default_build = 0; //默认显示标识,即默认楼层
	var <portlet:namespace />choose_build1 = 0; //选定建筑标识
	var <portlet:namespace />floorStart_date1 = ''; //层参数开始时间1
	var <portlet:namespace />floorStart_date2 = ''; //层参数开始时间2
	var <portlet:namespace />floorStart_date3 = ''; //层参数开始时间3
	var <portlet:namespace />areaStart_date = ''; //区域参数开始时间
	var <portlet:namespace />chartRender1 = "<portlet:namespace />floor_consumption"; //图表绘制的位置
	var <portlet:namespace />chartRender2 = "<portlet:namespace />floor_concentration";
	var <portlet:namespace />chartRender3 = "<portlet:namespace />consumption_chart";
	var <portlet:namespace />chartRender4 = "<portlet:namespace />concentration_chart";
	var <portlet:namespace />floorChoose_type1 = ''; //层参数视图类型（日视图、周视图、月视图）1
	var <portlet:namespace />floorChoose_type2 = ''; //层参数视图类型（日视图、周视图、月视图）2
	var <portlet:namespace />floorChoose_type3 = ''; //层参数视图类型（日视图、周视图、月视图）3
	var <portlet:namespace />areaChoose_type = ''; //区域参数视图类型（日视图、周视图、月视图）
	var <portlet:namespace />centerTitle1 = ""; //居中标题1
	var <portlet:namespace />centerTitle2 = ""; //居中标题2
	var <portlet:namespace />centerTitle3 = ""; //居中标题3
	var <portlet:namespace />areaCenterTitle = ""; //区域参数图表居中标题
	var <portlet:namespace />c_title1 = ''; //存储居中标题对应的年份1
	var <portlet:namespace />c_title2 = ''; //存储居中标题对应的年份2
	var <portlet:namespace />area_c_title = ''; //存储区域参数图表居中标题对应的年份
	var <portlet:namespace />exp_start_date1 = ''; //导出时间
	var <portlet:namespace />exp_start_date2 = ''; //导出时间
	var <portlet:namespace />exp_start_date3 = ''; //导出时间
	var <portlet:namespace />exp_start_date4 = ''; //导出时间
	var <portlet:namespace />times1 = []; //根据所选name个数来保存相应时间信息
	var <portlet:namespace />define_mark = '';//选择图表标记（区分层参数图表：用电量及温度图表 、CO2浓度图表、设备列表）
	
	//个性信息——层参数部分
	var <portlet:namespace />floor_ectName = ''; //层参数用电量及温度图表所选name
	var <portlet:namespace />floor_ectId = ''; //层参数用电量及温度图表所选id
	var <portlet:namespace />floor_ectIspd = ''; //层参数用电量及温度图表所选ispd
	var <portlet:namespace />floorEctBg_color = ''; //层参数用电量及温度图表绘图区域背景颜色---
	var <portlet:namespace />floorEctFill_color = ''; //层参数用电量及温度图表填充颜色---
	var <portlet:namespace />floorEctConnLine = ''; //层参数用电量及温度图表连接线宽度---
	var <portlet:namespace />floorEctLegendList = ''; //层参数用电量及温度图表图例说明列表---
	var <portlet:namespace />floorEctColorList = ''; //层参数用电量及温度图表数据列颜色列表---
	var <portlet:namespace />floorEctShowLegend = ''; //层参数用电量及温度图表是否显示图例说明
	var <portlet:namespace />floorEctDecimals = ''; //层参数用电量及温度图表保留小数位数---
	var <portlet:namespace />floorEctLineWidth = ''; //层参数用电量及温度图表线宽---
	var <portlet:namespace />floorEctXStep = ''; //层参数用电量及温度图表显示间隔---
	var <portlet:namespace />floorEctChartType1 = ''; //层参数用电量及温度图表中图1类型---
	var <portlet:namespace />floorEctChartType2 = ''; //层参数用电量及温度图表中图2类型---
	var <portlet:namespace />floorEctShowX = ''; //层参数用电量及温度图表是否显示x轴上网格线---
	var <portlet:namespace />floorEctShowY = ''; //层参数用电量及温度图表是否显示y轴上网格线---
	var <portlet:namespace />floorEctLeftTitle = ''; //层参数用电量及温度图表左侧y轴标题---
	var <portlet:namespace />floorEctRightTitle = ''; //层参数用电量及温度图表右侧y轴标题---
	var <portlet:namespace />floorEctYSymbol = ''; //层参数用电量及温度图表y轴单位---
	var <portlet:namespace />floorEctRadius = ''; //层参数用电量及温度图表数据点半径列表---
	var <portlet:namespace />floorEctSymbol = ''; //层参数用电量及温度图表数据点样式---
	var <portlet:namespace />floorEctGridStyle = ''; //层参数用电量及温度图表网格线样式---
	var <portlet:namespace />floorEctYAxis = ''; //层参数用电量及温度图表y轴数据列表---
	var <portlet:namespace />floorEctExpColumn = ''; //层参数用电量及温度图表导出表头---
	
	var <portlet:namespace />floor_Co2Name = ''; //层参数CO2浓度图表所选name
	var <portlet:namespace />floor_Co2Id = ''; //层参数CO2浓度图表所选id
	var <portlet:namespace />floor_Co2Ispd = ''; //层参数CO2浓度图表所选ispd
	var <portlet:namespace />floorCo2Bg_color = ''; //层参数CO2浓度图表绘图区域背景颜色
	var <portlet:namespace />floorCo2Fill_color = ''; //层参数CO2浓度图表填充颜色
	var <portlet:namespace />floorCo2ConnLine = ''; //层参数CO2浓度图表连接线宽度
	var <portlet:namespace />floorCo2LegendList = ''; //层参数CO2浓度图表图例说明列表
	var <portlet:namespace />floorCo2ColorList = ''; //层参数CO2浓度图表数据列颜色列表
	var <portlet:namespace />floorCo2ShowLegend = ''; //层参数CO2浓度图表是否显示图例说明
	var <portlet:namespace />floorCo2Decimals = ''; //层参数CO2浓度图表保留小数位数
	var <portlet:namespace />floorCo2LineWidth = ''; //层参数CO2浓度图表线宽
	var <portlet:namespace />floorCo2XStep = ''; //层参数CO2浓度图表显示间隔
	var <portlet:namespace />floorCo2ChartType1 = ''; //层参数CO2浓度图表中图1类型
	var <portlet:namespace />floorCo2ChartType2 = ''; //层参数CO2浓度图表中图2类型
	var <portlet:namespace />floorCo2ShowX = ''; //层参数CO2浓度图表是否显示x轴上网格线
	var <portlet:namespace />floorCo2ShowY = ''; //层参数CO2浓度图表是否显示y轴上网格线
	var <portlet:namespace />floorCo2LeftTitle = ''; //层参数CO2浓度图表左侧y轴标题
	var <portlet:namespace />floorCo2RightTitle = ''; //层参数CO2浓度图表右侧y轴标题
	var <portlet:namespace />floorCo2YSymbol = ''; //层参数CO2浓度图表y轴单位
	var <portlet:namespace />floorCo2Radius = ''; //层参数CO2浓度图表数据点半径列表
	var <portlet:namespace />floorCo2Symbol = ''; //层参数CO2浓度图表数据点样式
	var <portlet:namespace />floorCo2GridStyle = ''; //层参数CO2浓度图表网格线样式
	var <portlet:namespace />floorCo2YAxis = ''; //层参数CO2浓度图表y轴数据列表
	var <portlet:namespace />floorCo2ExpColumn = ''; //层参数CO2浓度图表导出表头
	
	var <portlet:namespace />equipment_name = ''; //层参数设备列表所选name
	var <portlet:namespace />equipment_id = ''; //层参数设备列表所选id
	var <portlet:namespace />equipment_ispd = ''; //层参数设备列表所选ispd
	var <portlet:namespace />dayColumn = ''; //层参数设备列表特殊列列名
	var <portlet:namespace />equipment_colName = ''; //层参数设备列表共用列列名
	
	//个性信息——区域参数部分
	var <portlet:namespace />area_ectName = ''; //区域参数用电量及温度图表所选name
	var <portlet:namespace />area_ectId = ''; //区域参数用电量及温度图表所选id
	var <portlet:namespace />area_ectIspd = ''; //区域参数用电量及温度图表所选ispd
	var <portlet:namespace />areaEctBg_color = ''; //区域参数用电量及温度图表绘图区域背景颜色
	var <portlet:namespace />areaEctFill_color = ''; //区域参数用电量及温度图表填充颜色
	var <portlet:namespace />areaEctConnLine = ''; //区域参数用电量及温度图表连接线宽度
	var <portlet:namespace />areaEctLegendList = ''; //区域参数用电量及温度图表图例说明列表
	var <portlet:namespace />areaEctColorList = ''; //区域参数用电量及温度图表数据列颜色列表
	var <portlet:namespace />areaEctShowLegend = ''; //区域参数用电量及温度图表是否显示图例说明
	var <portlet:namespace />areaEctDecimals = ''; //区域参数用电量及温度图表保留小数位数
	var <portlet:namespace />areaEctLineWidth = ''; //区域参数用电量及温度图表线宽
	var <portlet:namespace />areaEctXStep = ''; //区域参数用电量及温度图表显示间隔
	var <portlet:namespace />areaEctChartType1 = ''; //区域参数用电量及温度图表中图1类型
	var <portlet:namespace />areaEctChartType2 = ''; //区域参数用电量及温度图表中图2类型
	var <portlet:namespace />areaEctShowX = ''; //区域参数用电量及温度图表是否显示x轴上网格线
	var <portlet:namespace />areaEctShowY = ''; //区域参数用电量及温度图表是否显示y轴上网格线
	var <portlet:namespace />areaEctLeftTitle = ''; //区域参数用电量及温度图表左侧y轴标题
	var <portlet:namespace />areaEctRightTitle = ''; //区域参数用电量及温度图表右侧y轴标题
	var <portlet:namespace />areaEctYSymbol = ''; //区域参数用电量及温度图表y轴单位
	var <portlet:namespace />areaEctRadius = ''; //区域参数用电量及温度图表数据点半径列表
	var <portlet:namespace />areaEctSymbol = ''; //区域参数用电量及温度图表数据点样式
	var <portlet:namespace />areaEctGridStyle = ''; //区域参数用电量及温度图表网格线样式
	var <portlet:namespace />areaEctYAxis = ''; //区域参数用电量及温度图表y轴数据列表
	var <portlet:namespace />areaEctExpColumn = ''; //区域参数用电量及温度图表导出表头
	
	var <portlet:namespace />area_Co2Name = ''; //区域参数CO2浓度图表所选name
	var <portlet:namespace />area_Co2Id = ''; //区域参数CO2浓度图表所选id
	var <portlet:namespace />area_Co2Ispd = ''; //区域参数CO2浓度图表所选ispd
	var <portlet:namespace />areaCo2Bg_color = ''; //区域参数CO2浓度图表绘图区域背景颜色
	var <portlet:namespace />areaCo2Fill_color = ''; //区域参数CO2浓度图表填充颜色
	var <portlet:namespace />areaCo2ConnLine = ''; //区域参数CO2浓度图表连接线宽度
	var <portlet:namespace />areaCo2LegendList = ''; //区域参数CO2浓度图表图例说明列表
	var <portlet:namespace />areaCo2ColorList = ''; //区域参数CO2浓度图表数据列颜色列表
	var <portlet:namespace />areaCo2ShowLegend = ''; //区域参数CO2浓度图表是否显示图例说明
	var <portlet:namespace />areaCo2Decimals = ''; //区域参数CO2浓度图表保留小数位数
	var <portlet:namespace />areaCo2LineWidth = ''; //区域参数CO2浓度图表线宽
	var <portlet:namespace />areaCo2XStep = ''; //区域参数CO2浓度图表显示间隔
	var <portlet:namespace />areaCo2ChartType1 = ''; //区域参数CO2浓度图表中图1类型
	var <portlet:namespace />areaCo2ChartType2 = ''; //区域参数CO2浓度图表中图2类型
	var <portlet:namespace />areaCo2ShowX = ''; //区域参数CO2浓度图表是否显示x轴上网格线
	var <portlet:namespace />areaCo2ShowY = ''; //区域参数CO2浓度图表是否显示y轴上网格线
	var <portlet:namespace />areaCo2LeftTitle = ''; //区域参数CO2浓度图表左侧y轴标题
	var <portlet:namespace />areaCo2RightTitle = ''; //区域参数CO2浓度图表右侧y轴标题
	var <portlet:namespace />areaCo2YSymbol = ''; //区域参数CO2浓度图表y轴单位
	var <portlet:namespace />areaCo2Radius = ''; //区域参数CO2浓度图表数据点半径列表
	var <portlet:namespace />areaCo2Symbol = ''; //区域参数CO2浓度图表数据点样式
	var <portlet:namespace />areaCo2GridStyle = ''; //区域参数CO2浓度图表网格线样式
	var <portlet:namespace />areaCo2YAxis = ''; //区域参数CO2浓度图表y轴数据列表
	var <portlet:namespace />areaCo2ExpColumn = ''; //区域参数CO2浓度图表导出表头
	
	//设置开始时间默认值 
	var t_now_date = '';
	if(publicTime != "") {
		t_now_date = publicTime;
	} else {
		if("${tbinfo.buildTime}" == ""){
			t_now_date = cur_time.getFullYear() + "-" + (cur_time.getMonth()+1) + "-" + cur_time.getDate();
		}else{
			t_now_date = "${tbinfo.buildTime}";
		}
	}
	
	<portlet:namespace />floorStart_date1 = t_now_date;
	<portlet:namespace />floorStart_date2 = t_now_date;
	<portlet:namespace />floorStart_date3 = t_now_date;
	<portlet:namespace />areaStart_date = t_now_date;
	
	//设置输出EXCEL的开始时间初始值
	<portlet:namespace />exp_start_date1 = <portlet:namespace />floorStart_date1;
	<portlet:namespace />exp_start_date2 = <portlet:namespace />floorStart_date1;
	<portlet:namespace />exp_start_date3 = <portlet:namespace />floorStart_date1;
	<portlet:namespace />exp_start_date4 = <portlet:namespace />floorStart_date1;
	//设置choose_type初始值
	<portlet:namespace />floorChoose_type1 = 'day';
	<portlet:namespace />floorChoose_type2 = 'day';
	<portlet:namespace />floorChoose_type3 = 'day';
	<portlet:namespace />areaChoose_type = 'day';
	
	// 获取层参数相关的图表和数据
	function <portlet:namespace />getParameter(){
		getRegionList(); // 获取区域列表
		
		//设置居中标题初始值
		<portlet:namespace />centerTitle1 = <portlet:namespace />floorStart_date1;
		<portlet:namespace />centerTitle2 = <portlet:namespace />floorStart_date1;
		<portlet:namespace />centerTitle3 = <portlet:namespace />floorStart_date1;
		<portlet:namespace />areaCenterTitle = <portlet:namespace />floorStart_date1;
		$(".ect_time").html(<portlet:namespace />floorStart_date1);
		$(".co2_time").html(<portlet:namespace />floorStart_date1);
		$(".equipment_time").html(<portlet:namespace />floorStart_date1);
		$(".today").html(<portlet:namespace />floorStart_date1);
		//设置各图表的默认选中项,即默认选中的为第一个图表或视图类型
		$("#<portlet:namespace />choose_chart li").removeClass("cur_tab");
		$("#<portlet:namespace />choose_chart li:eq(0)").addClass("cur_tab");
		//层参数用电量及温度图表默认选择日视图
		$("#<portlet:namespace />ect_choose>div").removeClass("pressive");
		$("#<portlet:namespace />ect_choose>div:eq(0)").addClass("pressive");
		//层参数CO2浓度图表默认选择日视图
		$("#<portlet:namespace />co2_choose>div").removeClass("pressive");
		$("#<portlet:namespace />co2_choose>div:eq(0)").addClass("pressive");
		//区域 参数用电量及温度图表默认选择日视图
		$("#<portlet:namespace />eqt_choose>div").removeClass("pressive");
		$("#<portlet:namespace />eqt_choose>div:eq(0)").addClass("pressive");
		//区域参数CO2图表默认选择日视图
		$(".btn_group>div").removeClass("btn_press");
		$(".btn_group>div:eq(0)").addClass("btn_press");
		//初始化图表标记define_mark,默认为1，即显示用电量及温度图表
		<portlet:namespace />define_mark = 1;
		 
		 //个性信息——层参数部分
		 <portlet:namespace />floor_ectName = f_ele_name + ',' + f_temp_name; //层参数用电量及温度图表所选name
		 <portlet:namespace />floor_ectId = (holo_cur_floor + "_" + holo_cur_build) + ',' + (holo_cur_floor + "_" + holo_cur_build); //层参数用电量及温度图表所选id
		 <portlet:namespace />floor_ectIspd = f_ele_ispd + ',' + f_temp_ispd; //层参数用电量及温度图表所选ispd

		 <portlet:namespace />floor_Co2Name = f_co2_name; //层参数CO2浓度图表所选name
		 <portlet:namespace />floor_Co2Id = (holo_cur_floor + "_" + holo_cur_build); //层参数CO2浓度图表所选id
		 <portlet:namespace />floor_Co2Ispd = f_co2_ispd; //层参数CO2浓度图表所选ispd
		
		 <portlet:namespace />equipment_name = f_eqt_name; //层参数设备列表所选name
		 <portlet:namespace />equipment_id = f_eqt_id; //层参数设备列表所选id
		 <portlet:namespace />equipment_ispd = f_eqt_ispd; //层参数设备列表所选ispd

		 // 共用信息——层参数部分
		 <portlet:namespace />floorEctBg_color = '${tbinfo.floorEctChartColor}'; //层参数用电量及温度图表绘图区域背景颜色
		 <portlet:namespace />floorEctFill_color = '${tbinfo.floorEctFillColor}'.split(","); //层参数用电量及温度图表填充颜色
		 <portlet:namespace />floorEctConnLine = '${tbinfo.floorEctConnLine}'; //层参数用电量及温度图表连接线宽度
		 <portlet:namespace />floorEctLegendList = '${tbinfo.floorEctLegendList}'.split(","); //层参数用电量及温度图表图例说明列表
		 <portlet:namespace />floorEctColorList = '${tbinfo.floorEctColorList}'.split(","); //层参数用电量及温度图表数据列颜色列表
		 <portlet:namespace />floorEctDecimals = '${tbinfo.floorEctDecimals}'; //层参数用电量及温度图表保留小数位数
		 <portlet:namespace />floorEctLineWidth = '${tbinfo.floorEctLineWidth}'; //层参数用电量及温度图表线宽
		 <portlet:namespace />floorEctXStep = '${tbinfo.floorEctXStep}'; //层参数用电量及温度图表显示间隔
		 <portlet:namespace />floorEctChartType1 = '${tbinfo.floorEctChartType1}'; //层参数用电量及温度图表中图1类型
		 <portlet:namespace />floorEctChartType2 = '${tbinfo.floorEctChartType2}'; //层参数用电量及温度图表中图2类型
		 <portlet:namespace />floorEctShowX = '${tbinfo.floorEctShowX}'; //层参数用电量及温度图表是否显示x轴上网格线
		 <portlet:namespace />floorEctShowY = '${tbinfo.floorEctShowY}'; //层参数用电量及温度图表是否显示y轴上网格线
		 <portlet:namespace />floorEctLeftTitle = '${tbinfo.floorEctLeftTitle}'; //层参数用电量及温度图表左侧y轴标题
		 <portlet:namespace />floorEctRightTitle = '${tbinfo.floorEctRightTitle}'; //层参数用电量及温度图表右侧y轴标题
		 <portlet:namespace />floorEctYSymbol = '${tbinfo.floorEctYSymbol}'; //层参数用电量及温度图表y轴单位
		 <portlet:namespace />floorEctRadius = '${tbinfo.floorEctRadius}'.split(","); //层参数用电量及温度图表数据点半径列表
		 <portlet:namespace />floorEctSymbol = '${tbinfo.floorEctSymbol}'; //层参数用电量及温度图表数据点样式
		 <portlet:namespace />floorEctGridStyle = '${tbinfo.floorEctGridStyle}'; //层参数用电量及温度图表网格线样式
		 <portlet:namespace />floorEctYAxis = [${tbinfo.floorEctYAxis}]; //层参数用电量及温度图表y轴数据列表
		 <portlet:namespace />floorEctExpColumn = '${tbinfo.floorEctExpColumn}'; //层参数用电量及温度图表导出表头
		 
		 <portlet:namespace />floorCo2Bg_color = '${tbinfo.floorCo2ChartColor}'; //层参数Co2浓度图表绘图区域背景颜色
		 <portlet:namespace />floorCo2Fill_color = '${tbinfo.floorCo2FillColor}'.split(","); //层参数Co2浓度图表填充颜色
		 <portlet:namespace />floorCo2ConnLine = '${tbinfo.floorCo2ConnLine}'; //层参数Co2浓度图表连接线宽度
		 <portlet:namespace />floorCo2LegendList = '${tbinfo.floorCo2LegendList}'.split(","); //层参数Co2浓度图表图例说明列表
		 <portlet:namespace />floorCo2ColorList = '${tbinfo.floorCo2ColorList}'.split(","); //层参数Co2浓度图表数据列颜色列表
		 <portlet:namespace />floorCo2Decimals = '${tbinfo.floorCo2Decimals}'; //层参数Co2浓度图表保留小数位数
		 <portlet:namespace />floorCo2LineWidth = '${tbinfo.floorCo2LineWidth}'; //层参数Co2浓度图表线宽
		 <portlet:namespace />floorCo2XStep = '${tbinfo.floorCo2XStep}'; //层参数Co2浓度图表显示间隔
		 <portlet:namespace />floorCo2ChartType1 = '${tbinfo.floorCo2ChartType1}'; //层参数Co2浓度图表中图1类型
		 <portlet:namespace />floorCo2ChartType2 = '${tbinfo.floorCo2ChartType2}'; //层参数Co2浓度图表中图2类型
		 <portlet:namespace />floorCo2ShowX = '${tbinfo.floorCo2ShowX}'; //层参数Co2浓度图表是否显示x轴上网格线
		 <portlet:namespace />floorCo2ShowY = '${tbinfo.floorCo2ShowY}'; //层参数Co2浓度图表是否显示y轴上网格线
		 <portlet:namespace />floorCo2LeftTitle = '${tbinfo.floorCo2LeftTitle}'; //层参数Co2浓度图表左侧y轴标题
		 <portlet:namespace />floorCo2RightTitle = '${tbinfo.floorCo2RightTitle}'; //层参数Co2浓度图表右侧y轴标题
		 <portlet:namespace />floorCo2YSymbol = '${tbinfo.floorCo2YSymbol}'; //层参数Co2浓度图表y轴单位
		 <portlet:namespace />floorCo2Radius = '${tbinfo.floorCo2Radius}'.split(","); //层参数Co2浓度图表数据点半径列表
		 <portlet:namespace />floorCo2Symbol = '${tbinfo.floorCo2Symbol}'; //层参数Co2浓度图表数据点样式
		 <portlet:namespace />floorCo2GridStyle = '${tbinfo.floorCo2GridStyle}'; //层参数Co2浓度图表网格线样式
		 <portlet:namespace />floorCo2YAxis = [${tbinfo.floorCo2YAxis}]; //层参数Co2浓度图表y轴数据列表
		 <portlet:namespace />floorCo2ExpColumn = '${tbinfo.floorCo2ExpColumn}'; //层参数Co2浓度图表导出表头
		 
		 <portlet:namespace />dayColumn = '${tbinfo.dayColumn}'; //层参数设备列表特殊列列名
		 <portlet:namespace />equipment_colName = '${tbinfo.equipment_colName}'.split(","); //层参数设备列表公用列列名
		 
		 //初始化图表
		 //层用电量及温度图表
		 <portlet:namespace />getGraphChart("floor",<portlet:namespace />chartRender1,<portlet:namespace />floor_ectName,<portlet:namespace />floor_ectId,
				 <portlet:namespace />floor_ectIspd,<portlet:namespace />floorEctBg_color,<portlet:namespace />floorEctFill_color,
				 <portlet:namespace />floorEctConnLine,<portlet:namespace />floorEctLegendList,<portlet:namespace />floorEctColorList,
				 <portlet:namespace />floorEctDecimals,<portlet:namespace />floorEctLineWidth,<portlet:namespace />floorEctXStep,
			     <portlet:namespace />floorEctChartType1, <portlet:namespace />floorEctChartType2,<portlet:namespace />floorEctShowX,
			     <portlet:namespace />floorEctShowY,<portlet:namespace />floorEctLeftTitle,<portlet:namespace />floorEctRightTitle,
			     <portlet:namespace />floorEctYSymbol,<portlet:namespace />floorEctRadius,<portlet:namespace />floorEctSymbol,
			     <portlet:namespace />floorEctGridStyle,<portlet:namespace />floorEctYAxis,<portlet:namespace />centerTitle1,
			     <portlet:namespace />c_title1,<portlet:namespace />floorStart_date1,<portlet:namespace />floorChoose_type1);
		 <portlet:namespace />getFloorParamsData(<portlet:namespace />define_mark); // 获取层用电量及温度右侧的最大、最小、平均值
		
		 // 层Co2浓度图表
		 if("${tbinfo.isShowCo2}" == "block") { // 配置了层Co2浓度图表显示
			 <portlet:namespace />getFloorParamsData(2); // 获取层Co2浓度右侧的最大、最小、平均值
			 <portlet:namespace />getGraphChart("floor",<portlet:namespace />chartRender2,<portlet:namespace />floor_Co2Name,<portlet:namespace />floor_Co2Id,
					 <portlet:namespace />floor_Co2Ispd,<portlet:namespace />floorCo2Bg_color,<portlet:namespace />floorCo2Fill_color,
					 <portlet:namespace />floorCo2ConnLine,<portlet:namespace />floorCo2LegendList,<portlet:namespace />floorCo2ColorList,
					 <portlet:namespace />floorCo2Decimals,<portlet:namespace />floorCo2LineWidth,<portlet:namespace />floorCo2XStep,
				     <portlet:namespace />floorCo2ChartType1, <portlet:namespace />floorCo2ChartType2,<portlet:namespace />floorCo2ShowX,
				     <portlet:namespace />floorCo2ShowY,<portlet:namespace />floorCo2LeftTitle,<portlet:namespace />floorCo2RightTitle,
				     <portlet:namespace />floorCo2YSymbol,<portlet:namespace />floorCo2Radius,<portlet:namespace />floorCo2Symbol,
				     <portlet:namespace />floorCo2GridStyle,<portlet:namespace />floorCo2YAxis,<portlet:namespace />centerTitle2,
				     <portlet:namespace />c_title2,<portlet:namespace />floorStart_date2,<portlet:namespace />floorChoose_type2);
		 }
		 
		 //层设备列表
		 //<portlet:namespace />getForm(<portlet:namespace />equipment_name,<portlet:namespace />equipment_id,
		 //		 <portlet:namespace />equipment_ispd,<portlet:namespace />floorStart_date3,<portlet:namespace />floorChoose_type3,
		 //		 <portlet:namespace />equipment_colName,<portlet:namespace />dayColumn);
		 
		 // 获取区域的图形等信息
		 getRegionInfo();
	}

	// 获取区域的图形等信息
	function getRegionInfo() {
		 //共用信息——区域参数部分
		 <portlet:namespace />areaEctBg_color = '${tbinfo.areaEctChartColor}'; //区域参数用电量及温度图表绘图区域背景颜色
		 <portlet:namespace />areaEctFill_color = '${tbinfo.areaEctFillColor}'.split(","); //区域参数用电量及温度图表填充颜色
		 <portlet:namespace />areaEctConnLine = '${tbinfo.areaEctConnLine}'; //区域参数用电量及温度图表连接线宽度
		 <portlet:namespace />areaEctLegendList = '${tbinfo.areaEctLegendList}'.split(","); //区域参数用电量及温度图表图例说明列表
		 <portlet:namespace />areaEctColorList = '${tbinfo.areaEctColorList}'.split(","); //区域参数用电量及温度图表数据列颜色列表
		 <portlet:namespace />areaEctDecimals = '${tbinfo.areaEctDecimals}'; //区域参数用电量及温度图表保留小数位数
		 <portlet:namespace />areaEctLineWidth = '${tbinfo.areaEctLineWidth}'; //区域参数用电量及温度图表线宽
		 <portlet:namespace />areaEctXStep = '${tbinfo.areaEctXStep}'; //区域参数用电量及温度图表显示间隔
		 <portlet:namespace />areaEctChartType1 = '${tbinfo.areaEctChartType1}'; //区域参数用电量及温度图表中图1类型
		 <portlet:namespace />areaEctChartType2 = '${tbinfo.areaEctChartType2}'; //区域参数用电量及温度图表中图2类型
		 <portlet:namespace />areaEctShowX = '${tbinfo.areaEctShowX}'; //区域参数用电量及温度图表是否显示x轴上网格线
		 <portlet:namespace />areaEctShowY = '${tbinfo.areaEctShowY}'; //区域参数用电量及温度图表是否显示y轴上网格线
		 <portlet:namespace />areaEctLeftTitle = '${tbinfo.areaEctLeftTitle}'; //区域参数用电量及温度图表左侧y轴标题
		 <portlet:namespace />areaEctRightTitle = '${tbinfo.areaEctRightTitle}'; //区域参数用电量及温度图表右侧y轴标题
		 <portlet:namespace />areaEctYSymbol = '${tbinfo.areaEctYSymbol}'; //区域参数用电量及温度图表y轴单位
		 <portlet:namespace />areaEctRadius = '${tbinfo.areaEctRadius}'.split(","); //区域参数用电量及温度图表数据点半径列表
		 <portlet:namespace />areaEctSymbol = '${tbinfo.areaEctSymbol}'; //区域参数用电量及温度图表数据点样式
		 <portlet:namespace />areaEctGridStyle = '${tbinfo.areaEctGridStyle}'; //区域参数用电量及温度图表网格线样式
		 <portlet:namespace />areaEctYAxis = [${tbinfo.areaEctYAxis}]; //区域参数用电量及温度图表y轴数据列表
		 <portlet:namespace />areaEctExpColumn = '${tbinfo.areaEctExpColumn}'; //区域参数用电量及温度图表导出表头
		 
		 // 个性信息——区域参数部分
		 <portlet:namespace />area_ectName = r_ele_name + "," + r_temp_name; //区域参数用电量及温度图表所选name
		 <portlet:namespace />area_ectId = (holo_cur_floor + "_" + holo_cur_build) + "," + (holo_cur_floor + "_" + holo_cur_build); //区域参数用电量及温度图表所选id
		 <portlet:namespace />area_ectIspd = r_ele_ispd + "," + r_temp_ispd; //区域参数用电量及温度图表所选ispd

		 <portlet:namespace />area_Co2Name = r_co2_name; //区域参数CO2浓度图表所选name
		 <portlet:namespace />area_Co2Id = r_co2_id; //区域参数CO2浓度图表所选id
		 <portlet:namespace />area_Co2Ispd = r_co2_ispd; //区域参数CO2浓度图表所选ispd
		 
		 <portlet:namespace />areaCo2Bg_color = '${tbinfo.areaCo2ChartColor}'; //区域参数Co2浓度图表绘图区域背景颜色
		 <portlet:namespace />areaCo2Fill_color = '${tbinfo.areaCo2FillColor}'.split(","); //区域参数Co2浓度图表填充颜色
		 <portlet:namespace />areaCo2ConnLine = '${tbinfo.areaCo2ConnLine}'; //区域参数Co2浓度图表连接线宽度
		 <portlet:namespace />areaCo2LegendList = '${tbinfo.areaCo2LegendList}'.split(","); //区域参数Co2浓度图表图例说明列表
		 <portlet:namespace />areaCo2ColorList = '${tbinfo.areaCo2ColorList}'.split(","); //区域参数Co2浓度图表数据列颜色列表
		 <portlet:namespace />areaCo2Decimals = '${tbinfo.areaCo2Decimals}'; //区域参数Co2浓度图表保留小数位数
		 <portlet:namespace />areaCo2LineWidth = '${tbinfo.areaCo2LineWidth}'; //区域参数Co2浓度图表线宽
		 <portlet:namespace />areaCo2XStep = '${tbinfo.areaCo2XStep}'; //区域参数Co2浓度图表显示间隔
		 <portlet:namespace />areaCo2ChartType1 = '${tbinfo.areaCo2ChartType1}'; //区域参数Co2浓度图表中图1类型
		 <portlet:namespace />areaCo2ChartType2 = '${tbinfo.areaCo2ChartType2}'; //区域参数Co2浓度图表中图2类型
		 <portlet:namespace />areaCo2ShowX = '${tbinfo.areaCo2ShowX}'; //区域参数Co2浓度图表是否显示x轴上网格线
		 <portlet:namespace />areaCo2ShowY = '${tbinfo.areaCo2ShowY}'; //区域参数Co2浓度图表是否显示y轴上网格线
		 <portlet:namespace />areaCo2LeftTitle = '${tbinfo.areaCo2LeftTitle}'; //区域参数Co2浓度图表左侧y轴标题
		 <portlet:namespace />areaCo2RightTitle = '${tbinfo.areaCo2RightTitle}'; //区域参数Co2浓度图表右侧y轴标题
		 <portlet:namespace />areaCo2YSymbol = '${tbinfo.areaCo2YSymbol}'; //区域参数Co2浓度图表y轴单位
		 <portlet:namespace />areaCo2Radius = '${tbinfo.areaCo2Radius}'.split(","); //区域参数Co2浓度图表数据点半径列表
		 <portlet:namespace />areaCo2Symbol = '${tbinfo.areaCo2Symbol}'; //区域参数Co2浓度图表数据点样式
		 <portlet:namespace />areaCo2GridStyle = '${tbinfo.areaCo2GridStyle}'; //区域参数Co2浓度图表网格线样式
		 <portlet:namespace />areaCo2YAxis = [${tbinfo.areaCo2YAxis}]; //区域参数Co2浓度图表y轴数据列表
		 <portlet:namespace />areaCo2ExpColumn = '${tbinfo.areaCo2ExpColumn}'; //区域参数Co2浓度图表导出表头
		 
		 // 区域Co2浓度图表
		 if($("#choose_region").find("option").length != 0) {
			 <portlet:namespace />getLeftRegionData(); // 获取区域参数左侧的最大、最小、平均值
			
			 if("${tbinfo.isShowRegion}" == "block") { // 配置了区域用电显示
				 //区域用电量及温度图表
				 <portlet:namespace />getGraphChart("area",<portlet:namespace />chartRender3,<portlet:namespace />area_ectName,<portlet:namespace />area_ectId,
						 <portlet:namespace />area_ectIspd,<portlet:namespace />areaEctBg_color,<portlet:namespace />areaEctFill_color,
						 <portlet:namespace />areaEctConnLine,<portlet:namespace />areaEctLegendList,<portlet:namespace />areaEctColorList,
						 <portlet:namespace />areaEctDecimals,<portlet:namespace />areaEctLineWidth,<portlet:namespace />areaEctXStep,
					     <portlet:namespace />areaEctChartType1, <portlet:namespace />areaEctChartType2,<portlet:namespace />areaEctShowX,
					     <portlet:namespace />areaEctShowY,<portlet:namespace />areaEctLeftTitle,<portlet:namespace />areaEctRightTitle,
					     <portlet:namespace />areaEctYSymbol,<portlet:namespace />areaEctRadius,<portlet:namespace />areaEctSymbol,
					     <portlet:namespace />areaEctGridStyle,<portlet:namespace />areaEctYAxis,<portlet:namespace />areaCenterTitle,
					     <portlet:namespace />area_c_title,<portlet:namespace />areaStart_date,<portlet:namespace />areaChoose_type);
			 }
			 
			 // co2图表
			 <portlet:namespace />getGraphChart("co2",<portlet:namespace />chartRender4,<portlet:namespace />area_Co2Name,<portlet:namespace />area_Co2Id,
					 <portlet:namespace />area_Co2Ispd,<portlet:namespace />areaCo2Bg_color,<portlet:namespace />areaCo2Fill_color,
					 <portlet:namespace />areaCo2ConnLine,<portlet:namespace />areaCo2LegendList,<portlet:namespace />areaCo2ColorList,
					 <portlet:namespace />areaCo2Decimals,<portlet:namespace />areaCo2LineWidth,<portlet:namespace />areaCo2XStep,
				     <portlet:namespace />areaCo2ChartType1, <portlet:namespace />areaCo2ChartType2,<portlet:namespace />areaCo2ShowX,
				     <portlet:namespace />areaCo2ShowY,<portlet:namespace />areaCo2LeftTitle,<portlet:namespace />areaCo2RightTitle,
				     <portlet:namespace />areaCo2YSymbol,<portlet:namespace />areaCo2Radius,<portlet:namespace />areaCo2Symbol,
				     <portlet:namespace />areaCo2GridStyle,<portlet:namespace />areaCo2YAxis,<portlet:namespace />areaCenterTitle,
				     <portlet:namespace />area_c_title,<portlet:namespace />areaStart_date,<portlet:namespace />areaChoose_type);
		 }
		 
	}
	
	// 生成图形
	function <portlet:namespace />getGraphChart(tag,chartId,name,id,ispd,bg_color,fill_color,connLineWidth,legendList,colorList,decimals,lineWidth,xStep,
			chartType1,chartType2,showX,showY,leftTitle,rightTitle,ySymbol,radiusList,symbol,gridLineStyle,yAxisList,centerTitle,c_title,start_date,choose_type){
		
		<portlet:namespace />times1.length = 0;; //清空times
		//根据所选name个数确定开始时间个数
		for(var i = 0 ;i<name.split(",").length;i++){
			<portlet:namespace />times1.push(start_date);
		}
		var showLegend;
		//图表中两条及两条以上数据列才显示图例说明
		if(name.split(",").length>1){
			showLegend = true;
		}else{
			showLegend = false;
		}
		$.post('<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',{
			from: <portlet:namespace />times1.join(),
			name: name,
			id: id,
			ispd: ispd,
			decimals: <portlet:namespace />areaEctDecimals,
			type: choose_type,
			build_id: holo_cur_build,
			region_id: tag == "co2" ? r_region_id : holo_cur_floor
		},function(data){
			var newLegendList = []; //用来保存新生成的个性图例说明列
			var cataList = data.expExcelCataList[0]; //存储x轴上的标识列
			var dataList = data.dataList; //获取各数据列信息
			var len = data.cataList.length;
			//根据类别个数个性化定义x轴标签,获取x轴显示信息，取个数多的显示
			for(var i = 0 ;i<data.expExcelCataList.length;i++){
				if(cataList.length<data.expExcelCataList[i].length){
					cataList = data.expExcelCataList[i];
				}
			}
			//截取数据列中的数据，防止数据过多
			for(var num = 0 ; num <dataList.length ; num++){
				if(dataList[num].length>len){
					dataList[num] = dataList[num].slice(0,len);
				}
			}
			if(choose_type == 'day'){
				//设置图例说明列
				for(var i = 0 ; i<name.split(",").length;i++){
					if(legendList.length>i){
						newLegendList.push(legendList[i]);
					}else{
						newLegendList.push("series" + (i+1));
					}
				}
			}else if(choose_type == 'week'){
				var cataList = data.cataList;//获取x轴显示内容
				//居中标题的值
				centerTitle = c_title + "-" + data.cataList[0].substring(0,2) + "-" + data.cataList[0].substring(3) + "~"
				  + c_title + "-" + data.cataList[data.cataList.length-1].substring(0,2) + "-" + data.cataList[data.cataList.length-1].substring(3);
				// 往后台返回的X轴列表中添加周一~周日
				var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
				 //设置图例说明列
				for(var i = 0 ; i<name.split(",").length;i++){
					if(legendList.length>i){
						newLegendList.push(legendList[i]);
					}else{
						newLegendList.push("series" + (i+1));
					}
				}
				//给每个 图例说明添加周信息
				for(var i=0;i<cataList.length;i++){
					finalCataList.push(cataList[i]+cList[i]);
				}
					cataList = finalCataList;
			}else{
				//设置图例说明列
				for(var i = 0 ; i<name.split(",").length;i++){
					if(legendList.length>i){
						newLegendList.push(legendList[i]);
					}else{
						newLegendList.push("series" + (i+1));
					}
				}
			}
			//通过tag标记来设置不同图表的居中标题
			if(tag == "floor"){
				if(<portlet:namespace />define_mark == 1){
					$(".ect_time").html(centerTitle);
				}else if(<portlet:namespace />define_mark == 2){
					$(".co2_time").html(centerTitle);
				}
			}else{
				if(choose_type == 'week'){
					centerTitle = centerTitle.substring(2,4) + "/" + centerTitle.substring(5,7) + "/"
								  + centerTitle.substring(8,11) + centerTitle.substring(16,18) + "/" + centerTitle.substring(19);
					$(".today").html(centerTitle);
					
				}else{
					$(".today").html(centerTitle);
				}
			}
		/*
		 *渲染图表
		 *该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToCharts.js中，用来生成图表
		*/
		autoRenderToMoreCharts(chartId,// 对应的渲染位置 
			chartType1 + "," + chartType2,//图表类型
			bg_color,//图表绘图区域背景颜色
			name.split(",").length,//获取选取name的个数
			xStep,//X轴间隔
			"",// 居中标题
			gridLineStyle,//图表中线的样式
			symbol, // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
			lineWidth, // 线宽，此为具体曲线点的点线宽
			connLineWidth, // 连接线线宽，为空则默认为2，为0则不显示连接线										
			leftTitle,//Y轴左侧标题
			rightTitle,//Y轴右侧标题
			showLegend,//是否显示图例说明
			showX,//是否显示X轴网格线
			showY,//是否显示Y轴网格线
			newLegendList,//图例说明
			colorList, //颜色列表
			dataList,//数据列表
			fill_color,//填充颜色列表
			radiusList,//曲线点半径列表
			ySymbol, //Y轴单位
			yAxisList,//Y轴数据列表
			cataList);//X轴数据信息
 	  }, 'json');
	}
	
	// 获取报表视图数据
	function <portlet:namespace />getForm(name,id,ispd,start_date,choose_type,commonColumn,dayColumn){
		$(".equipment_time").html(<portlet:namespace />centerTitle3);
		$.post(
			'<portlet:resourceURL id="getReportDataList"></portlet:resourceURL>',
			{
				name:name, // 设置name
				id:id,	// 设置id
				ispd:ispd,	// 设置ispd
				from:start_date, // 设置开始时间
				type:choose_type, // 设置选择类型
			},function(data){
				var showCataList = data.showCataList; // 保存表头信息
				var showDataList = data.showDataList; // 保存内容数据
			 	// 生成表格
				var html = "<table><thead>"; 
				var firstRow = "<tr><th>日期</th>"; // 表头信息部分
				var content = ""; // 表格内容部分
				
				if(choose_type == "day"){
					firstRow += '<th>' + dayColumn + '</th>';
				}
				var len = commonColumn.length;
				if(len>showDataList.length){
					len = showDataList.length
				}
				//循环添加内容数据
				for(var i = 0 ;i<showCataList[0].length;i++){
					content +="<tr>" + (choose_type == "day"?("<td>" + start_date + "</td>"):"") + "<td>" + showCataList[0][i] + "</td>";
					for(var j = 0;j<len;j++){
						content += '<td>'+ (showDataList[j][i] != undefined ? showDataList[j][i] : '') 
						+'</td>';
					}
					content +="</tr>";
				}
				
				// 添加表头信息
				for(var i = 0;i<len;i++){
					firstRow += '<th>'+commonColumn[i]+'</th>';
				}
				firstRow += '</tr>';
				html = html + firstRow + "</thead>"+ content;
				html += '</table>';
				$("#<portlet:namespace />equipmentChart").html("");
				$("#<portlet:namespace />equipmentChart").html(html);
			},'json');
	}
	
	/*
	 *获取标记，通过该标记可以得到所选标签是第几个，以此为依据给不同图表赋不同的值
	*/
	function <portlet:namespace />getIndex(index){
		<portlet:namespace />define_mark = index;
	}

	// 全息图-层参数-选择时间的事件
	function <portlet:namespace />floorDate(type, index){
		var dformt='yyyy-MM-dd',titleFormat='yyyy-MM-dd';
		<portlet:namespace />define_mark = index;
		//获取XStep信息,用于日视图
		if(<portlet:namespace />define_mark == 1){
			<portlet:namespace />floorEctXStep = '${tbinfo.floorEctXStep}';
		}else if(<portlet:namespace />define_mark == 2){
			<portlet:namespace />floorCo2XStep = '${tbinfo.floorCo2XStep}';
		}
		
		//根据所选视图类型，确定居中标题样式
		if(type=='week'){
			if(<portlet:namespace />define_mark == 1){
				<portlet:namespace />floorEctXStep = '1';
			}else if(<portlet:namespace />define_mark == 2){
				<portlet:namespace />floorCo2XStep = '1';
			}
		}else if(type=='month'){
			dformt='MM';
			titleFormat='yyyy-MM'; //设置居中标题日期样式
			if(<portlet:namespace />define_mark == 1){
				<portlet:namespace />floorEctXStep = '${tbinfo.floorEctXStep}';
			}else if(<portlet:namespace />define_mark == 2){
				<portlet:namespace />floorCo2XStep = '${tbinfo.floorCo2XStep}';
			}
		}
		
		WdatePicker({
			position:{left:80},
			el:'<portlet:namespace />floorTime',
			dateFmt:dformt,
			onpicked:function(dp){
				var _time = dp.cal;
				if(<portlet:namespace />define_mark == 1){
					<portlet:namespace />floorStart_date1 = _time.getDateStr('yyyy-MM-dd'); //设置开始时间
					<portlet:namespace />exp_start_date1 = _time.getDateStr('yyyy-MM-dd'); //导出excel的开始时间 
					<portlet:namespace />floorChoose_type1 = type; //设置选择类型
					//为居中标题赋值 
					<portlet:namespace />centerTitle1 = dp.cal.getDateStr(titleFormat);
					<portlet:namespace />c_title1 = dp.cal.getDateStr("yyyy"); //保存年份信息
				}else if(<portlet:namespace />define_mark == 2){
					<portlet:namespace />floorStart_date2 = _time.getDateStr('yyyy-MM-dd'); //设置开始时间
					<portlet:namespace />exp_start_date2 = _time.getDateStr('yyyy-MM-dd'); //导出excel的开始时间 
					<portlet:namespace />floorChoose_type2 = type; //设置选择类型
					//为居中标题赋值 
					<portlet:namespace />centerTitle2 = dp.cal.getDateStr(titleFormat);
					<portlet:namespace />c_title2 = dp.cal.getDateStr("yyyy"); //保存年份信息
				}else{
					<portlet:namespace />floorStart_date3 = _time.getDateStr('yyyy-MM-dd'); //设置开始时间
					<portlet:namespace />exp_start_date3 = _time.getDateStr('yyyy-MM-dd'); //导出excel的开始时间 
					<portlet:namespace />floorChoose_type3 = type; //设置选择类型
					//为居中标题赋值 
					if(type == 'week'){
						<portlet:namespace />centerTitle3 = showWeekFirstDay(_time.getDateStr('yyyy-MM-dd')) + "~" + showWeekLastDay(_time.getDateStr('yyyy-MM-dd'));
					}else{
						<portlet:namespace />centerTitle3 = dp.cal.getDateStr(titleFormat);	
					}
				}
				
				//获取相应时间段的各图表信息
				<portlet:namespace />getFloorParamsData(<portlet:namespace />define_mark); // 获取层用电量及温度右侧的最大、最小、平均值
				if(<portlet:namespace />define_mark == 1){
					//层用电量及温度图表
					<portlet:namespace />getGraphChart("floor",<portlet:namespace />chartRender1,<portlet:namespace />floor_ectName,<portlet:namespace />floor_ectId,
							 <portlet:namespace />floor_ectIspd,<portlet:namespace />floorEctBg_color,<portlet:namespace />floorEctFill_color,
							 <portlet:namespace />floorEctConnLine,<portlet:namespace />floorEctLegendList,<portlet:namespace />floorEctColorList,
							 <portlet:namespace />floorEctDecimals,<portlet:namespace />floorEctLineWidth,<portlet:namespace />floorEctXStep,
						     <portlet:namespace />floorEctChartType1, <portlet:namespace />floorEctChartType2,<portlet:namespace />floorEctShowX,
						     <portlet:namespace />floorEctShowY,<portlet:namespace />floorEctLeftTitle,<portlet:namespace />floorEctRightTitle,
						     <portlet:namespace />floorEctYSymbol,<portlet:namespace />floorEctRadius,<portlet:namespace />floorEctSymbol,
						     <portlet:namespace />floorEctGridStyle,<portlet:namespace />floorEctYAxis,<portlet:namespace />centerTitle1,
						     <portlet:namespace />c_title1,<portlet:namespace />floorStart_date1,<portlet:namespace />floorChoose_type1);
				}else if(<portlet:namespace />define_mark == 2){
					// 层Co2浓度图表
		 			if("${tbinfo.isShowCo2}" == "block") { // 配置了层Co2浓度图表显示
		 				<portlet:namespace />getGraphChart("floor",<portlet:namespace />chartRender2,<portlet:namespace />floor_Co2Name,<portlet:namespace />floor_Co2Id,
								 <portlet:namespace />floor_Co2Ispd,<portlet:namespace />floorCo2Bg_color,<portlet:namespace />floorCo2Fill_color,
								 <portlet:namespace />floorCo2ConnLine,<portlet:namespace />floorCo2LegendList,<portlet:namespace />floorCo2ColorList,
								 <portlet:namespace />floorCo2Decimals,<portlet:namespace />floorCo2LineWidth,<portlet:namespace />floorCo2XStep,
							     <portlet:namespace />floorCo2ChartType1, <portlet:namespace />floorCo2ChartType2,<portlet:namespace />floorCo2ShowX,
							     <portlet:namespace />floorCo2ShowY,<portlet:namespace />floorCo2LeftTitle,<portlet:namespace />floorCo2RightTitle,
							     <portlet:namespace />floorCo2YSymbol,<portlet:namespace />floorCo2Radius,<portlet:namespace />floorCo2Symbol,
							     <portlet:namespace />floorCo2GridStyle,<portlet:namespace />floorCo2YAxis,<portlet:namespace />centerTitle2,
							     <portlet:namespace />c_title2,<portlet:namespace />floorStart_date2,<portlet:namespace />floorChoose_type2);
		 			}
				//}else{
					//层设备列表
					//<portlet:namespace />getForm(<portlet:namespace />equipment_name,<portlet:namespace />equipment_id,
					//		 <portlet:namespace />equipment_ispd,<portlet:namespace />floorStart_date3,<portlet:namespace />floorChoose_type3,
					//		 <portlet:namespace />equipment_colName,<portlet:namespace />dayColumn);
				}
			}
		});
	}
	
	// 获取层参数右侧的最大、最小、平均值
	function <portlet:namespace />getFloorParamsData(mark) {
		var starttime = <portlet:namespace />floorStart_date1, type = <portlet:namespace />floorChoose_type1, name = '', id = '', ispd = '';
		if(mark == '1') { // 层用电量及温度
			starttime = <portlet:namespace />floorStart_date1;
			type = <portlet:namespace />floorChoose_type1;
			name = f_ele_name; // + ',' + f_temp_name;
			id = (holo_cur_floor + "_" + holo_cur_build); // + ',' + (holo_cur_floor + "_" + holo_cur_build);
			ispd = f_ele_ispd; // + ',' + f_temp_ispd;
		} else if(mark == '2') {
			starttime = <portlet:namespace />floorStart_date2;
			type = <portlet:namespace />floorChoose_type2;
			name = f_co2_name;
			id = (holo_cur_floor + "_" + holo_cur_build);
			ispd = f_co2_ispd;
		}
		$.ajax({
			type : "POST",
			url : "<portlet:resourceURL id='getDatasForNamesAndAtts'></portlet:resourceURL>",
			data : {
				from : starttime,
				name : name,
				id : id,
				ispd : ispd,
				att : 'max,min,average',
				type : type,
				decimals: <portlet:namespace />floorEctDecimals,
				build_id: holo_cur_build,
				region_id: holo_cur_floor
			},
			success : function(result) {
				var data = result.data;
				var elemaxtime = '', elemintime = '', w_text = '日'; //, tempmaxtime = '', tempmintime = ''
				if(<portlet:namespace />areaChoose_type == 'day'){
					if( mark == '1' ) { // 层用电量及温度
						elemaxtime = data[0][0][1].substring(11, 16);
						elemintime = data[0][1][1].substring(11, 16);
						//tempmaxtime = data[1][0][1].substring(11, 16);
						//tempmintime = data[1][1][1].substring(11, 16);
					}
					w_text = '日';
				} else {
					if( mark == '1' ) { // 层用电量及温度
						elemaxtime = data[0][0][1].substring(5);
						elemintime = data[0][1][1].substring(5);
						//tempmaxtime = data[1][0][1].substring(5);
						//tempmintime = data[1][1][1].substring(5);
					}
					if(<portlet:namespace />areaChoose_type == 'week'){
						w_text = '周';
					} else if(<portlet:namespace />areaChoose_type == 'month'){
						w_text = '月';
					} else if(<portlet:namespace />areaChoose_type == 'year'){
						w_text = '年';
					}
				}
				
				if( mark == '1' ) { // 层用电量及温度
					
					$(".floor_top_params tr td > span").text(w_text); // 文字 
					// 最大、最小、平均区域用电
					$(".floor_top_params > tr:eq(0) > td:eq(1)").text(parseFloat(data[0][0][0])); // 最大用电量
					$(".floor_top_params > tr:eq(0) > td:eq(3)").text(elemaxtime); // 最大用电量对应的时间
					$(".floor_top_params > tr:eq(1) > td:eq(1)").text(parseFloat(data[0][1][0])); // 最小用电量
					$(".floor_top_params > tr:eq(1) > td:eq(3)").text(elemintime); // 最小用电量对应的时间
					$(".floor_top_params > tr:eq(2) > td:eq(1)").text(parseFloat(data[0][2][0])); // 平均用电量
					// 最大、最小、平均区域温度
					//$(".floor_top_params > tr:eq(3) > td:eq(1)").text(parseFloat(data[1][0][0])); // 最高层温度
					//$(".floor_top_params > tr:eq(3) > td:eq(3)").text(tempmaxtime); // 最高层温度对应的时间
					//$(".floor_top_params > tr:eq(4) > td:eq(1)").text(parseFloat(data[1][1][0])); // 最低层温度
					//$(".floor_top_params > tr:eq(4) > td:eq(3)").text(tempmintime); // 最低层温度对应的时间
					//$(".floor_top_params > tr:eq(5) > td:eq(1)").text(parseFloat(data[1][2][0])); // 平均层温度
					
				} else if( mark == '2' ) {
					
					// 最大、最小、平均区域CO2浓度 
					$(".floor_top_co2 tr td > span").text(w_text); // 文字 
					$(".floor_top_co2 > tr:eq(0) > td:eq(1)").text(parseFloat(data[0][0][0])); // 最大用电量
					$(".floor_top_co2 > tr:eq(0) > td:eq(3)").text(elemaxtime); // 最大用电量对应的时间
					$(".floor_top_co2 > tr:eq(1) > td:eq(1)").text(parseFloat(data[0][1][0])); // 最小用电量
					$(".floor_top_co2 > tr:eq(1) > td:eq(3)").text(elemintime); // 最小用电量对应的时间
					$(".floor_top_co2 > tr:eq(2) > td:eq(1)").text(parseFloat(data[0][2][0])); // 平均用电量
					
				}
			},
			error : function(result) {
				console.log('getLeftRegionData + error');
			}
		});
	};
	
	// 区域参数，选择时间触发的事件 
	function <portlet:namespace />areaDate(type){
		
		if($("#choose_region").find("option").length == 0) { // 如果区域下拉列表为空，则不允许选择时间 
			return false;
		}
		
		var dformt='yyyy-MM-dd',titleFormat='yyyy-MM-dd';
		//获取XStep信息,用于日视图
		<portlet:namespace />areaEctXStep = '${tbinfo.areaEctXStep}';
		<portlet:namespace />areaCo2XStep = '${tbinfo.areaCo2XStep}';
		
		//根据所选视图类型，确定居中标题样式
		if(type=='week'){
			<portlet:namespace />areaEctXStep = '1';
			<portlet:namespace />areaCo2XStep = '1';

		}else if(type=='month'){
			dformt='MM';
			titleFormat='yyyy-MM'; //设置居中标题日期样式
			<portlet:namespace />areaEctXStep = '${tbinfo.areaEctXStep}';
			<portlet:namespace />areaCo2XStep = '${tbinfo.areaCo2XStep}';
		}
		
		WdatePicker({
			el:'<portlet:namespace />areaTime',
			dateFmt:dformt,
			onpicked:function(dp){
				var _time = dp.cal;
				<portlet:namespace />areaStart_date = _time.getDateStr('yyyy-MM-dd'); //设置开始时间
				<portlet:namespace />exp_start_date4 = _time.getDateStr('yyyy-MM-dd'); //导出excel的开始时间 
				<portlet:namespace />areaChoose_type = type; //设置选择类型
				//为居中标题赋值 
				<portlet:namespace />areaCenterTitle = dp.cal.getDateStr(titleFormat);
				<portlet:namespace />area_c_title = dp.cal.getDateStr("yyyy"); //保存年份信息
				
				// 区域Co2浓度图表
				if($("#choose_region").find("option").length != 0) {
					 
					 // 获取区域参数左侧的最大、最小、平均值
					 <portlet:namespace />getLeftRegionData();
					 
					//区域用电量及温度图表
					if("${tbinfo.isShowRegion}" == "block") { // 配置了区域用电显示
						<portlet:namespace />getGraphChart("area",<portlet:namespace />chartRender3,<portlet:namespace />area_ectName,<portlet:namespace />area_ectId,
								 <portlet:namespace />area_ectIspd,<portlet:namespace />areaEctBg_color,<portlet:namespace />areaEctFill_color,
								 <portlet:namespace />areaEctConnLine,<portlet:namespace />areaEctLegendList,<portlet:namespace />areaEctColorList,
								 <portlet:namespace />areaEctDecimals,<portlet:namespace />areaEctLineWidth,<portlet:namespace />areaEctXStep,
							     <portlet:namespace />areaEctChartType1, <portlet:namespace />areaEctChartType2,<portlet:namespace />areaEctShowX,
							     <portlet:namespace />areaEctShowY,<portlet:namespace />areaEctLeftTitle,<portlet:namespace />areaEctRightTitle,
							     <portlet:namespace />areaEctYSymbol,<portlet:namespace />areaEctRadius,<portlet:namespace />areaEctSymbol,
							     <portlet:namespace />areaEctGridStyle,<portlet:namespace />areaEctYAxis,<portlet:namespace />areaCenterTitle,
							     <portlet:namespace />area_c_title,<portlet:namespace />areaStart_date,<portlet:namespace />areaChoose_type);
					}
					 
					//区域Co2浓度图表
					<portlet:namespace />getGraphChart("co2",<portlet:namespace />chartRender4,<portlet:namespace />area_Co2Name,<portlet:namespace />area_Co2Id,
							 <portlet:namespace />area_Co2Ispd,<portlet:namespace />areaCo2Bg_color,<portlet:namespace />areaCo2Fill_color,
							 <portlet:namespace />areaCo2ConnLine,<portlet:namespace />areaCo2LegendList,<portlet:namespace />areaCo2ColorList,
							 <portlet:namespace />areaCo2Decimals,<portlet:namespace />areaCo2LineWidth,<portlet:namespace />areaCo2XStep,
						     <portlet:namespace />areaCo2ChartType1, <portlet:namespace />areaCo2ChartType2,<portlet:namespace />areaCo2ShowX,
						     <portlet:namespace />areaCo2ShowY,<portlet:namespace />areaCo2LeftTitle,<portlet:namespace />areaCo2RightTitle,
						     <portlet:namespace />areaCo2YSymbol,<portlet:namespace />areaCo2Radius,<portlet:namespace />areaCo2Symbol,
						     <portlet:namespace />areaCo2GridStyle,<portlet:namespace />areaCo2YAxis,<portlet:namespace />areaCenterTitle,
						     <portlet:namespace />area_c_title,<portlet:namespace />areaStart_date,<portlet:namespace />areaChoose_type);
					
				}
			}
		});
	}
	
	// 获取区域参数左侧的最大、最小、平均值
	function <portlet:namespace />getLeftRegionData() {
		var name = '', id = '', ispd = '';
		if("${tbinfo.isShowRegion}" == "block") { // 配置了区域用电显示
			name = r_ele_name + "," + r_co2_name;
			id = (holo_cur_floor + "_" + holo_cur_build) + "," + r_co2_id;
			ispd = r_ele_ispd + "," + r_co2_ispd;
		} else {
			name = r_co2_name, id = r_co2_id, ispd = r_co2_ispd;
		}
		$.ajax({
			type : "POST",
			url : "<portlet:resourceURL id='getDatasForNamesAndAtts'></portlet:resourceURL>",
			data : {
				from : <portlet:namespace />areaStart_date,
				name : name,
				id : id,
				ispd : ispd,
				att : 'max,min,average',
				type : <portlet:namespace />areaChoose_type,
				decimals: <portlet:namespace />areaEctDecimals,
				build_id: holo_cur_build,
				region_id: r_region_id // holo_cur_floor
			},
			success : function(result) {
				var data = result.data;
				var elemaxtime = '', elemintime = '', w_text = '日'; // , tempmaxtime = '', tempmintime = ''
				if(<portlet:namespace />areaChoose_type == 'day'){
					elemaxtime = data[0][0][1].substring(11, 16);
					elemintime = data[0][1][1].substring(11, 16);
					//tempmaxtime = data[1][0][1].substring(11, 16);
					//tempmintime = data[1][1][1].substring(11, 16);
					w_text = '日';
				} else {
					elemaxtime = data[0][0][1].substring(5);
					elemintime = data[0][1][1].substring(5);
					//tempmaxtime = data[1][0][1].substring(5);
					//tempmintime = data[1][1][1].substring(5);
					if(<portlet:namespace />areaChoose_type == 'week'){
						w_text = '周';
					} else if(<portlet:namespace />areaChoose_type == 'month'){
						w_text = '月';
					} else if(<portlet:namespace />areaChoose_type == 'year'){
						w_text = '年';
					}
				}
				
				if("${tbinfo.isShowRegion}" == "block") { // 配置了区域用电显示
					$(".floor_region_data tr td > span").text(w_text); // 文字 
					// 最大、最小、平均区域用电
					$(".floor_region_data > tr:eq(0) > td:eq(1)").text(parseFloat(data[0][0][0])); // 最大用电量
					$(".floor_region_data > tr:eq(0) > td:eq(3)").text(elemaxtime); // 最大用电量对应的时间
					$(".floor_region_data > tr:eq(1) > td:eq(1)").text(parseFloat(data[0][1][0])); // 最小用电量
					$(".floor_region_data > tr:eq(1) > td:eq(3)").text(elemintime); // 最小用电量对应的时间
					$(".floor_region_data > tr:eq(2) > td:eq(1)").text(parseFloat(data[0][2][0])); // 平均用电量
					// 最大、最小、平均区域温度
					//$(".floor_region_data > tr:eq(3) > td:eq(1)").text(parseFloat(data[1][0][0])); // 最高层温度
					//$(".floor_region_data > tr:eq(3) > td:eq(3)").text(tempmaxtime); // 最高层温度对应的时间
					//$(".floor_region_data > tr:eq(4) > td:eq(1)").text(parseFloat(data[1][1][0])); // 最低层温度
					//$(".floor_region_data > tr:eq(4) > td:eq(3)").text(tempmintime); // 最低层温度对应的时间
					//$(".floor_region_data > tr:eq(5) > td:eq(1)").text(parseFloat(data[1][2][0])); // 平均层温度
					// 最大、最小、平均区域CO2浓度 
					$(".region_co2 tr td > span").text(w_text); // 文字 
					$(".region_co2 > tr:eq(0) > td:eq(1)").text(parseFloat(data[1][0][0])); // 最大CO2浓度
					$(".region_co2 > tr:eq(0) > td:eq(3)").text(elemaxtime); // 最大CO2浓度对应的时间
					$(".region_co2 > tr:eq(1) > td:eq(1)").text(parseFloat(data[1][1][0])); // 最小CO2浓度
					$(".region_co2 > tr:eq(1) > td:eq(3)").text(elemintime); // 最小CO2浓度对应的时间
					$(".region_co2 > tr:eq(2) > td:eq(1)").text(parseFloat(data[1][2][0])); // 平均CO2浓度
				} else {
					// 最大、最小、平均区域CO2浓度 
					$(".region_co2 tr td > span").text(w_text); // 文字 
					$(".region_co2 > tr:eq(0) > td:eq(1)").text(parseFloat(data[0][0][0])); // 最大CO2浓度
					$(".region_co2 > tr:eq(0) > td:eq(3)").text(elemaxtime); // 最大CO2浓度对应的时间
					$(".region_co2 > tr:eq(1) > td:eq(1)").text(parseFloat(data[0][1][0])); // 最小CO2浓度
					$(".region_co2 > tr:eq(1) > td:eq(3)").text(elemintime); // 最小CO2浓度对应的时间
					$(".region_co2 > tr:eq(2) > td:eq(1)").text(parseFloat(data[0][2][0])); // 平均CO2浓度
				}
			},
			error : function(result) {
				console.log('getLeftRegionData + error');
			}
		});
	};

	function <portlet:namespace />autoChooseExcelMethod(tag){
		if(tag == "floor"){
			if(<portlet:namespace />define_mark == 1){
				<portlet:namespace />graphChartToExcel(legendList,expColmnName,excelName,name,id,ispd,type);
			}else if(<portlet:namespace />define_mark == 2){
				<portlet:namespace />graphChartToExcel(legendList,expColmnName,excelName,name,id,ispd,type);
			}else{
				<portlet:namespace />graphChartToExcel(legendList,expColmnName,excelName,name,id,ispd,type);
			}
		}else{
			<portlet:namespace />graphChartToExcel(legendList,expColmnName,excelName,name,id,ispd,type);
		}
	}
	
	// 导出数据到excel
	function <portlet:namespace />graphChartToExcel(sdate,legendList,expColmnName,excelName,name,id,ispd,type) {
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date;//保存导出到excel中的时间 
		var sdateList = sdate.split(",");
		
		// 根据配置的图例个数，匹配时间个数和图例个数一致 
		var startdate = [];
		for(var i=0;i<sdateList.length;i++){
			for(var k=0;k<legendList.length;k++){
				startdate.push(sdateList[i]);
			}
		}
		sdate = startdate.join();//将每个日期对应的数据列保存
		var expColumnName = expColmnName;
		var expUrl = '';
		if(name.split(",").length>1){
			// 导出excel的Url
			expUrl = "<portlet:resourceURL id='expOutSideChartDataToExcel'></portlet:resourceURL>"
					+ "&excelName="
					+ excelName
					+ "&from="
					+ sdate
					+ "&name="
					+ name
					+ "&id="
					+ id
					+ "&ispd="
					+ ispd
					+ "&type="
					+ type
					+ "&isNotCompare="
					+ isNotCompare
					+ "&expColumnName="
					+ (expColumnName==""?excelName:expColumnName);
		}else{
			expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ excelName
				+ "&from="
				+ sdate
				+ "&name="
				+ name
				+ "&id="
				+ id
				+ "&ispd="
				+ ispd
				+ "&type="
				+ type
				+ "&isNotCompare="
				+ isNotCompare
				+ "&expColumnName="
				+ (expColumnName==""?excelName:expColumnName);
		}
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + excelName
				+ ".xls";
		$.ajax({
			type : "POST",
			url : expUrl,
			async : false,
			contentType : 'application/x-msdownload;charset=UTF-8',
			success : function(result) {
				$("#<portlet:namespace />tmpFrame").attr('src', hSrc);
			},
			error : function(result) {
				alert('error');
			}
		});
	}
</script>