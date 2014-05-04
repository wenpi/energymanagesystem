<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
共用图表渲染页面：特指两组参数图表
后台传参‘totalEnergy’
@Author:ZHANGTIANLE
 -->
<%@ include file="../../init.jsp"%>
<div class="div-table" style="margin-left: 0px;width:300px;">
	<div class="energy_chart">
		<div class="chart_top has_border_radius_top">
			<div class="chart_top_content">
				<div class="top_title">
					<h2 class="h2mini">${totalEnergy.title1}</h2>
					<div class="zoomIn" onclick="<portlet:namespace/>showZoomIn()"></div>
					<div class="download"
						onclick="<portlet:namespace />outputToExcel()"></div>
				</div>
				<div>
					<div class="scroll_describe slides">
						<!-- <div class="arrow left_move slidesjs-previous slidesjs-navigation"></div> -->
						<p class="cur">${totalEnergy.description_1}</p>
						<p>${totalEnergy.description_2}</p>
						<p>${totalEnergy.description_3}</p>
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
			<h3>${totalEnergy.title1}</h3>
			<div class="dialog-cancel_btn"></div>
			<div class="dialog-download-btn"
				onclick="<portlet:namespace />outputToExcel()"></div>
		</div>
		<div class="dialog-body">
			<div class="scroll slides1">
				<!-- <div class="arrow left_move slidesjs-previous slidesjs-navigation"></div> -->
				<p class="cur">${totalEnergy.description_1}</p>
				<p>${totalEnergy.description_2}</p>
				<p>${totalEnergy.description_3}</p>
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
	<portlet:namespace/>getChart(<portlet:namespace/>beginTime, <portlet:namespace/>choose_name, <portlet:namespace/>choose_id, <portlet:namespace/>ispd, <portlet:namespace/>legend, true,<portlet:namespace/>isNotCompare,"big");
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
	$("#<portlet:namespace/>compareTime").html("");//清空对比框
	$("#<portlet:namespace/>compareBuilding").html("");//清空对比框
	$("#<portlet:namespace/>compareTime0").val("");
});
//全局变量
var <portlet:namespace/>start_date = "";//开始时间
var <portlet:namespace/>choose_type = "";//时间选择类型
var <portlet:namespace/>step = 4;//存储x轴显示标签间距
var <portlet:namespace/>outsideStr = "当日";
var <portlet:namespace/>centerTitle = "${totalEnergy.centerTitle}";//图表标题
var <portlet:namespace/>c_title = "";//存储居中标题对应的年份
var <portlet:namespace/>choose_name = "${totalEnergy.choose_name1}";//对应的数据name
var <portlet:namespace/>choose_id = "${totalEnergy.choose_id1}";//对应的数据Id
var <portlet:namespace/>ispd = "${totalEnergy.ispd1}";//对应的ispd
var <portlet:namespace/>legendList = "${totalEnergy.chartLegendList}";//图例列表
var <portlet:namespace/>showLegend=false;
var <portlet:namespace/>exp_start_date = "";//导出到excel表中的时间
//--------------------------------------------------------------------
var <portlet:namespace/>beginTime="";
var <portlet:namespace/>isNotCompare="";
var <portlet:namespace/>legend="";
var <portlet:namespace/>expTime="";
//默认显示
if(publicTime != ""){
	<portlet:namespace />start_date = publicTime;
} else {
	if ("${totalEnergy.defaulttime1}" == "") {//默认显示当前时间
		var nowdate = new Date();
		<portlet:namespace/>start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1)
				+ "-" + nowdate.getDate();
	} else {
		<portlet:namespace/>start_date = "${totalEnergy.defaulttime1}";//首选项数据，默认时间
	}
}
<portlet:namespace/>choose_type = "day";
<portlet:namespace/>centerTitle = <portlet:namespace/>start_date;
var times0 = "", legend = [];
legend = <portlet:namespace/>legendList.replace(/'/g,"").split(",");
for ( var i = 0; i < legend.length; i++) {
	if(i<legend.length-1){
		times0 += <portlet:namespace/>start_date + ",";
	}else{
		times0 += <portlet:namespace/>start_date;
	}
}
<portlet:namespace/>exp_start_date = times0;
//填充图表
//数据类型String,String,String,String,Array,Boolean,String
<portlet:namespace/>beginTime=times0;
<portlet:namespace/>isNotCompare='no';
<portlet:namespace/>legend=legend;
<portlet:namespace/>expTime=<portlet:namespace/>exp_start_date; 
<portlet:namespace/>getChart(times0, <portlet:namespace/>choose_name, <portlet:namespace/>choose_id, <portlet:namespace/>ispd, legend,<portlet:namespace/>showLegend, 'no','small');
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
			$("#<portlet:namespace/>compareTime").html("");
			$("#<portlet:namespace/>compareBuilding").html("");//清空对比框
			$("#<portlet:namespace/>compareTime0").val("");
			var _time = dp.cal;
			<portlet:namespace/>c_time = _time.getDateStr("yyyy");
			<portlet:namespace/>start_date = _time.getDateStr("yyyy-MM-dd");
			<portlet:namespace/>choose_type = type;
			<portlet:namespace/>centerTitle = dp.cal.getDateStr(titleFormat);
			if (type == "day") {
				<portlet:namespace/>outsideStr = _time.getDateStr('MM') + "月"
						+ _time.getDateStr('dd') + "日";
				<portlet:namespace/>step = "4";
			} else if (type == "week") {
				<portlet:namespace/>step = "2";
				<portlet:namespace/>outsideStr = "该周";
			} else if (type == "month") {
				<portlet:namespace/>outsideStr = _time.getDateStr('yyyy') + "年"
						+ _time.getDateStr('MM') + "月";
				<portlet:namespace/>step = "5";
			} else if (type == "year") {
				<portlet:namespace/>outsideStr = _time.getDateStr('yyyy');
				<portlet:namespace/>step = "3";
			}
			<portlet:namespace/>choose_name = '${totalEnergy.choose_name1}'; // 对应的name
			<portlet:namespace/>choose_id = '${totalEnergy.choose_id1}'; // 对应的id
			<portlet:namespace/>ispd = '${totalEnergy.ispd1}'; // 对应的ispd

			var times = "";
			// 根据name的个数，来为att添加对应个数的值
			var legend =  "${totalEnergy.chartLegendList}".replace(/'/g,"").split(",");
			for ( var i = 0; i < legend.length; i++) {
				if(i< legend.length-1){
					times +=<portlet:namespace/>start_date + ",";
				}else{
					times +=<portlet:namespace/>start_date ;
				}
				
			}
			<portlet:namespace/>showLegend=${totalEnergy.showLegend};
			<portlet:namespace/>exp_start_date = times;// 导出到excel中的时间 
			// 获取图表
			//数据类型String,String,String,String,Array,Boolean,String
			<portlet:namespace/>beginTime=times;
			<portlet:namespace/>isNotCompare='no';
			<portlet:namespace/>legend=legend;
			<portlet:namespace/>expTime=<portlet:namespace/>exp_start_date;
			<portlet:namespace/>getChart(times, <portlet:namespace/>choose_name, <portlet:namespace/>choose_id, <portlet:namespace/>ispd, legend,<portlet:namespace/>showLegend, 'no',size);
		}
	});
}
//--------------------------------------------------------------------文本框选择时间
function <portlet:namespace/>compareTime(size){
	var dformt = 'yyyy-MM-dd';
	if (<portlet:namespace />choose_type == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type == "month") {
		dformt = 'MM';
	} else if (<portlet:namespace />choose_type == "year") {
		dformt = 'yyyy';
	}
	
	WdatePicker({
		el : '<portlet:namespace />datetime',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			// 显示在页面上的时间
			var showtime= dp.cal.getDateStr(dformt);
			$('#<portlet:namespace/>compareTime').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+showtime);		
			$("#<portlet:namespace/>compareTime0").val(showtime);
			<portlet:namespace />centerTitle = <portlet:namespace />start_date + "," + paretime; //居中标题
			var times = [];
			// 根据name的个数，来为att添加对应个数的值
			var chartLegendList = [${totalEnergy.chartLegendList}];
			for(var i=0;i<chartLegendList.length;i++){
				times+=<portlet:namespace />start_date+",";
			}
			for(var i=0;i<chartLegendList.length;i++){
				if(i<chartLegendList.length-1){
					times+=paretime+",";
				}else{
					times+=paretime;
				}
			}
			<portlet:namespace />exp_start_date =times;// 导出到excel中的时间 
			<portlet:namespace />choose_name= '${totalEnergy.choose_name1},${totalEnergy.choose_name1}'; // 对应的name
			<portlet:namespace />choose_id = '${totalEnergy.choose_id1},${totalEnergy.choose_id1}'; // 对应的id
			<portlet:namespace />ispd = '${totalEnergy.ispd1},${totalEnergy.ispd1}'; // 对应的ispd
			//----------------------------加入对比
			var chartLegendList=[${totalEnergy.chartLegendList}];
			var legendList=[];
			for(var i=0;i<chartLegendList.length;i++){
				legendList.push(<portlet:namespace />start_date+chartLegendList[i]);
			}
			for(var i=0;i<chartLegendList.length;i++){
				legendList.push(paretime+chartLegendList[i]);
			}
			<portlet:namespace/>showLegend=${totalEnergy.showLegend};
			<portlet:namespace/>beginTime=<portlet:namespace />exp_start_date;
			<portlet:namespace/>isNotCompare='yes';
			<portlet:namespace/>legend=legendList;
			<portlet:namespace/>expTime=<portlet:namespace/>exp_start_date;
			<portlet:namespace />getChart(<portlet:namespace />exp_start_date,<portlet:namespace />choose_name,<portlet:namespace />choose_id,<portlet:namespace />ispd,legendList,<portlet:namespace/>showLegend,"yes",size);
			}
	});
}
	/*
	 *获取数据
	 *
	 */
	function <portlet:namespace/>getChart(tfrom, name, id, ispd, legend,showLegend,
			isNotCompare,size) {
		$.post("<portlet:resourceURL id='getCommonChartData'></portlet:resourceURL>", {
			from : tfrom,
			name : name,
			id : id,
			ispd : ispd,
			decimals :  '${totalEnergy.decimals}',//显示小数位数，首选项传
			mult : '',//是否在获取的数据基础上乘数，首选项传（饼图）
			type : <portlet:namespace/>choose_type
		//选取时间段
		}, function(data) {
			var cateList = data.cataList;//x轴标签，数组
			var dataList = data.dataList;//数据，数组集合
			if (<portlet:namespace />choose_type == "day"){
				if(isNotCompare == "yes"){ // 如果是对比的图
					<portlet:namespace />centerTitle = "";
					legend = "";
					var tfroms = tfrom.split(",");
					for(var i=0;i<tfroms.length-1;i+=2){
						if(i==2){
							<portlet:namespace />centerTitle += tfroms[i] ;
						}else{						
							<portlet:namespace />centerTitle += tfroms[i] + ((tfroms.length-1) == i ? "" : "与");			
						}
						legend += tfroms[i] + ((tfroms.length-1) == i ? "" : ",");
					}
				}
				// 个性需求：重新为图表的X轴赋值
				cateList = [];
				for(var k=0;k<=data.cataList.length;k++){
					cateList.push(k); 					
				};
			} else if (<portlet:namespace />choose_type == "week") {
				if(isNotCompare == "yes"){ // 如果是对比的图 
					var _legendList = data.legendList;
					<portlet:namespace />centerTitle = "";
					legend = "";
					// 个性需求：重新为图表的一级标题和图例赋值
					for(var i=0;i<_legendList.length-1;i+=2){
						for(var k=0;k<_legendList[i].length;k++){
							if(k%2!=0){
								_legendList[i][k]=_legendList[i][k].substring(5);
							}
							<portlet:namespace />centerTitle+= _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
							legend += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
						}
						if(i<2){
							<portlet:namespace />centerTitle += ((_legendList.length-1) == i ? "" : "与");
						}
						legend += ((_legendList.length-1) == i ? "" : ",");
					}
					legend=legend.replace(/\//g,'-');
					<portlet:namespace />centerTitle=<portlet:namespace />centerTitle.replace(/\//g,'-');
					// 个性需求：重新为图表的X轴赋值
				} else {
					// 居中标题的值
					<portlet:namespace />centerTitle =tfrom.substring(0,5)+ <portlet:namespace />c_title+ data.cataList[0].replace(/\//g,'-')+ "~" + <portlet:namespace />c_title  + data.cataList[data.cataList.length-1].replace(/\//g,'-');
				}
				cateList = ["周一","周二","周三","周四","周五","周六","周日"];
			} else if (<portlet:namespace />choose_type == "month") {
				if(isNotCompare == "yes"){ // 如果是对比的图 
					<portlet:namespace />centerTitle = "";
					legend = "";
					// 个性需求：重新为图表的一级标题和图例赋值
					var tfroms = tfrom.split(",");
					for(var i=0;i<tfroms.length-1;i+=2){
						if(i<2){
							<portlet:namespace />centerTitle += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
						}else{
							<portlet:namespace />centerTitle += tfroms[i].substring(0,7);
						}
						legend += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
					}
					
				}
				// 个性需求：重新为图表的X轴赋值
				cateList = [];
				for(var k=1;k<=data.cataList.length;k++){
					cateList.push(k); 					
				};
			} else if (<portlet:namespace />choose_type == "year") {
				if(isNotCompare == "yes"){ // 如果是对比的图 
					var compareyear = tfrom.substring(22,26);
					legend="";
					// 个性需求：重新为图表的一级标题和图例赋值
					<portlet:namespace />centerTitle = <portlet:namespace/>outsideStr + "与" + compareyear;
					legend += <portlet:namespace/>outsideStr + "," + compareyear+",";
					// 个性需求：重新为图表的X轴赋值
					var _yearList = data.yearList;
					
					if(_yearList[0].length>=_yearList[1].length){
						cateList = _yearList[0];
					} else if(_yearList[0].length<_yearList[1].length){
						cateList = _yearList[1];
					};
				};
				cateList=data.yearList[0];
			};
			if("${totalEnergy.xStep_1}"!=""){
				<portlet:namespace/>step="${totalEnergy.xStep_1}";
			}
			if(isNotCompare == "yes"){
				var legendList="${totalEnergy.chartLegendList}".split(",");
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
			var chartColorList = [${totalEnergy.chartColorList}];
			var chartYAxisList = [${totalEnergy.chartYAxisList}];
			var chartTypeList=['${totalEnergy.chartType_1}','${totalEnergy.chartType_2}','${totalEnergy.chartType_1}','${totalEnergy.chartType_2}'];
			renderToTwoType(chartId, 
					"${totalEnergy.backgroundColor_1}",
					<portlet:namespace />centerTitle,
					cateList,
					<portlet:namespace/>step,
					"${totalEnergy.yLeftTitle}",
					"${totalEnergy.yRightTitle}",
					dataList,
					chartColorList,
					chartTypeList,
					chartYAxisList,
					legend,showLegend,height,width,'${totalEnergy.gridLineColor}');
		}, 'json');
	}

	//导出数据到excel文件
	function <portlet:namespace />outputToExcel(){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date;
		var sdateList = sdate.split(",");
		if(sdateList.length>2){
			isNotCompare = "yes"; // yes表示是对比图表
		}
		var expColumnName = "${totalEnergy.expColumnName}";
		// 导出excel的Url
		var expUrl = "<portlet:resourceURL id='expTotalEnergyDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${totalEnergy.title1}"
				+"&hours="
				+ "${totalEnergy.hours}"
				+ "&from="
				+ sdate
				+ "&name="
				+ <portlet:namespace />choose_name
				+ "&id="
				+ <portlet:namespace />choose_id
				+ "&ispd="
				+ <portlet:namespace />ispd
				+ "&type="
				+ <portlet:namespace />choose_type
				+ "&isNotCompare="
				+ isNotCompare
				+ "&expColumnName="
				+ (expColumnName==""?"${totalEnergy.expColumnName1}".replace(/'/g,""):expColumnName);
		var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${totalEnergy.title1}" /></portlet:resourceURL>';
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${totalEnergy.title1}"
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
</script>