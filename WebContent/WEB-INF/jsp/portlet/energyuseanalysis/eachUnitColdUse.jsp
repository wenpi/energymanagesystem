<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="date_select">
	<input id="<portlet:namespace />datetime2" type="hidden" />
	<div class="pressive" id="<portlet:namespace/>day"
		onclick="<portlet:namespace />selectdate2('day')">日视图</div>
	<div id="<portlet:namespace/>week"
		onclick="<portlet:namespace />selectdate2('week')">周视图</div>
	<div id="<portlet:namespace/>month"
		onclick="<portlet:namespace />selectdate2('month')">月视图</div>
	<div class="radius" id="<portlet:namespace/>year"
		onclick="<portlet:namespace />selectdate2('year')">年视图</div>
</div>
<div class="charts">
	<div class="look_other">
		<label class="now_data labels" id="<portlet:namespace/>now_data2"></label>
		<div class="date_comparer">
			<input id="<portlet:namespace/>comparing2" type="text"
				class="comp_data" value=""
				onclick="<portlet:namespace/>comparing2()" /> <span
				class="comp_btn">加入对比</span>
			<div class="download" onclick="<portlet:namespace/>expToExcel2()"></div>
		</div>
	</div>
	<div class="chart" id="<portlet:namespace/>chartArea2"></div>
</div>
<div class="detail">
	<div>
		<table class = "unit_cold">
			<caption>单位面积耗冷量</caption>
			<tbody>
				<tr>
					<td><span>日</span>最大值</td>
					<td>250</td>
					<td class="tdClass"><sup>Wh/㎡</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>最小值</td>
					<td>100</td>
					<td class="tdClass"><sup>Wh/㎡</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>累计值</td>
					<td>1200</td>
					<td class="tdClass"><sup>Wh/㎡</sup></td>
					<td></td>
				</tr>
				<tr>
					<td>同比昨日</td>
					<td>↓10</td>
					<td class="tdClass"><sup>%</sup></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
