<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
共用图表渲染页面：特指一组参数饼图图表
后台传参‘eachEnergy’
@Author:ZHANGTIANLE
 -->
<%@ include file="../../init.jsp"%>
<div class="div-table" style="margin-left: 0px;width:300px;">
	<div class="energy_chart">
		<div class="chart_top has_border_radius_top">
			<div class="chart_top_content">
				<div class="top_title">
					<h2 class="h2mini">${eachEnergy.title5}</h2>
					<div class="zoomIn" onclick="<portlet:namespace/>showZoomIn()"></div>
					<div class="download"
						onclick="<portlet:namespace />outputToExcel()"></div>
				</div>
				<div>
					<div class="scroll_describe slides">
						<!-- <div class="arrow left_move slidesjs-previous slidesjs-navigation"></div> -->
						<p class="cur">${eachEnergy.description_1}</p>
						<p>${eachEnergy.description_2}</p>
						<p>${eachEnergy.description_3}</p>
						<!-- <div class="arrow right_move  slidesjs-next slidesjs-navigation"></div> -->
					</div>
				</div>
			</div>
		</div>
		<div class="chart_area" id="<portlet:namespace />chartArea"></div>
		<div class="chart_bottom">
			<div class="chart_bottom_content">
				<div class="btn_group">
					<input id="<portlet:namespace />datetime" type="hidden" />
					<div id="<portlet:namespace/>day"
						onclick="<portlet:namespace />selectdate('day','small')"
						class="btn_press">日视图</div>
					<div id="<portlet:namespace/>week"
						onclick="<portlet:namespace />selectdate('week','small')">周视图</div>
					<div id="<portlet:namespace/>month"
						onclick="<portlet:namespace />selectdate('month','small')">月视图</div>
					<div id="<portlet:namespace/>year"
						onclick="<portlet:namespace />selectdate('year','small')">年视图</div>
				</div>
				<div class="compare_module">
					<div class="kindpicker" style="display: none;">
						<ul>
							<li>时间</li>
							<li class="kind_select">
								<ul>
									<li>时间</li>
									<li>建筑</li>
								</ul>
							</li>
						</ul>
						<div class="down_arrow"></div>
					</div>
					<div class="switch_picker">
						<div class="datepicker cur" id="<portlet:namespace/>compareTime"
							onclick="<portlet:namespace/>compareTime('small')"></div>
						<div class="buildpicker" id="<portlet:namespace/>compareBuilding"></div>
					</div>
					<div class="compare_btn" id="<portlet:namespace/>cpmpare_btn">加入对比</div>
					<iframe name="<portlet:namespace/>tmpFrame"
						id="<portlet:namespace/>tmpFrame" width="1" height="1"
						style="visibility: hidden; position: absolute; display: none">
					</iframe>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="<portlet:namespace />mask" class="mask">
	<div class="dialog-popover dialog-energy-zoom">
		<div class="dialog-header">
			<h3>${eachEnergy.title5}</h3>
			<div class="dialog-cancel_btn"></div>
			<div class="dialog-download-btn"
				onclick="<portlet:namespace />outputToExcel()"></div>
		</div>
		<div class="dialog-body">
			<div class="scroll slides1">
				<!-- <div class="arrow left_move slidesjs-previous slidesjs-navigation"></div> -->
				<p class="cur">${eachEnergy.description_1}</p>
				<p>${eachEnergy.description_2}</p>
				<p>${eachEnergy.description_3}</p>
				<!-- <div class="arrow right_move  slidesjs-next slidesjs-navigation"></div> -->
			</div>
			<div class="d_w_m_content">
				<div class="cur" id="<portlet:namespace />bigChart"></div>
			</div>
			<div class="bottom_tool">
				<div class="d_w_m_switch">

					<div class="pressive"
						onclick="<portlet:namespace />selectdate('day','big')">日视图</div>
					<div onclick="<portlet:namespace />selectdate('week','big')">周视图</div>
					<div onclick="<portlet:namespace />selectdate('month','big')">月视图</div>


					<div class="nomargin"
						onclick="<portlet:namespace />selectdate('year','big')">年视图</div>
				</div>
				<div class="compare">
					<input class="datapicker_1" type="text" id="<portlet:namespace/>compareTime0"
						onclick="<portlet:namespace/>compareTime('big')" />
					<div class="compare_btn">加入对比</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(".bottom_tool .d_w_m_switch > div").each(function(index){
	$(this).on("click", function(){
		$(this).addClass("pressive");
		$(this).siblings().removeClass("pressive");
	})
});
function <portlet:namespace/>showZoomIn(){
	$("#<portlet:namespace />mask").show();
	$("#<portlet:namespace />mask .dialog-energy-zoom").show();
	$("#<portlet:namespace />mask .dialog-energy-zoom").find(".slides1").slidesjs({
			width: 700,
			height: 104,
			play: {
				active: false,
				auto: false,
				interval: 4000,
				swap: true,
				pauseOnHover: true,
				restartDelay: 2500
			},
			navigation: {
				active: true,
				effect: "slide"
			},
			pagination: {
				active: false,
				effect: "slide"
			},
			effect: {
				slide: {
					speed: 1000
				},
				fade: {
					speed: 1800,
					crossfade: true
				}
			}
		});
	//放大图表上日、周、月、年的显示处理
	if(<portlet:namespace/>choose_type=='day'){
		$("#<portlet:namespace />mask .d_w_m_switch div:eq(0)").addClass("pressive");
		$("#<portlet:namespace />mask .d_w_m_switch div:eq(0)").siblings().removeClass("pressive");
	}else if(<portlet:namespace/>choose_type=='week'){
		$("#<portlet:namespace />mask .d_w_m_switch div:eq(1)").addClass("pressive");
		$("#<portlet:namespace />mask .d_w_m_switch div:eq(1)").siblings().removeClass("pressive");
	}else if(<portlet:namespace/>choose_type=='month'){
		$("#<portlet:namespace />mask .d_w_m_switch div:eq(2)").addClass("pressive");
		$("#<portlet:namespace />mask .d_w_m_switch div:eq(2)").siblings().removeClass("pressive");
	}else{
		$("#<portlet:namespace />mask .d_w_m_switch div:eq(3)").addClass("pressive");
		$("#<portlet:namespace />mask .d_w_m_switch div:eq(3)").siblings().removeClass("pressive");
	}
	//渲染放大图表
	if(<portlet:namespace/>isNotCompare=="yes"){
		<portlet:namespace />getChart2(<portlet:namespace/>beginTime,<portlet:namespace />choose_name,<portlet:namespace />choose_id,<portlet:namespace />ispd,<portlet:namespace/>legend,true,'yes',<portlet:namespace />c_times,'big');		
	}else{
		<portlet:namespace/>getChart(<portlet:namespace/>beginTime, <portlet:namespace/>choose_name, <portlet:namespace/>choose_id, <portlet:namespace/>ispd, <portlet:namespace/>legend, true, 'no','big');
	}
	//数据保存在全局变量中
	beginTime=<portlet:namespace/>beginTime;
	choose_name=<portlet:namespace/>choose_name;
	choose_id=<portlet:namespace/>choose_id;
	ispd=<portlet:namespace/>ispd;
	legend=<portlet:namespace/>legend;
	isNotCompare= <portlet:namespace/>isNotCompare;
	choose_type=<portlet:namespace/>choose_type;
	centerTitle=<portlet:namespace />centerTitle;
	 xStep=<portlet:namespace/>step;
	 expTime=<portlet:namespace/>expTime;
	 c_times=<portlet:namespace/>center_times;
}
//保存点击放大前数据的数据项
var beginTime="";
var choose_name="";
var choose_id="";
var ispd="";
var legend=[];
var isNotCompare="";
var choose_type="";
var centerTitle="";
var xStep="";
var expTime="";
var c_times="";
//大图关闭事件--回传数据
$("#<portlet:namespace />mask .dialog-cancel_btn").on("click", function(){
	$(this).parent().parent().hide();
	$(this).parent().parent().find("input").val("");
	$(".mask").hide();
	<portlet:namespace/>beginTime=beginTime;
	<portlet:namespace/>choose_name=choose_name;
	<portlet:namespace/>choose_id=choose_id;
	<portlet:namespace/>ispd=ispd;
	<portlet:namespace/>legend=legend;
	<portlet:namespace/>isNotCompare=isNotCompare;
	<portlet:namespace/>choose_type=choose_type;
	<portlet:namespace />centerTitle=centerTitle;
	<portlet:namespace/>step=xStep;
	<portlet:namespace/>exp_start_date=expTime;
	<portlet:namespace/>c_times=c_times;
	$("#<portlet:namespace/>compareTime").html("");//清空对比框
	$("#<portlet:namespace/>compareBuilding").html("");//清空对比框
	$("#<portlet:namespace/>compareTime0").val("");
});
//全局变量
var <portlet:namespace/>start_date = "";//开始时间
var <portlet:namespace/>choose_type = "";//时间选择类型
var <portlet:namespace/>step = 1;//存储x轴显示标签间距
var <portlet:namespace/>centerTitle = "";//图表标题
var <portlet:namespace/>c_times = "";//存储居中标题对应的年份
var <portlet:namespace/>choose_name = "${eachEnergy.choose_name5}";//对应的数据name
var <portlet:namespace/>choose_id = "${eachEnergy.choose_id5}";//对应的数据Id
var <portlet:namespace/>ispd = "${eachEnergy.ispd5}";//对应的ispd
var <portlet:namespace/>legendList = "${eachEnergy.chartLegendList_5}";//图例列表
var <portlet:namespace/>showLegend = false;//默认不显示图例
var <portlet:namespace/>exp_start_date = "";//导出到excel表中的时间
//需特殊保存的大图数据--------------------------------------------
var <portlet:namespace/>beginTime="";
var <portlet:namespace/>isNotCompare="";
var <portlet:namespace/>legend="";
var <portlet:namespace/>expTime="";
var <portlet:namespace/>center_times="";
//默认显示
if(publicTime != ""){
	<portlet:namespace />start_date = publicTime;
} else {
	if ("${eachEnergy.defaulttime5}" == "") {//默认显示当前时间
		var nowdate = new Date();
		<portlet:namespace/>start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1)
				+ "-" + nowdate.getDate();
	} else {
		<portlet:namespace/>start_date = "${eachEnergy.defaulttime5}"; // 首选项数据，默认时间
	}
}
<portlet:namespace/>choose_type = "day";
<portlet:namespace/>step = "";//x轴标签间距,首选项获取
<portlet:namespace/>c_times =<portlet:namespace/>start_date;
<portlet:namespace />exp_start_date= <portlet:namespace />start_date; 
<portlet:namespace/>centerTitle = <portlet:namespace/>start_date;
var times0 = "", legend = [];
legend = <portlet:namespace/>legendList.split(",");
for ( var i = 0; i < legend.length; i++) {
	times0 += <portlet:namespace/>start_date + ",";
}
//填充图表
<portlet:namespace/>beginTime=times0;
<portlet:namespace/>isNotCompare="no";
<portlet:namespace/>legend=legend;
<portlet:namespace/>expTime=<portlet:namespace />exp_start_date;
<portlet:namespace/>center_times=<portlet:namespace/>start_date;
<portlet:namespace/>getChart(times0, <portlet:namespace/>choose_name, <portlet:namespace/>choose_id, <portlet:namespace/>ispd, legend, <portlet:namespace/>showLegend,<portlet:namespace/>isNotCompare,'small');
//---------------------------------------------------------------------
//选择时间（日、周、月、年）
function <portlet:namespace/>selectdate(type,size) {
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
		el : '<portlet:namespace/>datetime',
		dateFmt : dformt,
		onpicked : function(dp) {
			$("#<portlet:namespace/>compareTime").html("");//清空对比框
			$("#<portlet:namespace/>compareBuilding").html("");//清空对比框
			$("#<portlet:namespace/>compareTime0").val("");
			var _time = dp.cal;
			<portlet:namespace/>start_date = _time.getDateStr("yyyy-MM-dd");
			<portlet:namespace/>choose_type = type;
			<portlet:namespace />exp_start_date= dp.cal.getDateStr(titleFormat); // 导出excel的开始时间 
			<portlet:namespace />c_times = <portlet:namespace />start_date;
			<portlet:namespace />legendList= dp.cal.getDateStr(titleFormat); // 图例
			
			<portlet:namespace/>centerTitle = dp.cal.getDateStr(titleFormat);
			<portlet:namespace/>choose_name = '${eachEnergy.choose_name5}'; // 对应的name
			<portlet:namespace/>choose_id = '${eachEnergy.choose_id5}'; // 对应的id
			<portlet:namespace/>ispd = '${eachEnergy.ispd5}'; // 对应的ispd

			if(<portlet:namespace/>choose_type=='week'){
				<portlet:namespace />centerTitle =showWeekFirstDay(<portlet:namespace />start_date)+"~"+showWeekLastDay(<portlet:namespace />start_date).substring(5);
				<portlet:namespace />legendList=<portlet:namespace />centerTitle;
				<portlet:namespace />exp_start_date=<portlet:namespace />legendList;
			}
			// 根据name的个数，来为att添加对应个数的值
			var legend = [];
			legend = "${eachEnergy.chartLegendList_5}".split(",");
			<portlet:namespace/>beginTime=<portlet:namespace/>start_date;
			<portlet:namespace/>isNotCompare="no";
			<portlet:namespace/>legend=legend;
			<portlet:namespace/>center_times=<portlet:namespace/>c_times;
			<portlet:namespace/>expTime=<portlet:namespace />exp_start_date; 
			//数据类型String,String,String,String,Array,Boolean,String
			<portlet:namespace/>getChart(<portlet:namespace/>start_date, <portlet:namespace/>choose_name, <portlet:namespace/>choose_id, <portlet:namespace/>ispd, legend,
					<portlet:namespace/>showLegend, <portlet:namespace/>isNotCompare,size);
		}
	});
}
//时间对比
function <portlet:namespace/>compareTime(size){
	var dformt = 'yyyy-MM-dd',titleFormat='yyyy-MM-dd';
	if (<portlet:namespace />choose_type == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type == "month") {
		dformt = 'MM';
		titleFormat = 'yyyy-MM';
	} else if (<portlet:namespace />choose_type == "year") {
		dformt = 'yyyy';
		titleFormat = 'yyyy';
	}
	
	WdatePicker({
		el : '<portlet:namespace />datetime',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			
			// 显示在页面上的时间
			var showtime= dp.cal.getDateStr(dformt);
			$('#<portlet:namespace />compareTime').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+showtime);
			$("#<portlet:namespace/>compareTime0").val(showtime);
			//加入对比
			<portlet:namespace />legendList = <portlet:namespace />start_date + "," + paretime;
			<portlet:namespace />c_times = <portlet:namespace />start_date + "," + paretime;
			<portlet:namespace />exp_start_date = <portlet:namespace />legendList;
			<portlet:namespace />choose_name = '${eachEnergy.choose_name5},${eachEnergy.choose_name5}'; // 对应的name
			<portlet:namespace />choose_id = '${eachEnergy.choose_id5},${eachEnergy.choose_id5}'; // 对应的id
			<portlet:namespace />ispd = '${eachEnergy.ispd5},${eachEnergy.ispd5}'; // 对应的ispd
			<portlet:namespace />showLegend =${eachEnergy.showLegend} ;
			
			// 根据选择的日周月年，来确定居中标题和图例显示的值
			if (<portlet:namespace />choose_type == "day"){ // 日报
					<portlet:namespace />centerTitle = "";
					<portlet:namespace />centerTitle +=<portlet:namespace />start_date+ "与" +paretime;
			} else if (<portlet:namespace />choose_type == "week") { // 周报
					<portlet:namespace />centerTitle = "";
					<portlet:namespace />legendList = "";
					// 个性需求：重新为图表的一级标题和图例赋值
					var pare_times = <portlet:namespace />c_times.split(",");
					for(var i=0;i<pare_times.length;i++){
						<portlet:namespace />centerTitle += showWeekFirstDay(pare_times[i]) + "~" + showWeekLastDay(pare_times[i]).substring(5) + ((pare_times.length-1) == i ? "" : "与");
						<portlet:namespace />legendList += showWeekFirstDay(pare_times[i]) + "~" + showWeekLastDay(pare_times[i]).substring(5) + ((pare_times.length-1) == i ? "" : ",");
					}
			} else if (<portlet:namespace />choose_type == "month") { // 月报 
					<portlet:namespace />centerTitle = "";
					<portlet:namespace />legendList = "";
					// 个性需求：重新为图表的一级标题和图例赋值
					var tfroms = <portlet:namespace />c_times.split(",");
					for(var i=0;i<tfroms.length;i++){
						<portlet:namespace />centerTitle += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
						<portlet:namespace />legendList += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
					}
			} else if (<portlet:namespace />choose_type == "year") { // 年报 
					var compareyear = <portlet:namespace />c_times.substring(11,15);
					// 个性需求：重新为图表的一级标题和图例赋值
					<portlet:namespace />centerTitle = <portlet:namespace />start_date.substring(0,4)+ "与" + compareyear;
					<portlet:namespace />legendList = <portlet:namespace />start_date.substring(0,4)+ "," + compareyear;
			}
			<portlet:namespace />exp_start_date=<portlet:namespace />legendList;
			<portlet:namespace/>expTime=<portlet:namespace />exp_start_date;
			
			
			var times = [];
			// 根据name的个数，来为att添加对应个数的值
			var names = "${eachEnergy.choose_name5}".split(",");
			for(var i=0;i<names.length;i++){
				times.push(<portlet:namespace />start_date);
			}
			for(var i=0;i<names.length;i++){
				times.push(paretime);
			}
			<portlet:namespace/>beginTime=times.join();
			<portlet:namespace/>isNotCompare="yes";
			<portlet:namespace/>legend=<portlet:namespace />legendList;
			<portlet:namespace/>center_times=<portlet:namespace/>c_times;
			<portlet:namespace/>expTime=<portlet:namespace />exp_start_date;
			<portlet:namespace />getChart2(times.join(),<portlet:namespace />choose_name,<portlet:namespace />choose_id,<portlet:namespace />ispd,<portlet:namespace />legendList,<portlet:namespace />showLegend,<portlet:namespace/>isNotCompare,<portlet:namespace />c_times,size);
	
		}
	
	});
}
/*
 *获取数据
 *
 */
