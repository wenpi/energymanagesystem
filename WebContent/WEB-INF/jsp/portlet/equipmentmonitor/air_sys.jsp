<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="air_sys">
	<!-- P1楼冷站 | 常规制冷 -->
	<div class="device_modle" id="coldSite_one">
		<div class="chart_title has_border_radius_top" title="P1楼冷站">
			P1楼冷站 | 常规制冷
			<div class="more more_coldSite_one" onclick="showDetails('空调系统', 'P1楼冷站', 1, 'coldSite_one')"></div>
			<div class="zoomin"></div>
		</div>
		<div class="chart">
			<div class="btn_group">
				<input type="hidden" id="C_1" value="1"> <input
					type="hidden" id="C_2" value="1">
				<div class="btn_press">开启台数</div>
				<!-- <div>开启冷量</div>
				<div>开启功率</div> -->
			</div>
			<div class="chartArea" id="<portlet:namespace/>chart_coldSite_one" style="height:135px"></div>
		</div>
	</div>
	<!-- P2楼冷站 | 常规制冷 -->
	<div class="device_modle" id="coldSite_two" title="P2楼冷站">
		<div class="chart_title has_border_radius_top">
			P2楼冷站 | 常规制冷
			<div class="more more_coldSite_two" onclick="showDetails('空调系统', 'P2楼冷站', 1, 'coldSite_two')"></div>
			<div class="zoomin"></div>
		</div>
		<div class="chart">
			<div class="btn_group">
				<input type="hidden" id="C_1" value="1"> <input
					type="hidden" id="C_2" value="1">
				<div class="btn_press">开启台数</div>
				<!-- <div>开启冷量</div>
				<div>开启功率</div> -->
			</div>
			<div class="chartArea" id="<portlet:namespace/>chart_coldSite_two" style="height:135px"></div>
		</div>
	</div>
	<!-- A1楼冷站 | 常规制冷 -->
	<div class="device_modle" id="coldSite_three" title="A1楼冷站">
		<div class="chart_title has_border_radius_top">
			A1楼冷站 | 常规制冷
			<div class="more more_coldSite_three" onclick="showDetails('空调系统', 'A1楼冷站', 1, 'coldSite_three')"></div>
			<div class="zoomin"></div>
		</div>
		<div class="chart">
			<div class="btn_group">
				<input type="hidden" id="C_1" value="1"> <input
					type="hidden" id="C_2" value="1">
				<div class="btn_press">开启台数</div>
				<!-- <div>开启冷量</div>
				<div>开启功率</div> -->
			</div>
			<div class="chartArea" id="<portlet:namespace/>chart_coldSite_three" style="height:135px"></div>
		</div>
	</div>
	<div class="device_modle equ_top" id="boiler_room">
		<div class="chart_title has_border_radius_top">
			锅炉房
			<div class="more more_boiler_room" onclick="showDetails('空调系统', '锅炉房', 2, 'boiler_room')"></div>
			<div class="zoomin"></div>
		</div>
		<div style="height: 261px;" class="chart">
			<div class="btn_group">
				<input type="hidden" id="G_1" value="1"> <input
					type="hidden" id="G_2" value="1">
				<div class="btn_press">开启台数</div>
				<!-- <div>开启热量</div>
				<div>开启功率</div> -->
			</div>
			<div class="chartArea" id="<portlet:namespace/>chart_boiler_room" style="height:217px"></div>
		</div>
	</div>
	<!-- 空调箱 -->
	<div class="device_modle equ_top" id="ahu">
		<div class="chart_title has_border_radius_top">
			空调箱
			<div class="more more_ahu" onclick="showDetails('空调系统', '空调箱', 3, 'ahu')"></div>
			<div class="zoomin"></div>
		</div>
		<div class="chart">
			<div class="btn_group">
				<input type="hidden" id="K_1" value="1"> <input
					type="hidden" id="K_2" value="1">
				<div class="btn_press">开启台数</div>
				<!-- <div>开启冷量</div>
				<div>开启功率</div> -->
			</div>
			<div class="chartArea" id="<portlet:namespace/>chart_ahu"  style="height:135px"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		// 冷站1 | 常规制冷系统
		var equip_coldSite_one = [{name : '冷机',total : 6, current : 4}, 
					              {name : '冷冻水泵',total : 7, current : 2}, 
					              {name : '冷却水泵',total : 7, current : 3},
					              {name : '冷却塔',total : 10, current : 7}];
		var obj_coldSite_one = $("#coldSite_one");
		
		// 冷站2 | 常规制冷系统
		var equip_coldSite_two = [{name : '冷机',total : 4, current : 3}, 
					              {name : '冷冻水泵',total : 5, current : 2}, 
					              {name : '冷却水泵',total : 5, current : 4}, 
					              {name : '冷却塔',total : 10, current : 6}];
		var obj_coldSite_two = $("#coldSite_two");
		
		// 冷站3 | 常规制冷系统
		var equip_coldSite_three = [{name : '冷机',total : 3, current : 3}, 
					                {name : '冷冻水泵',total : 4, current : 3}, 
					                {name : '冷却水泵',total : 4, current : 3}, 
					                {name : '冷却塔',total : 5, current : 3}];
		var obj_coldSite_three = $("#coldSite_three");
		
		// 获取各冷站的开启台数
		$.ajax({
			type : "POST",
			async : false, // 同步
			url : "<portlet:resourceURL id='getDatasForBuilds'></portlet:resourceURL>",
			data : {
				from : ('${equipmentMonitor.defaulttime}'==''?date0:'${equipmentMonitor.defaulttime}'),
				name : coldSite_t_name,
				id : coldSite_t_id,
				ispd : coldSite_t_ispd,
				type : 'span',
				decimals : '0',
				region_id : 'total',
				build_id : 'P1,P2,A1'
			},
			success : function(result) {
				var dataList = result.data;
				
				equip_coldSite_one = [{name : '冷机',total : 6, current : parseFloat(dataList[0][0])}, 
						              {name : '冷冻水泵',total : 7, current : parseFloat(dataList[0][1])}, 
						              {name : '冷却水泵',total : 7, current : parseFloat(dataList[0][2])},
						              {name : '冷却塔',total : 10, current : parseFloat(dataList[0][3])}];
				
				equip_coldSite_two = [{name : '冷机',total : 4, current : parseFloat(dataList[1][0])}, 
						              {name : '冷冻水泵',total : 5, current : parseFloat(dataList[1][1])}, 
						              {name : '冷却水泵',total : 5, current : parseFloat(dataList[1][2])}, 
						              {name : '冷却塔',total : 10, current : parseFloat(dataList[1][3])}];
				
				equip_coldSite_three = [{name : '冷机',total : 3, current : parseFloat(dataList[2][0])}, 
						                {name : '冷冻水泵',total : 4, current : parseFloat(dataList[2][1])}, 
						                {name : '冷却水泵',total : 4, current : parseFloat(dataList[2][2])}, 
						                {name : '冷却塔',total : 5, current : parseFloat(dataList[2][3])}];
			},
			error : function(result) {
				console.log('getDatasForBuilds + error');
			}
		});
		
		// 锅炉房
		var equip_boiler_room = [{name : '锅炉',total : 2,current : 1}, 
				                 {name : '热水泵',total : 3,current : 3}, 
				                 {name : '换热器',total : 0,current : 0}];
		var obj_boiler_room = $("#boiler_room");
		
		//空调箱
		var equip_ahu =  [{name : 'A1号楼',total : 7, current : 4}, 
						 {name : 'P1号楼',total : 0, current : 0}, 
						 {name : 'P2号楼',total : 0, current : 0}, 
						 {name : 'T1号楼',total : 6, current : 3}, 
						 {name : 'T2号楼',total : 6, current : 2}, 
						 {name : 'T3号楼',total : 10, current : 6}, 
						 {name : 'T4号楼',total : 6, current : 1}, 
						 {name : 'T5号楼',total : 6, current : 5}];
		var obj_ahu = $("#ahu");
		
		// 获取各建筑的空调箱台数
		$.ajax({
			type : "POST",
			async : false, // 同步
			url : "<portlet:resourceURL id='getDatasForBuilds'></portlet:resourceURL>",
			data : {
				from : ('${equipmentMonitor.defaulttime}'==''?date0:'${equipmentMonitor.defaulttime}'),
				name : ahu_t_name,
				id : ahu_t_id,
				ispd : ahu_t_ispd,
				type : 'span',
				decimals : '0',
				region_id : 'total',
				build_id : all_build_list.join()
			},
			success : function(result) {
				var dataList = result.data;
				equip_ahu =  [{name : 'A1号楼',total : 7,current : parseFloat(dataList[0][0])}, 
							  {name : 'P1号楼',total : 0,current : parseFloat(dataList[1][0])}, 
							  {name : 'P2号楼',total : 0,current : parseFloat(dataList[2][0])}, 
							  {name : 'T1号楼',total : 6,current : parseFloat(dataList[3][0])}, 
							  {name : 'T2号楼',total : 6,current : parseFloat(dataList[4][0])}, 
							  {name : 'T3号楼',total : 10,current : parseFloat(dataList[5][0])}, 
							  {name : 'T4号楼',total : 6,current : parseFloat(dataList[6][0])}, 
							  {name : 'T5号楼',total : 6,current : parseFloat(dataList[7][0])}];
			},
			error : function(result) {
				console.log('getDatasForBuilds + error');
			}
		});
		
		// 动态生成对应的div和绘图 
		detail_tables(equip_coldSite_one, obj_coldSite_one, '');
		detail_tables(equip_coldSite_one, $(".dialog-popover"), 1);
		$(".more_coldSite_one").data("data", equip_coldSite_one);
		buildSmallChart('<portlet:namespace/>chart_coldSite_one', null);
		
		detail_tables(equip_coldSite_two, obj_coldSite_two, '');
		detail_tables(equip_coldSite_two, $(".dialog-popover"), 2);
		$(".more_coldSite_two").data("data", equip_coldSite_two);
		buildSmallChart('<portlet:namespace/>chart_coldSite_two', null);
		
		detail_tables(equip_coldSite_three, obj_coldSite_three, '');
		detail_tables(equip_coldSite_three, $(".dialog-popover"), 3);
		$(".more_coldSite_three").data("data", equip_coldSite_three);
		buildSmallChart('<portlet:namespace/>chart_coldSite_three', null);
		
		detail_tables(equip_boiler_room, obj_boiler_room, '');
		detail_tables(equip_boiler_room, $(".dialog-popover"), 4);
		$(".more_boiler_room").data("data", equip_boiler_room);
		buildSmallChart('<portlet:namespace/>chart_boiler_room', null);
		
		detail_tables(equip_ahu, obj_ahu, '');
		detail_tables(equip_ahu, $(".dialog-popover"), 5);
		$(".more_ahu").data("data", equip_ahu);
		smallChartAndBuild('<portlet:namespace/>chart_ahu', null, ahu_build_id);
	});

