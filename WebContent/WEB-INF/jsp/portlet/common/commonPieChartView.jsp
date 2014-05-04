<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-10-11 下午15点21分
	LastModified Date:
	Description: 共用的饼图的渲染页面  
 -->

<div class="div-table">

	<div class="content450 center left20">
		<div class="analysis_2">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${commonpiechart.backgroundColor_5};">
					<h4 class="h4size">${commonpiechart.title5}</h4>
					<div>${commonpiechart.description_5}</div>
				</div>

				<div class="timediv50">
					<input id="<portlet:namespace />datetime5" type="hidden" />
					<div id="<portlet:namespace />day5" style="color: red;"
						class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate5('day')">日视图</div>
					<div id="<portlet:namespace />week5" class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate5('week')">周视图</div>
					<div id="<portlet:namespace />month5" class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate5('month')">月视图</div>
					<div id="<portlet:namespace />year5" class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate5('year')">年视图</div>

					<div class="inlinedivstyle selectdivstyle">
						&nbsp;与&nbsp; <input name="<portlet:namespace />comparetime5"
							id="<portlet:namespace />comparetime5" class="inputstyle"
							onclick="<portlet:namespace />comparetime5()" /> &nbsp;对比&nbsp;
					</div>

					<div id="<portlet:namespace />output"
						onclick="<portlet:namespace />outputToExcel5()"
						class="tdatt output">输出</div>
				</div>

				<iframe name="<portlet:namespace />tmpFrame5"
					id="<portlet:namespace />tmpFrame5" width="1" height="1"
					style="visibility: hidden; position: absolute; display: none"></iframe>

				<div id="<portlet:namespace />piechart" class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${commonpiechart.linkUrl_1}">${commonpiechart.linkName_1}</a></i>
					<i><a href="${commonpiechart.linkUrl_2}">${commonpiechart.linkName_2}</a></i>
					<i><a href="${commonpiechart.linkUrl_3}">${commonpiechart.linkName_3}</a></i>
				</div>
			</div>
		</div>
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

//文本框选择时间对比
function <portlet:namespace />comparetime5() {
	var dformt = 'yyyy-MM-dd',titleFormat='yyyy-MM-dd';
	if (<portlet:namespace />choose_type5 == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type5 == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type5 == "month") {
		dformt = 'MM';
		titleFormat = 'yyyy-MM';
	} else if (<portlet:namespace />choose_type5 == "year") {
		dformt = 'yyyy';
		titleFormat = 'yyyy';
	}
	
	WdatePicker({
		el : '<portlet:namespace />datetime5',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			
			// 显示在页面上的时间
			var showtime= dp.cal.getDateStr(dformt);
			$('#<portlet:namespace />comparetime5').val(showtime);
			
			<portlet:namespace />legendList5 = <portlet:namespace />start_date5 + "," + paretime;
			<portlet:namespace />c_times5 = <portlet:namespace />start_date5 + "," + paretime;
			<portlet:namespace />exp_start_date5 = <portlet:namespace />legendList5;
			<portlet:namespace />choose_name5 = '${commonpiechart.choose_name5},${commonpiechart.choose_name5}'; // 对应的name
			<portlet:namespace />choose_id5 = '${commonpiechart.choose_id5},${commonpiechart.choose_id5}'; // 对应的id
			<portlet:namespace />ispd5 = '${commonpiechart.ispd5},${commonpiechart.ispd5}'; // 对应的ispd
			<portlet:namespace />showLegend5 = true;
			
			var times = [];
			// 根据name的个数，来为att添加对应个数的值
			var names = "${commonpiechart.choose_name5}".split(",");
			for(var i=0;i<names.length;i++){
				times.push(<portlet:namespace />start_date5);
			}
			for(var i=0;i<names.length;i++){
				times.push(paretime);
			}
			// 渲染图表,注意：此处和别的页面不太一样，此处多了一个参数
			<portlet:namespace />compareCharts5(times.join(),<portlet:namespace />choose_name5,<portlet:namespace />choose_id5,<portlet:namespace />ispd5,<portlet:namespace />legendList5,<portlet:namespace />showLegend5,'yes',<portlet:namespace />legendList5);
		}
	});
}

/**
 * 异步获取图表数据
 */
