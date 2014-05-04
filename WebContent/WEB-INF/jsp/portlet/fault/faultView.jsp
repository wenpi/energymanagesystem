<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2014-01-15 下午4点08分
	LastModified Date:
	Description: 故障诊断页面
 -->
<div class="div-table">
	<div class="first_layout">
			<div class="fault_tab">
				<div class="tab_menu">
					<ul>
						<li class="cur_tab">
							<div>	
								<img src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>日视图</p>
							</div>
							
						</li>
						<li>
							<div>	
								<img src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>周视图</p>
							</div>
						</li>
						<li>
							<div>	
								<img src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>月视图</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="tab_switch_group">
				<div class="fault_tab_content current">
					<div class="tab_content">
						<div class="title_block report_form ">
							<p class="block_title" id="_energyexception">能耗异常</p>
						</div>
					</div>
					<div class="fault_content">
						<div class="fault_title">
							<h5 id="todayTime">2013-09-01</h5>			
							<p>预计损失&nbsp;&nbsp;&nbsp;<strong>20,500</strong>&nbsp;&nbsp;&nbsp;元</p>
							<p>今日共发生能耗异常&nbsp;&nbsp;&nbsp;<strong class="fault_count">0</strong>&nbsp;&nbsp;&nbsp;次</p>
						</div>
						<div class="each_fault">
							<div class="no_fault">
								<div class="no_fault_icon"></div>
								<div class="no_fault_word">暂无故障</div>
							</div>
							<table>
								<thead>
									<tr>
										<th>故障描述1</th>
										<th>预估损失</th>
										<th>持续时间</th>
										<th>时间轴</th>
										<th>故障对象</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>建筑总用电异常</td>
										<td>3000元</td>
										<td>8h</td>
										<td>fff</td>
										<td><i class="icon_warning"></i><span class="build_number">A1楼</span><i class="icon_start"></i></td>
									</tr>
									<tr>
										<td>建筑总用电异常</td>
										<td>3000元</td>
										<td>8h</td>
										<td></td>
										<td><i class="icon_warning"></i><span class="build_number">A1楼</span><i class="icon_start"></i></td>
									</tr>
									<tr>
										<td>建筑总用电异常</td>
										<td>3000元</td>
										<td>8h</td>
										<td></td>
										<td><i class="icon_warning"></i><span class="build_number">A1楼</span><i class="icon_start"></i></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td>日横坐标</td>
										<td></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<div class="tab_content">
						<div class="title_block report_form ">
							<p class="block_title" id="_devices">设备故障</p>
						</div>
					</div>
					<div class="fault_content">
						<div class="fault_title">
							<h5 id="todayTime1">2013-09-01</h5>			
							<p>预计损失&nbsp;&nbsp;&nbsp;<strong>21,050</strong>&nbsp;&nbsp;&nbsp;元</p>
							<p>今日共发生能耗异常&nbsp;&nbsp;&nbsp;<strong class="fault_count">3</strong>&nbsp;&nbsp;&nbsp;次</p>
						</div>
						<div class="each_fault">
							<table>
								<thead>
									<tr>
										<th>故障描述</th>
										<th>预估损失</th>
										<th>持续时间</th>
										<th>时间轴</th>
										<th>故障对象</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>AHU同时供热供冷</td>
										<td>3000元</td>
										<td>6h</td>
										<td><div class="areaChart" id="<portlet:namespace />chart1"></div></td>
										<td><i class="icon_warning"></i><span class="build_number">T1楼AHU-1-1</span><i class="icon_start"></i></td>
									</tr>
									<tr>
										<td>AHU送风达不到设定值</td>
										<td>3000元</td>
										<td>3h</td>
										<td><div class="areaChart" id="<portlet:namespace />chart2"></div></td>
										<td><i class="icon_warning"></i><span class="build_number">T2楼AHU-1-2</span><i class="icon_start"></i></td>
									</tr>
									<tr>
										<td>冷机COP过低</td>
										<td>3000元</td>
										<td>7h</td>
										<td><div class="areaChart" id="<portlet:namespace />chart3"></div></td>
										<td><i class="icon_warning"></i><span class="build_number">冷机1#</span><i class="icon_start"></i></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td>&nbsp;</td>
										<td></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
				<div class="fault_tab_content">
					<div class="tab_content">
						<div class="title_block report_form ">
							<p class="block_title" id="_energyexception">能耗异常</p>
						</div>
					</div>
					<div class="fault_content">
						<div class="fault_title">
							<h5 id="todayTime2">2013-09-01</h5>			
							<p>预计损失&nbsp;&nbsp;&nbsp;<strong>29,010</strong>&nbsp;&nbsp;&nbsp;元</p>
							<p>本周共发生能耗异常&nbsp;&nbsp;&nbsp;<strong>0</strong>&nbsp;&nbsp;&nbsp;次</p>
						</div>
						<div class="each_fault">
							<div class="no_fault">
								<div class="no_fault_icon"></div>
								<div class="no_fault_word">暂无故障</div>
							</div>
							<table>
								<thead>
									<tr>
										<th>故障描述</th>
										<th>预估损失</th>
										<th>持续时间</th>
										<th>时间轴</th>
										<th>故障对象</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>建筑总用电异常</td>
										<td>3000元</td>
										<td>8h</td>
										<td></td>
										<td><i class="icon_warning"></i><span class="build_number">A1楼</span><i class="icon_start"></i></td>
									</tr>
									<tr>
										<td>建筑总用电异常</td>
										<td>3000元</td>
										<td>8h</td>
										<td></td>
										<td><i class="icon_warning"></i><span class="build_number">A1楼</span><i class="icon_start"></i></td>
									</tr>
									<tr>
										<td>建筑总用电异常</td>
										<td>3000元</td>
										<td>8h</td>
										<td></td>
										<td><i class="icon_warning"></i><span class="build_number">A1楼</span><i class="icon_start"></i></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td>周横坐标</td>
										<td></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<div class="tab_content">
						<div class="title_block report_form ">
							<p class="block_title" id="_devices">设备故障</p>
						</div>
					</div>
					<div class="fault_content">
						<div class="fault_title">
							<h5 id="todayTime3">2013-09-01</h5>			
							<p>预计损失&nbsp;&nbsp;&nbsp;<strong>40,010</strong>&nbsp;&nbsp;&nbsp;元</p>
							<p>本周共发生能耗异常&nbsp;&nbsp;&nbsp;<strong>0</strong>&nbsp;&nbsp;&nbsp;次</p>
						</div>
						<div class="each_fault">
							<table>
								<thead>
									<tr>
										<th>故障描述</th>
										<th>预估损失</th>
										<th>持续时间</th>
										<th>时间轴</th>
										<th>故障对象</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>建筑总用电异常</td>
										<td>3000元</td>
										<td>8h</td>
										<td></td>
										<td><i class="icon_warning"></i><span class="build_number">A1楼</span><i class="icon_start"></i></td>
									</tr>
									<tr>
										<td>建筑总用电异常</td>
										<td>3000元</td>
										<td>8h</td>
										<td></td>
										<td><i class="icon_warning"></i><span class="build_number">A1楼</span><i class="icon_start"></i></td>
									</tr>
									<tr>
										<td>建筑总用电异常</td>
										<td>3000元</td>
										<td>8h</td>
										<td></td>
										<td><i class="icon_warning"></i><span class="build_number">A1楼</span><i class="icon_start"></i></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td>周横坐标</td>
										<td></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
				<div class="fault_tab_content">
					<div class="tab_content">
						<div class="title_block report_form ">
							<p class="block_title" id="_energyexception">能耗异常</p>
						</div>
					</div>
					<div class="fault_content">
						<div class="fault_title">
							<h5>2013-09</h5>			
							<p>预计损失&nbsp;&nbsp;&nbsp;<strong>20,000</strong>&nbsp;&nbsp;&nbsp;元</p>
							<p>本月共发生能耗异常&nbsp;&nbsp;&nbsp;<strong>6</strong>&nbsp;&nbsp;&nbsp;次</p>
						</div>
						<div class="each_fault">
							<div class="fake_tr">
								<div class="th1">故障类型</div>	
								<div class="th2">故障描述</div>	
								<div class="th3">预估损失</div>	
								<div class="th4">持续时间</div>
								<div class="th5">故障时间统计</div>
							</div>
							<div class="warning"><p>建筑总能耗异常</p><div class="warning_icon_2"></div><p>×6</p></div>
							<div class="fake_tbody">
								<div class="left_table">
									<div class="fault_list">
										<ol>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
										</ul>
									</div>
								</div>
								<div class="right_chart"></div>
							</div>
							<div class="warning"><p>系统总能耗异常</p></div>
							<div class="fake_tbody">
								<div class="left_table">
									<div class="fault_list">
										<ol>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
										</ul>
									</div>
								</div>
								<div class="right_chart"></div>
							</div>
						</div>
					</div>
					<div class="tab_content">
						<div class="title_block report_form ">
							<p class="block_title" id="_devices">设备故障</p>
						</div>
					</div>
					<div class="fault_content">
						<div class="fault_title">
							<h5>2013-09</h5>			
							<p>预计损失&nbsp;&nbsp;&nbsp;<strong>20,000</strong>&nbsp;&nbsp;&nbsp;元</p>
							<p>本月共发生能耗异常&nbsp;&nbsp;&nbsp;<strong>6</strong>&nbsp;&nbsp;&nbsp;次</p>
						</div>
						<div class="each_fault">
							<div class="fake_tr">
								<div class="th1">故障类型</div>	
								<div class="th2">故障描述</div>	
								<div class="th3">预估损失</div>	
								<div class="th4">持续时间</div>
								<div class="th5">故障时间统计</div>
							</div>
							<div class="warning"><p>建筑总能耗异常</p><div class="warning_icon_2"></div><p>×6</p></div>
							<div class="fake_tbody">
								<div class="left_table">
									<div class="fault_list">
										<ol>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
										</ul>
									</div>
								</div>
								<div class="right_chart"></div>
							</div>
							<div class="warning"><p>系统总能耗异常</p></div>
							<div class="fake_tbody">
								<div class="left_table">
									<div class="fault_list">
										<ol>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
											<li><p class="fault_describe">送风温度达不到设定值</p><p class="waste_value">2,000￥</p><p class="last_time">16.75h</p></li>
										</ul>
									</div>
								</div>
								<div class="right_chart"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="second_layout">
			<div class="title_block report_form ">
				<p class="block_title">能耗异常|<span>A1</span>楼<span>总用电</span>异常</p>
				<p id="todayTime4">2013-09-01</p>
				<div class="return_btn">返回</div>
			</div>
			<div class="fault_content">
				<div class="fault_title">
					<h3>室外状态</h3>
				</div>
				<div class="chart_content" id="<portlet:namespace />outsideChart"></div>
			</div>
			<div class="fault_content yczt">
				<div class="fault_title">
					<h3>异常状态</h3>
					<div class="legend"><div class="legend1"></div><span>故障</span></div>
				</div>
				<div class="chart_content">
					<div class="perch"></div>
					<table>
						<tbody>
							<tr>
								<td>总用电</td>
								<td><div id="<portlet:namespace />eleChart" class="expChart"></div></td>
							</tr>
							<tr>
								<td>空调系统用电</td>
								<td><div id="<portlet:namespace />ahuChart" class="expChart"></div></td>
							</tr>
							<tr>
								<td>照明系统用电</td>
								<td><div id="<portlet:namespace />lightSysChart" class="expChart"></div></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td>时间轴</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div class="fault_content fjzt">
				<div class="fault_title">
					<h3>风机状态</h3>
					<div class="legend">
						<div class="time_line">
							<div class="chart_dot"></div>
							<div class="chart_line 0_2"></div>
							<div class="chart_dot"></div>
						</div>
						<span>开</span>
					</div>
				</div>
				<div class="chart_content">
					<div class="perch"></div>
					<table>
						<tbody>
							<tr>
								<td>送风机</td>
								<td>
									<div class="time_line">
										<div class="chart_dot"></div>
										<div class="chart_line 0_2"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 2_4"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 4_6"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 6_8"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 8_10"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 10_12"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 12_14"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 14_16"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 16_18"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 18_20"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 20_22"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 22_24"></div>
										<div class="chart_dot"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td>送风机</td>
								<td>
									<div class="time_line">
										<div class="chart_dot"></div>
										<div class="chart_line 0_2">
											<div></div>
											<div></div>
											<div></div>
											<div></div>
											<div></div>
											<div></div>
											<div></div>
											<div></div>
											<div></div>
											<div></div>
											<div></div>
											<div></div>
										</div>
										<div class="chart_dot"></div>
										<div class="chart_line 2_4"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 4_6"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 6_8"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 8_10"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 10_12"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 12_14"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 14_16"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 16_18"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 18_20"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 20_22"></div>
										<div class="chart_dot"></div>
										<div class="chart_line 22_24"></div>
										<div class="chart_dot"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="time_roller"><div>0:00</div><div>2:00</div><div>4:00</div><div>6:00</div><div>8:00</div><div>10:00</div><div>12:00</div><div>14:00</div><div>16:00</div><div>18:00</div><div>20:00</div><div>22:00</div><div>24:00</div></div>
				</div>
			</div>
			<div class="fault_content">
				<div class="fault_title">
					<h3>总体及系统用电</h3>
				</div>
				<div class="chart_content"></div>
			</div>
			<div class="fault_content">
				<div class="fault_title">
					<h3>设备组用电</h3>
				</div>
				<div class="chart_content"></div>
			</div>

		</div>
