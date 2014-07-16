<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<div class="detail_page">
	<div class="title_block">
		<p></p>
	</div>
	<input type="hidden" value="0"> <input type="hidden" value="0">
	<div class="fault_tab device_floor">
		<div class="tab_menu">
			<ul>
			</ul>
		</div>
	</div>
	<div class="hidden_tool">
		<span class="floor_select_block"> | <span class="floor_select">一层</span></span>
		<div class="floor_list">
			<ul>
				<li title="1F">一层</li>
				<li title="2F">二层</li>
				<li title="3F">三层</li>
				<li title="4F">四层</li>
				<li title="5F">五层</li>
				<li title="6F">六层</li>
			</ul>
		</div>
		<span class="ahu_fselect_block"> | <span class="ahu_fselect">机房</span></span>
		<div class="ahu_flist">
			<ul>
				<li title="JF">机房</li>
				<li title="B1">B1</li>
			</ul>
		</div>
		<span class="sf_fselect_block"> | <span class="sf_fselect">B1</span></span>
		<div class="sf_flist">
			<ul>
				<li title="B1">B1</li>
				<li title="F1">一层</li>
			</ul>
		</div>
		<span class="pf_fselect_block"> | <span class="pf_fselect">B1</span></span>
		<div class="pf_flist">
			<ul>
				<li title="B1">B1</li>
				<li title="F1">一层</li>
				<li title="F2">二层</li>
				<li title="JC">JC</li>
			</ul>
		</div>
		<table class="build_para_table">
			<tbody>
				<tr>
					<td>人数</td>
					<td><span>516</span><span>人</span></td>
				</tr>
				<tr>
					<td>当日耗电量</td>
					<td><span>1000</span><span>kWh</span></td>
				</tr>
				<tr>
					<td>当日耗冷量</td>
					<td><span>800</span><span>kW</span></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="tab_switch_group">

		<div class="fault_tab_content" style="display: block;">
			<div class="title_block sub_title_block">
				<p>实时状态</p>
				<span><i id="device_text">每台设备的实时状况</i></span>
			</div>
			<div class="single_tab sszt">
				<div class="single_tab_title">
					<h5>2013-09-02</h5>
					<h5>14:50</h5>
					<p>
						总数&nbsp;&nbsp;&nbsp;<strong></strong>&nbsp;&nbsp;&nbsp;台
					</p>
					<p>
						开启数&nbsp;&nbsp;&nbsp;<strong></strong>&nbsp;&nbsp;&nbsp;台
					</p>
				</div>
				<div class="each_device_list"></div>
			</div>
			<div class="title_block sub_title_block">
				<p>运行趋势</p>
			</div>
			<div class="tab">
				<div class="tab_menu">
					<input type="hidden" value="0">
					<ul style="margin-left: 54px;">
						<li class="cur_tab" onclick="tab_click(this)" id="yxtsId">
							<div>
								<img
									src="${pageContext.request.contextPath }/public/energyStatic/public/images/dot.png" />
								<p>运行台数</p>
							</div>
						</li>
						<!-- 运行负载率 -->
						<li id="excess" style="display: none;" onclick="tab_click(this)">
							<div>
								<img
									src="${pageContext.request.contextPath }/public/energyStatic/public/images/dot.png" />
								<p>运行负载率</p>
							</div>
						</li>
						<!-- <li onclick="tab_click(this)">
							<div>
								<img
									src="${pageContext.request.contextPath }/public/energyStatic/public/images/dot.png" />
								<p>运行时间</p>
							</div>
						</li>
						<li onclick="tab_click(this)">
							<div>
								<img
									src="${pageContext.request.contextPath }/public/energyStatic/public/images/dot.png" />
								<p>额定参数</p>
							</div>
						</li> -->
					</ul>
				</div>
				<div class="tab_content current">
					<div class="date_select" style="width: 82px;">
						<input type="hidden" id="seldate_sszt_yxts">
						<div class="pressive"
							onclick="selectdate('day','seldate_sszt_yxts',this)">日视图</div>
						<div onclick="selectdate('week','seldate_sszt_yxts',this)">周视图</div>
						<div class="radius"
							onclick="selectdate('month','seldate_sszt_yxts',this)">月视图</div>
					</div>
					<div class="charts">
						<div class="look_other">
							<label class="now_data">2013-09-02</label>
<!-- 							<div class="download"></div> -->
						</div>
						<div class="chart" id="detail_chart_yxts"></div>
					</div>
					<div class="detail">
						<div>
							<table>
								<caption>运行台数</caption>
								<tbody class="running_num">
									<tr>
										<td><span>日</span>最大值</td>
										<td>250</td>
										<td class="tdClass"><sup>台</sup></td>
										<td></td>
									</tr>
									<tr>
										<td><span>日</span>最小值</td>
										<td>100</td>
										<td class="tdClass"><sup>台</sup></td>
										<td></td>
									</tr>
									<tr>
										<td><span>日</span>平均值</td>
										<td>1200</td>
										<td class="tdClass"><sup>台</sup></td>
										<td></td>
									</tr>
									<tr>
										<td>总台数</td>
										<td>40</td>
										<td class="tdClass"><sup>台</sup></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<!-- 运行负载率 -->
				<div class="tab_content" style="display: none;">
					<div class="date_select" style="width: 82px;">
						<input type="hidden" id="seldate_sszt_yxfzl">
						<div class="pressive"
							onclick="selectdate('day','seldate_sszt_yxfzl',this)">日视图</div>
						<div onclick="selectdate('week','seldate_sszt_yxfzl',this)">周视图</div>
						<div class="radius"
							onclick="selectdate('month','seldate_sszt_yxfzl',this)">月视图</div>
					</div>
					<div class="charts">
						<div class="look_other">
							<label class="now_data">2013-09-02</label>
<!-- 							<div class="download"></div> -->
						</div>
						<div class="chart" id="<portlet:namespace/>chart_yxfzl"></div>
					</div>
					<div class="detail">
						<div>
							<table>
								<caption>运行负载率</caption>
								<tbody>
									<tr>
										<td><span>日</span>最大值</td>
										<td>30</td>
										<td><sup>%</sup></td>
										<td>15:35</td>
									</tr>
									<tr>
										<td><span>日</span>最小值</td>
										<td>10</td>
										<td><sup>%</sup></td>
										<td>11:15</td>
									</tr>
									<tr>
										<td><span>日</span>平均值</td>
										<td>20</td>
										<td><sup>%</sup></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="tab_content" style="display: none;">
					<div class="date_select" style="width: 82px;">
						<input type="hidden" id="seldate_sszt_yxsj">
						<div class="pressive"
							onclick="selectdate('day','seldate_sszt_yxsj',this)">日视图</div>
						<div onclick="selectdate('week','seldate_sszt_yxsj',this)">周视图</div>
						<div class="radius"
							onclick="selectdate('month','seldate_sszt_yxsj',this)">月视图</div>
					</div>
					<div class="charts">
						<div class="look_other">
							<label class="now_data">2013-09-02</label>
<!-- 							<div class="download"></div> -->
						</div>
						<div class="chart" id="chart_yxsj">
							<div>
								<span>设备1#</span>
								<div class="" id="equip_1"></div>
							</div>
							<div>
								<span>设备2#</span>
								<div class="" id="equip_2"></div>
							</div>
							<div>
								<span>设备3#</span>
								<div class="" id="equip_3"></div>
							</div>
							<div id="yxsj_table">
								<table style="margin-left: 80px; width: 430px;">
									<tr>
										<td>0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;16&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;18&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;22&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="detail">
						<div>
							<table>
								<caption>运行时间</caption>
								<tbody>
									<tr>
										<td><span>日</span>最大值</td>
										<td>250</td>
										<td class="tdClass"><sup>台</sup></td>
										<td></td>
									</tr>
									<tr>
										<td><span>日</span>最小值</td>
										<td>100</td>
										<td class="tdClass"><sup>台</sup></td>
										<td></td>
									</tr>
									<tr>
										<td><span>日</span>平均值</td>
										<td>1200</td>
										<td class="tdClass"><sup>台</sup></td>
										<td></td>
									</tr>
									<tr>
										<td>总台数</td>
										<td>40</td>
										<td class="tdClass"><sup>台</sup></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="tab_content" style="display: none;">
					<div class="charts" style="width: 638px;">
						<div class="look_other">
