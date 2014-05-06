<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="light_sys">
	<div class="device_modle" id="light">
		<div class="chart_title has_border_radius_top">
			照明回路
			<div class="more more_light" onclick="showDetails('照明系统','照明回路', 7, 'light')"></div>
			<div class="zoomin"></div>
		</div>
		<div class="chart">
			<div class="btn_group">
				<input type="hidden" id="D_1" value="1"> <input
					type="hidden" id="D_2" value="1">
				<!-- <div class="btn_press">开启回路</div>
				<div>开启功率</div> -->
			</div>
			<div class="chartArea" id="<portlet:namespace/>chart_light" style="height: 135px"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		// 照明回路
		var equip_light = [{name : 'A1号楼',total : 7, current : 4}, 
						 {name : 'P1号楼',total : 0, current : 0}, 
						 {name : 'P2号楼',total : 0, current : 0}, 
						 {name : 'T1号楼',total : 6, current : 3}, 
						 {name : 'T2号楼',total : 6, current : 2}, 
						 {name : 'T3号楼',total : 10, current : 6}, 
						 {name : 'T4号楼',total : 6, current : 1}, 
						 {name : 'T5号楼',total : 6, current : 5}];
		var obj_light = $("#light");

		detail_tables(equip_light, obj_light, '');
		detail_tables(equip_light, $(".dialog-popover"), 7);
		$(".more_light").data("data", equip_light);
		smallChartAndBuild('<portlet:namespace/>chart_light', null, ahu_build_id);
	});
</script>