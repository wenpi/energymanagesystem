<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午5点15分
	LastModified Date:
	Description: 运行监测
 -->


<div class="div-table m_top">

	<div class="span445 row-fluid">
		<div id="runMonitor">
			<div class="sub_chart" id="<portlet:namespace />runningmonitor">
			</div>
			<div class="chart_title runningtop">
				<div>
					<span>冷机</span>
				</div>
				<div class="running_line"></div>
				<div>
					<span>新风机组</span>
				</div>
				<div class="running_line"></div>
				<div>
					<span>空调箱</span>
				</div>
				<div class="running_line"></div>
				<div>
					<span>通风系统</span>
				</div>
			</div>
			<div class="detail_para">
				<div>
					<p class="onoff_state">
						<span id="<portlet:namespace />datavalue1">3</span><sup
							style="color: #C2AE99;">ON</sup>
					</p>
					<p class="device_count">共8台</p>
				</div>
				<div class="eff_line"></div>
				<div>
					<p class="onoff_state">
						<span id="<portlet:namespace />datavalue2">3</span><sup
							style="color: #C2AE99;">ON</sup>
					</p>
					<p class="device_count">共17台</p>
				</div>
				<div class="eff_line"></div>
				<div>
					<p class="onoff_state">
						<span id="<portlet:namespace />datavalue3">3</span><sup
							style="color: #C2AE99;">ON</sup>
					</p>
					<p class="device_count">共79台</p>
				</div>
				<div class="eff_line"></div>
				<div>
					<p class="onoff_state">
						<span id="<portlet:namespace />datavalue4">3</span><sup
							style="color: #C2AE99;">ON</sup>
					</p>
					<p class="device_count">共171台</p>
				</div>
			</div>
		</div>

	</div>

</div>

<script type="text/javascript">
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
							name : '${runningmonitor.choose_name}',
							id : '${runningmonitor.choose_id}',
							ispd : '${runningmonitor.ispd}',
							decimals : '${runningmonitor.decimals}',
							mult : '', // 是否需要在获取的数据的基础上乘数，此处传空即可
							type : <portlet:namespace />choose_type
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							// 为 运行监测 报表填充
							var chartLegendList = [ ${runningmonitor.chartLegendList} ], 
								chartColorList = [${runningmonitor.chartColorList} ] ;
							//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的renderToCharts.js中，用来生成图表
							renderToChartLine('<portlet:namespace />runningmonitor',
									"${runningmonitor.chartType}",
									"${runningmonitor.marginRight}",
									"${runningmonitor.backgroundColor}",
									"${runningmonitor.marginBottom}",
									"${runningmonitor.chartTitle}",
									"${runningmonitor.titleColor}",
									"${runningmonitor.fontSize}",
									"${runningmonitor.fontWeight}",
									"${runningmonitor.fontFamily}",
									${runningmonitor.xTitlePosition},
									"${runningmonitor.xStep}",
									"${runningmonitor.yLeftTitle}",
									"${runningmonitor.yFontColor}",
									"${runningmonitor.valueSuffix}",
									"${runningmonitor.chartLegendLayout}",
									"${runningmonitor.chartLegendAlign}",
									"${runningmonitor.verticalAlign}",
									${runningmonitor.borderWidth},
									${runningmonitor.legendXPosition},
									${runningmonitor.legendYPosition},
									${runningmonitor.seriesRadius},
									${runningmonitor.lineWidth},
									chartLegendList,
									chartColorList, 
									cataList,
									dataList);
						}, 'json');
	}
	
	// 获取对应的开启台数
	function <portlet:namespace />getOnStage(){
		// 获取页面下方的数据信息
		$
		.post(
				'<portlet:resourceURL id="getMoreChartsByNames"></portlet:resourceURL>',
				{
					from : <portlet:namespace />start_date,
					name : '${runningmonitor.valuename}',
					id : '${runningmonitor.valueid}',
					ispd : '${runningmonitor.valueispd}',
					decimals : '${runningmonitor.decimals}',
					type : 'span'
				}, function(data) {
					var dataList = data.dataList;

					try{
						$('#<portlet:namespace />datavalue1').text(dataList[0][0]);
						$('#<portlet:namespace />datavalue2').text(dataList[1][0]);
						$('#<portlet:namespace />datavalue3').text(dataList[2][0]);
						$('#<portlet:namespace />datavalue4').text(dataList[3][0]);
					}catch(e){}
				}, 'json');
	}
	
	<portlet:namespace />choose_type = "day";
	if("${runningmonitor.defaulttime}" == ""){// 默认显示当前时间 
		var nowdate = new Date();
		<portlet:namespace />start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	} else {
		<portlet:namespace />start_date = "${runningmonitor.defaulttime}";
	}
	
	// 获取页面报表数据
	<portlet:namespace />getChart();
	
	// 五分钟定时执行
	window.setInterval("<portlet:namespace />getOnStage()",300000);
</script>