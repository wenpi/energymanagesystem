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
				onclick="<portlet:namespace/>comparing2()" /> <span class="comp_btn">加入对比</span>
			<div class="download" onclick="<portlet:namespace/>expToExcel2()"></div>
		</div>
	</div>
	<div class="chart" id="<portlet:namespace/>chartArea2"></div>
</div>
<div class="detail">
	<div>
		<table>
			<caption>建筑能耗分项</caption>
			<tbody class="build_subentry">
				<tr>
					<td>总用电</td>
					<td><span>↓ 30</span><sup><sup>%</sup></sup></td>
				</tr>
				<tr>
					<td>总用水</td>
					<td><span>↓ 10</span><sup><sup>%</sup></sup></td>
				</tr>
				<tr>
					<td>总用气</td>
					<td><span>↓ 8</span><sup><sup>%</sup></sup></td>
				</tr>
				<tr>
					<td>其他能耗</td>
					<td><span>↑ 5</span><sup><sup>%</sup></sup></td>
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
	var <portlet:namespace/>c_times2="";
	var <portlet:namespace/>centerTitle2 = "";//图表标题
	var <portlet:namespace/>c_title2 = "";//存储居中标题对应的年份
	var <portlet:namespace/>choose_name2 = "${energyStatic.choose_name2}";//对应的数据name
	var <portlet:namespace/>choose_id2 = "${energyStatic.choose_id2}";//对应的数据Id
	var <portlet:namespace/>ispd2 = "${energyStatic.ispd2}";//对应的ispd
	var <portlet:namespace/>legendList2 = "${energyStatic.chartLegendList_2}";//图例列表
	var <portlet:namespace/>showLegend2 =  "${energyStatic.chartLegendList_2}";//默认不显示图例
	var <portlet:namespace/>exp_start_date2 = "";//导出到excel表中的时间
	//--------------------------------------------------------------------
	//默认显示
	if(publicTime != ""){
		<portlet:namespace />start_date2 = publicTime;
	} else {
		if ("${energyStatic.defaulttime2}" == "") {//默认显示当前时间
			var nowdate = new Date();
			<portlet:namespace/>start_date2 = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1)
					+ "-" + nowdate.getDate();
		} else {
			<portlet:namespace/>start_date2 = "${energyStatic.defaulttime2}";//首选项数据，默认时间
		}
	}
	<portlet:namespace/>choose_type2 = "day";
	<portlet:namespace/>step2 = "";//x轴标签间距,首选项获取
	 <portlet:namespace/>c_times2=<portlet:namespace/>start_date2;
	<portlet:namespace/>centerTitle2 = <portlet:namespace/>start_date2;
	var times02 = "", legend2 = [];
	legend = <portlet:namespace/>legendList2.split(",");
	for ( var i = 0; i < legend.length; i++) {
		times02 += <portlet:namespace/>start_date2 + ",";
	}
	<portlet:namespace/>exp_start_date2 = <portlet:namespace/>start_date2;