function <portlet:namespace/>getChart(tfrom, name, id, ispd, legend, showLegend,
		isNotCompare,size) {
	$.post("<portlet:resourceURL id='getMoreChartsByNames'></portlet:resourceURL>", {
		from : tfrom,
		name : name,
		id : id,
		ispd : ispd,
		att:'percents',
		decimals : '${eachEnergy.decimals5}',//显示小数位数，首选项传
		mult : '${eachEnergy.multiplier}',//是否在获取的数据基础上乘数，首选项传（饼图）
		type : <portlet:namespace/>choose_type//选取时间段
	}, function(data) {
		var cateList = data.cataList;//x轴标签，数组
		var dataList = data.dataList;//数据，数组集合
		var categories = [ ${eachEnergy.chartLegendList_5} ], colorsArr = [
                								${eachEnergy.chartColorList_5}], datas = [
                								${eachEnergy.chartDataList_5} ];
		var pieDataList = [];
		for(var i=0;i<dataList.length;i++){
			pieDataList.push(dataList[i][0]);
		}

		//填充图表
		var chartId="<portlet:namespace />chartArea";
		var height=203;
		var width=300;
		if(size!='small'){
			chartId="<portlet:namespace />bigChart";
			height=336;
			width=930;
			showLegend=true;
		}
		renderToRing(chartId,
				"${eachEnergy.chartType_5}", categories, colorsArr, pieDataList , "${eachEnergy.chartLegendLayout_5}",
				"${eachEnergy.chartLegendAlign_5}", "${eachEnergy.backgroundColor_5}",<portlet:namespace />centerTitle,showLegend,height,width);
	}, 'json');
}
function <portlet:namespace/>getChart2(tfrom,name,id,ispd,legendList,showLegend,isNotCompare,compareDate,size){
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
				type : <portlet:namespace />choose_type,
				decimals : '${eachEnergy.decimals}',
				att : atts.join(),
				mult : '${eachEnergy.multiplier}' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
			}, function(data) {
				var cataList = data.cataList;
				var dataList = data.dataList;
				cataList = [ ${eachEnergy.chartLegendList_5} ]; // 个性需求：重新为图表的X轴赋值
				
				// 渲染图表
				var seriesList = [];
				
				var newData = [],data1=[],data2=[];
				// 根据name的个数，切割后台返回的数据，填充到报表中 
				
				var names = "${eachEnergy.choose_name5}".split(",");
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
				seriesList = returnSeriesList("${eachEnergy.chartType_6_1}",
											  "", // 连接线线宽，为空则默认为2，为0则不显示连接线
											  "", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
											  legendList,
											  "${eachEnergy.chartColorList_6}", // 颜色列表
											  "${eachEnergy.chartFillColorList_6}", // 填充颜色列表
											  "${eachEnergy.chartRadiusList_6}", // 曲线点半径列表,默认为4
											  "", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
											  "", // 参考值  
											  "", // 参考值的图表类型
											  "", // 参考值对应的图例名称
											  "", // 参考值对应的颜色
											  newData);
				if("${eachEnergy.xStep_5}"!=""){
					<portlet:namespace />step="${eachEnergy.xStep_5}";
				}
				// 将图表渲染到对应的位置上
				if(size=='small'){
					var chartId="<portlet:namespace />chartArea";
					var height=203;
					var width=300;
				}else{
					var chartId="<portlet:namespace />bigChart";
					var height=336;
					var width=930;
					showLegend=true;
				}
				renderToCommonChart(chartId,
								   <portlet:namespace />centerTitle, // 居中标题
								   <portlet:namespace />step, // x轴的间隔
								   cataList, // x轴列表
								   '',
								   '${eachEnergy.yLeftTitle_6}', // Y轴左侧的标题
								   '${eachEnergy.ySymbol6}', // Y轴的单位
								   showLegend == '' ? false : showLegend,
								   "",
								   seriesList,'${eachEnergy.backgroundColor_5}',height,width,'${eachEnergy.gridLineColor}');
			}, 'json');
}
	//导出数据到excel文件
