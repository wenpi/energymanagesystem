<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午8点38分
	LastModified Date:
	Description: 能效分析-空调系统能效指标概览
 -->


<div class="div-table">

	<div class="timediv">
		<input id="<portlet:namespace />datetime5" type="hidden" />
		<div id="<portlet:namespace />day5" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('day')">日视图</div>
		<div id="<portlet:namespace />week5" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('week')">周视图</div>
		<div id="<portlet:namespace />month5" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('month')">月视图</div>
		<div id="<portlet:namespace />year5" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('year')">年视图</div>

		<div id="<portlet:namespace />thisyearddd" class="tdatt output">输出</div>

		<div id="<portlet:namespace />airconditiontargetview"
			class="chartdiv250 ktxtnxzbgl"></div>

		<div class="bottom_link">
			<i><a href="${importantenergytarget.linkUrl_1_5}">${importantenergytarget.linkName_1_5}</a></i>
		</div>

	</div>

	<div class="parameter air_score"
		style="background-color:${importantenergytarget.backgroundColor_5};">
		<div class="page_header">
			<h1>空调系统能效指标概览</h1>
		</div>
		<h5>${importantenergytarget.description_5}</h5>
		<div class="division"></div>
		<div class="air_system_target"></div>
	</div>

</div>

<script type="text/javascript">
var <portlet:namespace />timeArr5 = ["<portlet:namespace />day5", "<portlet:namespace />week5", "<portlet:namespace />month5", "<portlet:namespace />year5"];    
function <portlet:namespace />changeColor5(type){
	//设置其它td标签的字体颜色
	$.each(<portlet:namespace />timeArr5,function(i,obj) {
		document.getElementById(this).style.color='#666666';
	});
	
	// 设置当前点击的标签的字体颜色
	document.getElementById("<portlet:namespace />"+type+"5").style.color='red';
}

	//6.为建筑总用水趋势报表填充数据
	// renderToColumnAndLineCharts('<portlet:namespace />carbonfootprint', 'line', '建筑碳足迹（t）', '#ACC776','2', 'white');

	var start_date5 = ''; // 开始时间
	var choose_type5 = ''; // 点击类型（日、周、月、年）

	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate5(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor5(type);
		var dformt = 'yyyy-MM-dd';
		if (type == "day")
			dformt = 'yyyy-MM-dd';
		else if (type == "week")
			dformt = 'yyyy-MM-dd';
		else if (type == "month")
			dformt = 'MM';
		else if (type == "year")
			dformt = 'yyyy';

		WdatePicker({
			el : '<portlet:namespace />datetime5',
			dateFmt : dformt,
			onpicked : function(dp) {
				var _time = dp.cal;
				start_date5 = _time.getDateStr('yyyy-MM-dd');
				choose_type5 = type;
			}
		});
	}
	
</script>