//填充图表
//数据类型String,String,String,String,Array,Boolean,String
<portlet:namespace/>getChart2(times02, <portlet:namespace/>choose_name2, <portlet:namespace/>choose_id2, <portlet:namespace/>ispd2, legend2, <portlet:namespace/>showLegend2, 'no');
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
				$("#<portlet:namespace/>comparing2").val('');//清空对比狂
				var _time = dp.cal;
				<portlet:namespace/>start_date2 = _time.getDateStr("yyyy-MM-dd");
				<portlet:namespace/>choose_type2 = type;
				<portlet:namespace/>centerTitle2 = dp.cal.getDateStr(titleFormat);
				<portlet:namespace/>c_times2 = <portlet:namespace/>start_date2;
				<portlet:namespace/>choose_name2 = '${energyStatic.choose_name2}'; // 对应的name
				<portlet:namespace/>choose_id2 = '${energyStatic.choose_id2}'; // 对应的id
				<portlet:namespace/>ispd2 = '${energyStatic.ispd2}'; // 对应的ispd
				
				if(<portlet:namespace/>choose_type2=='week'){
					<portlet:namespace />centerTitle2 =showWeekFirstDay(<portlet:namespace />start_date2)+"~"+showWeekLastDay(<portlet:namespace />start_date2).substring(5);
					<portlet:namespace />legendList2=<portlet:namespace />centerTitle2;
					<portlet:namespace />exp_start_date2=<portlet:namespace />legendList2;
				}
				<portlet:namespace/>exp_start_date2=<portlet:namespace/>centerTitle2;
				var times = "";
				// 根据name的个数，来为att添加对应个数的值
				var legend = "${energyStatic.chartLegendList_2}".split(",");//
				<portlet:namespace/>exp_start_date2 = <portlet:namespace/>centerTitle2;// 导出到excel中的时间 
				// 获取图表
				//数据类型String,String,String,String,Array,Boolean,String
				<portlet:namespace/>getChart2(<portlet:namespace/>start_date2, <portlet:namespace/>choose_name2, <portlet:namespace/>choose_id2, <portlet:namespace/>ispd2, legend,
						<portlet:namespace/>showLegend2, 'no');
				}
		});
}
//选择对比时间
function <portlet:namespace/>comparing2(){
	var dformt = 'yyyy-MM-dd',titleFormat='yyyy-MM-dd';
	if (<portlet:namespace />choose_type2 == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type2 == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type2 == "month") {
		dformt = 'MM';
		titleFormat = 'yyyy-MM';
	} else if (<portlet:namespace />choose_type2 == "year") {
		dformt = 'yyyy';
		titleFormat = 'yyyy';
	}
	
	WdatePicker({
		el : '<portlet:namespace />datetime2',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			
			// 显示在页面上的时间
			var showtime= dp.cal.getDateStr(dformt);
			$('#<portlet:namespace/>comparing2').val(showtime);
			<portlet:namespace />legendList2 = <portlet:namespace />start_date2 + "," + paretime;
			<portlet:namespace />c_times2 = <portlet:namespace />start_date2 + "," + paretime;
			<portlet:namespace />exp_start_date2 = <portlet:namespace />legendList2;
			<portlet:namespace />choose_name2 = '${energyStatic.choose_name2},${energyStatic.choose_name2}'; // 对应的name
			<portlet:namespace />choose_id2 = '${energyStatic.choose_id2},${energyStatic.choose_id2}'; // 对应的id
			<portlet:namespace />ispd2 = '${energyStatic.ispd2},${energyStatic.ispd2}'; // 对应的ispd
			<portlet:namespace />showLegend2 = true;
			// 根据选择的日周月年，来确定居中标题和图例显示的值
			if (<portlet:namespace />choose_type2 == "day"){ // 日报
					<portlet:namespace />centerTitle2 = "";
					<portlet:namespace />centerTitle2 +=<portlet:namespace />start_date2+ "与" +paretime;
			} else if (<portlet:namespace />choose_type2 == "week") { // 周报
					<portlet:namespace />centerTitle2 = "";
					<portlet:namespace />legendList2 = "";
					// 个性需求：重新为图表的一级标题和图例赋值
					var pare_times = <portlet:namespace />c_times2.split(",");
					for(var i=0;i<pare_times.length;i++){
						<portlet:namespace />centerTitle2 += showWeekFirstDay(pare_times[i]) + "~" + showWeekLastDay(pare_times[i]).substring(5) + ((pare_times.length-1) == i ? "" : "与");
						<portlet:namespace />legendList2 += showWeekFirstDay(pare_times[i]) + "~" + showWeekLastDay(pare_times[i]).substring(5) + ((pare_times.length-1) == i ? "" : ",");
					}
			} else if (<portlet:namespace />choose_type2 == "month") { // 月报 
					<portlet:namespace />centerTitle2 = "";
					<portlet:namespace />legendList2 = "";
					// 个性需求：重新为图表的一级标题和图例赋值
					var tfroms = <portlet:namespace />c_times2.split(",");
					for(var i=0;i<tfroms.length;i++){
						<portlet:namespace />centerTitle2 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
						<portlet:namespace />legendList2 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
					}
			} else if (<portlet:namespace />choose_type2 == "year") { // 年报 
					var compareyear = <portlet:namespace />c_times2.substring(11,15);
					// 个性需求：重新为图表的一级标题和图例赋值
					<portlet:namespace />centerTitle2 =<portlet:namespace />start_date2.substring(0,4)+ "与" + compareyear;
					<portlet:namespace />legendList2 = <portlet:namespace />start_date2.substring(0,4)+ "," + compareyear;
			}
			<portlet:namespace />exp_start_date2=<portlet:namespace />legendList2;
			<portlet:namespace/>expTime2=<portlet:namespace />exp_start_date2;
			
			
			var times = [];
			// 根据name的个数，来为att添加对应个数的值
			var names = "${energyStatic.choose_name2}".split(",");
			for(var i=0;i<names.length;i++){
				times.push(<portlet:namespace />start_date2);
			}
			for(var i=0;i<names.length;i++){
				times.push(paretime);
			}
		//加入对比按钮
		<portlet:namespace />getChart2_1(times.join(),<portlet:namespace />choose_name2,<portlet:namespace />choose_id2,<portlet:namespace />ispd2,<portlet:namespace />legendList2,<portlet:namespace />showLegend2,"yes",<portlet:namespace />legendList2);

		}
	});
}
/*
 *获取数据
 *
 */