</div>
<script type="text/javascript">
	$('#todayTime').text(_todayTime);
	$('#todayTime1').text(_todayTime);
	$('#todayTime2').text(_todayTime);
	$('#todayTime3').text(_todayTime);
	$('#todayTime4').text(_todayTime);
	
	var list1 = [2,2,null,2,2,null,2,2,2,null,2,2];
	var list2 = [null,2,null,2,2,null,2,2,2,null,2,2];
	var list3 = [null,2,2,null,2,2,2,null,2,null,2,2];
	
	var arr1 = [], arr2 = [], arr3 = [];
	for(var i=0;i<288;i++){
		arr1.push((i % 4 == 0 || i % 9 == 5) ? null : 2);
		arr2.push((i % 3 == 1 || i % 8 == 4) ? null : 2);
		arr3.push((i % 5 == 2 || i % 7 == 3) ? null : 2);
	};
	buildAreaChart('<portlet:namespace />chart1', list1, '#33CCFF');
	buildAreaChart('<portlet:namespace />chart2', list2, '#FF9933');
	buildAreaChart('<portlet:namespace />chart3', list3, '#33CCFF'); 
	
	// 点击“故障对象”后显示的内容 
	function shouExpInfo() {
		var name = 'S7_temp_display_OUTDOOR_TEMP,S7_temp_display_OUTDOOR_HUMIDITY';
		var id = 'chiller,chiller', ispd = '3,3';
		<portlet:namespace />getOutSideChart(_todayTime,name,id,ispd);
		
		buildAreaChart('<portlet:namespace />eleChart', arr1, '#FF9933'); // 异常状态--总用电
		buildAreaChart('<portlet:namespace />ahuChart', arr2, '#FF9933'); // 异常状态--空调系统用电
		buildAreaChart('<portlet:namespace />lightSysChart', arr3, '#FF9933'); // 异常状态--照明系统用电
	}
	
	/**
	 * 异步获取室外状态图表数据
	 */
	function <portlet:namespace />getOutSideChart(tfrom,name,id,ispd) {
		$
				.post(
						'<portlet:resourceURL id="getMoreChartsByNames"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							type : 'day'
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							// if (<portlet:namespace />choose_type1 == "week") {
							// 	// 居中标题的值
							// 	<portlet:namespace />centerTitle1 = <portlet:namespace />c_title1 + "/" + data.cataList[0] + "~~" + <portlet:namespace />c_title1 + "/" + data.cataList[data.cataList.length-1];
							// 	// 往后台返回的X轴列表中添加周一~周日
							// 	var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
							// 	for(var i=0;i<cataList.length;i++){
							// 		finalCataList.push(cataList[i]+cList[i]);
							// 	}
							// 	cataList = finalCataList;
							// }
							
							// 为 室外状态，报表填充
							var chartLegendList = ["室外温度", "室外湿度"];
							var chartColorList = ['#8C73AB', '#59B2CA'];
							var chartFillColorList = ['#8C73AB', '#59B2CA'];
							var chartRadiusList = [1, 1];
							var chartSymbolList = ['circle','circle'];
							var chartYAxisList = [0, 1];
							
							renderToTwoChart("<portlet:namespace />outsideChart",
												"line", 4, "", "", "", "温度(℃)", "湿度(%)",
												"", "", "", chartLegendList,
												chartColorList, dataList,
												chartFillColorList, chartRadiusList,
												chartSymbolList, chartYAxisList, cataList);

						}, 'json');
	}
</script>