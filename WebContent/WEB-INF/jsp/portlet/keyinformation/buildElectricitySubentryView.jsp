	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 建筑用电分项
 -->

<div class="date_select">
	<input id="<portlet:namespace />datetime5" type="hidden" />
	<div id="<portlet:namespace />day5" class="pressive" onclick="<portlet:namespace />selectdate5('day')">日视图</div>
	<div id="<portlet:namespace />week5" onclick="<portlet:namespace />selectdate5('week')">周视图</div>
	<div id="<portlet:namespace />month5" onclick="<portlet:namespace />selectdate5('month')">月视图</div>
	<div id="<portlet:namespace />year5" class="radius" onclick="<portlet:namespace />selectdate5('year')">年视图</div>
</div>
<div class="charts chart_width">
	<div class="look_other">
		<label class="now_data tb_now" id = "<portlet:namespace />fromDate5"></label>
		<div class="date_comparer">
			<input type="text" class="comp_data tbcmp"  id="<portlet:namespace />comparetime5" onclick="<portlet:namespace />comparetime5()"/><span
				class="comp_btn tb_btn" onclick="<portlet:namespace />confirm5()">加入对比</span>
		</div>
		<div class="download" onclick="<portlet:namespace />outputToExcel5()"></div>
	</div>
	<iframe name="<portlet:namespace />tmpFrame5"
			id="<portlet:namespace />tmpFrame5" width="1" height="1"
			style="visibility: hidden; position: absolute; display: none"></iframe>
	<div class="chart tbchart" id="<portlet:namespace />buildelectrosubentry"></div>
</div>
<div class="detail">
	<div>
		<table>
			<caption>建筑总能耗分项</caption>
			<tbody class="build_subentry">
				<tr>
					<td>空调用电</td>
					<td><span>↓ 30</span><sup><sup>%</sup></sup></td>
				</tr>
				<tr>
					<td>照明用电</td>
					<td><span>↓ 10</span><sup><sup>%</sup></sup></td>
				</tr>
				<tr>
					<td>电梯用电</td>
					<td><span>↓ 8</span><sup><sup>%</sup></sup></td>
				</tr>
				<tr>
					<td>其他用电</td>
					<td><span>↑ 5</span><sup><sup>%</sup></sup></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
var <portlet:namespace />start_date5 = ''; // 开始时间
var <portlet:namespace />choose_type5 = ''; // 点击类型（日、周、月、年）
var <portlet:namespace />step5 = "${tbinfo.xStep_5}"; //存储X轴的显示间隔
var <portlet:namespace />legendList5 = "${tbinfo.chartLegendList_5}";// 图例列表
var <portlet:namespace />showLegend5 = false; // 默认不显示图例
var <portlet:namespace />centerTitle5 = ""; //居中标题
var <portlet:namespace />c_title5 = ''; // 存储居中标题对应的年份
var <portlet:namespace />exp_start_date5 = ''; // 存储导出的时间 
var <portlet:namespace />c_times5 = ''; // 存储导出的时间 
var <portlet:namespace />choose_name5 = '${tbinfo.choose_name5}'; // 对应的name
var <portlet:namespace />choose_id5 = '${tbinfo.choose_id5}'; // 对应的id
var <portlet:namespace />ispd5 = '${tbinfo.ispd5}'; // 对应的ispd
var <portlet:namespace />time_join5 ="";//存放比较视图中的比较时间

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
			<portlet:namespace />choose_name5 = '${tbinfo.choose_name5},${tbinfo.choose_name5}'; // 对应的name
			<portlet:namespace />choose_id5 = '${tbinfo.choose_id5},${tbinfo.choose_id5}'; // 对应的id
			<portlet:namespace />ispd5 = '${tbinfo.ispd5},${tbinfo.ispd5}'; // 对应的ispd
			<portlet:namespace />showLegend5 = true;
			
			var times = [];
			// 根据name的个数，来为att添加对应个数的值
			var names = "${tbinfo.choose_name5}".split(",");
			for(var i=0;i<names.length;i++){
				times.push(<portlet:namespace />start_date5);
			}
			for(var i=0;i<names.length;i++){
				times.push(paretime);
			}
			<portlet:namespace />time_join5 = times.join();
		}
	});
}

