<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 运行监测展示页面
 -->
<div class="div-table">
	<div class="chart_group_1 <c:if test="${tbinfo.gridLineDashStyle6 != 'doubleColumn'}">otherframe</c:if><c:if test="${tbinfo.gridLineDashStyle6 == 'doubleColumn'}">doubleColumn</c:if>">
		<div class="left_chart">
			<div class="chart">
				<div class="chart_top" id="<portlet:namespace />runningnonitor"></div>
				<div class="chart_bottom">
					<div>
						<div>
							<p class="device_list">冷机</p>
							<p class="open_count">
								<span>3</span><sup>ON</sup>
							</p>
							<p class="device_count">共13台</p>
						</div>
						<div>
							<p class="device_list">新风机组</p>
							<p class="open_count">
								<span>30</span><sup>ON</sup>
							</p>
							<p class="device_count">共40台</p>
						</div>
						<div>
							<p class="device_list">冷却塔</p>
							<p class="open_count">
								<span>21</span><sup>ON</sup>
							</p>
							<p class="device_count">共25台</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var <portlet:namespace />chartType_1 = "${tbinfo.chartType_1}"; // 图表类型
var <portlet:namespace />backgroudColor_1 = "${tbinfo.backgroundColor_1}"; //图表背景颜色 
var <portlet:namespace />chartTitle1 = "${tbinfo.chartTitle}"; //左上角的图表标题
var <portlet:namespace />titleColor1 = "${tbinfo.titleColor}"; // 图表标题的颜色
var <portlet:namespace />chartTipUnit1 = "${tbinfo.chartTipUnit}"; //提示框中内容的单位
var <portlet:namespace />gridLineDashStyle1 = '${tbinfo.gridLineDashStyle}'; //网格线的样式
var <portlet:namespace />showLegend1 = ${tbinfo.showLegend1};  //是否显示图例说明,默认是显示
var <portlet:namespace />showXGridLine1 = "${tbinfo.showXGridLine1}";//是否显示X轴上的网格线
var <portlet:namespace />showYGridLine1 = "${tbinfo.showYGridLine1}";//是否显示Y轴上的网格线
var <portlet:namespace />chartColors ="${tbinfo.chartColorList}";//图表数据列颜色列表
var <portlet:namespace />choose_name1 ="${tbinfo.choose_name1}";// name
var <portlet:namespace />choose_id1 ="${tbinfo.choose_id1}";// id
var <portlet:namespace />ispd1 ="${tbinfo.ispd1}";// ispd1
var <portlet:namespace />start_date1 = ''; // 默认开始时间 
//默认显示当前时间
if(publicTime != ""){
	<portlet:namespace />start_date1 = publicTime;
} else {
	if("${tbinfo.defaulttime1}" == ""){
		var nowdate = new Date();
		<portlet:namespace />start_date1 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-" + nowdate.getDate();
	} else {
		<portlet:namespace />start_date1 = "${tbinfo.defaulttime1}";
	}
}

function <portlet:namespace/>getChart() {
	var catalist = ['冷机','锅炉','冷冻泵','冷却泵','冷却塔','新风机组'];
	var datalist1 = [], datalist2 = [], atts = [];
	//for(var i = 0; i < catalist.length * 2; i++){
		//atts.push('span');
	//}
	//debugger;
	var url = '<portlet:resourceURL id="getValueListByNames"></portlet:resourceURL>&from='
			+ <portlet:namespace />start_date1
			+ '&name='
			+ <portlet:namespace />choose_name1
			+ "&id="
			+ <portlet:namespace />choose_id1
			+ "&ispd="
			+ <portlet:namespace />ispd1
			+ "&att=&type=span&decimals=${tbinfo.decimals}";
	$.ajax({
		type : "POST",
		url : url,
		//async : false,
		success : function(result) {
			var valueList = result.dataList;
			for(var i = 0; i < valueList.length; i++){
				if(i < catalist.length) 
					datalist1.push(parseFloat(valueList[i][0]));
				//else 
					//datalist2.push(parseFloat(result.data[i]));
			}
			var chartColorList = <portlet:namespace />chartColors.split(",");
			//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToCharts.js中，用来生成图表
			//其参数依次代表图表需要渲染到的id，图表类型，图表背景颜色，标题，标题颜色 ，标题水平对齐方式（默认为left），提示内容后缀，网格线样式，是否显示图例说明，是否显示X轴上网格线，是否显示Y轴上网格线 ，图表数据列颜色
			autoRenderToStackChart("<portlet:namespace />runningnonitor",<portlet:namespace />chartType_1,<portlet:namespace />backgroudColor_1,<portlet:namespace />chartTitle1,<portlet:namespace />titleColor1,"",<portlet:namespace />chartTipUnit1,<portlet:namespace />gridLineDashStyle1,<portlet:namespace />showLegend1,<portlet:namespace />showXGridLine1,<portlet:namespace />showYGridLine1,chartColorList, catalist, datalist1, datalist2);
		}
	});
	
	// 获取开启台数 
	$.post('<portlet:resourceURL id="getValueListByNames"></portlet:resourceURL>',
			{
				from : <portlet:namespace />start_date1,
				name : '${tbinfo.valuename}',
				id : '${tbinfo.valueid}',
				ispd : '${tbinfo.valueispd}',
				decimals : '0',
				type : (publicTime != "" ? 'test_span' : 'span')
			},
			function(data) {
				// 为相应的位置赋值
				var valueList = data.dataList;
				$(".chart_bottom .open_count:eq(0) > span").text(valueList[0][0]);
				$(".chart_bottom .open_count:eq(1) > span").text(valueList[1][0]);
				$(".chart_bottom .open_count:eq(2) > span").text(valueList[2][0]);
			}, 'json');
}
//加载时获取页面报表数据
<portlet:namespace />getChart();
</script>
