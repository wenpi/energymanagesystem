<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-11-22 上午9点49分
	LastModified Date:
	Description: 第二版能源产品-报表管理-计量报表
 -->

<div class="div-table ">
	<div class="measure_content">
		<div id="main" class="measure_main">
			<div>
				<div class="title_block report_form" id="_measurereport">
					<p class="block_title">计量报表</p>
					<div class="table_chart_switch" id="measure_table">
						<div class="chart_switch_btn btn_press" id="<portlet:namespace />picView">
							<i class="icon_chart"></i>
							<p>图形视图</p>
						</div>
						<div class="chart_switch_btn" id="<portlet:namespace />tableView">
							<i class="icon_table"></i>
							<p>表格视图</p>
						</div>
					</div>
				</div>
				<div class="tab report_page_tab jlbb">
					<div class="tab_menu">
						<ul>
							<li class="cur_tab">
								<div>
									<img
										src="${pageContext.request.contextPath}/secondstyle/images/dot.png" />
									<p>电表</p>
								</div>

							</li>
							<li>
								<div>
									<img
										src="${pageContext.request.contextPath}/secondstyle/images/dot.png" />
									<p>水表</p>
								</div>
							</li>
							<li>
								<div>
									<img
										src="${pageContext.request.contextPath}/secondstyle/images/dot.png" />
									<p>能量表</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="tab_content current">
						<div class="detail">
							<div>
								<h1>电表数据</h1>
							</div>
							<div style="overflow: auto; height: 638px;">
								<ul id="<portlet:namespace />ele_tree_data" animate="true" class="easyui-tree"></ul>
							</div>
						</div>
						<div class="charts">
							<div class="chart">
								<div class="look_other">
									<div class="filter_widget">
										<div class="filter_label has_border_radius_left">选择频率</div>
										<select class="selectpicker">
											<option>5分钟</option>
											<option selected="selected">1小时</option>
											<option>1天</option>
										</select>
									</div>
									<div class="filter_widget">
										<div class="filter_label has_border_radius_left">选择日期</div>
										<input type="text" id="<portlet:namespace />start_ele" class="input_height" onclick="<portlet:namespace />selectdate('start_ele')"/> <span class="to">至</span> <input
											type="text" id="<portlet:namespace />end_ele" class="input_height" onclick="<portlet:namespace />selectdate('end_ele')"/>
									</div>
									<div class="tool_groupt">
										<div class="has_border_radius_left search_btn" onclick="searchData()"></div>
										<div class="has_border_radius_right downLoad_btn" onclick=""></div>
									</div>
								</div>
								<div class="sub_content chart_height" id="<portlet:namespace />ele_chart_div" style="display: block;"></div>
								<div class="sub_content table_content" style="height: 677px;">
									<div id="<portlet:namespace />reportdiv" ></div>
									<div class="measure_zoom_mask" style="height: 676px;">
										<div class="magnify"></div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="tab_content">
						<div class="detail">
							<div>
								<table>
									<caption>建筑总123123能耗分项</caption>
									<tbody>
										<tr>
											<td class="subtitle" colspan="1">与昨日相比</td>

										</tr>
										<tr>
											<td>总用电</td>
											<td><span>↓ </span>5<sup>kgce</sup></td>
										</tr>
										<tr>
											<td>总用水</td>
											<td><span>↓ </span>12<sup>kgce</sup></td>
										</tr>
										<tr>
											<td>总用气</td>
											<td><span>↓ </span>2<sup>kgce</sup></td>
										</tr>
										<tr>
											<td>其他能耗</td>
											<td><span>↓ </span>10<sup>kgce</sup></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="charts">
							<div class="chart">
								<div class="look_other">
									<!-- <label class="now_data">2013-09-02</label>
								<div class="date_comparer">
									<input type="text" class="comp_data" value="2013-06-01"/>
									<span class="comp_btn">加入对比</span>
								</div>
								<div class="download"></div> -->
									<div class="filter_widget">
										<div class="filter_label has_border_radius_left">选择建筑</div>
										<select class="selectpicker">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
										</select>

									</div>
									<div class="filter_widget">
										<div class="filter_label has_border_radius_left">选择类型</div>
										<select class="selectpicker">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
										</select>
									</div>
									<div class="filter_widget">
										<div class="filter_label has_border_radius_left">选择日期</div>
										<input type="text" /> <span class="to">至</span> <input
											type="text" />
									</div>
									<div class="tool_groupt">
										<div class="has_border_radius_left search_btn"></div>
										<div class="has_border_radius_right downLoad_btn"></div>
									</div>
								</div>
								<div class="sub_content chart_content"></div>
								<div class="sub_content table_content">
									<table>
										<thead>
											<tr>
												<th>日期</th>
												<th>时间</th>
												<th>建筑总用电(kWh)</th>
												<th>建筑总用气(m<sup>3</sup>)
												</th>
												<th>建筑总用水(t)</th>
												<th>建筑总能耗(kgce)</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
										</tbody>
									</table>
									<div class="zoom_mask">
										<div class="magnify"></div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="tab_content">
						<div class="detail">
							<div>
								<table>
									<caption>建筑总123123能耗分项</caption>
									<tbody>
										<tr>
											<td class="subtitle" colspan="1">与昨日相比</td>

										</tr>
										<tr>
											<td>总用电</td>
											<td><span>↓ </span>5<sup>kgce</sup></td>
										</tr>
										<tr>
											<td>总用水</td>
											<td><span>↓ </span>12<sup>kgce</sup></td>
										</tr>
										<tr>
											<td>总用气</td>
											<td><span>↓ </span>2<sup>kgce</sup></td>
										</tr>
										<tr>
											<td>其他能耗</td>
											<td><span>↓ </span>10<sup>kgce</sup></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="charts">
							<div class="chart">
								<div class="look_other">
									<!-- <label class="now_data">2013-09-02</label>
								<div class="date_comparer">
									<input type="text" class="comp_data" value="2013-06-01"/>
									<span class="comp_btn">加入对比</span>
								</div>
								<div class="download"></div> -->
									<div class="filter_widget">
										<div class="filter_label has_border_radius_left">选择建筑</div>
										<select class="selectpicker">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
										</select>

									</div>
									<div class="filter_widget">
										<div class="filter_label has_border_radius_left">选择类型</div>
										<select class="selectpicker">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
										</select>
									</div>
									<div class="tool_groupt">
										<div class="has_border_radius_left search_btn"></div>
										<div class="has_border_radius_right downLoad_btn"></div>
									</div>
								</div>
								<div class="sub_content chart_content"></div>
								<div class="sub_content table_content">
									<table>
										<thead>
											<tr>
												<th>日期</th>
												<th>时间</th>
												<th>建筑总用电(kWh)</th>
												<th>建筑总用气(m<sup>3</sup>)
												</th>
												<th>建筑总用水(t)</th>
												<th>建筑总能耗(kgce)</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
											<tr>
												<td>2013-09-01</td>
												<td>00:00</td>
												<td>100</td>
												<td>0</td>
												<td>25</td>
												<td>82</td>
											</tr>
										</tbody>
									</table>
									<div class="zoom_mask">
										<div class="magnify"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div id="measure_mask" class="report_mask">
			<div class="dialog-popover dialog-zoomin-table">
				<div class="dialog-header">
					<h3></h3>
					<div class="dialog-cancel_btn"></div>
				</div>
				<div class="dialog-body">
					<div class="dialog-popover-btn-group">
						<div class="filter_widget tool_1">
							<div class="filter_label has_border_radius_left">选择建筑</div>
							<select class="selectpicker_2">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</div>

						<div class="filter_widget tool_2">
							<div class="filter_label has_border_radius_left">选择冷机</div>
							<select class="selectpicker_2">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</div>
						<div class="filter_widget tool_3">
							<div class="filter_label has_border_radius_left">选择类型</div>
							<select class="selectpicker_2">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</div>
						<div class="filter_widget tool_4">
							<div class="filter_label has_border_radius_left">选择日期</div>
							<input type="text" /> <span class="to">至</span> <input
								type="text" />
						</div>
						<div class="filter_widget tool_5">
							<div class="filter_label has_border_radius_left">选择设备</div>
							<select class="selectpicker_2">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</div>
						<div class="filter_widget tool_6">
							<div class="filter_label has_border_radius_left">选择年份</div>
							<input type="text" />
						</div>
						<div class="tool_groupt">
							<div class="has_border_radius_left search_btn"></div>
							<div class="has_border_radius_right downLoad_btn"></div>
						</div>
					</div>
					
					<div id="<portlet:namespace />magnify_report" class="repor_table"></div>
					<div class="page report_page">
						<div class="control-btn page-prev" onclick="paging('last')">&lt;上一页</div>
						<div class="control-btn page-prev" onclick="paging('next')">下一页&gt;</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input id="<portlet:namespace />datetime" type="hidden" />
