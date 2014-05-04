<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-7-26 下午2点27分
	LastModified Date:
	Description: 能耗统计-空调箱用电趋势
 -->


<div class="div-table">

	<div class="content450 center">
		<div class="vision_6">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${airconditionboxelectrotrend.backgroundColor};">
					<h4 class="h4size">空调箱用电趋势</h4>
					<div>${airconditionboxelectrotrend.description}</div>
				</div>

				<div class="timediv50">
					<input id="<portlet:namespace />datetime" type="hidden" />
					<div id="<portlet:namespace />day" style="color: red;"
						class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate('day')">日视图</div>
					<div id="<portlet:namespace />week" class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate('week')">周视图</div>
					<div id="<portlet:namespace />month" class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate('month')">月视图</div>
					<div id="<portlet:namespace />year" class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate('year')">年视图</div>
					<div class="inlinedivstyle selectdivstyle">
						&nbsp;与&nbsp; <select name="<portlet:namespace />timeselect"
							id="<portlet:namespace />timeselect" class="selectstyle">
							<option selected="selected"></option>
						</select> &nbsp;对比&nbsp;
					</div>
					<div id="<portlet:namespace />thisyearddd" class="tdatt output"
						onclick="<portlet:namespace />selectdate('year')">输出</div>

				</div>

				<div id="<portlet:namespace />airconditionboxelectrotrend" class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${airconditionboxelectrotrend.linkUrl_1}">${airconditionboxelectrotrend.linkName_1}</a></i><i><a
						href="${airconditionboxelectrotrend.linkUrl_2}">${airconditionboxelectrotrend.linkName_2}</a></i>
				</div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	//为报表填充数据  (test数据)
	//renderToColumnAndLineCharts('airconditionboxelectrotrend','column','空调箱用电量(kWh)','#33CCCC','5','');

	var start_date = ''; // 开始时间
	var choose_type = ''; // 点击类型（日、周、月、年）

	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate(type) {
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
			el : '<portlet:namespace />datetime',
			dateFmt : dformt,
			onpicked : function(dp) {
				start_date = dp.cal.getDateStr('yyyy-MM-dd');
				choose_type = type;

				// 获取图表
				<portlet:namespace />getChart();
			}
		});
	}

	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getChart() {
		$
				.post(
						'<portlet:resourceURL id="getSingleChartData"></portlet:resourceURL>',
						{
							from : start_date,
							to : '',
							type : choose_type
						},
						function(data) {
							//var chardata = data.chart;
							var cataList = data.cataList;
							var dataList = data.dataList;

							// 生成图表
							renderToColumnAndLineCharts(
									'<portlet:namespace />airconditionboxelectrotrend',
									"${airconditionboxelectrotrend.chartType}",
									"${airconditionboxelectrotrend.yLeftTitle}",
									"${airconditionboxelectrotrend.lineColor}",
									"${airconditionboxelectrotrend.xStep}",
									"${airconditionboxelectrotrend.fillColor}",
									cataList, dataList);

						}, 'json');
	}

	// 默认显示当前时间
	var nowdate = new Date();
	start_date = nowdate.getFullYear() + "-" + nowdate.getMonth() + "-"
			+ nowdate.getDate();
	choose_type = "day";
	<portlet:namespace />getChart();
</script>