<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="date_select">
	<input id="<portlet:namespace />datetime5" type="hidden" />
	<div class="pressive" id="<portlet:namespace/>day"
		onclick="<portlet:namespace />selectdate5('day')">日视图</div>
	<div id="<portlet:namespace/>week"
		onclick="<portlet:namespace />selectdate5('week')">周视图</div>
	<div id="<portlet:namespace/>month"
		onclick="<portlet:namespace />selectdate5('month')">月视图</div>
	<div class="radius" id="<portlet:namespace/>year"
		onclick="<portlet:namespace />selectdate5('year')">年视图</div>
</div>
<div class="charts">
	<div class="look_other">
		<label class="now_data labels" id="<portlet:namespace/>now_data5"></label>
		<div class="date_comparer">
			<input id="<portlet:namespace/>comparing5" type="text"
				class="comp_data" value=""
				onclick="<portlet:namespace/>comparing5()" /> <span
				class="comp_btn">加入对比</span>
			<div class="download" onclick="<portlet:namespace/>expToExcel5()"></div>
		</div>
	</div>
	<div class="chart" id="<portlet:namespace/>chartArea5"></div>
</div>
<div class="detail">
	<div>
		<table class="gas_total">
			<caption>建筑总用气量</caption>
			<tbody>
				<tr>
					<td><span>日</span>最大值</td>
					<td>250</td>
					<td class="tdClass"><sup>m³</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>最小值</td>
					<td>100</td>
					<td class="tdClass"><sup>m³</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>累计值</td>
					<td>1200</td>
					<td class="tdClass"><sup>m³</sup></td>
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
var <portlet:namespace/>start_date5 = "";//开始时间
var <portlet:namespace/>choose_type5 = "";//时间选择类型
var <portlet:namespace/>step5= 4;//存储x轴显示标签间距
var <portlet:namespace/>outsideStr5 = "当日";
var <portlet:namespace/>centerTitle5 = "";//图表标题
var <portlet:namespace/>c_title5 = "";//存储居中标题对应的年份
var <portlet:namespace/>choose_name5 = "${energyStatic.choose_name5}";//对应的数据name
var <portlet:namespace/>choose_id5 = "${energyStatic.choose_id5}";//对应的数据Id
var <portlet:namespace/>ispd5 = "${energyStatic.ispd5}";//对应的ispd
var <portlet:namespace/>legendList5 = "${energyStatic.chartLegendList_5}";//图例列表
var <portlet:namespace/>showLegend5 =${energyStatic.showLegend_5};//默认不显示图例
var <portlet:namespace/>exp_start_date5 = "";//导出到excel表中的时间
//--------------------------------------------------------------------
//默认显示
if(publicTime != ""){
	<portlet:namespace />start_date5 = publicTime;
} else {
	if ("${energyStatic.defaulttime5}" == "") {//默认显示当前时间
		var nowdate = new Date();
		<portlet:namespace/>start_date5 = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1)
				+ "-" + nowdate.getDate();
	} else {
		<portlet:namespace/>start_date5 = "${energyStatic.defaulttime5}";//首选项数据，默认时间
	}
}
<portlet:namespace/>choose_type5 = "day";
<portlet:namespace/>centerTitle5 = <portlet:namespace/>start_date5;
var times05 = "", legend5 = [];
legend5 = <portlet:namespace/>legendList5.split(",");
for ( var i = 0; i < legend5.length; i++) {
	if(i<legend5.length-1){
		times05 += <portlet:namespace/>start_date5 + ",";
	}else{
		times05 += <portlet:namespace/>start_date5 ;
	}
}
<portlet:namespace/>exp_start_date5 = times05;
//填充图表
//数据类型String,String,String,String,Array,Boolean,String
<portlet:namespace/>getChart5(times05, <portlet:namespace/>choose_name5, <portlet:namespace/>choose_id5, <portlet:namespace/>ispd5, <portlet:namespace/>legendList5, <portlet:namespace/>showLegend5, 'no');
//---------------------------------------------------------------------
//选择时间（日、周、月、年）
function <portlet:namespace/>selectdate5(type) {
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
		el : '<portlet:namespace/>datetime5',
		dateFmt : dformt,
		onpicked : function(dp) {
			$("#<portlet:namespace/>comparing5").val('');//清空对比框
			var _time = dp.cal;
			<portlet:namespace/>c_time5 = _time.getDateStr("yyyy");
			<portlet:namespace/>start_date5 = _time.getDateStr("yyyy-MM-dd");
			<portlet:namespace/>choose_type5 = type;
			<portlet:namespace/>centerTitle5 = dp.cal.getDateStr(titleFormat);
			if (type == "day") {
				<portlet:namespace/>outsideStr5 = _time.getDateStr('MM') + "月"
						+ _time.getDateStr('dd') + "日";
				<portlet:namespace/>step5 = "4";
				$(".gas_total td > span").text("日"); // 文字
				$(".gas_total > tbody > tr:eq(3) > td:eq(0)").text("同比昨日"); // 文字
			} else if (type == "week") {
				$(".gas_total td > span").text("周"); // 文字
				$(".gas_total > tbody > tr:eq(3) > td:eq(0)").text("同比上周"); // 文字
				<portlet:namespace/>step5 = "1";
				<portlet:namespace/>outsideStr5 = "该周";
			} else if (type == "month") {
				$(".gas_total td > span").text("月"); // 文字
				$(".gas_total > tbody > tr:eq(3) > td:eq(0)").text("同比上月"); // 文字
				<portlet:namespace/>outsideStr5 = _time.getDateStr('yyyy') + "年"
						+ _time.getDateStr('MM') + "月";
				<portlet:namespace/>step5 = "5";
			} else if (type == "year") {
				$(".gas_total td > span").text("年"); // 文字
				$(".gas_total > tbody > tr:eq(3) > td:eq(0)").text("同比去年"); // 文字
				<portlet:namespace/>outsideStr5 = _time.getDateStr('yyyy');
				<portlet:namespace/>step5 = "2";
			}
			<portlet:namespace/>choose_name5 = '${energyStatic.choose_name5}'; // 对应的name
			<portlet:namespace/>choose_id5= '${energyStatic.choose_id5}'; // 对应的id
			<portlet:namespace/>ispd5 = '${energyStatic.ispd5}'; // 对应的ispd

			var times = "";
			// 根据name的个数，来为att添加对应个数的值
			var legend = <portlet:namespace/>legendList5.split(",");//
			for ( var i = 0; i < legend.length; i++) {
				if(i<legend.length-1){
					times +=<portlet:namespace/>start_date5 + ",";
				}else{
					times +=<portlet:namespace/>start_date5;
				}	
			}
			<portlet:namespace/>exp_start_date5 = times;// 导出到excel中的时间 
			// 获取图表
			//数据类型String,String,String,String,Array,Boolean,String
			<portlet:namespace/>getChart5(times, <portlet:namespace/>choose_name5, <portlet:namespace/>choose_id5, <portlet:namespace/>ispd5,"${energyStatic.chartLegendList_5}",
					<portlet:namespace/>showLegend5, 'no');
		}
	});
}
//时间对比
function <portlet:namespace/>comparing5(){
	var dformt = 'yyyy-MM-dd';
	if (<portlet:namespace />choose_type5 == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type5 == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type5 == "month") {
		dformt = 'MM';
	} else if (<portlet:namespace />choose_type5 == "year") {
		dformt = 'yyyy';
	}
	
	WdatePicker({
		el : '<portlet:namespace />datetime5',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			
			// 显示在页面上的时间
			var showtime= dp.cal.getDateStr(dformt);
			$('#<portlet:namespace />comparing5').val(showtime);
			<portlet:namespace />legendList = <portlet:namespace />start_date5 + "," + paretime; 
			// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
			if("${energyStatic.referenceLegend_5}" != ""){
				<portlet:namespace />legendList5 += ","+"${energyStatic.referenceLegend_5}"; 
			}
		
			<portlet:namespace />showLegend5 = true;
			
			<portlet:namespace />exp_start_date5 = <portlet:namespace />start_date5 + "," + paretime; // 对应的开始时间
			<portlet:namespace />choose_name5 = '${energyStatic.choose_name5},${energyStatic.choose_name5}'; // 对应的name
			<portlet:namespace />choose_id5 = '${energyStatic.choose_id5},${energyStatic.choose_id5}'; // 对应的id
			<portlet:namespace />ispd5 = '${energyStatic.ispd5},${energyStatic.ispd5}'; // 对应的ispd
			//加入对比
			<portlet:namespace />getChart5(<portlet:namespace />exp_start_date5,<portlet:namespace />choose_name5,<portlet:namespace />choose_id5,<portlet:namespace />ispd5,<portlet:namespace />legendList5,<portlet:namespace />showLegend5,"yes");				
		}
	});
}
/*
 *获取数据
 *
 */