var now = new Date();
var date0 = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();

if(publicTime != ""){
	date0 = publicTime;
}

// 生成设备监测-首页-小图-chart
function buildSmallChart(chartId, curId) {
	var num1 = $("#" + chartId).siblings().find("input:eq(0)").val(); // 代表设备在Table中的位置，从1开始
	var num2 = $("#" + chartId).siblings().find("input:eq(1)").val(); // 代表按钮的位置，从1开始
	var num3 = $("#" + chartId).parent().parent().attr("id");

	// 冷站和锅炉房之外的模块执行特定函数
	var build_id = ahu_build_id;
	if(chartId.indexOf("coldSite_one") != -1) {
		build_id = 'P1';
	} else if (chartId.indexOf("coldSite_two") != -1) {
		build_id = 'P2';
	} else if (chartId.indexOf("coldSite_three") != -1) {
		build_id = 'A1';
	} else if (chartId.indexOf("boiler_room") != -1) {
		build_id = 'A1';
	}
	
	eval("var UrlName = s_name_" + (curId != null ? curId : num3)); // 拼变量名
	eval("var UrlId = s_id_" + (curId != null ? curId : num3));
	eval("var UrlIspd = s_ispd_" + (curId != null ? curId : num3));	
	
	var chartColor = "#7E9BB8";
	if (num1 == 2) {
		chartColor = "#ACB4D0";
	} else if (num1 == 3) {
		chartColor = "#FEFEFE";
	}
	//选取相应的name、id、ispd
	Uname = UrlName[num2-1][num1-1];
	Uid = UrlId[num2-1][num1-1];
	Uispd = UrlIspd[num2-1][num1-1];
	// console.log("Uname--" + Uname + "--Uid--" + Uid + "--Uispd--" + Uispd);
	$.post("<portlet:resourceURL id='getCommonChartData'></portlet:resourceURL>", {
		from : ('${equipmentMonitor.defaulttime}' == '' ? date0 : '${equipmentMonitor.defaulttime}'),
		name : Uname,
		id : Uid,
		ispd : Uispd,
		decimals : ('${equipmentMonitor.decimals}'==''?'0.0':'${equipmentMonitor.decimals}'),//显示小数位数，首选项传
		type : 'day',
		region_id : 'total',
		build_id : build_id
	}, function(data) {
		var name = "";
		// 根据数据产生name
		var str = "div:eq(" + parseInt(num2 - 1) + ")";
		name += $("#" + chartId).parent().siblings(".data").children(str).find("h4").html();
		name += $("#" + chartId).siblings().find(".btn_press").html();
		renderToChart(chartId, chartColor, data.dataList[0], name);
	});
}

