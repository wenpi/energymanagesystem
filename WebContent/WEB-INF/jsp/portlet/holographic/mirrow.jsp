<!-- 此处请注意，不要使用IDE的格式化，格式化后前台会报错  ${regEqpMap};这段代码格式化后前台会报错的-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<%-- json data url --%>
<%@ include file="timer/ticker.jsp"%>

<style>
.highlight {
	background: none;
	font-weight: bold;
	margin: 0 1px;
}
</style>

<portlet:actionURL var="detailURL">
	<portlet:param name="action" value="detail" />
</portlet:actionURL>

<portlet:renderURL var="renderHolographic" />

<portlet:renderURL var="renderDetail">
	<portlet:param name="action" value="detail" />
</portlet:renderURL>
<%-- 全局变量 --%>

<script type="text/javascript">
	// 设置顶部的皮肤背景颜色 
	try{
		$('#nav_bg_div').css("background-color", "#0066CC");
		$('.nav_gat_bar>li').css("background-color", "#003399");
	}catch(e){}

	Date.prototype.format = function(format) {
		var o = {
			"M+" : this.getMonth() + 1, //month
			"d+" : this.getDate(), //day
			"h+" : this.getHours(), //hour
			"m+" : this.getMinutes(), //minute
			"s+" : this.getSeconds(), //second
			"q+" : Math.floor((this.getMonth() + 3) / 3), //quarter
			"S" : this.getMilliseconds()
		//millisecond
		};
		if (/(y+)/.test(format))
			format = format.replace(RegExp.$1, (this.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		for ( var k in o)
			if (new RegExp("(" + k + ")").test(format))
				format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
						: ("00" + o[k]).substr(("" + o[k]).length));
		return format;
	};
	
	//zzx于20130924添加
	var nowdate = new Date();
	var <portlet:namespace />start_date = nowdate.getFullYear() + "-"
			+ (nowdate.getMonth() + 1) + "-" + nowdate.getDate();
	var pubDateFrom = <portlet:namespace />start_date, pubDateTo = "";// 开始时间和结束时间  
	var nowDateFrom = <portlet:namespace />start_date; //当前时间 
	var prettyFrom = <portlet:namespace />start_date; // 开始时间 
	
	// 定义图表的X轴的间隔 (分别是天间隔、 周间隔、月间隔)
	var chart_day_step = 12 * 1, chart_week_step = 12 * 2, chart_month_step = 12 * 4;
	// 判断当前项目是否是中国馆项目 
	var isNotChinaArts = ("${holocfg.itemName}" == "ChinaArts" ? true : false); // 默认不是中国馆
	// 此处请注意，不要使用IDE的格式化，格式化后前台会报错
	var regEqpMap = eval(${regEqpMap});
	var default_regionId = '0000010700010001'; // 默认的区域id(测试淘宝)
</script>

<div class="content center">
	<div class="span12 classify">
		<ul class="nav">
			<li class="device_test highlight" style="font-size: 20px;">设备监测</li>
			<li class="holograph_pic" style="font-size: 20px;">全息图</li>
		</ul>
	</div>
	<div id="swap_info">
		<div class="span12 basic_imformation cur" id="devicemonitor_formdiv"
			style="margin-left: -50px;">
			<!-- 设备监测全局页面 -->
			<div class="fir_inner_content overview">
				<div class="span12 floor_left" id="floor_list">
					<ul class="floor" style="list-style-type: none;">
						<!-- <li class="highlight">A1号楼</li>
						<li>P1号楼</li>
						<li>P2号楼</li>
						<li>T1号楼</li>
						<li>T2号楼</li>
						<li>T3号楼</li>
						<li>T4号楼</li>
						<li>T5号楼</li> -->
						<li>&nbsp;</li>

						<c:forEach items="${ovm}" var="floorlist">
							<li onclick="changeFloor('${floorlist.value.regionId}')">${floorlist.value.regionName}</li>
						</c:forEach>
					</ul>
				</div>
				<div id="floor_hr">
					<hr class="floor_hr_class" style="">
				</div>
				<br />
				<div class="span12" id="all_device">
					<%@include file="commonInclude.jsp"%>
				</div>
			</div>
			<!-- 设备监测全局页面 -->

			<!-- 冷站内容  -->
			<div class="fir_inner_content cold_module">
				<div class="span12">
					<ul class="sub_menu" style="list-style-type: none;">

						<li id="不能去掉"></li>
						<li>冷站 ></li>
						<li id="tabCm" class="highlight">冷机</li>
						<li id="tabWatSys">水系统</li>
						<li id="tabCp">冷却泵</li>
						<li id="tabSp">冷冻泵</li>
						<li id="tabCt">冷却塔</li>
					</ul>
				</div>
				<%@include file="coolMachine.jsp"%>

			</div>
			<!-- end冷站内容 -->
			<!-- 空调机组 -->
			<div id="airConditionGroup" class="span12 air_group_left_l"
				style="display: none;">
				<%@include file="airConditionGroup.jsp"%>	
			</div>
			<!-- end空调机组 -->
			<!-- 空调末端 -->
			<div id="airConditionEndGroup" class="span12 air_group_left_l"
				style="display: none;">
				<%--@include file="airConditionEnd.jsp" --%>
				<%@include file="acus.jsp"%>
			</div>
			<!-- end空调末端 -->

			<!-- 排送风机 -->
			<div id="fan_form" class="span12 fan_margin_left"
				style="display: block;">
				<%@include file="fan.jsp"%>
			</div>
			<!-- end排送风机 -->
		</div>

		<!-- 园区全息图 -->
		<%@include file="holoOverView.jsp"%>
		<!-- end园区全息图 -->
	</div>
</div>

<portlet:resourceURL id="detectionJson" var="detectionDataURL"></portlet:resourceURL>
<portlet:resourceURL id="changeFloorInfo" var="changeFloorInfoURL"></portlet:resourceURL>

<script type="text/javascript">
	//zzx于20131021添加
	if(isNotChinaArts){ // 如果是中国馆的话，则隐藏楼层列表和分割线 
		$('#floor_list').hide(); 
		$('#floor_hr').hide();
		$('#fan_form').hide(); // 隐藏送排风机列
		$('#songpaifeng').hide(); // 隐藏送排风机列
	}

	// 初始化设备监测数据 	
	var detectionData;
	function equipmentDetectionDataInit() {
		$.post('${detectionDataURL}', function(data) {
			 detectionData = data;
		});
	}
	
	// 初始化holo细节图表数据
	var mirrorData;
	var dateRange = "月";
	var level = "1";
	function mirrowDataInit() {
		$.post('${graphicsJsonDataURL}', {
			"mirrowData.dateRange" : dateRange,
			"mirrowData.level" : level
		}, function(data) {
			mirrorData = data;
		});
	}
	
	// 点击全息图 --A1号楼 / P1号楼 等建筑回调 
	function holoBuildingCallback(buildName) {
		initHoloDetailGraphic(buildName);
	}
	
	// 点击建筑楼层 ，触发的 事件 	
	function changeFloor(regionId){
		$.post('${changeFloorInfoURL}', {
			"buildId" : "${holocfg.buildId}",
			"itemName" : "${holocfg.itemName}",
			"regionId" : regionId
		}, function(data) {
			insertIntoAirGroup(data.floorMap); // 插入请求后的空调机组的信息 
			insertIntoColdSite(data.floorMap); // 插入请求后的恒温恒湿空调箱的信息 
		});
		// 此处请注意，不要使用IDE的格式化，格式化后前台会报错
		// regEqpMap = eval(${regEqpMap});
	}
	
	// 插入请求后的空调机组的信息 
	function insertIntoAirGroup(floorMap){

		$('#air_group_value_list').remove();
		
		var str='<div id="air_group_value_list">';
		
		for(var key in floorMap){

			//debugger;
			str += '<div class="unit_stlye cold_classify">';
			str += '<div onclick="airConditionPageInit()" class="classfiy_title air_title">';
			str += '<ul class="device_title" style="list-style-type: none;">';
			str += '<li style="cursor: pointer;" onclick="clickRegion('+floorMap[key].regionId+')">'+floorMap[key].regionName+'</li>';
			str += '<li id="a1CoolerOn"></li>';
			str += '<li></li>';
			str += '</ul>';
			str += '</div>';
			str += '<div class="classify_data air_data">';
			str += '<table class="device_para">';
			str += '<tbody class="tbod">';
			str += '<tr><td id=" ">';
			//str += '<c:if test="${entryFC.value.count.ahu<=0}">0</c:if> ';
			//str += '<c:if test="${entryFC.value.count.ahu>0}">${entryFC.value.count.ahu-1 }</c:if>';
			str += '<sup>台</sup></td>';
			str += '<td id=" ">';
			//str += '<c:if test="${entryFC.value.regionId=='0000010700010001'}">${opened.ahu_0}</c:if>';
			//str += '<c:if test="${entryFC.value.regionId=='0000010700010002'}">${opened.ahu_5}</c:if>';
			//str += '<c:if test="${entryFC.value.regionId=='0000010700010003'}">${opened.ahu_33}</c:if>';
			//str += '<c:if test="${entryFC.value.regionId=='0000010700010004'}">${opened.ahu_41}</c:if>';
			//str += '<c:if test="${entryFC.value.regionId=='0000010700010005'}">${opened.ahu_49}</c:if>';
			str += '<sup>台</sup></td><td id=" ">';
			//str += '<c:if test="${entryFC.value.count.fau<=0}">0</c:if> ';
			//str += '<c:if test="${entryFC.value.count.fau>0}">${entryFC.value.count.fau-1 }</c:if>';
			//str += '<c:if test="${entryFC.value.count.fau==null}">0</c:if>';
			str += '<sup>台</sup></td><td id=" ">';
			//str += '<c:if test="${entryFC.value.count.fau<=0}">0</c:if> <c:if test="${entryFC.value.count.fau>0}">${entryFC.value.count.fau-1 }</c:if>';
			//str += '<c:if test="${entryFC.value.count.fau==null}">0</c:if> ';
			str += '<sup>台</sup></td></tr><tr>';
			str += '<td>总数</td>';
			str += '<td>开启</td>';
			str += '<td>总数</td>';
			str += '<td>开启</td>';
			str += '</tr>';
			str += '<tr>';
			str += '<td></td>';
			str += '<td style="font-size: 14px;" id="test_region">空调箱</td>';
			str += '<td style="font-size: 14px;">新风箱</td>';
			str += '<td></td>';
			str += '</tr>';
			str += '</tbody>';
			str += '</table>';
			str += '</div>';
			str += '</div>';
		}
		
		str += '</div>';
		$('#air_group_list').append(str);
	}
	
	// 插入请求后的恒温恒湿空调箱的信息 
	function insertIntoColdSite(floorMap){

		$('#cold_site_value_list').remove();
		
		var str='<div id="cold_site_value_list">';
		
		for(var key in floorMap){
			str += '<div class="unit_stlye cold_classify">';
			str += '<div class="classfiy_title terminal_title"';
			str += 'onclick="airCdtEndPageInit()">';
			str += '<ul class="device_title" style="list-style-type: none;">';
			str += '<li style="cursor: pointer;" onclick="clickAcusRegion('+floorMap[key].regionId+')">'+floorMap[key].regionName+'</li>';
			str += '<li id="a1CoolerOn"></li>';
			str += '</ul>';
			str += '</div>';
			str += '<div class="classify_data terminal_data">';
			str += '<table class="device_para">';
			str += '<tbody class="tbod">';
			str += '<tr><td id=" ">';
			//str += '<c:if test="${dvd.value.count.acu==null}">0</c:if>';
			//str += '<c:if test="${dvd.value.count.acu<46}">${dvd.value.count.acu-1}</c:if>';
			//str += '<c:if test="${dvd.value.count.acu==46}">${dvd.value.count.acu}</c:if>';
			str += '<sup>台</sup></td>';
			str += '<td id=" ">';
			//str += '<c:if test="${dvd.value.count.acu==null}">0</c:if>';
			//str += '<c:if test="${dvd.value.count.acu<46}">${dvd.value.count.acu-1}</c:if>';
			//str += '<c:if test="${dvd.value.count.acu==46}">${dvd.value.count.acu}</c:if>';
			str += '<sup>台</sup></td>';
			str += '</tr>';
			str += '<tr>';
			str += '<td>总数</td>';
			str += '<td>开启</td>';
			str += '</tr>';
			str += '</tbody>';
			str += '</table>';
			str += '</div>';
			str += '</div>';
		}
		
		str += '</div>';
		
		$('#cold_site_list').append(str); // 拼接字符串
	}
	
	// test
</script>