function <portlet:namespace/>getChart2(tfrom, name, id, ispd, legend, showLegend,
		isNotCompare) {
	<portlet:namespace />getRightData2(); // 获取右侧数据信息
	$.post("<portlet:resourceURL id='getMoreChartsByNames'></portlet:resourceURL>", {
		from : tfrom,
		name : name,
		id : id,
		ispd : ispd,
		att:"percents",
		decimals : '',//显示小数位数，首选项传
		mult : '${energyStatic.multiplier}',//是否在获取的数据基础上乘数，首选项传（饼图）
		type : <portlet:namespace/>choose_type2
	//选取时间段
	}, function(data) {
		var cateList = data.cataList;//x轴标签，数组
		var dataList = data.dataList;//数据，数组集合
		if (<portlet:namespace />choose_type2 == "week") {
			// 居中标题的值
			<portlet:namespace />centerTitle2 = showWeekFirstDay(tfrom.split(",")[0]) + "~" + showWeekLastDay(tfrom.split(",")[0]).substring(5);
			// 往后台返回的X轴列表中添加周一~周日
			var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCateList = [];
			for(var i=0;i<cateList.length;i++){
				finalCateList.push(cateList[i]+cList[i]);
			}
			
			cateList = finalCateList;			
		}
		var categories = [ ${energyStatic.chartLegendList_2} ], colorsArr = [
                								${energyStatic.chartColorList_2}], datas = [
                								${energyStatic.chartDataList_2} ];
		var pieDataList = [];
		for(var i=0;i<dataList.length;i++){
			pieDataList.push(dataList[i][0]);
		}
		//填充图表
		$("#<portlet:namespace/>now_data2").html(<portlet:namespace/>centerTitle2);
		 renderToBigRing('<portlet:namespace />chartArea2',
				"${energyStatic.chartType_2}", categories, colorsArr, pieDataList , "${energyStatic.chartLegendLayout_2}",
				"${energyStatic.chartLegendAlign_2}", "${energyStatic.backgroundColor_2}",''); 

	}, 'json');
}
//对比填充
function <portlet:namespace/>getChart2_1(tfrom,name,id,ispd,legendList,showLegend2,isNotCompare,compareDate){
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
				type : <portlet:namespace />choose_type2,
				decimals : '${energyStatic.decimals2}',
				att : atts.join(),
				mult : '${energyStatic.multiplier}' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
			}, function(data) {
				var cataList = data.cataList;
				var dataList = data.dataList;
				cataList = [ ${energyStatic.chartLegendList_2} ]; // 个性需求：重新为图表的X轴赋值

				// 渲染图表
				var seriesList = [];
				
				var newData = [],data1=[],data2=[];
				// 根据name的个数，切割后台返回的数据，填充到报表中 
				
				var names = "${energyStatic.choose_name2}".split(",");
				for(var i=0;i<dataList.length;i++){
					if(i<names.length){
						data1.push(dataList[i][0]);
					}else{
						data2.push(dataList[i][0]);
					}
				}
				newData.push(data1);
				newData.push(data2);
				var colorList= "${energyStatic.chartColorList_2}".replace(/'/g,"");
				// 获取对应的数据列表，对应图表中的图形条数
				seriesList = returnSeriesList("${energyStatic.chartType_2_1}",
											  "", // 连接线线宽，为空则默认为2，为0则不显示连接线
											  "", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
											  <portlet:namespace />legendList2,
											  colorList, // 颜色列表
											  "${energyStatic.chartFillColorList_2}", // 填充颜色列表
											  "${energyStatic.chartRadiusList_2}", // 曲线点半径列表,默认为4
											  "", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
											  "", // 参考值  
											  "", // 参考值的图表类型
											  "", // 参考值对应的图例名称
											  "", // 参考值对应的颜色
											  newData);
				if("${energyStatic.xStep_2}"!=""){
					<portlet:namespace />step2="${energyStatic.xStep_2}";
				}
				// 将图表渲染到对应的位置上
				$("#<portlet:namespace/>now_data2").html(<portlet:namespace/>centerTitle2);
				renderToBigCommonChart("<portlet:namespace />chartArea2",
								   <portlet:namespace />centerTitle2, // 居中标题
								   <portlet:namespace />step2, // x轴的间隔
								   cataList, // x轴列表
								   '',
								   '${energyStatic.yLeftTitle_2}', // Y轴左侧的标题
								   '${energyStatic.ySymbol2}', // Y轴的单位
								   showLegend2 == '' ? false :showLegend2,
								   "",
								   seriesList);
			}, 'json');
}
	//导出数据到excel文件