// 生成设备监测-首页-带建筑的小图
function smallChartAndBuild(chartId, curId, buildId) {
	var num1 = $("#" + chartId).siblings().find("input:eq(0)").val(); // 代表设备在Table中的位置，从1开始
	var num2 = $("#" + chartId).siblings().find("input:eq(1)").val(); // 代表按钮的位置，从1开始
	var num3 = $("#" + chartId).parent().parent().attr("id");
	
	eval("var UrlName = s_name_" + (curId != null ? curId : num3)); // 拼变量名
	eval("var UrlId = s_id_" + (curId != null ? curId : num3));
	eval("var UrlIspd = s_ispd_" + (curId != null ? curId : num3));	
	
	var chartColor = "#7E9BB8";
	if (num1 == 2) {
		chartColor = "#ACB4D0";
	} else if (num1 == 3) {
		chartColor = "#FEFEFE";
	}
	//选取相应的name、id、ispd
	Uname = UrlName[num2-1][num1-1];
	Uid = UrlId[num2-1][num1-1];
	Uispd = UrlIspd[num2-1][num1-1];
	$.post("<portlet:resourceURL id='getCommonChartData'></portlet:resourceURL>", {
		from : ('${equipmentMonitor.defaulttime}' == '' ? date0 : '${equipmentMonitor.defaulttime}'),
		name : Uname,
		id : Uid,
		ispd : Uispd,
		decimals : ('${equipmentMonitor.decimals}'==''?'0.0':'${equipmentMonitor.decimals}'),//显示小数位数，首选项传
		type : 'day',
		source : 'moniotr',
		region_id : 'total',
		build_id : buildId
	}, function(data) {
		var name = "";
		// 根据数据产生name
		var str = "div:eq(" + parseInt(num2 - 1) + ")";
		name += $("#" + chartId).parent().siblings(".data").children(str).find("h4").html();
		name += $("#" + chartId).siblings().find(".btn_press").html();
		renderToChart(chartId, chartColor, data.dataList[0], name);
	});
}
</script>