<!-- 							<div class="download"></div> -->
						</div>
						<div class="chart">
							<div class="edcs" id="<portlet:namespace/>chart_edcs">
								<table>
									<thead>
										<tr>
											<th width="100">设备名称</th>
											<th>额定功率（kW）</th>
											<th>额定制冷量（kW）</th>
											<th>额定蒸发温度（℃）</th>
											<th>额定冷凝温度（℃）</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
										<tr>
											<td>冷水机组1#</td>
											<td>314</td>
											<td>1583</td>
											<td>20</td>
											<td>15</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="detail">
						<div>
							<table>
								<caption>额定参数</caption>
							</table>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="detail_page_sbxq.jsp"></jsp:include>
		</div>
	</div>
	<div class="device_select_popover" style="left: 419px;">
		<input type="hidden" value="0">
		<div>
			<ul class="select_list">
				<li style="display: none;" tip="coldSite"><span>&nbsp;|&nbsp;&nbsp;</span>
					<p>冷水机组</p></li>
				<li tip="waterSystem"><span>&nbsp;|&nbsp;&nbsp;</span>
					<p>水系统</p></li>
				<li tip="coldPump"><span>&nbsp;|&nbsp;&nbsp;</span>
					<p>冷冻水泵</p></li>
				<li tip="coolPump"><span>&nbsp;|&nbsp;&nbsp;</span>
					<p>冷却水泵</p></li>
				<li tip="coolTower"><span>&nbsp;|&nbsp;&nbsp;</span>
					<p>冷却塔</p></li>
			</ul>
		</div>
	</div>
	<div class="device_select_popover" style="left: 694px;">
		<input type="hidden" value="0">
		<div>
			<ul class="select_list">
				<li style="display: none;" tip="coldSite"><span>&nbsp;|&nbsp;&nbsp;</span>
					<p>冷水机组</p></li>
				<li tip="waterSystem"><span>&nbsp;|&nbsp;&nbsp;</span>
					<p>水系统</p></li>
				<li tip="coldPump"><span>&nbsp;|&nbsp;&nbsp;</span>
					<p>冷冻水泵</p></li>
				<li tip="coolPump"><span>&nbsp;|&nbsp;&nbsp;</span>
					<p>冷却水泵</p></li>
				<li tip="coolTower"><span>&nbsp;|&nbsp;&nbsp;</span>
					<p>冷却塔</p></li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
	
	// 详细页面初始化
	function showDetails(firstN, lastN, num, curId) {
		$(".fault_tab_content > .sub_title_block").css("display", "block"); 
		$(".fault_tab_content > .tab").css("display", "block"); 
		$(".filter_widget").css("display", "block"); 
		var obj = $(".each_device_list");
		obj.empty();
		$("div").remove(".display_more");
		
		if(firstN != null) {
			// 设置详情页中的左上角文字
			$(".detail_page").attr("tip", curId);
			$(".detail_page .title_block:eq(0) > p").html('<a href="javascript: showMonitorDiv();" id="leftTitle">' + firstN + '</a>&nbsp;&nbsp;|&nbsp;&nbsp;' + lastN + '');
			$(".detail_page > input:eq(1)").val(num - 1);
			if (curId.indexOf("coldSite_") != -1) { // 冷站 | 常规制冷系统
				$(".tab ul>li:eq(1)").css('display', '${equipmentMonitor.isShowLoadRate}');
				$(".tab ul>li").siblings().css('width', ("${equipmentMonitor.isShowLoadRate}" == "none" ? "882px" : "425px")); // "425px" : "206px"
				getEquipDetail(curId, 0);
			}

			if (curId.indexOf("boiler_room_") != -1) { // 锅炉房
				getBoilerBay(curId, 0);
			}
		}
		
		var place = 0;     // $(".detail_page>input:eq(1)").val();//位置
		if(curId == 'ahu') { // 新风机组
			place = num - 1;
			$(".ahu_detail").css("display", "block"); // 新风机组，显示新风机组的设备详情
		}
		
		if(curId == 'sendWind' || curId == 'exhaustWind') { // 送风机或者排风机
			place = num - 1;
			$(".fault_tab_content > .sub_title_block:eq(2)").find(".btn_group").css("marginLeft", "0px"); // 隐藏其它的图表div
			$(".frequency_sf_detail").css("display", "block"); // 送排风机，显示送排风机的设备详情
			$(".frequency_sf_detail > .fault_content:eq(1)").css("display", "${equipmentMonitor.isShowWindPressure}"); // 送排风机，运行风量、风压是否显示
		}

		eval("<portlet:namespace/>choose_name = detail_" + place + "_up_name");//URL-name
		eval("<portlet:namespace/>choose_id = detail_" + place + "_up_id");//URL-id
		eval("<portlet:namespace/>ispd = detail_" + place + "_up_ispd");//URL-ispd
		eval("<portlet:namespace/>yLeftTitle = detail_" + place + "_up_yTtile");//y轴标题
		eval("<portlet:namespace/>expColumnName = detail_" + place + "_up_expColumnName");//导出Excel文件头列名
		eval("<portlet:namespace/>legendList = detail_" + place + "_up_legendList");//图例列表
		
		if(publicTime != "") {
			<portlet:namespace />start_date = publicTime;
		} else {
			if (<portlet:namespace/>start_date == "") {
				var nowDate = new Date();
				<portlet:namespace/>start_date = nowDate.getFullYear() + "-" + (nowDate.getMonth() + 1) + "-" + nowDate.getDate();
			}
		}
		
		detail_yxts_starttime = <portlet:namespace/>start_date;
		detail_wind_starttime = <portlet:namespace/>start_date;
		$(".today").html(detail_wind_starttime);
		$("#device_text").text("每台设备的实时状况");
		
		var legend = <portlet:namespace/>legendList[0][0];
		var choose_id = <portlet:namespace/>choose_id[0][0];
		var choose_name = <portlet:namespace/>choose_name[0][0];
		var ispd = <portlet:namespace/>ispd[0][0];
		var yTitle = <portlet:namespace/>yLeftTitle[0][0];
		var chartColor = <portlet:namespace/>chartColorList; // 数组
		var charttype = <portlet:namespace/>chartType;
		var step = <portlet:namespace/>xStep;
		var showLegend = false;
		// 统一的填充颜色
		// 获取数据--绘图

		if (curId == 'coldSite_one' || curId == 'coldSite_two' || curId == 'coldSite_three') { // 冷站1,2,3 | 常规制冷系统
			getDeviceForColdSite('coldSite'); // 获取设备列表 
			opeaColdSite(); // 显示冷水机组
		}

		if (curId == 'boiler_room_P1' || curId == 'boiler_room_P2' || curId == 'boiler_room_A1') { // 锅炉房P1、P2、A1
			$(".fault_tab_content > .sub_title_block:eq(2)").find(".btn_group").css("marginLeft", "0px"); // 隐藏其它的图表div
			getDeviceForBoiler('boiler'); // 获取设备列表 
			opeaBoiler(); // 显示锅炉房
		}
		
		if(curId == 'ahu') { // 新风机组
			ahu_detail_floor = default_detail_floor;
			ahu_detail_build = default_build_id;
			getDeviceCommonList(curId); // 获取设备列表
			opeaAhu(); // 处理新风机组的信息
		}
		
		if(curId == 'sendWind' || curId == 'exhaustWind') { // 送风机或者排风机
			ahu_detail_floor = default_spf_detail_floor;
			ahu_detail_build = default_build_id;
			$(".filter_widget").css("display", "none"); // 隐藏其它的图表div
			$(".fault_tab_content > .sub_title_block:eq(2)").css("display", "none"); // 隐藏其它的图表div
			getDeviceCommonList(curId); // 获取设备列表
			opeaWindSite();
		}

		if(curId == 'light') { // 照明回路
			$("#device_text").text("每层照明灯具的总数和开启数");
			opeaLight();
		}

		if(curId == 'fcu') { // 风机盘管
			$("#device_text").text("每层风机盘管的总数和开启数");
			opeaFcu();
		}
	}

	//绘图全局变量
	var <portlet:namespace/>choose_name = "";//URL-name
	var <portlet:namespace/>choose_id = "";//URL-id
	var <portlet:namespace/>ispd = "";//URL-ispd
	var <portlet:namespace/>legendList = "";//图例列表
	var <portlet:namespace/>expColumnName = "";//导出列头名称
	var <portlet:namespace/>yLeftTitle = "";//y轴标题
	var <portlet:namespace/>title = "";//导出文件名称

	var <portlet:namespace/>start_date = "${equipmentMonitor.defaulttime}";//开始时间
	var <portlet:namespace/>decimals = "${equipmentMonitor.decimals}";//保留小数位数
	var <portlet:namespace/>xStep = "${equipmentMonitor.xStep}";//x轴标签间隔
	var <portlet:namespace/>chartFillColorList = "${equipmentMonitor.chartFillColorList}";//填充颜色
	var <portlet:namespace/>chartColorList = "${equipmentMonitor.chartColorList}";//图表颜色列表
	var <portlet:namespace/>chartType = "${equipmentMonitor.chartType}";//图表类型
	if (<portlet:namespace/>start_date == "") {
		var nowDate = new Date();
		<portlet:namespace/>start_date= nowDate.getFullYear() + "-"
				+ (nowDate.getMonth() + 1) + "-" + nowDate.getDate();
	}
	
	var choose_type = "day";//选择日期类型
	var xStep = 4;//初始x轴间隔
	var exp_start_date = "";//导出到Excel中的开始时间
	//获取数据--绘图--运行趋势
	function getchart_yxqs(obj, tfrom, legend, id, name, ispd, choose_type,
			decimals, yTitle, chartColor, charttype, step, region_id) {
		$
				.post(
						"<portlet:resourceURL id='getCommonChartData'></portlet:resourceURL>",
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							decimals : decimals,
							type : choose_type,
							region_id : (region_id == undefined || region_id == "" ? ahu_detail_floor : region_id),
							build_id : ahu_detail_build
						},
						function(data) {
// 							console.log(data);
							var dataList = data.dataList[0];
							var cateList = data.cataList;
							var centerTitle = tfrom;//图表标题
							if (choose_type == "week") {
								xStep = 4 * 24;
								centerTitle = "";
								cateList = data.cataList;
								centerTitle = tfrom.substring(0, 5)
										+ data.cataList[0].replace(/\//g, '-')
										+ "~"
										+ data.cataList[data.cataList.length - 1]
												.replace(/\//g, '-');
							} else if (choose_type == "month") {
								xStep = 4 * 24 * 30;
								cateList = data.cataList;
								centerTitle = tfrom.substring(0, 7);
							}
							if (step != "") {
								xStep = step;
							}
							$("#" + obj).siblings(".look_other").find(
									".now_data").html(centerTitle);
							//渲染图表
							renderToSimpleChart(obj, legend, cateList, xStep,
									<portlet:namespace/>chartFillColorList,
									yTitle, "", <portlet:namespace/>chartColorList.split(','),charttype,
									dataList, false);
						});
	}
	//日周月时间选择--实时状态
	function selectdate(type, date_id,obj) {
		var dformt = 'yyyy-MM-dd', titleFormt = 'yyyy-MM-dd';
		if (type == 'month') {
			dformt = 'MM';
			titleFormt = 'yyyy-MM';
		}
		WdatePicker({
			position : {
				left : 80
			},
			el : date_id,
			dateFmt : dformt,
			onpicked : function(dp) {
				var _time = dp.cal;
				//全局变量赋值
				if (type == 'day') {
					//x轴间隔控制
					xStep = '4';
				} else if (type == 'week') {
					xStep = '1';
				} else if (type == 'month') {
					xStep = '5';
				}
				//choose_id、choose_name、ispd赋值

				//导出到Excel中的时间
				var place=$(obj).parent().parent().index(".tab_content");
				if(place == 0) { // 运行台数绘图 
					detail_yxts_type = type; 
					detail_yxts_starttime = _time.getDateStr('yyyy-MM-dd');
					
					var curId = $(".detail_page").attr("tip"); // 当前所处模块id
					var totalNum = eval(curId + "Temp")[0].total; // 默认显示冷水机组的总台数
					getRunningChart(totalNum); // 运行趋势
				}else if(place==1){
					getYXFZLChart("<portlet:namespace/>chart_yxfzl");
				}else if(place==2){
					getYXSJChart("equip_1");
					getYXSJChart("equip_2");
					getYXSJChart("equip_3");
				}
			}
		});
	}

	//运行趋势tab点击时间
	function tab_click(obj, type) {
		if(type != "detail"){
			//避免重复绘图
			if ($(".tab_menu:eq(1)>input").val() == $(obj).index()) {
				// return false;
			} else {
				$(".tab_menu:eq(1)>input").val($(obj).index());
			}
		}
		
		//绘图区ID处理
		if ($(obj).index() == 0) {
			var curId = $(".detail_page").attr("tip"); // 当前所处模块id
			var totalNum = 0;
			if(curId == "ahu" || curId == "sendWind" || curId == "exhaustWind") {
				var bIndex = $(".detail_page > .device_floor > .tab_menu > ul > .cur_tab").index(); // 当前建筑对应的index
				totalNum = eval(curId + "Temp")[bIndex].total;
			} else if(curId == "coldSite_one" || curId == "coldSite_two" || curId == "coldSite_three") { // 冷机
				totalNum = eval(curId + "Temp")[0].total; // 默认显示冷水机组的总台数
			}
			getRunningChart(totalNum); // 运行趋势
		} else if ($(obj).index() == 1) {
			getYXFZLChart("<portlet:namespace/>chart_yxfzl");
		} else if ($(obj).index() == 2) {
			getYXSJChart("equip_1");
			getYXSJChart("equip_2");
			getYXSJChart("equip_3");
		} else if ($(obj).index() == 3) {
			var chartId = "<portlet:namespace/>chart_edcs";
		};
	}
	
	// 获取运行台数图表信息
	function getRunningChart(totalNum) {
		var curId = $(".detail_page").attr("tip");
		//console.log("totalNum---" + totalNum + "----curId---" + curId);
		if(totalNum == 0) {
			
			$("#detail_chart_yxts > div").remove(); // 移除div
			$(".running_num > tr:eq(0) > td:eq(1)").text('0'); // max
			$(".running_num > tr:eq(0) > td:eq(3)").text(''); // maxTime
			$(".running_num > tr:eq(1) > td:eq(1)").text('0');// min
			$(".running_num > tr:eq(1) > td:eq(3)").text(''); // minTime
			$(".running_num > tr:eq(2) > td:eq(1)").text('0'); // average
			$(".running_num > tr:eq(3) > td:eq(1)").text('0'); // 总台数
			
		} else {
// 			console.log("curId-----"+curId);
			var id = detail_yxts_id_fau + "_" + ahu_detail_floor + "_" + ahu_detail_build;
			var region_id = ahu_detail_floor;
			var build_id = ahu_detail_build;
			if(curId == "fau") {
				region_id = 'total';
				id = detail_yxts_id_fau + "_" + ahu_detail_floor + "_" + ahu_detail_build;
			} else if(curId == "coldSite_one" || curId == "coldSite_two" || curId == "coldSite_three") { // 冷机
				region_id = 'total';
				id = detail_yxts_id_chiller + ahu_detail_build;
			} else if(curId == "sendWind") { // 送风风机
				id = detail_yxts_id_sendWind + ahu_detail_build;;
				region_id = 'total';
			 	build_id = ahu_detail_build;
			} else if(curId == "exhaustWind") { // 排风风机
				id = detail_yxts_id_exhaustWind + ahu_detail_build;;
				region_id = 'total';
			 	build_id = ahu_detail_build;
			} else if(curId.indexOf("boiler_room") != -1) { // 锅炉房
				region_id = 'total';
				var text = $(".device_floor > .tab_menu > ul > .cur_tab").find("p").text();
				if(text == "热水泵") { // 热水泵
					id = detail_yxts_id_hwp + "_" + region_id + "_" + ahu_detail_build;
				} else {
					id = detail_yxts_id_boiler + "_" + region_id + "_" + ahu_detail_build;
				}
			}
			var choose_name = detail_yxts_name;
			var choose_id = id;
			var ispd = detail_yxts_ispd;
			
// 			console.log("-----------getRunningChart--------start");
// 			console.log(choose_name);
// 			console.log(choose_id);
// 			console.log(ispd);
// 			console.log("-----------getRunningChart--------end");
			
			var yTitle = <portlet:namespace/>yLeftTitle[0][0];
			var chartColor = <portlet:namespace/>chartColorList; // 数组
			var charttype = <portlet:namespace/>chartType;
			var step = <portlet:namespace/>xStep;
			// 运行台数
			getchart_yxqs("detail_chart_yxts", detail_yxts_starttime, "运行台数",
							choose_id, choose_name, ispd, detail_yxts_type,
							<portlet:namespace/>decimals, yTitle,
							chartColor.split(','), charttype, step, region_id);
			
			var str = "日";
			if(detail_yxts_type == "week") {
				str = "周";
			} else if(detail_yxts_type == "month") {
				str = "月";
			}
			$(".running_num > tr > td > span").text(str);
			$(".running_num > tr:eq(3) > td:eq(1)").text(totalNum); // 总台数
			
			// 获取右侧运行台数
			$
					.ajax({
						type : "POST",
						url : "<portlet:resourceURL id='getDatasForAtts'></portlet:resourceURL>",
						data : {
							from : detail_yxts_starttime,
							name : choose_name,
							id : choose_id,
							ispd : ispd,
							att : 'max,min,average',
							type : detail_yxts_type,
							decimals : '0',
							region_id : region_id,
							build_id : build_id
						},
						success : function(result) {
							var data = result.data;
							//console.log(data);
							var maxtime = '', mintime = '';
							if (detail_yxts_type == 'day') {
								maxtime = data[0][1].substring(11, 16);
								mintime = data[1][1].substring(11, 16);
							} else if (detail_yxts_type == 'week') {
								maxtime = data[0][1].substring(5);
								mintime = data[1][1].substring(5);
							} else if (detail_yxts_type == 'month') {
								maxtime = data[0][1].substring(5);
								mintime = data[1][1].substring(5);
							}

							$(".running_num > tr:eq(0) > td:eq(1)").text(
									parseFloat(data[0][0])); // max
// 							$(".running_num > tr:eq(0) > td:eq(3)").text(maxtime); // maxTime
							$(".running_num > tr:eq(1) > td:eq(1)").text(
									parseFloat(data[1][0]));// min
// 							$(".running_num > tr:eq(1) > td:eq(3)").text(mintime); // minTime
							$(".running_num > tr:eq(2) > td:eq(1)").text(
									parseFloat(data[2][0])); // average

						},
						error : function(result) {
							console.log('获取右侧运行台数 + error');
						}
					});

		}

	}

	// 获取设备列表的数据,针对冷机
	function getDeviceForColdSite(source) {
		var id = "chiller%", name = "", comments = "%冷冻水回水温度%", index = 0;
		if (source == 'coldPump') { // 冷冻水泵(求对应设备信息)
			id = "chwp_%", name = "%status%", comments = "", index = 1;
		} else if (source == 'coolPump') { // 冷却水泵(求对应设备信息)
			id = "cwp_%", name = "%status%", comments = "", index = 2;
		} else if (source == 'coolTower') { // 冷却塔(求对应设备信息)
			id = "ct_%", name = "%status%", comments = "", index = 3;
		}

		var curId = $(".detail_page").attr("tip"); // 当前选择的模块
		var buildid = '';
		if (curId == 'coldSite_one') {
			buildid = 'P1';
		} else if (curId == 'coldSite_two') {
			buildid = 'P2';
		} else if (curId == 'coldSite_three') {
			buildid = 'A1';
		}

		var devicesList = [];
		ahu_detail_build = buildid;
		ahu_detail_floor = '';
		$
				.ajax({
					type : "POST",
					url : "<portlet:resourceURL id='getQuerySchemeListByCondition'></portlet:resourceURL>",
					data : {
						id : id,
						name : name,
						comments : comments,
						buildId : buildid
					},
					async : false,
					success : function(result) {
						var data = result.result;
						$("#chooseDevice").empty(); // 清空下拉列表
						if (data.length != 0) {
							var hashMap = new HashMap();
							for ( var i = 0; i < data.length; i++) {
								if (i == 0) {
									detail_coldSiteColdParam_id = detail_coldSiteCoolParam_id = data[i].id
											+ ","
											+ data[i].id
											+ ","
											+ data[i].id;
									detail_coldSiteColdParam_id += "," + data[i].id;
								}
								if (!hashMap.containsValue(data[i].id)) {
									devicesList.push(data[i].id);
									$("#chooseDevice").append(
											"<option tip='" + data[i].buildId + "' value='" + data[i].id + "'>"
													+ data[i].id + "</option>");
								}
								hashMap.put(data[i].id, data[i].id);
							}
						}
					},
					error : function(result) {
						console.log('getDeviceForColdSite + error');
					}
				});

		var equip = $(".more_" + curId + "").data('data');
		//$(".single_tab_title>p:eq(0) strong").html(equip[index].total);
		//$(".single_tab_title>p:eq(1) strong").html(equip[index].current);
		getSsztTable(equip[index].total, source, devicesList);
	}

	// 获取设备列表的数据,针对锅炉房
	function getDeviceForBoiler(source) {
		var id = "boiler_%", name = "status%", comments = "", index = 0;
		if (source == "hwp") { // 热水泵
			id = "hp_%", name = "%frequency%", comments = "", index = 1;
		}
		var curId = $(".detail_page").attr("tip"); // 当前选择的模块
		var buildid = '';
		if (curId == 'boiler_room_P1') {
			buildid = 'P1';
		} else if (curId == 'boiler_room_P2') {
			buildid = 'P2';
		} else if (curId == 'boiler_room_A1') {
			buildid = 'A1';
		}

		var devicesList = [];
		ahu_detail_build = buildid;
		ahu_detail_floor = '';
		$
				.ajax({
					type : "POST",
					url : "<portlet:resourceURL id='getQuerySchemeListByCondition'></portlet:resourceURL>",
					data : {
						name : name,
						id : id,
						comments : comments,
						buildId : buildid
					},
					async : false,
					success : function(result) {
						var data = result.result;
						$("#chooseDevice").empty(); // 清空下拉列表
						if (data.length != 0) {
							var hashMap = new HashMap();
							for ( var i = 0; i < data.length; i++) {
								if (i == 0) {
									detail_hotWaterParam_id = data[i].id + ","
											+ data[i].id + "," + data[i].id;
									detail_hwpParam_id = data[i].id;
								}
								if (!hashMap.containsValue(data[i].id)) {
									devicesList.push(data[i].id);
									$("#chooseDevice").append(
											"<option tip='" + data[i].buildId + "' value='" + data[i].id + "'>"
													+ data[i].id + "</option>");
								}
								hashMap.put(data[i].id, data[i].id);
							}
						}
					},
					error : function(result) {
						console.log('getDeviceForBoiler + error');
					}
				});

		var equip = $(".more_" + curId + "").data('data');
		//$(".single_tab_title>p:eq(0) strong").html(equip[index].total);
		//$(".single_tab_title>p:eq(1) strong").html(equip[index].current);
		getSsztTable(equip[index].total, source, devicesList);
	}

	// 获取设备列表的数据，针对新风机组、空调箱
	function getDeviceCommonList(source) {
		var id = "", name = "status_sf", comments = "", index = 0, devicesList = [], order = '';
		if (source == "sendWind") { // 送风机
			id = "S%", name = "status", comments = "", index = 0, order = ' id asc';
		} else if (source == "exhaustWind") { // 排风机
			id = "P%", name = "status", comments = "", index = 0, order = ' id asc';
		}

// 		console.log("-----------------getDeviceCommonList-------------------start");
// 		console.log("----------" + ahu_detail_build + "----------" + ahu_detail_floor + "-------" + order);
// 		console.log("-----------------getDeviceCommonList-------------------end");
		var curId = $(".detail_page").attr("tip"); // 当前模块的id
		$
				.ajax({
					type : "POST",
					url : "<portlet:resourceURL id='getQuerySchemeListByCondition'></portlet:resourceURL>",
					data : {
						name : name,
						id : id,
						buildId : ahu_detail_build,
						regionId : ahu_detail_floor,
						order : order
					},
					async : false,
					success : function(result) {
						var data = result.result;
// 						console.log(result);
						$("#chooseDevice").empty(); // 清空下拉列表
						if (data.length == 0) {
							$(".chart_content > .chart").children().remove();
						} else {
							var hashMap = new HashMap();
							for ( var i = 0; i < data.length; i++) {
								if (i == 0) {
									if (curId == 'coldSite_one'
											|| curId == 'coldSite_two'
											|| curId == 'coldSite_three') { // 冷站1,2,3 | 常规制冷系统
										detail_coldSiteColdParam_id = data[i].id
												+ ","
												+ data[i].id
												+ ","
												+ data[i].id
												+ ","
												+ data[i].id;
									}

									if (curId == 'ahu') { // 新风机组
										detail_windTempParam_id = detail_windHumpParam_id = data[i].id
												+ "," + data[i].id;
									}
								}
								if (!hashMap.containsValue(data[i].id)) {
									devicesList.push(data[i].id);
									$("#chooseDevice").append(
											"<option value='" + data[i].id + "'>"
													+ data[i].id + "</option>");
								}
								hashMap.put(data[i].id, data[i].id);
							}
						}
					},
					error : function(result) {
						console.log('getDeviceDetailList + error');
					}
				});

		var equip = $(".more_" + curId + "").data('data');
		//$(".single_tab_title>p:eq(0) strong").html(equip[index].total);
		//$(".single_tab_title>p:eq(1) strong").html(equip[index].current);
		getSsztTable(equip[index].total, source, devicesList);
	}

	// 获取设备详情图表信息
	function getDevicesDetailChart(p_name) {
		// zzxtest
		var bid = ahu_detail_build, fid = ahu_detail_floor; // bid = 'P1'
		//if(p_name == "fanFrequency" || p_name == "runFrequency") { // 测试风机频率 和 运行频率
		//	bid = 'P2', fid = '3F';
		//}

		if (p_name == 'lightOpenNum' || p_name == 'fcuOpenNum') { // 照明系统-照明回路或者风机盘管
			fid = detail_floor; // 照明回路或者风机盘管，特殊处理 
		}

		var atts = 'max,min,average'; // 默认求的attribute属性

		var choose_name = eval("detail_" + p_name + "_name");
		var choose_id = eval("detail_" + p_name + "_id");
		var ispd = eval("detail_" + p_name + "_ispd");
		var classname = p_name + "_table"; // 表格样式名称

		console.log(p_name + "---" + choose_name + "----" + choose_id + "----" + ispd + "---" + fid + "---" + bid);
		// 获取图表信息
		$
				.ajax({
					type : "POST",
					url : "<portlet:resourceURL id='getDatasByNamesForMonitor'></portlet:resourceURL>",
					//async : false, // 同步
					data : {
						from : detail_wind_starttime,
						name : choose_name,
						id : choose_id,
						ispd : ispd,
						decimals : '0.0',
						type : detail_wind_type,
						region_id : fid,
						build_id : bid
					// ahu_detail_build
					},
					success : function(data) {

// 						console
// 								.log("---------------getDevicesDetailChart------------------------"
// 										+ p_name);
// 						console.log(data);
						
						var cataList = data.catalist;
						var dataList = data.datalist;

						var chartLegendList = [ '送风温度', '回风温度', '新风温度',
								'送风温度设定值' ];
						var chartColorList = [ '#00B050', '#FFC000', '#0070C0',
								'#FF99FF' ]; // [ '#E778BC', '#FF9900' ];
						var chartFillColorList = [ 'white', 'white', 'white',
								'white' ];
						var chartRadiusList = [ 1, 1, 1, 1 ];
						var chartYAxisList = [ 0, 0, 0, 0 ];
						var chartSymbolList = [ 'circle', 'circle', 'circle',
								'circle' ];
						var chartid = 'windTempParam_chart', lefttitle = '温度（℃）', righttitle = '', unit = '°C';

						if (p_name.indexOf("waterColdParam") != -1
								|| p_name.indexOf("waterCoolParam") != -1) { // 水流量-冷冻水参数

							p_name = p_name.substring(0, p_name.indexOf(bid));
							var str = "冷冻水";
							if (p_name == "waterCoolParam") {
								str = "冷却水";
							}
							classname = p_name + "_table";
							chartid = p_name + '_chart', lefttitle = '温度（℃）',
									righttitle = '', unit = '℃';
							if (bid == "P1") {

								chartLegendList = [ 'ws_P1_1' + str + '供水温度',
										'ws_P1_2' + str + '供水温度',
										'ws_P1_1' + str + '回水温度',
										'ws_P1_2' + str + '回水温度' ];
								chartColorList = [ '#E46C0A', '#0070C0',
										'#E778BC', '#453656' ];
								chartRadiusList = [ 1, 1, 1, 1 ];
								chartYAxisList = [ 0, 0, 0, 0 ];

							} else if (bid == "P2") {

								chartLegendList = [ 'ws_P2_1' + str + '供水温度',
										'ws_P2_1' + str + '回水温度' ];
								chartColorList = [ '#E46C0A', '#0070C0' ];
								chartRadiusList = [ 1, 1 ];
								chartYAxisList = [ 0, 0 ];

							} else if (bid == "A1") {

								chartLegendList = [ 'ws_A1_1' + str + '供水温度',
										'ws_A1_1' + str + '回水温度' ];
								chartColorList = [ '#E46C0A', '#0070C0' ];
								chartRadiusList = [ 1, 1 ];
								chartYAxisList = [ 0, 0 ];

							}

						} else {

							if (p_name == 'windTempParam') { // 送回风温度参数

							} else if (p_name == 'coldSiteColdParam') { // 冷站详情-冷水机组-冷冻水参数
								chartid = 'coldSiteColdParam_chart',
										lefttitle = '温度（℃）', unit = '℃';
								chartLegendList = [ '冷冻水供水温度', '冷冻水回水湿度',
										'蒸发温度', '冷冻水温度设定' ];
								chartColorList = [ '#E46C0A', '#FF66FF',
										'#403152', '#FF99FF' ];
								chartRadiusList = [ 1, 1, 1, 1 ];
								chartYAxisList = [ 0, 0, 0, 0 ];
							} else if (p_name == 'coldSiteCoolParam') { // 冷站详情-冷水机组-冷却水参数
								chartid = 'coldSiteCoolParam_chart',
										lefttitle = '温度（℃）', unit = '℃';
								chartLegendList = [ '冷却水供水温度', '冷却水回水湿度',
										'冷凝温度' ];
								chartColorList = [ '#00B050', '#00B0F0',
										'#FFBFFF' ];
								chartRadiusList = [ 1, 1, 1 ];
								chartYAxisList = [ 0, 0, 0 ];
							} else if (p_name == 'windHumpParam') { // 送回风湿度参数
								chartid = 'windHumpParam_chart',
										lefttitle = '湿度（%）', unit = '%';
								chartLegendList = [ '送风湿度', '回风湿度' ];
								chartColorList = [ '#00B050', '#0070C0' ]; // [ '#E778BC', '#FF9900' ];
								chartRadiusList = [ 1, 1 ];
								chartYAxisList = [ 0, 0 ];
							} else if (p_name == 'waterOpen') { // 水阀开度
								chartid = 'waterOpen_chart',
										lefttitle = '开度（%）', unit = '%';
								chartLegendList = [ '冷水阀开度', '热水阀开度' ];
								chartColorList = [ '#FF66FF', '#66CCFF' ];
								chartRadiusList = [ 1, 1 ];
								chartYAxisList = [ 0, 0 ];
							} else if (p_name == 'fanFrequency') { // 风机频率
								chartid = 'fanFrequency_chart',
										lefttitle = '频率（HZ）', unit = 'HZ';
								chartLegendList = [ '送风机频率', '回风机频率' ];
								chartColorList = [ '#FF66FF', '#66CCFF' ];
								chartRadiusList = [ 1, 1 ];
								chartYAxisList = [ 0, 0 ];
							} else if (p_name == 'runFrequency') { // 送排风机-运行频率
								chartid = 'runFrequency_chart',
										lefttitle = '频率（HZ）', unit = 'HZ';
								chartLegendList = [ '运行频率' ];
								chartColorList = [ '#FF66FF' ];
								chartRadiusList = [ 1 ];
								chartYAxisList = [ 0 ];
							} else if (p_name == 'runningWind') { // 送排风机-运行风量、风压
								chartid = 'runningWind_chart',
										lefttitle = '风压（kPa）',
										righttitle = '风量(m³/h)', unit = '';
								chartLegendList = [ '扬尘', '流量' ];
								chartColorList = [ '#00B050', '#0070C0' ]; // [ '#E778BC', '#FF9900' ];
								chartRadiusList = [ 1, 1 ];
								chartYAxisList = [ 0, 1 ];
							} else if (p_name == 'waterCoolParam') { // 水流量-冷却水参数 
								chartid = 'waterCoolParam_chart',
										lefttitle = '温度（℃）', righttitle = '',
										unit = '℃';
								chartLegendList = [ '冷却水供水温度', '冷却水回水温度',
										'冷凝温度' ];
								chartColorList = [ '#00B050', '#00B0F0',
										'#FF99FF' ]; // [ '#E778BC', '#FF9900' ];
								chartRadiusList = [ 1, 1, 1 ];
								chartYAxisList = [ 0, 1, 0 ];
							} else if (p_name == 'waterFlow') { // 水流量
								chartid = 'waterFlow_chart',
										lefttitle = '冷冻水流量（m³/h）',
										righttitle = '', unit = 'm³/h';
								chartLegendList = [ 'T1楼冷冻水流量', 'T2楼冷冻水流量',
										'T3楼冷冻水流量', 'T4楼冷冻水流量' ];
								chartColorList = [ '#00B050', '#FFC000',
										'#0070C0', '#FF99FF' ];
								chartRadiusList = [ 1, 1, 1, 1 ];
								chartYAxisList = [ 0, 0, 0, 0 ];
							} else if (p_name == 'waterPressure') { // 压力 
								chartid = 'waterPressure_chart',
										lefttitle = '水系统压力（Pa）',
										righttitle = '', unit = 'Pa';
								chartLegendList = [ '水系统压力' ];
								chartColorList = [ '#E56F0E' ];
								chartRadiusList = [ 1 ];
								chartYAxisList = [ 0 ];
							} else if (p_name == 'towerWindFrequency') { // 冷却塔-风机频率 
								chartid = 'towerWindFrequency_chart',
										lefttitle = '频率（HZ）', righttitle = '',
										unit = 'HZ';
								chartLegendList = [ '频率' ];
								chartColorList = [ '#00B0F0' ];
								chartRadiusList = [ 1 ];
								chartYAxisList = [ 0 ];
							} else if (p_name == 'towerCoolParam') { // 冷却塔-冷却水参数 
								chartid = 'towerCoolParam_chart',
										lefttitle = '温度（℃）', righttitle = '',
										unit = '℃';
								chartLegendList = [ '冷却水供水温度', '冷却水回水温度' ];
								chartColorList = [ '#00B0F0', '#00B050' ];
								chartRadiusList = [ 1, 1 ];
								chartYAxisList = [ 0, 0 ];
							} else if (p_name == 'hotWaterParam') { // 锅炉房-热水参数 
								chartid = 'hotWaterParam_chart',
										lefttitle = '温度（℃）', righttitle = '',
										unit = '℃';
								chartLegendList = [ '供水温度', '回水温度' ];
								chartColorList = [ '#32C0F4', '#00B050' ];
								chartRadiusList = [ 1, 1 ];
								chartYAxisList = [ 0, 0 ];
							} else if (p_name == 'hwpParam') { // 锅炉房-热水泵频率
								chartid = 'hwpParam_chart',
										lefttitle = '频率（HZ）', righttitle = '',
										unit = 'HZ';
								chartLegendList = [ '频率' ];
								chartColorList = [ '#32C0F4' ];
								chartRadiusList = [ 1 ];
								chartYAxisList = [ 0 ];
							} else if (p_name == 'lightOpenNum') { // 照明系统-照明回路
								chartid = 'lightOpenNum_chart',
										lefttitle = '开启台数', righttitle = '',
										unit = '';
								chartLegendList = [ '开启台数' ];
								chartColorList = [ '#0070C5' ];
								chartRadiusList = [ 1 ];
								chartYAxisList = [ 0 ];
							} else if (p_name == 'fcuOpenNum') { // 空调系统-风机盘管
								chartid = 'fcuOpenNum_chart',
										lefttitle = '开启台数', righttitle = '',
										unit = '';
								chartLegendList = [ '开启台数' ];
								chartColorList = [ '#0070C5' ];
								chartRadiusList = [ 1 ];
								chartYAxisList = [ 0 ];
							}
						}

						var step = 4;
						if (detail_wind_type == "week") {
							step = 24;
						} else if (detail_wind_type == "month") {
							step = 4 * 30;
						}
						renderToTwoChart(chartid, "spline", step, "",
								"LongDash", 1, lefttitle, righttitle,
								"#FF9900", "", unit, chartLegendList,
								chartColorList, dataList, chartFillColorList,
								chartRadiusList, chartSymbolList,
								chartYAxisList, cataList);
					},
					error : function(result) {
						console.log('获取设备详情 + error');
					}
				});

		if (p_name == 'lightOpenNum' || p_name == 'fcuOpenNum') { // 照明系统-照明回路或者风机盘管
			return false; // 照明回路或者风机盘管，不需要计算左侧的值 
		}

		// 获取左侧max、min、average
		$
				.ajax({
					type : "POST",
					url : "<portlet:resourceURL id='getDatasForNamesAndAtts'></portlet:resourceURL>",
					//async : false, // 同步
					data : {
						from : detail_wind_starttime,
						name : choose_name,
						id : choose_id,
						ispd : ispd,
						att : atts,
						type : detail_wind_type,
						decimals : '0.0',
						region_id : fid,
						build_id : bid
					//ahu_detail_build
					},
					success : function(result) {
						var data = result.data;
						var maxtime1 = '', mintime1 = '', maxtime2 = '', mintime2 = '', maxtime3 = '', mintime3 = '';
						if (detail_wind_type == 'day') {

							if (p_name == "waterColdParam"
									|| p_name == "waterCoolParam"
									|| p_name == 'waterFlow'
									|| p_name == 'windTempParam'
									|| p_name == 'waterCoolParam'
									|| p_name == 'waterColdParam'
									|| p_name == 'coldSiteColdParam'
									|| p_name == 'coldSiteCoolParam') { // 送回风温度参数 , 冷水机组-冷冻水参数，冷却水参数 
								maxtime1 = data[0][0][1].substring(11, 16);
								mintime1 = data[0][1][1].substring(11, 16);
								maxtime2 = data[1][0][1].substring(11, 16);
								mintime2 = data[1][1][1].substring(11, 16);
								//maxtime3 = data[2][0][1].substring(11, 16);
								//mintime3 = data[2][1][1].substring(11, 16);
							} else if (p_name == 'windHumpParam'
									|| p_name == 'runningWind'
									|| p_name == 'fanFrequency'
									|| p_name == 'towerCoolParam') { // 送回风湿度参数 和 运行风量、风压 和 风机频率，冷站-冷却塔-冷却水参数
								maxtime1 = data[0][0][1].substring(11, 16);
								mintime1 = data[0][1][1].substring(11, 16);
								maxtime2 = data[1][0][1].substring(11, 16);
								mintime2 = data[1][1][1].substring(11, 16);
							} else if (p_name == 'waterOpen'
									|| p_name == 'runFrequency'
									|| p_name == 'towerWindFrequency'
									|| p_name == 'hotWaterParam'
									|| p_name == 'hwpParam') { // 水阀开度 和 送排风-运行频率 、 热水参数、热水泵频率
								maxtime1 = data[0][0][1].substring(11, 16);
								mintime1 = data[0][1][1].substring(11, 16);
							}

						} else if (detail_wind_type == 'week'
								|| detail_wind_type == 'month') {

							if (p_name == "waterColdParam"
									|| p_name == "waterCoolParam"
									|| p_name == 'waterFlow'
									|| p_name == 'windTempParam'
									|| p_name == 'waterCoolParam'
									|| p_name == 'waterColdParam'
									|| p_name == 'coldSiteColdParam'
									|| p_name == 'coldSiteCoolParam') { // 送回风温度参数 , 冷水机组-冷冻水参数，冷却水参数
								maxtime1 = data[0][0][1].substring(5);
								mintime1 = data[0][1][1].substring(5);
								maxtime2 = data[1][0][1].substring(5);
								mintime2 = data[1][1][1].substring(5);
								//maxtime3 = data[2][0][1].substring(5);
								//mintime3 = data[2][1][1].substring(5);
							} else if (p_name == 'windHumpParam'
									|| p_name == 'runningWind'
									|| p_name == 'fanFrequency'
									|| p_name == 'towerCoolParam') { // 送回风湿度参数 和 运行风量、风压 和 风机频率，冷站-冷却塔-冷却水参数
								maxtime1 = data[0][0][1].substring(5);
								mintime1 = data[0][1][1].substring(5);
								maxtime2 = data[1][0][1].substring(5);
								mintime2 = data[1][1][1].substring(5);
							} else if (p_name == 'waterOpen'
									|| p_name == 'runFrequency'
									|| p_name == 'towerWindFrequency'
									|| p_name == 'hotWaterParam'
									|| p_name == 'hwpParam') { // 水阀开度 和 送排风-运行频率 、 热水参数、热水泵频率
								maxtime1 = data[0][0][1].substring(5);
								mintime1 = data[0][1][1].substring(5);
							}

						}

						if (p_name == "waterColdParam"
								|| p_name == "waterCoolParam"
								|| p_name == 'waterFlow'
								|| p_name == 'windTempParam'
								|| p_name == 'waterCoolParam'
								|| p_name == 'waterColdParam'
								|| p_name == 'coldSiteColdParam'
								|| p_name == 'coldSiteCoolParam') { // 送回风温度参数 , 冷水机组-冷冻水参数，冷却水参数

							$("." + classname + " > tr:eq(0) > td:eq(1)").text(
									parseFloat(data[0][0][0])); // max
							$("." + classname + " > tr:eq(0) > td:eq(3)").text(
									maxtime1); // maxTime
							$("." + classname + " > tr:eq(1) > td:eq(1)").text(
									parseFloat(data[0][1][0]));// min
							$("." + classname + " > tr:eq(1) > td:eq(3)").text(
									mintime1); // minTime
							$("." + classname + " > tr:eq(2) > td:eq(1)").text(
									parseFloat(data[1][0][0])); // max
							$("." + classname + " > tr:eq(2) > td:eq(3)").text(
									maxtime2); // minTime
							$("." + classname + " > tr:eq(3) > td:eq(1)").text(
									parseFloat(data[1][1][0]));// min
							$("." + classname + " > tr:eq(3) > td:eq(3)").text(
									mintime2); // minTime
							//$("." + classname + " > tr:eq(4) > td:eq(1)").text(parseFloat(data[2][0][0])); // max
							//$("." + classname + " > tr:eq(4) > td:eq(3)").text(maxtime3); // maxTime
							//$("." + classname + " > tr:eq(5) > td:eq(1)").text(parseFloat(data[2][1][0]));// min
							//$("." + classname + " > tr:eq(5) > td:eq(3)").text(mintime3);// min

						} else if (p_name == 'windHumpParam'
								|| p_name == 'runningWind') { // 送回风湿度参数 和 运行风量、风压

							$("." + classname + " > tr:eq(0) > td:eq(1)").text(
									parseFloat(data[0][0][0])); // max
							$("." + classname + " > tr:eq(0) > td:eq(3)").text(
									maxtime1); // maxTime
							$("." + classname + " > tr:eq(1) > td:eq(1)").text(
									parseFloat(data[0][1][0]));// min
							$("." + classname + " > tr:eq(1) > td:eq(3)").text(
									mintime1); // minTime
							//$("." + classname + " > tr:eq(2) > td:eq(1)").text(parseFloat(data[0][2][0])); // average
							//$("." + classname + " > tr:eq(3) > td:eq(1)").text(parseFloat(data[1][0][0]));// max
							//$("." + classname + " > tr:eq(3) > td:eq(3)").text(maxtime2); // maxTime
							//$("." + classname + " > tr:eq(4) > td:eq(1)").text(parseFloat(data[1][1][0])); // min
							//$("." + classname + " > tr:eq(4) > td:eq(3)").text(mintime2); // minTime
							//$("." + classname + " > tr:eq(5) > td:eq(1)").text(parseFloat(data[1][2][0]));// average

						} else if (p_name == 'waterOpen'
								|| p_name == 'runFrequency'
								|| p_name == 'towerWindFrequency'
								|| p_name == 'hotWaterParam'
								|| p_name == 'hwpParam') { // 水阀开度 和 送排风-运行频率 、 热水参数、热水泵频率

							$("." + classname + " > tr:eq(0) > td:eq(1)").text(
									parseFloat(data[0][0][0])); // max
							$("." + classname + " > tr:eq(0) > td:eq(3)").text(
									maxtime1); // maxTime
							$("." + classname + " > tr:eq(1) > td:eq(1)").text(
									parseFloat(data[0][1][0]));// min
							$("." + classname + " > tr:eq(1) > td:eq(3)").text(
									mintime1); // minTime
							$("." + classname + " > tr:eq(2) > td:eq(1)").text(
									parseFloat(data[0][2][0])); // average

						} else if (p_name == 'fanFrequency'
								|| p_name == 'towerCoolParam') { // 风机频率，冷站-冷却塔-冷却水参数

							$("." + classname + " > tr:eq(0) > td:eq(1)").text(
									parseFloat(data[0][0][0])); // max
							$("." + classname + " > tr:eq(0) > td:eq(3)").text(
									maxtime1); // maxTime
							$("." + classname + " > tr:eq(1) > td:eq(1)").text(
									parseFloat(data[0][1][0]));// min
							$("." + classname + " > tr:eq(1) > td:eq(3)").text(
									mintime1); // minTime
							$("." + classname + " > tr:eq(2) > td:eq(1)").text(
									parseFloat(data[0][2][0])); // average
							//$("." + classname + " > tr:eq(3) > td:eq(1)").text(parseFloat(data[1][0][0]));// max
							//$("." + classname + " > tr:eq(3) > td:eq(3)").text(maxtime2); // maxTime
							//$("." + classname + " > tr:eq(4) > td:eq(1)").text(parseFloat(data[1][1][0])); // min
							//$("." + classname + " > tr:eq(4) > td:eq(3)").text(mintime2); // minTime
							//$("." + classname + " > tr:eq(5) > td:eq(1)").text(parseFloat(data[1][2][0]));// average

						}

					},
					error : function(result) {
						console.log('获取右侧运行台数 + error');
					}
				});

		//}
	}

	// 获取详细信息详情
	function getDetailData() {
		getRunningChart(0); // 运行趋势中-运行台数图表
	}

	// 操作冷站-冷水机组
	function opeaColdSite() {
		$(".detail_chart").css("display", "none"); // 隐藏其它的图表div
		$(".coldSiteDiv").css("display", "block"); // 默认显示冷水机组
		getDevicesDetailChart('coldSiteColdParam'); // 冷站设备详情，常规制冷系统 | 冷水机组 - 冷冻水参数
		getDevicesDetailChart('coldSiteCoolParam'); // 冷站设备详情，常规制冷系统 | 冷水机组 - 冷却水参数
	}

	// 操作锅炉房
	function opeaBoiler() {
		$(".detail_chart").css("display", "none"); // 隐藏其它的图表div
		$(".hotWaterParamDiv").css("display", "block"); // 显示锅炉房div
		$(".hwpParamDiv").css("display", "none"); // 隐藏热水泵div
		getDevicesDetailChart('hotWaterParam'); // 热水参数
	}

	// 操作热水泵
	function opeaHwp() {
		$(".detail_chart").css("display", "none"); // 隐藏其它的图表div
		$(".hwpParamDiv").css("display", "block"); // 显示热水泵div
		$(".hotWaterParamDiv").css("display", "none"); // 隐藏锅炉div

		getDevicesDetailChart('hwpParam'); // 热水泵频率
	}

	// 操作冷站-水系统
	function opeaWaterSystem() {
		$(".detail_chart").css("display", "none"); // 隐藏其它的图表div
		$(".coolSystemDiv").css("display", "block"); // 显示冷水机组

		getDevicesDetailChart('waterFlow'); // 冷站设备详情，常规制冷系统 | 冷水机组 - 水流量
		//getDevicesDetailChart('waterPressure'); // 冷站设备详情，常规制冷系统 | 冷水机组 - 压力
		getDevicesDetailChart('waterColdParam' + ahu_detail_build); // 冷站设备详情，常规制冷系统 | 冷水机组 - 冷冻水参数
		getDevicesDetailChart('waterCoolParam' + ahu_detail_build); // 冷站设备详情，常规制冷系统 | 冷水机组 - 冷却水参数
	}

	// 操作冷站-泵（冷冻水泵、冷却水泵）
	function opeateRunningParam() {
		$(".detail_chart").css("display", "none"); // 隐藏其它的图表div
		$(".fault_tab_content > .sub_title_block:eq(1)").css("display", "none"); // 隐藏运行趋势
		$(".fault_tab_content > .tab").css("display", "none"); // 隐藏运行趋势
		$(".fault_tab_content > .sub_title_block:eq(2)").css("display", "none"); // 隐藏设备详情
		$(".fault_tab_content > .runningDiv").css("display", "none"); // 隐藏设备详情图表
		//$(".runningDiv").css("display", "block"); // 显示频率和流程、扬程
		//getDevicesDetailChart('runFrequency'); // 运行频率
		//getDevicesDetailChart('runningWind'); // 运行流量、扬程
	}

	// 操作冷站-冷却塔
	function opeaCoolTower() {
		$(".detail_chart").css("display", "none"); // 隐藏其它的图表div
		$(".fault_tab_content > .sub_title_block:eq(1)").css("display", "none"); // 隐藏运行趋势
		$(".fault_tab_content > .tab").css("display", "none"); // 隐藏运行趋势
		$(".fault_tab_content > .sub_title_block:eq(2)").css("display", "none"); // 隐藏设备详情
		$(".fault_tab_content > .coolTowerDiv").css("display", "none"); // 隐藏设备详情图表
		//$(".coolTowerDiv").css("display", "block"); // 显示冷却塔
		//getDevicesDetailChart('towerWindFrequency'); // 风机频率
		//getDevicesDetailChart('towerCoolParam'); // 冷却水参数
	}

	// 操作空调箱
	function opeaAhu() {
		$(".detail_chart").css("display", "none"); // 隐藏其它的图表div
		$(".ahu_detail").css("display", "block"); // 显示ahu的div
		$(".fault_tab_content > .sub_title_block:eq(2)").find(".btn_group")
				.css("marginLeft", "0px"); // 隐藏其它的图表div
		getDevicesDetailChart('windTempParam'); // 冷却塔设备详情， 送回风温度参数
		getDevicesDetailChart('windHumpParam'); // 冷却塔设备详情，送回风湿度参数
		//getDevicesDetailChart('waterOpen'); // 冷却塔设备详情， 水阀开度
		//getDevicesDetailChart('fanFrequency'); // 冷却塔设备详情， 风机频率
	}

	// 操作送排风机
	function opeaWindSite() {
		$(".detail_chart").css("display", "none"); // 隐藏其它的图表div
		//getDevicesDetailChart('runFrequency'); // 送排风机运行频率
		//if("${equipmentMonitor.isShowWindPressure}" != "none")
		//getDevicesDetailChart('runningWind'); // 送排风机运行风量、风压
	}

	// 操作照明系统-照明回路
	function opeaLight() {
		$(".detail_chart").css("display", "none"); // 隐藏其它的图表div
		$(".filter_widget").css("display", "none"); // 隐藏其它的图表div
		$(".fault_tab_content > .sub_title_block:eq(1)").css("display", "none"); // 隐藏其它的图表div
		$(".fault_tab_content > .tab:eq(0)").css("display", "none"); // 隐藏其它的图表div
		$(".lightOpenNumDiv").css("display", "block"); // 显示照明回路开启台数
		$(".single_tab_title>p").css('display', 'none');
		$(".fcuAndLighting").show();
		detail_floor = ahu_detail_floor = dev_cur_floor = "1F";
		$("#chooseFloorList").val("1F");
		dynamicBuildInfo('light'); // 显示各楼层照明回路的实时状态 
		getDevicesDetailChart('lightOpenNum'); // 显示照明开启状态的曲线图
	}

	// 操作风机盘管
	function opeaFcu() {
		$(".detail_chart").css("display", "none"); // 隐藏其它的图表div
		$(".filter_widget").css("display", "none"); // 隐藏其它的图表div
		$(".fault_tab_content > .sub_title_block:eq(1)").css("display", "none"); // 隐藏其它的图表div
		$(".fault_tab_content > .tab:eq(0)").css("display", "none"); // 隐藏其它的图表div
		$(".single_tab_title>p").css('display', 'none');
		$(".fcuOpenNumDiv").css("display", "block"); // 显示风机盘管开启台数
		$(".fcuAndLighting").show();
		detail_floor = ahu_detail_floor = dev_cur_floor = "1F";
		$("#chooseFloorList").val("1F");
		dynamicBuildInfo('fcu'); // 显示各楼层风机盘管的实时状态 
		getDevicesDetailChart('fcuOpenNum'); // 显示风机盘管状态的曲线图
	}
</script>