<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午3点40分
	LastModified Date:
	Description: 建筑用电分项
 -->

<div class="div-table">

	<div class="parameter_1 bulid_elec_detail"
		style="background-color:${coreinfo.backgroundColor_5};">
		<div class="page_header">
			<h1>建筑用电分项</h1>
		</div>
		<h5>${coreinfo.description_5}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td><span id="<portlet:namespace />hvac">35</span><sup>%</sup></td>
				<td><span id="<portlet:namespace />lighting">30</span><sup>%</sup></td>
				<td><span id="<portlet:namespace />data_center">10</span><sup>%</sup></td>
			</tr>
			<tr>
				<td>空调用电量</td>
				<td>照明用电量</td>
				<td>数据中心用电量</td>
			</tr>
		</table>
	</div>

	<div class="timediv">
		<input id="<portlet:namespace />datetime5" type="hidden" />
		<div id="<portlet:namespace />day5" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('day')">日视图</div>
		<div id="<portlet:namespace />week5" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('week')">周视图</div>
		<div id="<portlet:namespace />month5" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('month')">月视图</div>
		<div id="<portlet:namespace />year5" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('year')">年视图</div>

		<div class="inlinedivstyle selectdivstyle">
			&nbsp;与&nbsp; <input name="<portlet:namespace />comparetime5"
				id="<portlet:namespace />comparetime5" class="inputstyle"
				onclick="<portlet:namespace />comparetime5()" /> &nbsp;对比&nbsp;
		</div>

		<div id="<portlet:namespace />output5"
			onclick="<portlet:namespace />outputToExcel5()" class="tdatt output">输出</div>

		<iframe name="<portlet:namespace />tmpFrame5"
			id="<portlet:namespace />tmpFrame5" width="1" height="1"
			style="visibility: hidden; position: absolute; display: none"></iframe>

		<div id="<portlet:namespace />buildelectrosubentry"
			class="basicchartdiv"></div>
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
			<portlet:namespace />choose_name5 = '${coreinfo.choose_name5},${coreinfo.choose_name5}'; // 对应的name
			<portlet:namespace />choose_id5 = '${coreinfo.choose_id5},${coreinfo.choose_id5}'; // 对应的id
			<portlet:namespace />ispd5 = '${coreinfo.ispd5},${coreinfo.ispd5}'; // 对应的ispd
			<portlet:namespace />showLegend5 = true;
			
			var times = [];
			// 根据name的个数，来为att添加对应个数的值
			var names = "${coreinfo.choose_name5}".split(",");
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
				decimals : '${coreinfo.decimals5}',
				att : atts.join(),
				mult : '${coreinfo.multiplier}' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
			}, function(data) {
				var cataList = data.cataList;
				var dataList = data.dataList;
				
				cataList = [ ${coreinfo.chartLegendList_5} ]; // 个性需求：重新为图表的X轴赋值
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
				
				var names = "${coreinfo.choose_name5}".split(",");
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
				seriesList = returnSeriesList("${coreinfo.chartType_6_1}",
											  "", // 连接线线宽，为空则默认为2，为0则不显示连接线
											  "", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
											  <portlet:namespace />legendList5,
											  "${coreinfo.chartColorList_6}", // 颜色列表
											  "${coreinfo.chartFillColorList_6}", // 填充颜色列表
											  "${coreinfo.chartRadiusList_6}", // 曲线点半径列表,默认为4
											  "", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
											  "", // 参考值  
											  "", // 参考值的图表类型
											  "", // 参考值对应的图例名称
											  "", // 参考值对应的颜色
											  newData);
				
				// 将图表渲染到对应的位置上
				renderCompareChart("<portlet:namespace />buildelectrosubentry",
								   <portlet:namespace />centerTitle5, // 居中标题
								   <portlet:namespace />step5, // x轴的间隔
								   cataList, // x轴列表
								   '',
								   '${coreinfo.yLeftTitle_6}', // Y轴左侧的标题
								   '${coreinfo.ySymbol6}', // Y轴的单位
								   showLegend5 == '' ? false : showLegend5,
								   "",
								   seriesList);
			}, 'json');
}