function <portlet:namespace/>getChart5(tfrom, name, id, ispd, legend, showLegend5,
		isNotCompare) {
	<portlet:namespace />getRightData5(); // 获取右侧数据信息
	$.post("<portlet:resourceURL id='getCommonChartData'></portlet:resourceURL>", {
		from : tfrom,
		name : name,
		id : id,
		ispd : ispd,
		decimals :'${energyStatic.decimals5}',//显示小数位数，首选项传
		mult : '',//是否在获取的数据基础上乘数，首选项传（饼图）
		type : <portlet:namespace/>choose_type5
	//选取时间段
	}, function(data) {
		var cateList = data.cataList;//x轴标签，数组
		var dataList = data.dataList;//数据，数组集合
		if (<portlet:namespace />choose_type5 == "day"){
			if(isNotCompare == "yes"){ // 如果是对比的图
				<portlet:namespace />centerTitle5 = "";
				legend = "";
				var tfroms = tfrom.split(",");
				for(var i=0;i<tfroms.length;i++){
					<portlet:namespace />centerTitle5 += tfroms[i] + ((tfroms.length-1) == i ? "" : "与");
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
		} else if (<portlet:namespace />choose_type5 == "week") {
			if(isNotCompare == "yes"){ // 如果是对比的图 

				var _legendList = data.legendList;
				<portlet:namespace />centerTitle5 = "";
				legend = "";
				// 个性需求：重新为图表的一级标题和图例赋值
				for(var i=0;i<_legendList.length;i++){
					for(var k=0;k<_legendList[i].length;k++){
						if(k%2!=0){
							_legendList[i][k]=_legendList[i][k].substring(5);
						}
						<portlet:namespace />centerTitle5 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
						legend += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
					}
					
					<portlet:namespace />centerTitle5 += ((_legendList.length-1) == i ? "" : "与");
					legend += ((_legendList.length-1) == i ? "" : ",");
				}
				legend=legend.replace(/\//g,'-');
				<portlet:namespace />centerTitle5=<portlet:namespace />centerTitle5.replace(/\//g,'-');
				// 个性需求：重新为图表的X轴赋值
				cateList = ["周一","周二","周三","周四","周五","周六","周日"];
			} else {
				// 居中标题的值
				<portlet:namespace />centerTitle5 =tfrom.substring(0,5)+ <portlet:namespace />c_title5 + data.cataList[0].replace(/\//g,'-') + "~" + <portlet:namespace />c_title5  + data.cataList[data.cataList.length-1].replace(/\//g,'-');;
				
				// 往后台返回的X轴列表中添加周一~周日
				var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCateList = [];
				for(var i=0;i<cateList.length;i++){
					finalCateList.push(cateList[i]+cList[i]);
				}
				
				cateList = finalCateList;
			}
		} else if (<portlet:namespace />choose_type5 == "month") {
			if(isNotCompare == "yes"){ // 如果是对比的图 
				<portlet:namespace />centerTitle5 = "";
				legend = "";
				// 个性需求：重新为图表的一级标题和图例赋值
				var tfroms = tfrom.split(",");
				for(var i=0;i<tfroms.length;i++){
					<portlet:namespace />centerTitle5 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
					legend += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
				}
				
				// 个性需求：重新为图表的X轴赋值
				cateList = [];
				for(var k=1;k<=data.cataList.length;k++){
					cateList.push(k); 					
				};
			}
		} else if (<portlet:namespace />choose_type5 == "year") {
			if(isNotCompare == "yes"){ // 如果是对比的图 
				var compareyear = tfrom.substring(11,15);
				// 个性需求：重新为图表的一级标题和图例赋值
				<portlet:namespace />centerTitle5 = <portlet:namespace/>outsideStr5 + "与" + compareyear;
				legend= <portlet:namespace/>outsideStr5 + "," + compareyear;
				
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
		// 渲染图表
		var seriesList = [];
		// 获取对应的数据列表，对应图表中的图形条数 
		seriesList = returnSeriesList("${energyStatic.chartType_5_1}",
									  "${energyStatic.connectLineWidth_5}", // 连接线线宽，为空则默认为2，为0则不显示连接线
									  "${energyStatic.lineWidth_5}", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
									  legend,
									  "${energyStatic.chartColorList_5}", // 颜色列表
									  "${energyStatic.chartFillColorList_5}", // 填充颜色列表
									  "${energyStatic.chartRadiusList_5}", // 曲线点半径列表,默认为4
									  "${energyStatic.symbol5}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
									  "${energyStatic.referencevalue5}", // 参考值  
									  "${energyStatic.chartType_5_2}", // 参考值的图表类型
									  "${energyStatic.referenceLegend_5}", // 参考值对应的图例名称
									  "${energyStatic.referenceColor_5}", // 参考值对应的颜色
									  dataList);
		// 将图表渲染到对应的位置上
		if("${energyStatic.xStep_5}"!=""){
			<portlet:namespace/>step5="${energyStatic.xStep_5}";
		}
		$("#<portlet:namespace/>now_data5").html(<portlet:namespace />centerTitle5);
		renderToBigCommonChart("<portlet:namespace />chartArea5", // 对应的渲染位置
						   '', // 居中标题
						   <portlet:namespace />step5, // X轴间隔
						   cateList, // X轴数据列表
						   '', // 列表中的线的样式，默认为虚线
						   '${energyStatic.yLeftTitle_5}', //  Y轴标题
						   '${energyStatic.ySymbol5}', // Y轴的单位
						   showLegend5 == '' ? false : showLegend5, // 是否显示图例
						   "${energyStatic.referenceColor_5}", // 参考颜色
						   seriesList,
							"${energyStatic.backgroundColor_5}");
	}, 'json');
}
//导出数据到excel文件
function <portlet:namespace/>expToExcel5(){
	var isNotCompare = "no"; // 默认不是对比图表
	var sdate = <portlet:namespace />exp_start_date5;
	var sdateList = sdate.split(",");
	if(sdateList.length>1){
		isNotCompare = "yes"; // yes表示是对比图表
	}
	var expColumnName = "${energyStatic.expColumnName5}";
	// 导出excel的Url
	var expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
			+ "&excelName="
			+ "${energyStatic.title5}"
			+ "&from="
			+ sdate
			+ "&name="
			+ <portlet:namespace />choose_name5
			+ "&id="
			+ <portlet:namespace />choose_id5
			+ "&ispd="
			+ <portlet:namespace />ispd5
			+ "&type="
			+ <portlet:namespace />choose_type5
			+ "&isNotCompare="
			+ isNotCompare
			+ "&expColumnName="
			+ (expColumnName==""?"${energyStatic.title5}":expColumnName);
	var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${energyStatic.title5}" /></portlet:resourceURL>';
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${energyStatic.title5}"
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
function <portlet:namespace />getRightData5(){
	$.ajax({
		type : "POST",
		url : "<portlet:resourceURL id='getDatasForAtts'></portlet:resourceURL>",
		data : {
			from : <portlet:namespace />start_date5,
			name : 'carbon',
			id : 'total',
			ispd : '0',
			att : 'max,min,sum,change',
			decimals : '${energyStatic.decimals5}',//显示小数位数，首选项传
			type : <portlet:namespace />choose_type5
		},
		success : function(result) {
			var data = result.data;
			var maxtime = '', mintime = '';
			if(<portlet:namespace />choose_type5 == 'day'){
				maxtime = data[0][1].substring(11, 16);
				mintime = data[1][1].substring(11, 16);
			} else if(<portlet:namespace />choose_type5 == 'week'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			} else if(<portlet:namespace />choose_type5 == 'month'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			} else if(<portlet:namespace />choose_type5 == 'year'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			}
			
			$(".gas_total > tbody > tr:eq(0) > td:eq(1)").text(parseFloat(data[0][0])); // max
			$(".gas_total > tbody > tr:eq(0) > td:eq(3)").text(maxtime); // maxTime
			$(".gas_total > tbody > tr:eq(1) > td:eq(1)").text(parseFloat(data[1][0]));// min
			$(".gas_total > tbody > tr:eq(1) > td:eq(3)").text(mintime); // minTime
			$(".gas_total > tbody > tr:eq(2) > td:eq(1)").text(parseFloat(data[2][0])); // sum
			$(".gas_total > tbody > tr:eq(3) > td:eq(1)").text(returnUpOrDown(data[3][0]) + returnPositiveVal(data[3][0],"0"));// change
		},
		error : function(result) {
			console.log('getRightData5 + error');
		}
	});
};
</script>