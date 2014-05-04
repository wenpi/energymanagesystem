<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-22 上午10点22分
	LastModified Date:
	Description: 共用的多个图表的渲染页面  
 -->

<div class="div-table">

	<div class="content450 center left20">
		<div class="analysis_2">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${commonmorechart.backgroundColor};">
					<h4 class="h4size">${commonmorechart.title}</h4>
					<div>${commonmorechart.description}</div>
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

					<div id="<portlet:namespace />output" class="tdatt output">输出</div>
				</div>

				<div id="<portlet:namespace />commonmorechart" class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${commonmorechart.linkUrl_1}">${commonmorechart.linkName_1}</a></i>
					<i><a href="${commonmorechart.linkUrl_2}">${commonmorechart.linkName_2}</a></i>
					<i><a href="${commonmorechart.linkUrl_3}">${commonmorechart.linkName_3}</a></i>
				</div>
			</div>
		</div>
	</div>

</div>


<script type="text/javascript">
var <portlet:namespace />timeArr = ["<portlet:namespace />day", "<portlet:namespace />week", "<portlet:namespace />month", "<portlet:namespace />year"];    
function <portlet:namespace />changeColor(type){
	//设置其它td标签的字体颜色
	$.each(<portlet:namespace />timeArr,function(i,obj) {
		document.getElementById(this).style.color='#666666';
	});
	
	// 设置当前点击的标签的字体颜色
	document.getElementById("<portlet:namespace />"+type+"").style.color='red';
}

	//为 空调系统能效比  报表填充数据
	//rendToChartMoreSeries('<portlet:namespace />commonmorechart', 'column', 'EERs', '#00B0F0', '5', 'white', '实测值', 'column', '参考值', '#F79646', '', '', '', '');

	var start_date = ''; // 开始时间
	var choose_type = ''; // 点击类型（日、周、月、年）
	var xstep = "${commonmorechart.xStep}"; // x轴的间距
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor(type);
		var dformt = 'yyyy-MM-dd';
		if (type == "day"){
			xstep = "${commonmorechart.xStep}"; // x轴的间距
			dformt = 'yyyy-MM-dd';
		} else if (type == "week") {
			xstep = "1"; // x轴的间距
			dformt = 'yyyy-MM-dd';
		} else if (type == "month") {
			dformt = 'MM';
			xstep = "${commonmorechart.xStep}"; // x轴的间距
		} else if (type == "year") {
			xstep = "1"; // x轴的间距
			dformt = 'yyyy';
		}

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
						'<portlet:resourceURL id="getMoreChartData"></portlet:resourceURL>',
						{
							from : start_date,
							to : '',
							name : '${commonmorechart.choose_name}',
							id : '${commonmorechart.choose_id}',
							ispd : '${commonmorechart.ispd}',
							referencevalue : '${commonmorechart.referencevalue}',
							type : choose_type
						}, function(data) {
							//var chardata = data.chart;
							var cataList = data.cataList;
							var dataList = data.dataList;
							var paraList = data.paraList;

							// 生成图表
							rendToChartMoreSeries(
									'<portlet:namespace />commonmorechart',
									"${commonmorechart.chartType_1}",
									"${commonmorechart.yLeftTitle}",
									"${commonmorechart.lineColor_1}",
									xstep,
									"${commonmorechart.fillColor_1}",
									"${commonmorechart.dataName_1}",
									"${commonmorechart.chartType_2}",
									"${commonmorechart.dataName_2}",
									"${commonmorechart.fillColor_2}",
									"${commonmorechart.lineWidth}",
									"${commonmorechart.symbol}", '',
									"${commonmorechart.ySymbol}", cataList,
									dataList, paraList);

						}, 'json');
	}

	// 默认显示当前时间
	choose_type = "day";
	if("${commonmorechart.defaulttime}" == ""){
		var nowdate = new Date();
		start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	} else {
		start_date = "${commonmorechart.defaulttime}";
	}
	
	<portlet:namespace />getChart();
</script>