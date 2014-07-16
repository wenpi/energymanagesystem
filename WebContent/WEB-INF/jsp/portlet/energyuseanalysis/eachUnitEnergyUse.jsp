<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="date_select">
	<input id="<portlet:namespace />datetime1" type="hidden" />
	<div class="pressive" id="<portlet:namespace/>day"
		onclick="<portlet:namespace />selectdate1('day')">日视图</div>
	<div id="<portlet:namespace/>week"
		onclick="<portlet:namespace />selectdate1('week')">周视图</div>
	<div id="<portlet:namespace/>month"
		onclick="<portlet:namespace />selectdate1('month')">月视图</div>
	<div class="radius" id="<portlet:namespace/>year"
		onclick="<portlet:namespace />selectdate1('year')">年视图</div>
</div>
<div class="charts">
	<div class="look_other">
		<label class="now_data labels" id="<portlet:namespace/>now_data1"></label>
		<div class="date_comparer">
			<input id="<portlet:namespace/>comparing1" type="text"
				class="comp_data" value=""
				onclick="<portlet:namespace/>comparing1()" /> <span
				class="comp_btn">加入对比</span> <span class="download"
				onclick="<portlet:namespace/>expToExcel1()"></span>
		</div>
	</div>
	<div class="chart" id="<portlet:namespace/>chartArea1"></div>
