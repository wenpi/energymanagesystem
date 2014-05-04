<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="wind">
	<div class="device_modle" id="sendWind">
		<div class="chart_title has_border_radius_top">
			送风机
			<div class="more more_sendWind" onclick="showDetails('空调系统', '送风机', 5, 'sendWind')"></div>
			<div class="zoomin"></div>
		</div>
		<div class="chart">
			<div class="btn_group">
				<input type="hidden" id="S_1" value="1"> <input
					type="hidden" id="S_2" value="1">
				<div class="btn_press">开启台数</div>
				<!-- <div>开启风量</div>
				<div>开启功率</div> -->
			</div>
			<div class="chartArea" id="<portlet:namespace/>sendWind"  style="height:135px"></div>
		</div>
	</div>
	<div class="device_modle" id="exhaustWind">
		<div class="chart_title has_border_radius_top">
			排风机
			<div class="more more_exhaustWind" onclick="showDetails('空调系统', '排风机', 6, 'exhaustWind')"></div>
			<div class="zoomin"></div>
		</div>
		<div class="chart">
			<div class="btn_group">
				<input type="hidden" id="P_1" value="1"> <input
					type="hidden" id="P_2" value="1">
				<div class="btn_press">开启台数</div>
				<!-- <div>开启风量</div>
				<div>开启功率</div> -->
			</div>
			<div class="chartArea" id="<portlet:namespace/>exhaustWind"  style="height:135px"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		var equip_sendWind = [{name : 'A1号楼', total : 7, current : 3},
	                		  {name : 'P1号楼', total : 3, current : 3},
	                		  {name : 'P2号楼', total : 3, current : 3},
	                		  {name : 'T1号楼', total : 0, current : 3},
	                		  {name : 'T2号楼', total : 4, current : 3},
	                		  {name : 'T3号楼', total : 0, current : 3},
	                		  {name : 'T4号楼', total : 0, current : 3},
	                		  {name : 'T5号楼', total : 4, current : 3}];
		// 获取各建筑的送风机台数
		$.ajax({
			type : "POST",
			async : false, // 同步
			url : "<portlet:resourceURL id='getDatasForBuilds'></portlet:resourceURL>",
			data : {
				from : ('${equipmentMonitor.defaulttime}'==''?date0:'${equipmentMonitor.defaulttime}'),
				name : sendWind_t_name,
				id : sendWind_t_id,
				ispd : sendWind_t_ispd,
				type : 'span',
				region_id : 'total',
				build_id : all_build_list.join()
			},
			success : function(result) {
				var dataList = result.data;
				equip_sendWind = [{name : 'A1号楼', total : 7, current : parseFloat(dataList[0][0])},
		                		  {name : 'P1号楼', total : 3, current : parseFloat(dataList[1][0])},
		                		  {name : 'P2号楼', total : 3, current : parseFloat(dataList[2][0])},
		                		  {name : 'T1号楼', total : 0, current : parseFloat(dataList[3][0])},
		                		  {name : 'T2号楼', total : 4, current : parseFloat(dataList[4][0])},
		                		  {name : 'T3号楼', total : 0, current : parseFloat(dataList[5][0])},
		                		  {name : 'T4号楼', total : 0, current : parseFloat(dataList[6][0])},
		                		  {name : 'T5号楼', total : 4, current : parseFloat(dataList[7][0])}];
			},
			error : function(result) {
				console.log('getDatasForBuilds + error');
			}
		});
		
		var equip_exhaustWind = [{name : 'A1号楼', total : 12, current : 5},
								 {name : 'P1号楼', total : 8, current : 2},
								 {name : 'P2号楼', total : 8, current : 4},
								 {name : 'T1号楼', total : 2, current : 3},
								 {name : 'T2号楼', total : 0, current : 0},
								 {name : 'T3号楼', total : 5, current : 5},
								 {name : 'T4号楼', total : 6, current : 2}, 
								 {name : 'T5号楼', total : 0, current : 3}];
		// 获取各建筑的排风机台数
		$.ajax({
			type : "POST",
			async : false, // 同步
			url : "<portlet:resourceURL id='getDatasForBuilds'></portlet:resourceURL>",
			data : {
				from : ('${equipmentMonitor.defaulttime}'==''?date0:'${equipmentMonitor.defaulttime}'),
				name : exhaustWind_t_name,
				id : exhaustWind_t_id,
				ispd : exhaustWind_t_ispd,
				type : 'span',
				region_id : 'total',
				build_id : all_build_list.join()
			},
			success : function(result) {
				var dataList = result.data;
				equip_exhaustWind = [{name : 'A1号楼', total : 12, current : parseFloat(dataList[0][0])}, 
									 {name : 'P1号楼', total : 8, current : parseFloat(dataList[1][0])},
									 {name : 'P2号楼', total : 8, current : parseFloat(dataList[2][0])}, 
									 {name : 'T1号楼', total : 2, current : parseFloat(dataList[3][0])}, 
									 {name : 'T2号楼', total : 0, current : parseFloat(dataList[4][0])},
									 {name : 'T3号楼', total : 5, current : parseFloat(dataList[5][0])}, 
									 {name : 'T4号楼', total : 6, current : parseFloat(dataList[6][0])}, 
									 {name : 'T5号楼', total : 0, current : parseFloat(dataList[7][0])}];
			},
			error : function(result) {
				console.log('getDatasForBuilds + error');
			}
		});
		
		detail_tables(equip_sendWind, $("#sendWind"), '');
		detail_tables(equip_sendWind, $(".dialog-popover"), 5);
		detail_tables(equip_exhaustWind, $("#exhaustWind"), '');
		detail_tables(equip_exhaustWind, $(".dialog-popover"), 6);
		$(".more_sendWind").data("data", equip_sendWind);
		$(".more_exhaustWind").data("data", equip_exhaustWind);
		// 绘图表--初始化
		smallChartAndBuild('<portlet:namespace/>sendWind', null, ahu_build_id);
		smallChartAndBuild('<portlet:namespace/>exhaustWind', null, ahu_build_id);
	});
</script>