<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-21 下午5点08分
	LastModified Date:
	Description: 共用的单个图表，适用于column、line等类型图表
 -->


<div class="div-table">

	<div class="content450 center">
		<div class="vision_1">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${commonsinglechart.backgroundColor};">
					<h4 class="h4size">${commonsinglechart.title}</h4>
					<div>${commonsinglechart.description}</div>
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
						&nbsp;与&nbsp; <input name="<portlet:namespace />comparetime"
							id="<portlet:namespace />comparetime" class="inputstyle"
							onclick="<portlet:namespace />comparetime()" /> &nbsp;对比&nbsp;
					</div>

					<div id="<portlet:namespace />thisyearddd" class="tdatt output">输出</div>

				</div>

				<div id="<portlet:namespace />commonsinglechart"
					class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${commonsinglechart.linkUrl_1}">${commonsinglechart.linkName_1}</a></i>
					<i><a href="${commonsinglechart.linkUrl_2}">${commonsinglechart.linkName_2}</a></i>
					<i><a href="${commonsinglechart.linkUrl_3}">${commonsinglechart.linkName_3}</a></i>
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

	var start_date = ''; // 开始时间
	var choose_type = ''; // 点击类型（日、周、月、年）
	var xstep = "${commonsinglechart.xStep}"; // x轴的间距
	
	// 文本框选择时间对比
	function <portlet:namespace />comparetime() {
		var dformt = 'yyyy-MM-dd';
		if (choose_type == "day"){
			dformt = 'yyyy-MM-dd';
		} else if (choose_type == "week") {
			dformt = 'yyyy-MM-dd';
		} else if (choose_type == "month") {
			dformt = 'MM';
		} else if (choose_type == "year") {
			dformt = 'yyyy';
		}
		
		WdatePicker({
			el : '<portlet:namespace />datetime',
			dateFmt : dformt,
			onpicked : function(dp) {
				// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
				var paretime= dp.cal.getDateStr('yyyy-MM-dd');
				
				// 显示在页面上的时间
				var showtime= dp.cal.getDateStr(dformt);
				$('#<portlet:namespace />comparetime').val(showtime);
			}
		});
	}
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor(type);
		
		var dformt = 'yyyy-MM-dd';
		if (type == "day"){
			xstep = "${commonsinglechart.xStep}"; // x轴的间距
			dformt = 'yyyy-MM-dd';
		} else if (type == "week") {
			xstep = "1"; // x轴的间距
			dformt = 'yyyy-MM-dd';
		} else if (type == "month") {
			dformt = 'MM';
			xstep = "${commonsinglechart.xStep}"; // x轴的间距
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
						'<portlet:resourceURL id="getSingleChartData"></portlet:resourceURL>',
						{
							from : start_date,
							to : '',
							name : '${commonsinglechart.choose_name}',
							id : '${commonsinglechart.choose_id}',
							ispd : '${commonsinglechart.ispd}',
							type : choose_type
						},
						function(data) {
							//var chardata = data.chart;
							var cataList = data.cataList;
							var dataList = data.dataList;

							// 生成图表
							renderToColumnAndLineCharts(
									'<portlet:namespace />commonsinglechart',
									"${commonsinglechart.chartType}",
									"${commonsinglechart.yLeftTitle}",
									"${commonsinglechart.lineColor}",
									xstep,
									"${commonsinglechart.fillColor}",
									"${commonsinglechart.symbol}",
									cataList, dataList);

						}, 'json');
	}

	// 默认显示当前时间
	choose_type = "day";
	if("${commonsinglechart.defaulttime}" == ""){
		var nowdate = new Date();
		start_date = nowdate.getFullYear() + "-" + nowdate.getMonth() + "-"
				+ nowdate.getDate();
	} else {
		start_date = "${commonsinglechart.defaulttime}";
	}
	<portlet:namespace />getChart();
</script>