</div>
<div class="detail">
	<div>
		<table class = "unit_energy">
			<caption>单位面积总能耗</caption>
			<tbody>
				<tr>
					<td><span>日</span>最大值</td>
					<td>250</td>
					<td class="tdClass"><sup>gce/㎡</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>最小值</td>
					<td>100</td>
					<td class="tdClass"><sup>gce/㎡</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>累计值</td>
					<td>1200</td>
					<td class="tdClass"><sup>gce/㎡</sup></td>
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
	var <portlet:namespace/>start_date1 = "";//开始时间
	var <portlet:namespace/>choose_type1 = "";//时间选择类型
	var <portlet:namespace/>step1 = 4;//存储x轴显示标签间距
	var <portlet:namespace/>outsideStr1 = "当日";
	var <portlet:namespace/>centerTitle1 = "";//图表标题
	var <portlet:namespace/>c_title1 = "";//存储居中标题对应的年份
	var <portlet:namespace/>choose_name1 = "${energyUseAnalysis.choose_name1}";//对应的数据name
	var <portlet:namespace/>choose_id1 = "${energyUseAnalysis.choose_id1}";//对应的数据Id
	var <portlet:namespace/>ispd1 = "${energyUseAnalysis.ispd1}";//对应的ispd
	var <portlet:namespace/>legendList1 = "${energyUseAnalysis.chartLegendList_1}";//图例列表
	var <portlet:namespace/>showLegend1 = true;//默认不显示图例
	var <portlet:namespace/>exp_start_date1 = "";//导出到excel表中的时间
	//--------------------------------------------------------------------
	//默认显示
	if(publicTime != ""){
		<portlet:namespace />start_date1 = publicTime;
	} else {
		if ("${energyUseAnalysis.defaulttime1}" == "") {//默认显示当前时间
			var nowdate = new Date();
			<portlet:namespace/>start_date1 = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1)
					+ "-" + nowdate.getDate();
		} else {
			<portlet:namespace/>start_date1 = "${energyUseAnalysis.defaulttime1}";//首选项数据，默认时间
		}
	}
	<portlet:namespace/>choose_type1 = "day";
	<portlet:namespace/>centerTitle1 = <portlet:namespace/>start_date1;
	var times0 = "", legend = [];
	legend = <portlet:namespace/>legendList1.replace(/'/g,"").split(",");
	for ( var i = 0; i < legend.length; i++) {
		if(i<legend.length-1){
			times0 += <portlet:namespace/>start_date1 + ",";
		}else{
			times0 += <portlet:namespace/>start_date1;
		}
	}
	<portlet:namespace/>exp_start_date1 = times0;
	//填充图表
	//数据类型String,String,String,String,Array,Boolean,String
	<portlet:namespace/>getChart1(times0, <portlet:namespace/>choose_name1, <portlet:namespace/>choose_id1, <portlet:namespace/>ispd1, legend, <portlet:namespace/>showLegend1, 'no');
//---------------------------------------------------------------------
//选择时间（日、周、月、年）
function <portlet:namespace/>selectdate1(type) {
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
		el : '<portlet:namespace/>datetime1',
		dateFmt : dformt,
		onpicked : function(dp) {
			$("#<portlet:namespace/>comparing1").val('');//清空对比框
			var _time = dp.cal;
			<portlet:namespace/>c_time1 = _time.getDateStr("yyyy");
			<portlet:namespace/>start_date1 = _time.getDateStr("yyyy-MM-dd");
			<portlet:namespace/>choose_type1 = type;
			<portlet:namespace/>centerTitle1 = dp.cal.getDateStr(titleFormat);
			if (type == "day") {
				<portlet:namespace/>outsideStr1 = _time.getDateStr('MM') + "月"
						+ _time.getDateStr('dd') + "日";
				<portlet:namespace/>step1 = "4";
				$(".unit_energy td > span").text("日"); // 文字
				$(".unit_energy > tbody > tr:eq(3) > td:eq(0)").text("同比昨日"); // 文字
			} else if (type == "week") {
				<portlet:namespace/>step1 = "1";
				<portlet:namespace/>outsideStr1 = "该周";
				$(".unit_energy td > span").text("周"); // 文字
				$(".unit_energy > tbody > tr:eq(3) > td:eq(0)").text("同比上周"); // 文字
			} else if (type == "month") {
				<portlet:namespace/>outsideStr1 = _time.getDateStr('yyyy') + "年"
						+ _time.getDateStr('MM') + "月";
				<portlet:namespace/>step1 = "5";
				$(".unit_energy td > span").text("月"); // 文字
				$(".unit_energy > tbody > tr:eq(3) > td:eq(0)").text("同比上月"); // 文字
			} else if (type == "year") {
				<portlet:namespace/>outsideStr1 = _time.getDateStr('yyyy') ;
				<portlet:namespace/>step1 = "2";
				$(".unit_energy td > span").text("年"); // 文字
				$(".unit_energy > tbody > tr:eq(3) > td:eq(0)").text("同比去年"); // 文字
			}
			<portlet:namespace/>choose_name1 = '${energyUseAnalysis.choose_name1}'; // 对应的name
			<portlet:namespace/>choose_id1 = '${energyUseAnalysis.choose_id1}'; // 对应的id
			<portlet:namespace/>ispd1 = '${energyUseAnalysis.ispd1}'; // 对应的ispd

			var times = "";
			// 根据name的个数，来为att添加对应个数的值
			var legend = "${energyUseAnalysis.chartLegendList_1}".replace(/'/g,"").split(",");//
			for ( var i = 0; i < legend.length; i++) {
				if(i<legend.length-1){
					times +=<portlet:namespace/>start_date1 + ",";
				}else{
					times +=<portlet:namespace/>start_date1;
				}
			}
			<portlet:namespace/>exp_start_date1 = times;// 导出到excel中的时间 
			// 获取图表
			//数据类型String,String,String,String,Array,Boolean,String
			<portlet:namespace/>getChart1(times, <portlet:namespace/>choose_name1, <portlet:namespace/>choose_id1, <portlet:namespace/>ispd1, legend,
					<portlet:namespace/>showLegend1, 'no');
		}
	});
}
//文本框对比
function <portlet:namespace/>comparing1(){
	var dformt = 'yyyy-MM-dd';
	if (<portlet:namespace />choose_type1 == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type1 == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type1 == "month") {
		dformt = 'MM';
	} else if (<portlet:namespace />choose_type1 == "year") {
		dformt = 'yyyy';
	}
	
	WdatePicker({
		el : '<portlet:namespace />datetime1',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			// 显示在页面上的时间
			var showtime= dp.cal.getDateStr(dformt);
			$('#<portlet:namespace />comparing1').val(showtime);
			//加入对比
			var legendList=[];
			<portlet:namespace />centerTitle1 = <portlet:namespace />start_date1 + "," + paretime; //居中标题
			
			<portlet:namespace />showLegend1 = true;
			
			var times = [];
			// 根据name的个数，来为att添加对应个数的值
			var chartLegendList = [${energyUseAnalysis.chartLegendList_1}];
			for(var i=0;i<chartLegendList.length;i++){
				times+=<portlet:namespace />start_date1+",";
			}
			for(var i=0;i<chartLegendList.length;i++){
				if(i<chartLegendList.length-1){
					times+=paretime+",";
				}else{
					times+=paretime;
				}
			}
			<portlet:namespace />exp_start_date1 =times;// 导出到excel中的时间 
			<portlet:namespace />choose_name1 = '${energyUseAnalysis.choose_name1},${energyUseAnalysis.choose_name1}'; // 对应的name
			<portlet:namespace />choose_id1 = '${energyUseAnalysis.choose_id1},${energyUseAnalysis.choose_id1}'; // 对应的id
			<portlet:namespace />ispd1 = '${energyUseAnalysis.ispd1},${energyUseAnalysis.ispd1}'; // 对应的ispd
			for(var i=0;i<chartLegendList.length;i++){
				legendList.push(<portlet:namespace />start_date1+chartLegendList[i]);
				}
				for(var i=0;i<chartLegendList.length;i++){
					legendList.push(paretime+chartLegendList[i]);
			}
			<portlet:namespace />getChart1(<portlet:namespace />exp_start_date1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,legendList,<portlet:namespace />showLegend1,"yes");		
		}
	});
}
/*
 *获取数据
 *
 */
