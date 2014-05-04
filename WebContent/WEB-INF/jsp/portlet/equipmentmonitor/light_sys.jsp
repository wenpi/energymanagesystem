<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="light_sys">
	<div class="device_modle">
		<div class="chart_title has_border_radius_top">
			灯具
			<div class="more" onclick="showDetails('照明系统','灯具',7)"></div>
			<div class="zoomin"></div>
		</div>
		<div class="chart">
			<div class="btn_group">
				<input type="hidden" id="D_1" value="1"> <input
					type="hidden" id="D_2" value="1">
				<div class="btn_press">开启回路</div>
				<div>开启功率</div>
			</div>
			<div class="chartArea" id="<portlet:namespace/>chartArea7"
				style="height: 135px"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		var equip_7 = [ {name : 'A1号楼',total : 4,current : 3}, 
									{name : 'P1号楼',total : 4,current : 3}, 
									{name : 'P2号楼',total : 4,current : 3}, 
									{name : 'T1号楼',total : 4,current : 3}, 
									{name : 'T2号楼',total : 4,current : 3}, 
									{name : 'T3号楼',total : 4,current : 3}, 
									{name : 'T4号楼',total : 4,current : 3}, 
									{name : 'T5号楼',total : 4,current : 3} ];
		var obj_7 = $(".light_sys>div:eq(0)");
		detail_tables(equip_7, obj_7, '');
		detail_tables(equip_7, $(".dialog-popover"), 7);
		$(".more:eq(6)").data("data",equip_7);
		//绘图表--初始化
		buildSmallChart('<portlet:namespace/>chartArea7',null);
	});
</script>