//全局变量
var <portlet:namespace/>start_date2 = "";//开始时间
var <portlet:namespace/>choose_type2 = "";//时间选择类型
var <portlet:namespace/>step2= 4;//存储x轴显示标签间距
var <portlet:namespace/>outsideStr2 = "当日";
var <portlet:namespace/>centerTitle2 = "";//图表标题
var <portlet:namespace/>c_title2 = "";//存储居中标题对应的年份
var <portlet:namespace/>choose_name2 = "${energyUseAnalysis.choose_name2}";//对应的数据name
var <portlet:namespace/>choose_id2 = "${energyUseAnalysis.choose_id2}";//对应的数据Id
var <portlet:namespace/>ispd2 = "${energyUseAnalysis.ispd2}";//对应的ispd
var <portlet:namespace/>legendList2 = "${energyUseAnalysis.chartLegendList_2}";//图例列表
var <portlet:namespace/>showLegend2 = false;//默认不显示图例
var <portlet:namespace/>exp_start_date2 = "";//导出到excel表中的时间
//--------------------------------------------------------------------
//默认显示
if(publicTime != ""){
	<portlet:namespace />start_date2 = publicTime;
} else {
	if ("${energyUseAnalysis.defaulttime2}" == "") {//默认显示当前时间
		var nowdate = new Date();
		<portlet:namespace/>start_date2 = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1)
				+ "-" + nowdate.getDate();
	} else {
		<portlet:namespace/>start_date2 = "${energyUseAnalysis.defaulttime2}";//首选项数据，默认时间
	}
}
<portlet:namespace/>choose_type2 = "day";
<portlet:namespace/>centerTitle2 = <portlet:namespace/>start_date2;
var times02 = "", legend2 = [];
legend2 = <portlet:namespace/>legendList2.split(",");
for ( var i = 0; i < legend2.length; i++) {
	if(i<legend2.length-1){
		times02 += <portlet:namespace/>start_date2 + ",";
	}else{
		times02 += <portlet:namespace/>start_date2;
	}
}
<portlet:namespace/>exp_start_date2 = times02;
//填充图表
//数据类型String,String,String,String,Array,Boolean,String
<portlet:namespace/>getChart2(times02, <portlet:namespace/>choose_name2, <portlet:namespace/>choose_id2, <portlet:namespace/>ispd2, "${energyUseAnalysis.chartLegendList_2}", <portlet:namespace/>showLegend2, 'no');
//---------------------------------------------------------------------
//选择时间（日、周、月、年）
function <portlet:namespace/>selectdate2(type) {
	var dformt = 'yyyy-MM-dd', titleFormat = 'yyyy-MM-dd';
	if (type == "day") {
		dformt = 'yyyy-MM-dd';
	} else if (type == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (type == "month") {
		dformt = 'MM';
		titleFormat = 'yyyy-MM';
	} else if (type == "year") {
		dformt = 'yyyy';
		titleFormat = 'yyyy';
	}

	WdatePicker({
		position:{left:80},
		el : '<portlet:namespace/>datetime2',
		dateFmt : dformt,
		onpicked : function(dp) {
			$("#<portlet:namespace/>comparing2").val('');//清空对比框
			var _time = dp.cal;
			<portlet:namespace/>c_time2 = _time.getDateStr("yyyy");
			<portlet:namespace/>start_date2 = _time.getDateStr("yyyy-MM-dd");
			<portlet:namespace/>choose_type2 = type;
			<portlet:namespace/>centerTitle2 = dp.cal.getDateStr(titleFormat);
			if (type == "day") {
				<portlet:namespace/>outsideStr2 = _time.getDateStr('MM') + "月"
						+ _time.getDateStr('dd') + "日";
				<portlet:namespace/>step2 = "4";
				$(".unit_cold td > span ").text("日"); // 文字
				$(".unit_cold > tbody > tr:eq(3) > td:eq(0)").text("同比昨日"); // 文字
			} else if (type == "week") {
				<portlet:namespace/>step2 = "1";
				<portlet:namespace/>outsideStr2 = "该周";
				$(".unit_cold td > span ").text("周"); // 文字
				$(".unit_cold > tbody > tr:eq(3) > td:eq(0)").text("同比上周"); // 文字
			} else if (type == "month") {
				<portlet:namespace/>outsideStr2 = _time.getDateStr('yyyy') + "年"
						+ _time.getDateStr('MM') + "月";
				<portlet:namespace/>step2 = "5";
				$(".unit_cold td > span ").text("月"); // 文字
				$(".unit_cold > tbody > tr:eq(3) > td:eq(0)").text("同比上月"); // 文字
			} else if (type == "year") {
				<portlet:namespace/>outsideStr2 = _time.getDateStr('yyyy');
				<portlet:namespace/>step2 = "2";
				$(".unit_cold td > span ").text("年"); // 文字
				$(".unit_cold > tbody > tr:eq(3) > td:eq(0)").text("同比去年"); // 文字
			}
			<portlet:namespace/>choose_name2 = '${energyUseAnalysis.choose_name2}'; // 对应的name
			<portlet:namespace/>choose_id2= '${energyUseAnalysis.choose_id2}'; // 对应的id
			<portlet:namespace/>ispd2 = '${energyUseAnalysis.ispd2}'; // 对应的ispd

			var times = "";
			// 根据name的个数，来为att添加对应个数的值
			var legend = <portlet:namespace/>legendList2.split(",");//
			for ( var i = 0; i < legend.length; i++) {
				if(i<legend.length-1){
					times +=<portlet:namespace/>start_date2 + ",";
				}else{
					times +=<portlet:namespace/>start_date2;
				}
			}
			<portlet:namespace/>exp_start_date2 = times;// 导出到excel中的时间 
			// 获取图表
			//数据类型String,String,String,String,Array,Boolean,String
			<portlet:namespace/>getChart2(times, <portlet:namespace/>choose_name2, <portlet:namespace/>choose_id2, <portlet:namespace/>ispd2, "${energyUseAnalysis.chartLegendList_2}",
					<portlet:namespace/>showLegend2, 'no');
		}
	});
}
//时间对比
function <portlet:namespace/>comparing2(){
	var dformt = 'yyyy-MM-dd';
	if (<portlet:namespace />choose_type2 == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type2 == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type2 == "month") {
		dformt = 'MM';
	} else if (<portlet:namespace />choose_type2 == "year") {
		dformt = 'yyyy';
	}
	
	WdatePicker({
		el : '<portlet:namespace />datetime2',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			
			// 显示在页面上的时间
			var showtime= dp.cal.getDateStr(dformt);
			$('#<portlet:namespace />comparing2').val(showtime);
			<portlet:namespace />legendList = <portlet:namespace />start_date2 + "," + paretime; 
			// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
			if("${energyUseAnalysis.referenceLegend_2}" != ""){
				<portlet:namespace />legendList2 += ","+"${energyUseAnalysis.referenceLegend_2}"; 
			}
		
			<portlet:namespace />showLegend2 = true;
			
			<portlet:namespace />exp_start_date2 = <portlet:namespace />start_date2 + "," + paretime; // 对应的开始时间
			<portlet:namespace />choose_name2 = '${energyUseAnalysis.choose_name2},${energyUseAnalysis.choose_name2}'; // 对应的name
			<portlet:namespace />choose_id2 = '${energyUseAnalysis.choose_id2},${energyUseAnalysis.choose_id2}'; // 对应的id
			<portlet:namespace />ispd2 = '${energyUseAnalysis.ispd2},${energyUseAnalysis.ispd2}'; // 对应的ispd
			//加入对比
			<portlet:namespace />getChart2(<portlet:namespace />exp_start_date2,<portlet:namespace />choose_name2,<portlet:namespace />choose_id2,<portlet:namespace />ispd2,<portlet:namespace />legendList2,<portlet:namespace />showLegend2,"yes");			

		}
	});
}