var <portlet:namespace />start_date5 = ''; // 开始时间
var <portlet:namespace />choose_type5 = ''; // 点击类型（日、周、月、年）
var <portlet:namespace />step5 = "${coreinfo.xStep_5}"; //存储X轴的显示间隔
var <portlet:namespace />legendList5 = "${coreinfo.chartLegendList_5}";// 图例列表
var <portlet:namespace />showLegend5 = false; // 默认不显示图例
var <portlet:namespace />centerTitle5 = ""; //居中标题
var <portlet:namespace />c_title5 = ''; // 存储居中标题对应的年份
var <portlet:namespace />exp_start_date5 = ''; // 存储导出的时间 
var <portlet:namespace />c_times5 = ''; // 存储导出的时间 
var <portlet:namespace />choose_name5 = '${coreinfo.choose_name5}'; // 对应的name
var <portlet:namespace />choose_id5 = '${coreinfo.choose_id5}'; // 对应的id
var <portlet:namespace />ispd5 = '${coreinfo.ispd5}'; // 对应的ispd

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

			// 获取左侧的数据信息
			<portlet:namespace />getBuildElectroButtomData();
			// 获取图表
			<portlet:namespace />choose_name5 = '${coreinfo.choose_name5}'; // 对应的name
			<portlet:namespace />choose_id5 = '${coreinfo.choose_id5}'; // 对应的id
			<portlet:namespace />ispd5 = '${coreinfo.ispd5}'; // 对应的ispd
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
						decimals : '${coreinfo.decimals5}',
						att : 'percents',
						mult : '${coreinfo.multiplier}' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
					}, function(data) {
						var dataList = data.dataList;
						// 为建筑用电分项报表填充数据
						var categories = [ ${coreinfo.chartLegendList_5} ], colorsArr = [
								${coreinfo.chartColorList_5}], datas = [
								${coreinfo.chartDataList_5} ];
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
					
						renderToPieChartsAndLegend('<portlet:namespace />buildelectrosubentry',
								"${coreinfo.chartType_5}", categories, colorsArr, pieDataList , "${coreinfo.chartLegendLayout_5}",
								"${coreinfo.chartLegendAlign_5}", "${coreinfo.chartWordColor}",<portlet:namespace />centerTitle5);
							
					}, 'json');
}

//获取页面下方的数据信息
function <portlet:namespace />getBuildElectroButtomData() {
	$
			.post(
					'<portlet:resourceURL id="getValueListByNamesAndAtts"></portlet:resourceURL>',
					{
						from : <portlet:namespace />start_date5,
						name : '${coreinfo.valuename}',
						id : '${coreinfo.valueid}',
						ispd : '${coreinfo.valueispd}',
						att : 'percents,percents,percents',
						multiplier : '${coreinfo.multiplier}',
						type : <portlet:namespace />choose_type5
					},
					function(data) {
						var dataList = data.data;
						try {
							$('#<portlet:namespace />hvac').text(returnPositiveVal(dataList[0],"${coreinfo.decimals5}"));
							$('#<portlet:namespace />lighting').text(returnPositiveVal(dataList[1],"${coreinfo.decimals5}"));
							$('#<portlet:namespace />data_center').text(returnPositiveVal(dataList[2],"${coreinfo.decimals5}"));
						} catch (e) {
						}
					}, 'json');
}

//默认显示当前时间
<portlet:namespace />choose_type5 = "day";
if("${coreinfo.defaulttime5}" == ""){
	var nowdate = new Date();
	<portlet:namespace />start_date5 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
			+ nowdate.getDate();
} else {
	<portlet:namespace />start_date5 = "${coreinfo.defaulttime5}";
}

<portlet:namespace />legendList5 = <portlet:namespace />start_date5; // 图例
<portlet:namespace />c_times5 = <portlet:namespace />start_date5; // 导出excel的开始时间
<portlet:namespace />exp_start_date5 = <portlet:namespace />start_date5; // 导出excel的开始时间
<portlet:namespace />centerTitle5 = <portlet:namespace />start_date5; //居中标题

//获取左侧的数据信息
<portlet:namespace />getBuildElectroButtomData();
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
	var itemName = "${coreinfo.itemName}";
	var expColumnName5 = "${coreinfo.expColumnName5}";
	// 导出excel的Url
	var expUrl = "<portlet:resourceURL id='expPieChartsDataToExcel'></portlet:resourceURL>"
			+ "&excelName="
			+ "${coreinfo.title5}"
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
			+ '${coreinfo.multiplier}'
			+ "&isNotCompare="
			+ isNotCompare
			+ "&decimals="
			+ '${coreinfo.decimals5}'
			+ "&comparetime="
			+ <portlet:namespace />legendList5
			+ "&expColumnName="
			+ (expColumnName5==""?"${coreinfo.title5}":expColumnName5);
	var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${coreinfo.title5}" /></portlet:resourceURL>';
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${coreinfo.title5}"
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