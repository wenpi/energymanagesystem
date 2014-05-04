<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 能耗统计展示页面
 -->
<div class="div-table">
	<div class="chart_group_1 <c:if test="${tbinfo.gridLineDashStyle6 != 'doubleColumn'}">otherframe</c:if><c:if test="${tbinfo.gridLineDashStyle6 == 'doubleColumn'}">doubleColumn</c:if>">
		<div class="middle_chart">
			<div class="chart">
				<div class="chart_top" id="<portlet:namespace />energystatistic"></div>
				<div class="chart_bottom">
					<div class="energy_statistic">
						<div>
							<p class="device_list">日总用电量</p>
							<p class="unit">kWh</p>
							<p class="cosume_number">1,500</p>
						</div>
						<div>
							<p class="device_list">日空调用电量</p>
							<p class="unit">kWh</p>
							<p class="cosume_number">1,600</p>
						</div>
						<div>
							<p class="device_list">日照明用电量</p>
							<p class="unit">kWh</p>
							<p class="cosume_number">230</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//为  能耗统计  报表填充数据 
var <portlet:namespace />start_date = "";
/**
 * 异步获取图表数据
 */
function <portlet:namespace />getChart() {
	$
			.post(
					'<portlet:resourceURL id="getMoreChartsByNames"></portlet:resourceURL>',
					{
						from : <portlet:namespace />start_date,
						name : '${tbinfo.choose_name}',
						id : '${tbinfo.choose_id}',
						ispd : '${tbinfo.ispd}',
						decimals : '${tbinfo.decimals}',//保留小数位数
						att : 'percents',
						mult : '${tbinfo.multiplier}', // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
						type : 'day'
					}, function(data) {
						var dataList = data.dataList;//获取图表数据
						var categories = [ ${tbinfo.chartLegendList}];
						var	colorsArr = [${tbinfo.chartColorList}]; 
						var pieDataList = [];
						for(var i=0;i<dataList.length;i++){
							pieDataList.push(dataList[i][0]);
						}
						//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToCharts.js中，用来生成图表
						autoRenderToPieCharts('<portlet:namespace />energystatistic', //图表渲染位置
                       			"${tbinfo.chartType}",//图表类型
                       			"${tbinfo.backgroundColor}",//背景颜色，默认为#394264
                       			"${tbinfo.chartTitle}",//左上角显示的标题
                       			"${tbinfo.titleColor}",//标题字体颜色 
                       			categories,//数据列的名称列表 
                       			colorsArr, //数据列的颜色列表 
                       			pieDataList, //图表数据
                       			${tbinfo.showLegend},//是否显示图例说明，默认是true
                       			"${tbinfo.chartLegendLayout}",//图例说明内容的布局是水平horizontal或垂直vertical
								"${tbinfo.chartLegendAlign}",//图例说明的对齐方式（left/center/right）
								"${tbinfo.distance}",//图表中说明标签与图表之间的间距
								"${tbinfo.connectLineWidth}",//连接线的宽度
								"${tbinfo.chartWordColor}");//图表中文字的颜色
							
					}, 'json');
}

// 获取当日用电量的值
function <portlet:namespace />getButtomValue(){
	$.post(
			'<portlet:resourceURL id="getDatasForNamesAndAtts"></portlet:resourceURL>',
			{
				from : <portlet:namespace />start_date,
				name : 'electricity,electricity,electricity',
				id : 'total,hvac,lighting',
				ispd : '0,0,0',
				decimals : '${tbinfo.decimals}',
				att : 'sum',
				type : 'day'
			},
			function(data) {
				// 为相应的位置赋值
				var valueList = data.data;
				$(".energy_statistic > div:eq(0) > .cosume_number").text(valueList[0][0][0]);
				$(".energy_statistic > div:eq(1) > .cosume_number").text(valueList[1][0][0]);
				$(".energy_statistic > div:eq(2) > .cosume_number").text(valueList[2][0][0]);
			}, 'json');
}

//根据首选项获取图表数据查询时间，默认显示当前时间
if(publicTime != ""){
	<portlet:namespace />start_date = publicTime;
} else {
	if("${tbinfo.defaulttime}"==""){
		var nowdate = new Date();
		<portlet:namespace />start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1) + "-"
		+ nowdate.getDate();
	}else{
		<portlet:namespace />start_date = "${tbinfo.defaulttime}";
	}
}

//获取页面报表数据
<portlet:namespace />getChart();
<portlet:namespace />getButtomValue();
</script>