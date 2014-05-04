<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-7-23 下午1点14分
	LastModified Date:
	Description: 能耗统计-建筑总用气趋势 gastrend
 -->

<div class="div-table">

	<div class="parameter_1 gas"
		style="background-color:${buildtotalconsumption.backgroundColor_5};">
		<div class="page_header">
			<h1>${buildtotalconsumption.title5}</h1>
		</div>
		<h5>${buildtotalconsumption.description_5}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td>800<sup>m<sup>3<sup></sup></td>
				<td>5<sup>%</sup></td>
			</tr>
			<tr>
				<td>当日用气量</td>
				<td>与昨日相比</td>
			</tr>
		</table>
	</div>

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

		<div id="<portlet:namespace />yearddd5" class="tdatt output">输出</div>

		<div id="<portlet:namespace />gastrend" class="basicchartdiv jzzyqqs"></div>
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

var start_date5 = ''; // 开始时间
var choose_type5 = ''; // 点击类型（日、周、月、年）

// 选择时间（日、周、月、年）
function <portlet:namespace />selectdate5(type) {
	//切换点击字体效果
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