function <portlet:namespace />compareCharts5(tfrom,name,id,ispd,legendList,showLegend5,isNotCompare,compareDate) {
	var atts = [];
	// 根据name的个数，来为att添加对应个数的值
	var names = name.split(",");
	for(var i=0;i<names.length;i++){
		atts.push("percents");
	}

	$
	.post(
			'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
			{
				from : tfrom,
				name : name,
				id : id,
				ispd : ispd,
				type : <portlet:namespace />choose_type5,
				decimals : '${commonpiechart.decimals5}',
				att : atts.join(),
				mult : '${commonpiechart.multiplier}' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
			}, function(data) {
				var cataList = data.cataList;
				var dataList = data.dataList;
				
				cataList = [ ${commonpiechart.chartLegendList_5} ]; // 个性需求：重新为图表的X轴赋值
				// 根据选择的日周月年，来确定居中标题和图例显示的值
				if (<portlet:namespace />choose_type5 == "day"){ // 日报
					if(isNotCompare == "yes"){ // 如果是对比的图
						<portlet:namespace />centerTitle5 = "";
						var tfroms = tfrom.split(",");
						if(tfroms.length > 0){
							<portlet:namespace />centerTitle5 += tfroms[0] + "与" + tfroms[tfroms.length-1];
						}
					}
				} else if (<portlet:namespace />choose_type5 == "week") { // 周报
					if(isNotCompare == "yes"){ // 如果是对比的图 
						<portlet:namespace />centerTitle5 = "";
						<portlet:namespace />legendList5 = "";
						// 个性需求：重新为图表的一级标题和图例赋值
						var pare_times = compareDate.split(",");
						for(var i=0;i<pare_times.length;i++){
							<portlet:namespace />centerTitle5 += showWeekFirstDay(pare_times[i]) + "~" + showWeekLastDay(pare_times[i]) + ((pare_times.length-1) == i ? "" : "与");
							<portlet:namespace />legendList5 += showWeekFirstDay(pare_times[i]) + "~" + showWeekLastDay(pare_times[i]) + ((pare_times.length-1) == i ? "" : ",");
						}
						
						<portlet:namespace />centerTitle5 = <portlet:namespace />centerTitle5.replace(/-/g, '/');
						<portlet:namespace />legendList5 = <portlet:namespace />legendList5.replace(/-/g, '/');
					}
				} else if (<portlet:namespace />choose_type5 == "month") { // 月报 
					if(isNotCompare == "yes"){ // 如果是对比的图 
						<portlet:namespace />centerTitle5 = "";
						<portlet:namespace />legendList5 = "";
						// 个性需求：重新为图表的一级标题和图例赋值
						var tfroms = compareDate.split(",");
						for(var i=0;i<tfroms.length;i++){
							<portlet:namespace />centerTitle5 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
							<portlet:namespace />legendList5 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
						}
					}
				} else if (<portlet:namespace />choose_type5 == "year") { // 年报 
					if(isNotCompare == "yes"){ // 如果是对比的图 
						var compareyear = compareDate.substring(11,15);
						// 个性需求：重新为图表的一级标题和图例赋值
						<portlet:namespace />centerTitle5 = <portlet:namespace />c_title5 + "与" + compareyear;
						<portlet:namespace />legendList5 = <portlet:namespace />c_title5 + "," + compareyear;
					}
				}

				// 渲染图表
				var seriesList = [];
				
				var newData = [],data1=[],data2=[];
				// 根据name的个数，切割后台返回的数据，填充到报表中 
				
				var names = "${commonpiechart.choose_name5}".split(",");
				for(var i=0;i<dataList.length;i++){
					if(i<names.length){
						data1.push(dataList[i][0]);
					}else{
						data2.push(dataList[i][0]);
					}
				}
				newData.push(data1);
				newData.push(data2);

				// 获取对应的数据列表，对应图表中的图形条数
				seriesList = returnSeriesList("${commonpiechart.chartType_6_1}",
											  "", // 连接线线宽，为空则默认为2，为0则不显示连接线
											  "", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
											  <portlet:namespace />legendList5,
											  "${commonpiechart.chartColorList_6}", // 颜色列表
											  "${commonpiechart.chartFillColorList_6}", // 填充颜色列表
											  "${commonpiechart.chartRadiusList_6}", // 曲线点半径列表,默认为4
											  "", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
											  "", // 参考值  
											  "", // 参考值的图表类型
											  "", // 参考值对应的图例名称
											  "", // 参考值对应的颜色
											  newData);
				
				// 将图表渲染到对应的位置上
				renderCompareChart("<portlet:namespace />piechart",
								   <portlet:namespace />centerTitle5, // 居中标题
								   <portlet:namespace />step5, // x轴的间隔
								   cataList, // x轴列表
								   '',
								   '${commonpiechart.yLeftTitle_6}', // Y轴左侧的标题
								   '${commonpiechart.ySymbol6}', // Y轴的单位
								   showLegend5 == '' ? false : showLegend5,
								   "",
								   seriesList);
			}, 'json');
}