/*
 *获取数据
 *
 */
function <portlet:namespace/>getChart2(tfrom, name, id, ispd, legend, showLegend2,
		isNotCompare) {
	<portlet:namespace />getRightData2();
	$.post("<portlet:resourceURL id='getCommonChartData'></portlet:resourceURL>", {
		from : tfrom,
		name : name,
		id : id,
		ispd : ispd,
		decimals : '${energyUseAnalysis.decimals2}',//显示小数位数，首选项传
		mult : '',//是否在获取的数据基础上乘数，首选项传（饼图）
		type : <portlet:namespace/>choose_type2
	//选取时间段
	}, function(data) {
		var cateList = data.cataList;//x轴标签，数组
		var dataList = data.dataList;//数据，数组集合
		if (<portlet:namespace />choose_type2 == "day"){
			if(isNotCompare == "yes"){ // 如果是对比的图
				<portlet:namespace />centerTitle2 = "";
				legend = "";
				var tfroms = tfrom.split(",");
				for(var i=0;i<tfroms.length;i++){
					<portlet:namespace />centerTitle2 += tfroms[i] + ((tfroms.length-1) == i ? "" : "与");
					legend += tfroms[i] + ((tfroms.length-1) == i ? "" : ",");
				}
				var num=0;
				for(var i=0;i<data.expExcelCataList.length;i++){
					if(data.expExcelCataList[num].length<data.expExcelCataList[i].length){
						num=i;
					}
				}
				cateList=data.expExcelCataList[num];
			}
		} else if (<portlet:namespace />choose_type2 == "week") {
			if(isNotCompare == "yes"){ // 如果是对比的图 

				var _legendList = data.legendList;
				<portlet:namespace />centerTitle2 = "";
				legend= "";
				// 个性需求：重新为图表的一级标题和图例赋值
				for(var i=0;i<_legendList.length;i++){
					for(var k=0;k<_legendList[i].length;k++){
						if(k%2!=0){
							_legendList[i][k]=_legendList[i][k].substring(5);
						}
						<portlet:namespace />centerTitle2 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
						legend += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
					}
					
					<portlet:namespace />centerTitle2 += ((_legendList.length-1) == i ? "" : "与");
					legend += ((_legendList.length-1) == i ? "" : ",");
				}
				legend=legend.replace(/\//g,'-');
				<portlet:namespace />centerTitle2=<portlet:namespace />centerTitle2.replace(/\//g,'-');
				// 个性需求：重新为图表的X轴赋值
				cateList = ["周一","周二","周三","周四","周五","周六","周日"];
			} else {
				// 居中标题的值
				<portlet:namespace />centerTitle2 =tfrom.substring(0,5)+ <portlet:namespace />c_title2 + data.cataList[0].replace(/\//g,'-') + "~" + <portlet:namespace />c_title2  + data.cataList[data.cataList.length-1].replace(/\//g,'-');;
				
				// 往后台返回的X轴列表中添加周一~周日
				var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCateList = [];
				for(var i=0;i<cateList.length;i++){
					finalCateList.push(cateList[i]+cList[i]);
				}
				
				cateList = finalCateList;
			}
		} else if (<portlet:namespace />choose_type2 == "month") {
			if(isNotCompare == "yes"){ // 如果是对比的图 
				<portlet:namespace />centerTitle2 = "";
				legend = "";
				// 个性需求：重新为图表的一级标题和图例赋值
				var tfroms = tfrom.split(",");
				for(var i=0;i<tfroms.length;i++){
					<portlet:namespace />centerTitle2 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
					legend += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
				}
				
				// 个性需求：重新为图表的X轴赋值
				cateList = [];
				for(var k=1;k<=data.cataList.length;k++){
					cateList.push(k); 					
				};
			}
		} else if (<portlet:namespace />choose_type2 == "year") {
			if(isNotCompare == "yes"){ // 如果是对比的图 
				var compareyear = tfrom.substring(11,15);
				// 个性需求：重新为图表的一级标题和图例赋值
				<portlet:namespace />centerTitle2 = <portlet:namespace/>outsideStr2 + "与" + compareyear;
				legend = <portlet:namespace/>outsideStr2 + "," + compareyear;
				
				// 个性需求：重新为图表的X轴赋值
				var _yearList = data.yearList;
				
				if(_yearList[0].length>=_yearList[1].length){
					cateList = _yearList[0];
				} else if(_yearList[0].length<_yearList[1].length){
					cateList = _yearList[1];
				};
			};
		};
		//填充图表
		var seriesList = [];
		// 获取对应的数据列表，对应图表中的图形条数 
		seriesList = returnSeriesList("${energyUseAnalysis.chartType_2_1}",
									  "${energyUseAnalysis.connectLineWidth_2}", // 连接线线宽，为空则默认为2，为0则不显示连接线
									  "${energyUseAnalysis.lineWidth_2}", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
									  legend,
									  "${energyUseAnalysis.chartColorList_2}", // 颜色列表
									  "${energyUseAnalysis.chartFillColorList_2}", // 填充颜色列表
									  "${energyUseAnalysis.chartRadiusList_2}", // 曲线点半径列表,默认为4
									  "${energyUseAnalysis.symbol2}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
									  "${energyUseAnalysis.referencevalue2}", // 参考值  
									  "${energyUseAnalysis.chartType_2_2}", // 参考值的图表类型
									  "${energyUseAnalysis.referenceLegend_2}", // 参考值对应的图例名称
									  "${energyUseAnalysis.referenceColor_2}", // 参考值对应的颜色
									  dataList);
		// 将图表渲染到对应的位置上
		if("${energyUseAnalysis.xStep_2}"!=""){
			<portlet:namespace/>step2="${energyUseAnalysis.xStep_2}";
		}
		$("#<portlet:namespace/>now_data2").html(<portlet:namespace />centerTitle2);
		renderToBigCommonChart("<portlet:namespace />chartArea2", // 对应的渲染位置
						   '', // 居中标题
						   <portlet:namespace />step2, // X轴间隔
						   cateList, // X轴数据列表
						   '', // 列表中的线的样式，默认为虚线
						   '${energyUseAnalysis.yLeftTitle_2}', //  Y轴标题
						   '${energyUseAnalysis.ySymbol2}', // Y轴的单位
						   showLegend2 == '' ? false : showLegend2, // 是否显示图例
						   "${energyUseAnalysis.referenceColor_2}", // 参考颜色
						   seriesList,
							"${energyUseAnalysis.backgroundColor_2}");
	}, 'json');
}
//导出数据到excel文件
function <portlet:namespace/>expToExcel2(){
	var isNotCompare = "no"; // 默认不是对比图表
	var sdate = <portlet:namespace />exp_start_date2;
	var sdateList = sdate.split(",");
	if(sdateList.length>1){
		isNotCompare = "yes"; // yes表示是对比图表
	}
	var expColumnName = "${energyUseAnalysis.expColumnName2}".replace(/'/g,"");
	// 导出excel的Url
	var expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
			+ "&excelName="
			+ "${energyUseAnalysis.title2}"
			+ "&from="
			+ sdate
			+ "&name="
			+ <portlet:namespace />choose_name2
			+ "&id="
			+ <portlet:namespace />choose_id2
			+ "&ispd="
			+ <portlet:namespace />ispd2
			+ "&type="
			+ <portlet:namespace />choose_type2
			+ "&isNotCompare="
			+ isNotCompare
			+ "&expColumnName="
			+ (expColumnName==""?"${energyUseAnalysis.expColumnName2}".replace(/'/g,""):expColumnName);
	var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${energyUseAnalysis.title2}" /></portlet:resourceURL>';
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${energyUseAnalysis.title2}"
			+ ".xls";
	$.ajax({
		type : "POST",
		url : expUrl,
		async : false,
		contentType : 'application/x-msdownload;charset=UTF-8',
		success : function(result) {
			$("#<portlet:namespace/>tmpFrame").attr('src', hSrc);
		},
		error : function(result) {
			alert('error');
		},
	});
};

//获取右侧数据
function <portlet:namespace />getRightData2(){
	$.ajax({
		type : "POST",
		url : "<portlet:resourceURL id='getDatasForAtts'></portlet:resourceURL>",
		data : {
			from : <portlet:namespace />start_date2,
			name : 'electricity',
			id : 'total',
			ispd : '0',
			att : 'max,min,sum,change',
			decimals : '${energyUseAnalysis.decimals2}',//显示小数位数，首选项传
			type : <portlet:namespace />choose_type2
		},
		success : function(result) {
			var data = result.data;
			var maxtime = '', mintime = '';
			if(<portlet:namespace />choose_type2 == 'day'){
				maxtime = data[0][1].substring(11, 16);
				mintime = data[1][1].substring(11, 16);
			} else if(<portlet:namespace />choose_type2 == 'week'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			} else if(<portlet:namespace />choose_type2 == 'month'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			} else if(<portlet:namespace />choose_type2 == 'year'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			}
			
			$(".unit_cold > tbody > tr:eq(0) > td:eq(1)").text(parseFloat(data[0][0])); // max
			$(".unit_cold > tbody > tr:eq(0) > td:eq(3)").text(maxtime); // maxTime
			$(".unit_cold > tbody > tr:eq(1) > td:eq(1)").text(parseFloat(data[1][0]));// min
			$(".unit_cold > tbody > tr:eq(1) > td:eq(3)").text(mintime); // minTime
			$(".unit_cold > tbody > tr:eq(2) > td:eq(1)").text(parseFloat(data[2][0])); // sum
			$(".unit_cold > tbody > tr:eq(3) > td:eq(1)").text(returnUpOrDown(data[3][0]) + returnPositiveVal(data[3][0],"0"));// change
		},
		error : function(result) {
			console.log('getRightData2 + error');
		}
	});
};
</script>