/**
* 加入对比后，获取图表数据
*/
function <portlet:namespace />confirm5(){
	<portlet:namespace />showLegend5 = true;
	// 渲染图表,注意：此处和别的页面不太一样，此处多了一个参数
	<portlet:namespace />compareCharts5(<portlet:namespace />time_join5,<portlet:namespace />choose_name5,<portlet:namespace />choose_id5,<portlet:namespace />ispd5,<portlet:namespace />legendList5,<portlet:namespace />showLegend5,'yes',<portlet:namespace />legendList5);
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
				decimals : '${tbinfo.decimals5}',
				att : atts.join(),
				mult : '${tbinfo.multiplier}' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
			}, function(data) {
				var cataList = data.cataList;
				var dataList = data.dataList;
				
				cataList = [ ${tbinfo.chartLegendList_5} ]; // 个性需求：重新为图表的X轴赋值
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
							if(i%2==0){
								
							}
							<portlet:namespace />centerTitle5 += showWeekFirstDay(pare_times[i]) + "~" + showWeekLastDay(pare_times[i]).substring(5,7) + "-" + showWeekLastDay(pare_times[i]).substring(8) + ((pare_times.length-1) == i ? "" : "与");
							<portlet:namespace />legendList5 += showWeekFirstDay(pare_times[i]) + "~" + showWeekLastDay(pare_times[i]) + ((pare_times.length-1) == i ? "" : ",");
						}
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
				
				var names = "${tbinfo.choose_name5}".split(",");
				for(var i=0;i<dataList.length;i++){
					if(i<names.length){
						data1.push(dataList[i][0]);
					}else{
						data2.push(dataList[i][0]);
					}
				}
				// 显示时间到相应位置
				$("#<portlet:namespace />fromDate5").text(<portlet:namespace />centerTitle5);
				newData.push(data1);
				newData.push(data2);
				// 获取对应的数据列表，对应图表中的图形条数
				seriesList = returnSeriesList("${tbinfo.chartType_6_1}",
											  "", // 连接线线宽，为空则默认为2，为0则不显示连接线
											  "", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
											  <portlet:namespace />legendList5,
											  "${tbinfo.chartColorList_6}", // 颜色列表
											  "${tbinfo.chartFillColorList_6}", // 填充颜色列表
											  "${tbinfo.chartRadiusList_6}", // 曲线点半径列表,默认为4
											  "", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
											  "", // 参考值  
											  "", // 参考值的图表类型
											  "", // 参考值对应的图例名称
											  "", // 参考值对应的颜色
											  newData);
				
				// 将图表渲染到对应的位置上
				renderCompareChart("<portlet:namespace />buildelectrosubentry",
								   "", // 居中标题
								   <portlet:namespace />step5, // x轴的间隔
								   cataList, // x轴列表
								   '',
								   '${tbinfo.yLeftTitle_6}', // Y轴左侧的标题
								   '${tbinfo.ySymbol6}', // Y轴的单位
								   showLegend5 == '' ? false : showLegend5,
								   "",
								   seriesList);
			}, 'json');
}

if(<portlet:namespace />choose_name5.split(",").length>1){
	<portlet:namespace />showLegend5 = true;
}

//选择时间（日、周、月、年）
function <portlet:namespace />selectdate5(type) {
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
		position:{left:80},
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
			<portlet:namespace />choose_name5 = '${tbinfo.choose_name5}'; // 对应的name
			<portlet:namespace />choose_id5 = '${tbinfo.choose_id5}'; // 对应的id
			<portlet:namespace />ispd5 = '${tbinfo.ispd5}'; // 对应的ispd
			if(<portlet:namespace />choose_name5.split(",").length>1){
				<portlet:namespace />showLegend5 = true;
			}else{
				<portlet:namespace />showLegend5 = false;
			}
			<portlet:namespace />getChart5(<portlet:namespace />start_date5,<portlet:namespace />choose_name5,<portlet:namespace />choose_id5,<portlet:namespace />ispd5,<portlet:namespace />legendList5,<portlet:namespace />showLegend5,'no');
		}
	});
}

/**
 * 异步获取图表数据
 */
