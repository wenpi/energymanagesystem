<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-7-23 下午1点14分
	LastModified Date:
	Description: 能耗统计-建筑总用水趋势
 -->

<div class="div-table">

	<div class="parameter_1 water"
		style="background-color:${buildtotalconsumption.backgroundColor_4};">
		<div class="page_header">
			<h1>${buildtotalconsumption.title4}</h1>
		</div>
		<h5>${buildtotalconsumption.description_4}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td>20<sup>t</sup></td>
				<td>7<sup>%</sup></td>
			</tr>
			<tr>
				<td>当日用水量</td>
				<td>与昨日相比</td>
			</tr>
		</table>
	</div>

	<div class="timediv">
		<input id="<portlet:namespace />datetime4" type="hidden" />
		<div id="<portlet:namespace />day4" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('day')">日视图</div>
		<div id="<portlet:namespace />week4" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('week')">周视图</div>
		<div id="<portlet:namespace />month4" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('month')">月视图</div>
		<div id="<portlet:namespace />year4" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('year')">年视图</div>

		<div id="<portlet:namespace />yearddd4" class="tdatt output">输出</div>

		<div id="<portlet:namespace />watertrend"
			class="basicchartdiv jzzysqs"></div>
	</div>

</div>


<script type="text/javascript">
var <portlet:namespace />timeArr4 = ["<portlet:namespace />day4", "<portlet:namespace />week4", "<portlet:namespace />month4", "<portlet:namespace />year4"];    
function <portlet:namespace />changeColor4(type){
	//设置其它td标签的字体颜色
	$.each(<portlet:namespace />timeArr4,function(i,obj) {
		document.getElementById(this).style.color='#666666';
	});
	
	// 设置当前点击的标签的字体颜色
	document.getElementById("<portlet:namespace />"+type+"4").style.color='red';
}

	// 为建筑总能耗趋势报表填充数据
	var start_date4 = ''; // 开始时间
	var choose_type4 = ''; // 点击类型（日、周、月、年）
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate4(type) {
		//切换点击字体效果
		<portlet:namespace />changeColor4(type);
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
			el : '<portlet:namespace />datetime4',
			dateFmt : dformt,
			onpicked : function(dp) {
				var _time = dp.cal;
				start_date4 = _time.getDateStr('yyyy-MM-dd');
				choose_type4 = type;
			}
		});
	}

</script>