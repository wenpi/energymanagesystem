<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-7-23 下午1点14分
	LastModified Date:
	Description: 能耗统计-建筑总能耗分项
 -->

<div class="div-table">

	<div class="parameter_1 itemize"
		style="background-color:${buildtotalconsumption.backgroundColor_2};">
		<div class="page_header">
			<h1>${buildtotalconsumption.title2}</h1>
		</div>
		<h5>${buildtotalconsumption.description_2}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td>84<sup>%</sup></td>
				<td>84<sup>%</sup></td>
			</tr>
			<tr>
				<td>建筑用电</td>
				<td>与昨日相比</td>
			</tr>
			<tr>
				<td>2<sup>%</sup></td>
				<td>1<sup>%</sup></td>
			</tr>
			<tr>
				<td>建筑用水</td>
				<td>与昨日相比</td>
			</tr>
		</table>
	</div>

	<div class="timediv">
		<input id="<portlet:namespace />datetime2" type="hidden" />
		<div id="<portlet:namespace />day2" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate2('day')">日视图</div>
		<div id="<portlet:namespace />week2" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate2('week')">周视图</div>
		<div id="<portlet:namespace />month2" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate2('month')">月视图</div>
		<div id="<portlet:namespace />year2" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate2('year')">年视图</div>

		<div id="<portlet:namespace />output2" class="tdatt output">输出</div>

		<div id="<portlet:namespace />energybreakdown"
			class="basicchartdiv jzznhfx"></div>

		<div class="bottom_link">
			<i><a href="${buildtotalconsumption.linkUrl_1_2}">${buildtotalconsumption.linkName_1_2}</a></i><i><a
				href="${buildtotalconsumption.linkUrl_2_2}">${buildtotalconsumption.linkName_2_2}</a></i>
		</div>
	</div>

</div>


<script type="text/javascript">
var <portlet:namespace />timeArr2 = ["<portlet:namespace />day2", "<portlet:namespace />week2", "<portlet:namespace />month2", "<portlet:namespace />year2"];    
function <portlet:namespace />changeColor2(type){
	//设置其它td标签的字体颜色
	$.each(<portlet:namespace />timeArr2,function(i,obj) {
		document.getElementById(this).style.color='#666666';
	});
	
	// 设置当前点击的标签的字体颜色
	document.getElementById("<portlet:namespace />"+type+"2").style.color='red';
}

var start_date2 = ''; // 开始时间
var choose_type2 = ''; // 点击类型（日、周、月、年）

// 选择时间（日、周、月、年）
function <portlet:namespace />selectdate2(type) {
	// 切换点击字体效果
	<portlet:namespace />changeColor2(type);
	
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
		el : '<portlet:namespace />datetime2',
		dateFmt : dformt,
		onpicked : function(dp) {
			var _time = dp.cal;
			start_date2 = _time.getDateStr('yyyy-MM-dd');
			choose_type2 = type;
		}
	});
}
</script>