function <portlet:namespace />getChart5(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
	<portlet:namespace />getRightData5(); 
	$
			.post(
					'<portlet:resourceURL id="getMoreChartsByNames"></portlet:resourceURL>',
					{
						from : tfrom,
						name : name,
						id : id,
						ispd : ispd,
						type : <portlet:namespace />choose_type5,
						decimals : '${tbinfo.decimals5}',
						att : 'percents',
						mult : '${tbinfo.multiplier}' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
					}, function(data) {
						var dataList = data.dataList;
						// 为建筑用电分项报表填充数据
						var categories = [${tbinfo.chartLegendList_5} ], colorsArr = [${tbinfo.chartColorList_5}], datas = [${tbinfo.chartDataList_5} ];
						var pieDataList = [];
						for(var i=0;i<dataList.length;i++){
							pieDataList.push(dataList[i][0]);
						}
						// 根据选择的类型，设置对应的居中标题
						if (<portlet:namespace />choose_type5 == "week") { // 周报
							<portlet:namespace />centerTitle5 = "";
							// 个性需求：重新为图表的一级标题和图例赋值
							<portlet:namespace />centerTitle5 += showWeekFirstDay(tfrom) + "~" + showWeekLastDay(tfrom);
							<portlet:namespace />legendList5 =<portlet:namespace />centerTitle5; // 图例
						}
						// 显示时间到相应位置
						$("#<portlet:namespace />fromDate5").text(<portlet:namespace />centerTitle5);
						//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToCharts.js中，用来生成图表
						autoRenderToPieChartsAndLegend('<portlet:namespace />buildelectrosubentry',
								"${tbinfo.chartType_5}","${tbinfo.backgroundColor_5}",categories, colorsArr, pieDataList , "${tbinfo.chartLegendLayout_5}",
								"${tbinfo.chartLegendAlign_5}", "${tbinfo.chartWordColor}","${tbinfo.distance}","${tbinfo.connectLineWidth_5}","");
							
					}, 'json');
}


//默认显示当前时间
<portlet:namespace />choose_type5 = "day";
if(publicTime != ""){
	<portlet:namespace />start_date5 = publicTime;
} else {
	if("${tbinfo.defaulttime5}" == ""){
		var nowdate = new Date();
		<portlet:namespace />start_date5 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	} else {
		<portlet:namespace />start_date5 = "${tbinfo.defaulttime5}";
	}
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
	var itemName = "${tbinfo.itemName}";
	var expColumnName5 = "${tbinfo.expColumnName5}";
	// 导出excel的Url
	var expUrl = "<portlet:resourceURL id='expPieChartsDataToExcel'></portlet:resourceURL>"
			+ "&excelName="
			+ "${tbinfo.title5}"
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
			+ '${tbinfo.multiplier}'
			+ "&isNotCompare="
			+ isNotCompare
			+ "&comparetime="
			+ <portlet:namespace />legendList5
			+ "&expColumnName="
			+ (expColumnName5==""?"${tbinfo.title5}":expColumnName5);
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${tbinfo.title5}"
			+ ".xls";
	$.ajax({
		type : "POST",
		url : expUrl,
		async : false,
		contentType : 'application/x-msdownload;charset=UTF-8',
		success : function(result) {
			$("#<portlet:namespace />tmpFrame5").attr('src', hSrc);
		},
		error : function(result) {
			alert('error');
		}
	});
}

//获取右侧数据
function <portlet:namespace />getRightData5(){
	$.ajax({
		type : "POST",
		url : "<portlet:resourceURL id='getDatasForNamesAndAtts'></portlet:resourceURL>",
		data : {
			from : <portlet:namespace />start_date5,
			name : <portlet:namespace />choose_name5,
			id : <portlet:namespace />choose_id5,
			ispd : <portlet:namespace />ispd5,
			att : 'change',
			type : <portlet:namespace />choose_type5,
			decimals : '${tbinfo.decimals5}'
		},
		success : function(result) {
			var data = result.data;
			$(".build_subentry > tr:eq(0) > td:eq(1) > span").text(returnUpOrDown(data[0][0][0]) + returnPositiveVal(data[0][0][0],'${tbinfo.decimals5}'));// change
			$(".build_subentry > tr:eq(1) > td:eq(1) > span").text(returnUpOrDown(data[1][0][0]) + returnPositiveVal(data[1][0][0],'${tbinfo.decimals5}'));// change
			$(".build_subentry > tr:eq(2) > td:eq(1) > span").text(returnUpOrDown(data[5][0][0]) + returnPositiveVal(data[5][0][0],'${tbinfo.decimals5}'));// change
			$(".build_subentry > tr:eq(3) > td:eq(1) > span").text(returnUpOrDown(data[6][0][0]) + returnPositiveVal(data[6][0][0],'${tbinfo.decimals5}'));// change
		},
		error : function(result) {
			console.log('getRightData5 + error');
		}
	});
};
</script>