function <portlet:namespace />outputToExcel(){
	var att = "sum,percents"; // 对应的attribute属性
	var isNotCompare = "no"; // 默认不是对比图表
	var times = [];
	var sdate = <portlet:namespace />c_times;
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
	var itemName = "${eachEnergy.itemName}";
	var expColumnName = "${eachEnergy.expColumnName5}";
	// 导出excel的Url
	var expUrl = "<portlet:resourceURL id='expPieChartsDataToExcel'></portlet:resourceURL>"
			+ "&excelName="
			+ "${eachEnergy.title5}"
			+ "&from="
			+ times.join()
			+ "&name="
			+ <portlet:namespace />choose_name
			+ "&id="
			+ <portlet:namespace />choose_id
			+ "&ispd="
			+ <portlet:namespace />ispd
			+ "&type="
			+ <portlet:namespace />choose_type
			+ "&itemName="
			+ itemName
			+ "&att="
			+ att
			+ "&mult="
			+ '${eachEnergy.multiplier}'
			+ "&isNotCompare="
			+ isNotCompare
			+ "&comparetime="
			+ <portlet:namespace />exp_start_date
			+ "&expColumnName="
			+ (expColumnName==""?"${eachEnergy.expColumnName5}":expColumnName);
			console.log(expUrl);
	var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${eachEnergy.title5}" /></portlet:resourceURL>';
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${eachEnergy.title5}"
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
</script>