</div>

<script type="text/javascript">
	var <portlet:namespace />magnifyPage = 1; // 放大的表格当前位于哪一页  
	var <portlet:namespace />magnifyList = []; // 放大的表格数据列表 
	var <portlet:namespace />treeList = []; // 左侧选择的树结构  
	var <portlet:namespace />start_date = ''; // 开始时间
	var <portlet:namespace />choose_type = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />xstep = "${measurereport.xStep}"; // x轴的间距
	var <portlet:namespace />legendList = "${measurereport.chartLegendList}";// 图例列表
	var <portlet:namespace />showLegend = false; // 默认不显示图例
	var <portlet:namespace />centerTitle = "${measurereport.centerTitle}"; //居中标题
	var <portlet:namespace />c_title = ''; // 存储居中标题对应的年份
	var <portlet:namespace />choose_name = '${measurereport.choose_name}'; // 对应的name
	var <portlet:namespace />choose_id = '${measurereport.choose_id}'; // 对应的id
	var <portlet:namespace />ispd = '${measurereport.ispd}'; // 对应的ispd
	var <portlet:namespace />exp_start_date = ''; // 存储导出的时间 
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate(id) {
		WdatePicker({
			el : '<portlet:namespace />datetime',
			dateFmt : 'yyyy-MM-dd',
			onpicked : function(dp) {
				var paretime = dp.cal.getDateStr('yyyy-MM-dd');
				$('#<portlet:namespace />' + id).val(paretime);
			}
		});
	}

	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getChart(tfrom,tto,name,id,ispd,showLegend,isNotCompare) {
		$
				.post(
						'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
						{
							from : tfrom,
							to : tto,
							name : name,
							id : id,
							ispd : ispd, 
							type : <portlet:namespace />choose_type,
							decimals : '${measurereport.decimals}' // 保留小数位数 
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							if (<portlet:namespace />choose_type == "day"){
								if(isNotCompare == "yes"){ // 如果是对比的图
									<portlet:namespace />legendList = "";
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />legendList += tfroms[i] + ((tfroms.length-1) == i ? "" : ",");
									}
								}
							} else if (<portlet:namespace />choose_type == "week") {
								if(isNotCompare == "yes"){ // 如果是对比的图 

									var _legendList = data.legendList;
									<portlet:namespace />legendList = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									for(var i=0;i<_legendList.length;i++){
										for(var k=0;k<_legendList[i].length;k++){
											<portlet:namespace />legendList += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
										}
										
										<portlet:namespace />legendList += ((_legendList.length-1) == i ? "" : ",");
									}

									// 个性需求：重新为图表的X轴赋值
									cataList = ["周一","周二","周三","周四","周五","周六","周日"];
								} else {
									// 往后台返回的X轴列表中添加周一~周日
									var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
									for(var i=0;i<cataList.length;i++){
										finalCataList.push(cataList[i]+cList[i]);
									}
									
									cataList = finalCataList;
								}
							} else if (<portlet:namespace />choose_type == "month") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									<portlet:namespace />legendList = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />legendList += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
									}
									
									// 个性需求：重新为图表的X轴赋值
									cataList = [];
									for(var k=1;k<=data.cataList.length;k++){
										cataList.push(k); 					
									}
								}
							} else if (<portlet:namespace />choose_type == "year") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									var compareyear = tfrom.substring(11,15);
									// 个性需求：重新为图表的一级标题和图例赋值
									<portlet:namespace />legendList = <portlet:namespace />c_title + "," + compareyear;
									
									// 个性需求：重新为图表的X轴赋值
									var _yearList = data.yearList;
									
									if(_yearList[0].length>=_yearList[1].length){
										cataList = _yearList[0];
									} else if(_yearList[0].length<_yearList[1].length){
										cataList = _yearList[1];
									}
								}
							}
							
							
							// 渲染图表
							var seriesList = [];

							// 获取对应的数据列表，对应图表中的图形条数 
							seriesList = returnSeriesList("${measurereport.chartType_1}",
														  "${measurereport.connectLineWidth}", // 连接线线宽，为空则默认为2，为0则不显示连接线
														  "${measurereport.lineWidth}", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
														  <portlet:namespace />legendList,
														  "${measurereport.chartColorList}", // 颜色列表
														  "${measurereport.chartFillColorList}", // 填充颜色列表
														  "${measurereport.chartRadiusList}", // 曲线点半径列表,默认为4
														  "${measurereport.symbol}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
														  "${measurereport.referencevalue}", // 参考值  
														  "${measurereport.chartType_2}", // 参考值的图表类型
														  "${measurereport.referenceLegend}", // 参考值对应的图例名称
														  "${measurereport.referenceColor}", // 参考值对应的颜色
														  dataList);
							
							// 将图表渲染到对应的位置上
							renderCompareChart("<portlet:namespace />ele_chart_div", // 对应的渲染位置
											   <portlet:namespace />centerTitle, // 居中标题
											   <portlet:namespace />xstep, // X轴间隔
											   cataList, // X轴数据列表
											   '', // 列表中的线的样式，默认为虚线
											   '${measurereport.yLeftTitle}', //  Y轴标题
											   '${measurereport.ySymbol}', // Y轴的单位
											    <portlet:namespace />showLegend == '' ? false : <portlet:namespace />showLegend, // 是否显示图例
											   "${measurereport.referenceColor}", // 参考颜色
											   seriesList);
						}, 'json');
	}

	// 默认显示当前时间,如果配置了默认时间，则显示配置的时间 
	<portlet:namespace />choose_type = "day";
	if("${measurereport.defaulttime}" == ""){
		var nowdate = new Date();
		<portlet:namespace />start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	} else {
		<portlet:namespace />start_date = "${measurereport.defaulttime}";
	}
	
	<portlet:namespace />exp_start_date = <portlet:namespace />start_date;
	<portlet:namespace />centerTitle = <portlet:namespace />start_date; //居中标题
	<portlet:namespace />getChart(<portlet:namespace />start_date,"",<portlet:namespace />choose_name,<portlet:namespace />choose_id,<portlet:namespace />ispd,<portlet:namespace />legendList,<portlet:namespace />showLegend,"no");
	
	// 导出数据到excel
	function <portlet:namespace />outputToExcel(){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date;
		var sdateList = sdate.split(",");
		if(sdateList.length>1){
			isNotCompare = "yes"; // yes表示是对比图表
		}
		var expColumnName = "${measurereport.expColumnName}";
		// 导出excel的Url
		var expUrl = "<portlet:resourceURL id='expmeasurereportDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${measurereport.title}"
				+ "&from="
				+ sdate
				+ "&name="
				+ <portlet:namespace />choose_name
				+ "&id="
				+ <portlet:namespace />choose_id
				+ "&ispd="
				+ <portlet:namespace />ispd
				+ "&type="
				+ <portlet:namespace />choose_type
				+ "&isNotCompare="
				+ isNotCompare
				+ "&decimals="
				+ '${measurereport.decimals}'
				+ "&expColumnName="
				+ (expColumnName==""?"${measurereport.title}":expColumnName);
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${measurereport.title}"
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

	// 生成图表 
	function renderCharts() {
		var cnode = $('#<portlet:namespace />ele_tree_data').tree('getChecked');
		var names = '',ids = '';
		for (var i = 0; i < cnode.length; i++) {
			ids += cnode[i].id + ",";
			names += cnode[i].text + ",";
		}
		
		// renderCharts(names.substring(0, names.length - 1), ids.substring(0, ids.length - 1),cnode.length);
		
		var tfrom = $('#<portlet:namespace />start_ele').val();
		var tto = $('#<portlet:namespace />end_ele').val();
		
		tfrom = (tfrom == "") ? returnTodayTime() : tfrom;
		tto = (tto == "") ? returnTodayTime() : tto;
		
		<portlet:namespace />centerTitle = tfrom + "~" + tto;  // 居中标题 

		// 以下是测试数据
		var names = ['electricity','electricity','electricity','electricity','electricity'],
			ids = ['acu','hvac','lighting','data_center','ahu'],
			ispds=['0','0','0','0','0'];
		var _tfrom=[],_name = [],_id = [],_ispd = [];
		if(cnode.length == 0){
			_tfrom.push(returnTodayTime());
			_name.push(<portlet:namespace />choose_name);
			_id.push(<portlet:namespace />choose_id);
			_ispd.push(<portlet:namespace />ispd);
		} else {
			for(var i=0;i<cnode.length;i++){
				_tfrom.push(tfrom);
				_name.push(names[i]);
				_id.push(ids[i]);
				_ispd.push(ispds[i]);
			}
		}
		<portlet:namespace />getChart(_tfrom.join(),tto,_name.join(),_id.join(),_ispd.join(),false,"no");
	}
	

	// 生成表格数据
	function buildTableData() {
		var cnode = $('#<portlet:namespace />ele_tree_data').tree('getChecked');
		<portlet:namespace />treeList = [],ids = [];
		for (var i = 0; i < cnode.length; i++) {
			ids.push(cnode[i].id);
			<portlet:namespace />treeList.push(cnode[i].text);
		}
		var tfrom = $('#<portlet:namespace />start_ele').val();
		var tto = $('#<portlet:namespace />end_ele').val();
		
		tfrom = (tfrom == "") ? returnTodayTime() : tfrom;
		tto = (tto == "") ? returnTodayTime() : tto;
		<portlet:namespace />start_date = tfrom;
		<portlet:namespace />centerTitle = tfrom + "~" + tto;  // 居中标题 

		// 以下是测试数据
		var names = ['electricity','electricity','electricity','electricity','electricity'],
			ids = ['acu','hvac','lighting','data_center','ahu'],
			ispds=['0','0','0','0','0'];
		var _tfrom=[],_name = [],_id = [],_ispd = [];
		if(cnode.length == 0){
			_tfrom.push(returnTodayTime());
			_name.push(<portlet:namespace />choose_name);
			_id.push(<portlet:namespace />choose_id);
			_ispd.push(<portlet:namespace />ispd);
		} else {
			for(var i=0;i<cnode.length;i++){
				_tfrom.push(tfrom);
				_name.push(names[i]);
				_id.push(ids[i]);
				_ispd.push(ispds[i]);
			}
		}

		$.post(
				'<portlet:resourceURL id="getReportDataList"></portlet:resourceURL>',
				{
					from : tfrom,
					name : _name.join(),
					id : _id.join(),
					ispd : _ispd.join(),
					to : tto,
					type : 'day',
					decimals : '0.0'
				}, function(data) {
					<portlet:namespace />magnifyList = data; // 存储对应的数据，供分页使用

					var html = returnReportHtml("");
					$('#<portlet:namespace />reportdiv').html("");
				    $('#<portlet:namespace />reportdiv').html(html);

				    html = returnReportHtml(<portlet:namespace />magnifyPage); // zzzx
					$('#<portlet:namespace />magnify_report').html("");
				    $('#<portlet:namespace />magnify_report').html(html);
				}, 'json');
	}
	
	$(function() {
		/**
		 * 电表数据 树形结构 
		 */
		$('#<portlet:namespace />ele_tree_data')
				.tree(
						{
							checkbox : true,
							url : '<portlet:resourceURL id="getCircuitTreeByBuildId"></portlet:resourceURL>',
							method : 'get',
							onCheck : function(node, checked) {
								renderCharts();
							}
						});
	});
	
	// 返回今天的时间，格式为【年-月-日】
	function returnTodayTime() {
		return new Date().getFullYear() + "-" + (new Date().getMonth()+1) + "-" + new Date().getDate();
	}
	
	// 分页函数（点击上一页、下一页触发）
	function paging(type) {
		if(type == "last") { // 上一页
			<portlet:namespace />magnifyPage = (<portlet:namespace />magnifyPage - 1 == 0) ? 1 : (<portlet:namespace />magnifyPage - 1);
		} else if(type == "next") { // 下一页
			var showCataList = <portlet:namespace />magnifyList.showCataList;
			var maxPage = Math.floor(showCataList[0].length / report_pageSize) + ((showCataList[0].length % report_pageSize) > 0 ? 1 : 0);
			<portlet:namespace />magnifyPage = (<portlet:namespace />magnifyPage + 1 > maxPage) ? maxPage : (<portlet:namespace />magnifyPage + 1);
		}
		var html = returnReportHtml(<portlet:namespace />magnifyPage); // zzzx
		$('#<portlet:namespace />magnify_report').html("");
	    $('#<portlet:namespace />magnify_report').html(html);
	}
	
	// 根据条件返回对应的html内容
	function returnReportHtml(page) {
		var showCataList = <portlet:namespace />magnifyList.showCataList;
		var showDataList = <portlet:namespace />magnifyList.showDataList;
	
		var html = '<table>'; // 最后赋值的html变量
		var firstRow = '<thead><tr><th style="text-align: center;">日期</th>'; // 第一行的数据  style="width: 70px;"
		var content = ''; // 中间的内容数据
		var commonColumnList = <portlet:namespace />treeList;
		
		// 报表的时间类型（day/week/month/year）
		var s_type = "day";
		if(s_type=="day"){ // 日报的处理方式
			firstRow += '<th style="text-align: center;">时间</th>';
		}
		// 循环添加内容数据 
		var currentSize = parseInt(page) * report_pageSize;
		var start_i = (page != "") ? ((page != 1) ? (currentSize - report_pageSize) : 0) : 0;
		var end_i = (page != "") ? (currentSize > showCataList[0].length ? showCataList[0].length : currentSize) : showCataList[0].length;
		
		for(var i = start_i ; i < end_i ; i++){
			content += "<tr align='center'>"+(s_type=="day"?("<td>" + <portlet:namespace />start_date + "</td>"):"")+"<td>"+showCataList[0][i]+"</td>";
			for(var k=0;k<commonColumnList.length;k++){
				content += '<td>'+ (showDataList[k][i] != undefined ? showDataList[k][i] : '') +'</td>';
			}
			content += "</tr>";
		}
		
		for(var i=0;i<commonColumnList.length;i++){ // 处理报表列头信息
			firstRow += '<th style="text-align: center;">'+commonColumnList[i]+'</th>';
		}
		firstRow += '</tr></thead>';
		
		return html + firstRow + content + '</table>';
	}
	
	// 查询数据 
	function searchData() {
		if($("#<portlet:namespace />picView").hasClass("btn_press")) { // 图形视图
			renderCharts();
		} else if ($("#<portlet:namespace />tableView").hasClass("btn_press")){ // 表格视图
			buildTableData();
		}
	}
</script>