function <portlet:namespace/>expToExcel2(){
	var att = "sum,percents"; // 对应的attribute属性
	var isNotCompare = "no"; // 默认不是对比图表
	var times = [];
	var sdate = <portlet:namespace />c_times2;
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
	var itemName = "${energyStatic.itemName}";
	var expColumnName = "${energyStatic.expColumnName2}".replace(/'/g,"");
	// 导出excel的Url
	var expUrl = "<portlet:resourceURL id='expPieChartsDataToExcel'></portlet:resourceURL>"
			+ "&excelName="
			+ "${energyStatic.title2}"
			+ "&from="
			+ times.join()
			+ "&name="
			+ <portlet:namespace />choose_name2
			+ "&id="
			+ <portlet:namespace />choose_id2
			+ "&ispd="
			+ <portlet:namespace />ispd2
			+ "&type="
			+ <portlet:namespace />choose_type2
			+ "&itemName="
			+ itemName
			+ "&att="
			+ att
			+ "&mult="
			+ '${energyStatic.multiplier}'
			+ "&isNotCompare="
			+ isNotCompare
			+ "&expColumnName="
			+  (expColumnName==""?"${energyStatic.expColumnName2}".replace(/'/g,""):expColumnName)
			+ "&comparetime="
			+ <portlet:namespace />exp_start_date2;
			console.log(expUrl);
	var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${energyStatic.title2}" /></portlet:resourceURL>';
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${energyStatic.title2}"
			+ ".xls";
	$.ajax({
		type : "POST",
		url : expUrl,
		async : false,
		contentType : 'application/x-msdownload;charset=UTF-8',
		success : function(result) {
			$("#<portlet:namespace />tmpFrame").attr('src', hSrc);
		},
		error : function(result) {
			alert('error');
		}
	});
}

//获取右侧数据
function <portlet:namespace />getRightData2(){
	$.ajax({
		type : "POST",
		url : "<portlet:resourceURL id='getDatasForNamesAndAtts'></portlet:resourceURL>",
		data : {
			from : <portlet:namespace />start_date2,
			name : <portlet:namespace />choose_name2,
			id : <portlet:namespace />choose_id2,
			ispd : <portlet:namespace />ispd2,
			att : 'change',
			type : <portlet:namespace />choose_type2,
			decimals : '${tbinfo.decimals2}'
		},
		success : function(result) {
			var data = result.data;
			$(".build_subentry > tr:eq(0) > td:eq(1) > span").text(returnUpOrDown(data[0][0][0]) + returnPositiveVal(data[0][0][0],'${tbinfo.decimals2}'));// change
			$(".build_subentry > tr:eq(1) > td:eq(1) > span").text(returnUpOrDown(data[1][0][0]) + returnPositiveVal(data[1][0][0],'${tbinfo.decimals2}'));// change
			$(".build_subentry > tr:eq(2) > td:eq(1) > span").text(returnUpOrDown(data[2][0][0]) + returnPositiveVal(data[2][0][0],'${tbinfo.decimals2}'));// change
			$(".build_subentry > tr:eq(3) > td:eq(1) > span").text(returnUpOrDown(data[3][0][0]) + returnPositiveVal(data[3][0][0],'${tbinfo.decimals2}'));// change
		},
		error : function(result) {
			console.log('getRightData5 + error');
		}
	});
};
</script>