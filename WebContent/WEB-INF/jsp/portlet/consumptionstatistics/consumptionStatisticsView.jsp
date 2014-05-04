<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-7-26 下午5点21分
	LastModified Date:
	Description: 能耗统计
 -->


<div class="div-table m_top">

	<div class="span445 row-fluid">
		<div id="runMonitor">
			<div class="sub_chart"
				id="<portlet:namespace />consumptionstatistics"></div>
			<div class="chart_title charttitletop charttitletop_2"
				style="background-color: #DCEFF0;">
				<div>
					<span style="color: #4EB2B9;">当日用电量</span>
				</div>
				<div>
					<span style="color: #4EB2B9;">本月用电总量</span>
				</div>
			</div>
			<div class="eff_para eff_para_2" style="background-color: #DCEFF0;">
				<div>
					<p class="onoff_state">
						<span id="<portlet:namespace />datavalue1" style="color: #4EB2B9;">142</span><sup
							style="color: #C2AE99;">kWh</sup>
					</p>
				</div>

				<div class="eff_line"></div>

				<div>
					<p class="onoff_state">
						<span id="<portlet:namespace />datavalue2" style="color: #4EB2B9;">5.8</span><sup
							style="color: #C2AE99;">kWh</sup>
					</p>
				</div>
			</div>
		</div>

	</div>

</div>

<script type="text/javascript">
	//为  能耗统计  报表填充数据 
	var <portlet:namespace />start_date = ''; // 开始时间
	var <portlet:namespace />choose_type = ''; // 点击类型（日、周、月、年）

	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getChart() {
		$
				.post(
						'<portlet:resourceURL id="getMoreChartsByNames"></portlet:resourceURL>',
						{
							from : <portlet:namespace />start_date,
							name : '${consumptionstatistics.choose_name}',
							id : '${consumptionstatistics.choose_id}',
							ispd : '${consumptionstatistics.ispd}',
							decimals : '${consumptionstatistics.decimals}',
							mult : '${consumptionstatistics.multiplier}', // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
							type : <portlet:namespace />choose_type
						}, function(data) {
							var dataList = data.dataList;
							
							var categories = [ ${consumptionstatistics.chartLegendList} ], 
								colorsArr = [${consumptionstatistics.chartColorList}], 
								datas = [ ${consumptionstatistics.chartDataList} ],
								dada = [dataList];
							             
                           	renderToPieCharts('<portlet:namespace />consumptionstatistics', 
                           			"${consumptionstatistics.chartType}",
                           			"${consumptionstatistics.leftTitle}",
                           			categories,
                           			colorsArr, 
                           			data.dataList, 
                           			${consumptionstatistics.showLegend},
                           			"${consumptionstatistics.lableValue}",
                           			"${consumptionstatistics.backgroundColor}",
                           			"${consumptionstatistics.pieSize}",
                           			"${consumptionstatistics.innerSize}",
                           			${consumptionstatistics.distance});
								
						}, 'json');
	}

	// 获取当日用电量的值
	function <portlet:namespace />getButtomValue(type,id){
		$
		.post(
				'<portlet:resourceURL id="getValueByNameAndId"></portlet:resourceURL>',
				{
					from : <portlet:namespace />start_date,
					name : 'electricity',
					id : 'total',
					ispd : '0',
					decimals : '${consumptionstatistics.decimals}',
					att : 'sum',
					type : type
				},
				function(data) {
					// 为相应的位置赋值
					var valueList = data.data;
					var value = returnPositiveVal(parseFloat(valueList[0]),'${consumptionstatistics.decimals}'); 

					$("#"+id).text(value);
				}, 'json');
	}
	
	// 刷新当日的数据和当月的数据
	function <portlet:namespace />refreshData(){
		// 获取当日的值
		<portlet:namespace />getButtomValue('day','<portlet:namespace />datavalue1');
		
		// 获取当月的值
		nowdate = new Date();
		<portlet:namespace />start_date = nowdate.getFullYear() + "-"+ (nowdate.getMonth() + 1) + "-01" ;
		<portlet:namespace />getButtomValue('month','<portlet:namespace />datavalue2');
	}
	
	// 默认显示当前时间
	var nowdate = new Date();
	<portlet:namespace />start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1) + "-"
			+ nowdate.getDate();
	<portlet:namespace />choose_type = "day";
	
	//if ("${consumptionstatistics.defaulttime}" == "") {
	//	var nowdate = new Date();
	//	<portlet:namespace />start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1)
	//			+ "-" + nowdate.getDate();
	//} else {
	//	<portlet:namespace />start_date = "${consumptionstatistics.defaulttime}";
	//}
	
	// 获取页面报表数据
	<portlet:namespace />getChart();
	
	// 五分钟定时执行
	window.setInterval("<portlet:namespace />refreshData()",300000);
</script>