var <portlet:namespace />start_date5 = ''; // 开始时间
var <portlet:namespace />choose_type5 = ''; // 点击类型（日、周、月、年）
var <portlet:namespace />step5 = "${commonpiechart.xStep_5}"; //存储X轴的显示间隔
var <portlet:namespace />legendList5 = "${commonpiechart.chartLegendList_5}";// 图例列表
var <portlet:namespace />showLegend5 = false; // 默认不显示图例
var <portlet:namespace />centerTitle5 = ""; //居中标题
var <portlet:namespace />c_title5 = ''; // 存储居中标题对应的年份
var <portlet:namespace />exp_start_date5 = ''; // 存储导出的时间 
var <portlet:namespace />c_times5 = ''; // 存储导出的时间 
var <portlet:namespace />choose_name5 = '${commonpiechart.choose_name5}'; // 对应的name
var <portlet:namespace />choose_id5 = '${commonpiechart.choose_id5}'; // 对应的id
var <portlet:namespace />ispd5 = '${commonpiechart.ispd5}'; // 对应的ispd

//选择时间（日、周、月、年）
function <portlet:namespace />selectdate5(type) {
	// 切换点击字体效果
	<portlet:namespace />changeColor5(type);
	
	var dformt = 'yyyy-MM-dd',titleFormat='yyyy-MM-dd';
	if (type == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (type == "week"){
		dformt = 'yyyy-MM-dd';
	} else if (type == "month"){
		dformt = 'MM';
		titleFormat='yyyy-MM';
	} else if (type == "year"){
		dformt = 'yyyy';
		titleFormat = 'yyyy';
	}

	WdatePicker({
		el : '<portlet:namespace />datetime5',
		dateFmt : dformt,
		onpicked : function(dp) {
			$('#<portlet:namespace />comparetime5').val(''); // 清空对比框的值
			var _time = dp.cal;
			<portlet:namespace />start_date5 = _time.getDateStr('yyyy-MM-dd');
			<portlet:namespace />exp_start_date5 = <portlet:namespace />start_date5; // 导出excel的开始时间 
			<portlet:namespace />choose_type5 = type;
			// 为居中标题赋值 
			<portlet:namespace />centerTitle5 = dp.cal.getDateStr(titleFormat);
			<portlet:namespace />c_times5 = <portlet:namespace />start_date5;
			<portlet:namespace />c_title5 = dp.cal.getDateStr("yyyy");
			<portlet:namespace />legendList5 = dp.cal.getDateStr(titleFormat); // 图例
			
			if (type == "month") {
				<portlet:namespace />start_date5 = dp.cal.getDateStr('yyyy-MM') +"-01";
			} else if (type == "year"){
				<portlet:namespace />start_date5 = dp.cal.getDateStr('yyyy-MM') +"-01";
			}

			// 获取图表
			<portlet:namespace />choose_name5 = '${commonpiechart.choose_name5}'; // 对应的name
			<portlet:namespace />choose_id5 = '${commonpiechart.choose_id5}'; // 对应的id
			<portlet:namespace />ispd5 = '${commonpiechart.ispd5}'; // 对应的ispd
			<portlet:namespace />getChart5(<portlet:namespace />start_date5,<portlet:namespace />choose_name5,<portlet:namespace />choose_id5,<portlet:namespace />ispd5,<portlet:namespace />legendList5,<portlet:namespace />showLegend5,'no');
		}
	});
}

/**
 * 异步获取图表数据
 */
function <portlet:namespace />getChart5(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
	$
			.post(
					'<portlet:resourceURL id="getMoreChartsByNames"></portlet:resourceURL>',
					{
						from : tfrom,
						name : name,
						id : id,
						ispd : ispd,
						type : <portlet:namespace />choose_type5,
						decimals : '${commonpiechart.decimals5}',
						att : 'percents',
						mult : '${commonpiechart.multiplier}' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
					}, function(data) {
						var dataList = data.dataList;
						// 为建筑用电分项报表填充数据
						var categories = [ ${commonpiechart.chartLegendList_5} ], colorsArr = [
								${commonpiechart.chartColorList_5}];
						var pieDataList = [];
						for(var i=0;i<dataList.length;i++){
							pieDataList.push(dataList[i][0]);
						}
						// 根据选择的类型，设置对应的居中标题
						if (<portlet:namespace />choose_type5 == "week") { // 周报
							<portlet:namespace />centerTitle5 = "";
							// 个性需求：重新为图表的一级标题和图例赋值
							<portlet:namespace />centerTitle5 += showWeekFirstDay(tfrom) + "~" + showWeekLastDay(tfrom);
							<portlet:namespace />centerTitle5 = <portlet:namespace />centerTitle5.replace(/-/g, '/');
							<portlet:namespace />legendList5 =<portlet:namespace />centerTitle5; // 图例
						}
					
						renderToPieChartsAndLegend('<portlet:namespace />piechart',
								"${commonpiechart.chartType_5}", categories, colorsArr, pieDataList , "${commonpiechart.chartLegendLayout_5}",
								"${commonpiechart.chartLegendAlign_5}", "${commonpiechart.chartWordColor}",<portlet:namespace />centerTitle5,"${commonpiechart.innerSize}");
					}, 'json');
}

//默认显示当前时间
<portlet:namespace />choose_type5 = "day";
if("${commonpiechart.defaulttime5}" == ""){
	var nowdate = new Date();
	<portlet:namespace />start_date5 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
			+ nowdate.getDate();
} else {
	<portlet:namespace />start_date5 = "${commonpiechart.defaulttime5}";
}

<portlet:namespace />legendList5 = <portlet:namespace />start_date5; // 图例
<portlet:namespace />c_times5 = <portlet:namespace />start_date5; // 导出excel的开始时间
<portlet:namespace />exp_start_date5 = <portlet:namespace />start_date5; // 导出excel的开始时间
<portlet:namespace />centerTitle5 = <portlet:namespace />start_date5; //居中标题

// 得到报表数据
<portlet:namespace />getChart5(<portlet:namespace />start_date5,<portlet:namespace />choose_name5,<portlet:namespace />choose_id5,<portlet:namespace />ispd5,<portlet:namespace />legendList5,<portlet:namespace />showLegend5,'no');

//导出数据到excel
function <portlet:namespace />outputToExcel5(){
	var att = "sum,percents"; // 对应的attribute属性
	var isNotCompare = "no"; // 默认不是对比图表
	var times = [];
	var sdate = <portlet:namespace />c_times5;
	var sdateList = sdate.split(",");
	for(var i=0;i<sdateList.length;i++){
		// 根据name的个数，来为att添加对应个数的值
		times.push(sdateList[i]);
		times.push(sdateList[i]);
	}
	if(sdateList.length>1){
		isNotCompare = "yes"; // yes表示是对比图表
		att = "sum,percents,sum,percents"; // 对应的attribute属性
	}
	var itemName = "${commonpiechart.itemName}";
	var expColumnName5 = "${commonpiechart.expColumnName5}";
	// 导出excel的Url
	var expUrl = "<portlet:resourceURL id='expPieChartsDataToExcel'></portlet:resourceURL>"
			+ "&excelName="
			+ "${commonpiechart.title5}"
			+ "&from="
			+ times.join()
			+ "&name="
			+ <portlet:namespace />choose_name5
			+ "&id="
			+ <portlet:namespace />choose_id5
			+ "&ispd="
			+ <portlet:namespace />ispd5
			+ "&type="
			+ <portlet:namespace />choose_type5
			+ "&itemName="
			+ itemName
			+ "&att="
			+ att
			+ "&mult="
			+ '${commonpiechart.multiplier}'
			+ "&isNotCompare="
			+ isNotCompare
			+ "&comparetime="
			+ <portlet:namespace />legendList5
			+ "&expColumnName="
			+ (expColumnName5==""?"${commonpiechart.title5}":expColumnName5);
	var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${commonpiechart.title5}" /></portlet:resourceURL>';
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${commonpiechart.title5}"
			+ ".xls";
	$.ajax({
		type : "POST",
		url : expUrl,
		async : false,
		contentType : 'application/x-msdownload;charset=UTF-8',
		success : function(result) {
			$("#<portlet:namespace />tmpFrame5").attr('src', hSrc);

			// AJAX请求删除临时文件
			//$.post(removeUrl, function(result) {
			//	if (result.success) {
			//	} else {
			//		$.messager.alert('Error', result.msg, 'error');
			//	}
			//});
		},
		error : function(result) {
			alert('error');
		}
	});
}
</script>