function <portlet:namespace/>getChart1(tfrom, name, id, ispd, legend, showLegend,
		isNotCompare) {
	<portlet:namespace />getRightData1();
	
	$.ajax({ 
        type : "post", 
        url : "<portlet:resourceURL id='getCommonChartData'></portlet:resourceURL>", 
        data : {
    		from : tfrom,
    		name : name,
    		id : id,
    		ispd : ispd,
    		decimals : '${energyUseAnalysis.decimals1}', //显示小数位数，首选项传
    		mult : '${energyUseAnalysis.multiplier}', //是否在获取的数据基础上乘数
    		type : <portlet:namespace/>choose_type1 //选取时间段
    	}, 
        //async : false, // 同步
        success : function(data) { 
        	var cateList = data.cataList;//x轴标签，数组
    		var dataList = data.dataList;//数据，数组集合
    		if (<portlet:namespace />choose_type1 == "day"){
    			if(isNotCompare == "yes"){ // 如果是对比的图
    				<portlet:namespace />centerTitle1 = "";
    				legend = "";
    				var tfroms = tfrom.split(",");
    				for(var i=0;i<tfroms.length-1;i+=2){
    					if(i==2){
    						<portlet:namespace />centerTitle1 += tfroms[i] ;
    					}else{						
    						<portlet:namespace />centerTitle1 += tfroms[i] + ((tfroms.length-1) == i ? "" : "与");			
    					}
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
    		} else if (<portlet:namespace />choose_type1 == "week") {
    			if(isNotCompare == "yes"){ // 如果是对比的图 
    				var _legendList = data.legendList;
    				<portlet:namespace />centerTitle1 = "";
    				legend = "";
    				// 个性需求：重新为图表的一级标题和图例赋值
    				for(var i=0;i<_legendList.length-1;i+=2){
    					for(var k=0;k<_legendList[i].length;k++){
    						if(k%2!=0){
    							_legendList[i][k]=_legendList[i][k].substring(5);
    						}
    						<portlet:namespace />centerTitle1 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
    						legend += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
    					}
    					if(i<2){
    						<portlet:namespace />centerTitle1 += ((_legendList.length-1) == i ? "" : "与");
    					}
    					legend += ((_legendList.length-1) == i ? "" : ",");
    				}
    					legend=legend.replace(/\//g,'-');
    					<portlet:namespace />centerTitle1=<portlet:namespace />centerTitle1.replace(/\//g,'-');
    				// 个性需求：重新为图表的X轴赋值
    				cateList = ["周一","周二","周三","周四","周五","周六","周日"];
    			} else {
    				// 居中标题的值
    				<portlet:namespace />centerTitle1 =tfrom.substring(0,5)+ <portlet:namespace />c_title1+ data.cataList[0].replace(/\//g,'-')+ "~" + <portlet:namespace />c_title1  + data.cataList[data.cataList.length-1].replace(/\//g,'-');
    				
    				// 往后台返回的X轴列表中添加周一~周日
    				var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCateList = [];
    				for(var i=0;i<cateList.length;i++){
    					finalCateList.push(cateList[i]+cList[i]);
    				}
    				
    				cateList = finalCateList;
    			}
    		} else if (<portlet:namespace />choose_type1 == "month") {
    			if(isNotCompare == "yes"){ // 如果是对比的图 
    				<portlet:namespace />centerTitle1 = "";
    				legend = "";
    				// 个性需求：重新为图表的一级标题和图例赋值
    				var tfroms = tfrom.split(",");
    				for(var i=0;i<tfroms.length-1;i+=2){
    					if(i<2){
    						<portlet:namespace />centerTitle1 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
    					}else{
    						<portlet:namespace />centerTitle1 += tfroms[i].substring(0,7);
    					}
    					legend += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
    				}
    				
    				// 个性需求：重新为图表的X轴赋值
    				cateList = [];
    				for(var k=1;k<=data.cataList.length;k++){
    					cateList.push(k); 					
    				};
    			}
    		} else if (<portlet:namespace />choose_type1 == "year") {
    			if(isNotCompare == "yes"){ // 如果是对比的图 
    				var compareyear = tfrom.substring(22,26);
    				legend="";
    				// 个性需求：重新为图表的一级标题和图例赋值
    				<portlet:namespace />centerTitle1 = <portlet:namespace/>outsideStr1 + "与" + compareyear;
    				legend += <portlet:namespace/>outsideStr1+ "," + compareyear+",";
    				// 个性需求：重新为图表的X轴赋值
    				var _yearList = data.yearList;
    				
    				if(_yearList[0].length>=_yearList[1].length){
    					cateList = _yearList[0];
    				} else if(_yearList[0].length<_yearList[1].length){
    					cateList = _yearList[1];
    				};
    			};
    		};
    		if("${energyUseAnalysis.xStep_1}"!=''){
    			<portlet:namespace/>step1="${energyUseAnalysis.xStep_1}";
    		}
    		//图例处理
    		if(isNotCompare == "yes"){
    			var legendList="${energyUseAnalysis.chartLegendList_1}".split(",");
    			legend=legend.split(",");
    			var temp=legend[1];
    			legend.pop();legend.pop();legend.push(legend[0]);legend.push(temp);legend.push(temp);
    			for(var i=0;i<legend.length;i+=2){
    				legend[i]+=legendList[0].replace(/'/g,"");
    			}
    			for(var i=1;i<legend.length;i+=2){
    				legend[i]+=legendList[1].replace(/'/g,"");
    			}
    		}
    		//填充图表
    		$("#<portlet:namespace/>now_data1").html(<portlet:namespace />centerTitle1);
    		var chartColorList = [${energyUseAnalysis.chartColorList_1}];
    		var chartYAxisList = [${energyUseAnalysis.chartYAxisList}];
    		var chartTypeList=['${energyUseAnalysis.chartType_1}','${energyUseAnalysis.chartType_1_1}','${energyUseAnalysis.chartType_1}','${energyUseAnalysis.chartType_1_1}'];
    		renderToBigTwoType("<portlet:namespace />chartArea1", 
    				"${energyUseAnalysis.backgroundColor_1}",
    				'',
    				cateList,
    				<portlet:namespace/>step1,
    				"${energyUseAnalysis.yLeftTitle_1}",
    				"${energyUseAnalysis.yRightTitle_1}",
    				dataList,
    				chartColorList,
    				chartTypeList,
    				chartYAxisList,
    				legend);
        } 
	}); 
}
//导出数据到excel文件
function <portlet:namespace/>expToExcel1(){
	var isNotCompare = "no"; // 默认不是对比图表
	var sdate = <portlet:namespace />exp_start_date1;
	var sdateList = sdate.split(",");
	if(sdateList.length>2){
		isNotCompare = "yes"; // yes表示是对比图表
	}
	var expColumnName = "${energyUseAnalysis.expColumnName1}".replace(/'/g,"");
	// 导出excel的Url
	var expUrl = "<portlet:resourceURL id='expTotalEnergyDataToExcel'></portlet:resourceURL>"
			+ "&excelName="
			+ "${energyUseAnalysis.title1}"
			+"&hours="
			+ "${energyUseAnalysis.hours}"
			+ "&from="
			+ sdate
			+ "&name="
			+ <portlet:namespace />choose_name1
			+ "&id="
			+ <portlet:namespace />choose_id1
			+ "&ispd="
			+ <portlet:namespace />ispd1
			+ "&type="
			+ <portlet:namespace />choose_type1
			+ "&isNotCompare="
			+ isNotCompare
			+ "&expColumnName="
			+ (expColumnName==""?"${energyUseAnalysis.expColumnName1}".replace(/'/g,""):expColumnName);
	var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${energyUseAnalysis.title1}" /></portlet:resourceURL>';
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${energyUseAnalysis.title1}"
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
		}
	});
};

//获取右侧数据
function <portlet:namespace />getRightData1(){
	$.ajax({
		type : "POST",
		url : "<portlet:resourceURL id='getDatasForAtts'></portlet:resourceURL>",
		data : {
			from : <portlet:namespace />start_date1,
			name : 'electricity',
			id : 'total',
			ispd : '0',
			att : 'max,min,sum,change',
			decimals : '${energyUseAnalysis.decimals1}',//显示小数位数，首选项传
			type : <portlet:namespace />choose_type1
		},
		success : function(result) {
			var data = result.data;
			var maxtime = '', mintime = '';
			if(<portlet:namespace />choose_type1 == 'day'){
				maxtime = data[0][1].substring(11, 16);
				mintime = data[1][1].substring(11, 16);
			} else if(<portlet:namespace />choose_type1 == 'week'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			} else if(<portlet:namespace />choose_type1 == 'month'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			} else if(<portlet:namespace />choose_type1 == 'year'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			}
			
			$(".unit_energy > tbody > tr:eq(0) > td:eq(1)").text(parseFloat(data[0][0])); // max
			$(".unit_energy > tbody > tr:eq(0) > td:eq(3)").text(maxtime); // maxTime
			$(".unit_energy > tbody > tr:eq(1) > td:eq(1)").text(parseFloat(data[1][0]));// min
			$(".unit_energy > tbody > tr:eq(1) > td:eq(3)").text(mintime); // minTime
			$(".unit_energy > tbody > tr:eq(2) > td:eq(1)").text(parseFloat(data[2][0])); // sum
			$(".unit_energy > tbody > tr:eq(3) > td:eq(1)").text(returnUpOrDown(data[3][0]) + returnPositiveVal(data[3][0],"0"));// change
		},
		error : function(result) {
			console.log('getRightData1 + error');
		}
	});
};
</script>