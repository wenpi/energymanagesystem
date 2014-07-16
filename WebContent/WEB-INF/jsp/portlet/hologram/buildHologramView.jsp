<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-12-12 上午9点39分
	LastModified Date:
	Description: 全息图——建筑总体
 -->

<div class="date_select" id="<portlet:namespace />build_date_select">
	<input id="<portlet:namespace />datetime" type="hidden">
	<div class="pressive" id="<portlet:namespace />hologram_day"
		onclick="<portlet:namespace />selectdate('day')">日视图</div>
	<div id="<portlet:namespace />hologram_week"
		onclick="<portlet:namespace />selectdate('week')">周视图</div>
	<div class="radius" id="<portlet:namespace />hologram_month"
		onclick="<portlet:namespace />selectdate('month')">月视图</div>
</div>
<div class="charts">
	<div class="smart_chart chart_1">
		<div class="smart_chart_title">
			<h2></h2>
			<div class="down_load_icon"
				onclick="<portlet:namespace />electricityToExcel()"></div>
		</div>
		<div class="smart_chart_content"
			id="<portlet:namespace />electricity_chart"></div>
	</div>
	<div class="smart_chart chart_2">
		<div class="smart_chart_title">
			<h2></h2>
			<div class="down_load_icon"
				onclick="<portlet:namespace />regrigerationToExcel()"></div>
		</div>
		<div class="smart_chart_content"
			id="<portlet:namespace />refrigeration_chart"></div>
	</div>
	<!-- 客流量视图 -->
	<div class="smart_chart chart_3 holo_passenger_chart">
		<div class="smart_chart_title">
			<h2></h2>
			<div class="down_load_icon" 
				onclick="<portlet:namespace />passengerToExcel()"></div>
		</div>
		<div class="smart_chart_content"
			id="<portlet:namespace />passenger_chart"></div>
	</div>
</div>
<jsp:include page="../hologram/buildGetParameters.jsp"></jsp:include>
<script type="text/javascript">
//公共信息
var <portlet:namespace />choose_build = "建筑总体"; //选定建筑标识
var <portlet:namespace />start_date = ''; //开始时间
var <portlet:namespace />choose_type = ''; //视图类型（日视图、周视图、月视图）
var <portlet:namespace />centerTitle = ""; //居中标题
var <portlet:namespace />c_title = ''; //存储居中标题对应的年份
var <portlet:namespace />exp_start_date = ''; //导出时间
var <portlet:namespace />times = []; //根据所选name个数来保存相应时间信息
var <portlet:namespace />chartId1 = "<portlet:namespace />electricity_chart"; //图表1绘制位置
var <portlet:namespace />chartId2 = "<portlet:namespace />refrigeration_chart"; //图表2绘制位置
var <portlet:namespace />chartId3 = "<portlet:namespace />passenger_chart"; //图表3绘制位置
//个性信息
var <portlet:namespace />choose_name1 = ''; //用电量图表所选name
var <portlet:namespace />choose_id1= ''; //用电量图表所选id
var <portlet:namespace />choose_ispd1 = ''; //用电量图表所选ispd
var <portlet:namespace />title1 = ''; //用电量图表标题 
var <portlet:namespace />bg_color1 = ''; //用电量图表绘图区域背景颜色
var <portlet:namespace />fill_color1 = ''; //用电量图表填充颜色
var <portlet:namespace />connectionLineWidth1 = ''; //用电量图表连接线宽度
var <portlet:namespace />legendList1 = ''; //用电量图表图例说明列表
var <portlet:namespace />legendColor1 = ''; //用电量图表图例说明文字颜色
var <portlet:namespace />colorList1 = ''; //用电量图表数据列颜色列表
var <portlet:namespace />decimals1 = ''; //用电量图表保留小数位数
var <portlet:namespace />lineWidth1 = ''; //用电量图表线宽
var <portlet:namespace />xStep1 = ''; //用电量图表显示间隔
var <portlet:namespace />electricityChartType1 = ''; //用电量图表中图1类型
var <portlet:namespace />electricityChartType2 = ''; //用电量图表中图2类型
var <portlet:namespace />showX1 = ''; //用电量图表是否显示x轴上网格线
var <portlet:namespace />showY1 = ''; //用电量图表是否显示y轴上网格线
var <portlet:namespace />xColor1 = ''; //用电量图表x轴轴线颜色
var <portlet:namespace />yColor1 = ''; //用电量图表y轴轴线颜色
var <portlet:namespace />yWidth1 = ''; //用电量图表y轴轴线宽度
var <portlet:namespace />xLabelColor1 = ''; //用电量图表x轴标签颜色
var <portlet:namespace />yLabelColor1 = ''; //用电量图表y轴标签颜色
var <portlet:namespace />yLeftTitle1 = ''; //用电量图表左侧y轴标题
var <portlet:namespace />yRightTitle1 = ''; //用电量图表右侧y轴标题
var <portlet:namespace />leftColor1 = ''; //用电量图表左标题颜色
var <portlet:namespace />rightColor1 = ''; //用电量图表右标题颜色 
var <portlet:namespace />ySymbol1 = ''; //用电量图表y轴单位
var <portlet:namespace />radiusList1 = ''; //用电量图表数据点半径列表
var <portlet:namespace />symbol1 = ''; //用电量图表数据点样式
var <portlet:namespace />symbolWidth1 = ''; //用电量图表图例图形宽度
var <portlet:namespace />gridLineStyle1 = ''; //用电量图表网格线样式
var <portlet:namespace />gridLineColor1 = ''; //用电量图表网格线颜色 
var <portlet:namespace />yAxisList1 = ''; //用电量图表y轴数据列表
var <portlet:namespace />expColumnName1 = ''; //用电量图表导出表头

var <portlet:namespace />choose_name2 = ''; //制冷量图表所选name
var <portlet:namespace />choose_id2= ''; //制冷量图表所选id
var <portlet:namespace />choose_ispd2 = ''; //制冷量图表所选ispd
var <portlet:namespace />title2 = ''; //制冷量图表标题 
var <portlet:namespace />bg_color2 = ''; //制冷量图表绘图区域背景颜色
var <portlet:namespace />fill_color2 = ''; //制冷量图表填充颜色
var <portlet:namespace />connectionLineWidth2 = ''; //制冷量图表连接线宽度
var <portlet:namespace />legendList2 = ''; //制冷量图表图例说明列表
var <portlet:namespace />legendColor2 = ''; //制冷量图表图例说明文字颜色
var <portlet:namespace />colorList2 = ''; //制冷量图表数据列颜色列表
var <portlet:namespace />decimals2 = ''; //制冷量图表保留小数位数
var <portlet:namespace />lineWidth2 = ''; //制冷量图表线宽
var <portlet:namespace />xStep2 = ''; //制冷量图表显示间隔
var <portlet:namespace />refrigerationChartType1 = ''; //制冷量图表中图1类型
var <portlet:namespace />refrigerationChartType2 = ''; //制冷量图表中图2类型
var <portlet:namespace />showX2 = ''; //制冷量图表是否显示x轴上网格线
var <portlet:namespace />showY2 = ''; //制冷量图表是否显示y轴上网格线
var <portlet:namespace />xColor2 = ''; //制冷量图表x轴轴线颜色
var <portlet:namespace />yColor2 = ''; //制冷量图表y轴轴线颜色
var <portlet:namespace />yWidth2 = ''; //制冷量图表y轴轴线宽度
var <portlet:namespace />xLabelColor2 = ''; //制冷量图表x轴标签颜色
var <portlet:namespace />yLabelColor2 = ''; //制冷量图表y轴标签颜色
var <portlet:namespace />yLeftTitle2 = ''; //制冷量图表左侧y轴标题
var <portlet:namespace />yRightTitle2 = ''; //制冷量图表右侧y轴标题
var <portlet:namespace />leftColor2 = ''; //制冷量图表左标题颜色
var <portlet:namespace />rightColor2 = ''; //制冷量图表右标题颜色 
var <portlet:namespace />ySymbol2 = ''; //制冷量图表y轴单位
var <portlet:namespace />radiusList2 = ''; //制冷量图表数据点半径列表
var <portlet:namespace />symbol2 = ''; //制冷量图表数据点样式
var <portlet:namespace />symbolWidth2 = ''; //制冷量图表图例图形宽度
var <portlet:namespace />gridLineStyle2 = ''; //制冷量图表网格线样式
var <portlet:namespace />gridLineColor2 = ''; //制冷量图表网格线颜色 
var <portlet:namespace />yAxisList2 = ''; //制冷量图表y轴数据列表
var <portlet:namespace />expColumnName2 = ''; //制冷量图表导出表头

var <portlet:namespace />choose_name3 = ''; //客流量图表所选name
var <portlet:namespace />choose_id3 = ''; //客流量图表所选id
var <portlet:namespace />choose_ispd3 = ''; //客流量图表所选ispd
var <portlet:namespace />title3 = ''; //客流量图表标题 
var <portlet:namespace />bg_color3 = ''; //客流量图表绘图区域背景颜色
var <portlet:namespace />fill_color3 = ''; //客流量图表填充颜色
var <portlet:namespace />connectionLineWidth3 = ''; //客流量图表连接线宽度
var <portlet:namespace />legendList3 = ''; //客流量图表图例说明列表
var <portlet:namespace />legendColor3 = ''; //客流量图表图例说明文字颜色
var <portlet:namespace />colorList3 = ''; //客流量图表数据列颜色列表
var <portlet:namespace />decimals3 = ''; //客流量图表保留小数位数
var <portlet:namespace />lineWidth3 = ''; //客流量图表线宽
var <portlet:namespace />xStep3 = ''; //客流量图表显示间隔
var <portlet:namespace />passengerChartType1 = ''; //客流量图表图1类型
var <portlet:namespace />passengerChartType2 = ''; //客流量图表中图2类型
var <portlet:namespace />showX3 = ''; //客流量图表是否显示x轴上网格线
var <portlet:namespace />showY3 = ''; //客流量图表是否显示y轴上网格线
var <portlet:namespace />xColor3 = ''; //客流量图表x轴轴线颜色
var <portlet:namespace />yColor3 = ''; //客流量图表y轴轴线颜色
var <portlet:namespace />yWidth3 = ''; //客流量图表y轴轴线宽度
var <portlet:namespace />xLabelColor3 = ''; //客流量图表x轴标签颜色
var <portlet:namespace />yLabelColor3 = ''; //客流量图表y轴标签颜色
var <portlet:namespace />yLeftTitle3 = ''; //客流量图表左侧y轴标题
var <portlet:namespace />yRightTitle3 = ''; //客流量图表右侧y轴标题
var <portlet:namespace />leftColor3 = ''; //客流量图表左标题颜色
var <portlet:namespace />rightColor3 = ''; //客流量图表右标题颜色 
var <portlet:namespace />ySymbol3 = ''; //客流量图表y轴单位
var <portlet:namespace />radiusList3 = ''; //客流量图表数据点半径列表
var <portlet:namespace />symbol3 = ''; //客流量图表数据点样式
var <portlet:namespace />symbolWidth3 = ''; //客流量图表图例图形宽度
var <portlet:namespace />gridLineStyle3 = ''; //客流量图表网格线样式
var <portlet:namespace />gridLineColor3 = ''; //客流量图表网格线颜色 
var <portlet:namespace />yAxisList3 = ''; //客流量图表y轴数据列表
var <portlet:namespace />expColumnName3 = ''; //客流量图表导出表头
	
	function <portlet:namespace />selectdate(type){
		var dformt='yyyy-MM-dd',titleFormat='yyyy-MM-dd';
		//获取XStep信息
		<portlet:namespace />xStep1 = '${tbinfo.electricityXStep}';
		<portlet:namespace />xStep2 = '${tbinfo.refrigerationXStep}';
		<portlet:namespace />xStep3 = '${tbinfo.passengerXStep}';
		
		//根据所选视图类型，确定居中标题样式
		if(type=='week'){
			<portlet:namespace />xStep1 = '2';
			<portlet:namespace />xStep2 = '2';
			<portlet:namespace />xStep3 = '2';
		}else if(type=='month'){
			dformt='MM';
			titleFormat='yyyy-MM'; //设置居中标题日期样式
			<portlet:namespace />xStep1 = '6';
			<portlet:namespace />xStep2 = '6';
			<portlet:namespace />xStep3 = '6';
		}
		
		WdatePicker({
			position:{left:80},
			el:'<portlet:namespace />datetime',
			dateFmt:dformt,
			onpicked:function(dp){
				var _time = dp.cal;
				<portlet:namespace />start_date = _time.getDateStr('yyyy-MM-dd'); //设置开始时间
				<portlet:namespace />exp_start_date = _time.getDateStr('yyyy-MM-dd'); //导出excel的开始时间 
				<portlet:namespace />choose_type = type; //设置选择类型
				//为居中标题赋值 
				<portlet:namespace />centerTitle = dp.cal.getDateStr(titleFormat);
				<portlet:namespace />c_title = dp.cal.getDateStr("yyyy"); //保存年份信息
				
				//获取相应时间段的各图表信息
				//用电量图表
				<portlet:namespace />getChart(<portlet:namespace />chartId1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />choose_ispd1,
						<portlet:namespace />bg_color1,<portlet:namespace />fill_color1,<portlet:namespace />connectionLineWidth1,
						<portlet:namespace />legendList1,<portlet:namespace />legendColor1,<portlet:namespace />colorList1,
						<portlet:namespace />decimals1,<portlet:namespace />lineWidth1,<portlet:namespace />xStep1,
						<portlet:namespace />electricityChartType1,<portlet:namespace />electricityChartType2,<portlet:namespace />showX1,
						<portlet:namespace />showY1,<portlet:namespace />xColor1,<portlet:namespace />yColor1,
						<portlet:namespace />yWidth1,<portlet:namespace />xLabelColor1,<portlet:namespace />yLabelColor1,
						<portlet:namespace />yLeftTitle1,<portlet:namespace />yRightTitle1,<portlet:namespace />leftColor1,
						<portlet:namespace />rightColor1,<portlet:namespace />ySymbol1,<portlet:namespace />radiusList1,
						<portlet:namespace />symbol1,<portlet:namespace />symbolWidth1,<portlet:namespace />gridLineStyle1,
						<portlet:namespace />gridLineColor1,<portlet:namespace />yAxisList1);
				//制冷量图表
				<portlet:namespace />getChart(<portlet:namespace />chartId2,<portlet:namespace />choose_name2,<portlet:namespace />choose_id2,<portlet:namespace />choose_ispd2,
						<portlet:namespace />bg_color2,<portlet:namespace />fill_color2,<portlet:namespace />connectionLineWidth2,
						<portlet:namespace />legendList2,<portlet:namespace />legendColor2,<portlet:namespace />colorList2,
						<portlet:namespace />decimals2,<portlet:namespace />lineWidth2,<portlet:namespace />xStep2,
						<portlet:namespace />refrigerationChartType1,<portlet:namespace />refrigerationChartType2,<portlet:namespace />showX2,
						<portlet:namespace />showY2,<portlet:namespace />xColor2,<portlet:namespace />yColor2,
						<portlet:namespace />yWidth2,<portlet:namespace />xLabelColor2,<portlet:namespace />yLabelColor2,
						<portlet:namespace />yLeftTitle2,<portlet:namespace />yRightTitle2,<portlet:namespace />leftColor2,
						<portlet:namespace />rightColor2,<portlet:namespace />ySymbol2,<portlet:namespace />radiusList2,
						<portlet:namespace />symbol2,<portlet:namespace />symbolWidth2,<portlet:namespace />gridLineStyle2,
						<portlet:namespace />gridLineColor2,<portlet:namespace />yAxisList2);
				//客流量图表
				<portlet:namespace />getChart(<portlet:namespace />chartId3,<portlet:namespace />choose_name3,<portlet:namespace />choose_id3,<portlet:namespace />choose_ispd3,
						<portlet:namespace />bg_color3,<portlet:namespace />fill_color3,<portlet:namespace />connectionLineWidth3,
						<portlet:namespace />legendList3,<portlet:namespace />legendColor3,<portlet:namespace />colorList3,
						<portlet:namespace />decimals3,<portlet:namespace />lineWidth3,<portlet:namespace />xStep3,
						<portlet:namespace />passengerChartType1,<portlet:namespace />passengerChartType2,<portlet:namespace />showX3,
						<portlet:namespace />showY3,<portlet:namespace />xColor3,<portlet:namespace />yColor3,
						<portlet:namespace />yWidth3,<portlet:namespace />xLabelColor3,<portlet:namespace />yLabelColor3,
						<portlet:namespace />yLeftTitle3,<portlet:namespace />yRightTitle3,<portlet:namespace />leftColor3,
						<portlet:namespace />rightColor3,<portlet:namespace />ySymbol3,<portlet:namespace />radiusList3,
						<portlet:namespace />symbol3,<portlet:namespace />symbolWidth3,<portlet:namespace />gridLineStyle3,
						<portlet:namespace />gridLineColor3,<portlet:namespace />yAxisList3);
			}
		});
	}
	
	// 生成园区全息图下（针对用电量、制冷量、客流量）的函数
	function <portlet:namespace />getChart(chartId,name,id,ispd,bg_color,fill_color,connLineWidth,legendList,legendColor,colorList,decimals,lineWidth,xStep,
			chartType1,chartType2,showX,showY,xColor,yColor,yWidth,xLabelColor,yLabelColor,leftTitle,rightTitle,leftColor,rightColor,ySymbol,radiusList,
			symbol,symbolWidth,gridLineStyle,gridLineColor,yAxisList){
		<portlet:namespace />times.length = 0;; //清空times
		//根据所选name个数确定开始时间个数
		for(var i = 0 ;i<name.split(",").length;i++){
			<portlet:namespace />times.push(<portlet:namespace />start_date);
		}
		var showLegend;
		//图表中两条及两条以上数据列才显示图例说明
		if(name.split(",").length>1){
			showLegend = true;
		}else{
			showLegend = false;
		}
		$.post('<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',{
			from: <portlet:namespace />times.join(),
			name: name,
			id: id,
			ispd: ispd,
			decimals: decimals,
			type: <portlet:namespace />choose_type,
			region_id: ((<portlet:namespace />choose_build == "建筑总体" || id.indexOf("outdoor_") != -1 || name.indexOf("cooling_capacity") != -1) ? "" : 'total'),
			build_id: (<portlet:namespace />choose_build == "建筑总体" ? "" : <portlet:namespace />choose_build)
		},function(data){
			var newLegendList = []; //用来保存新生成的个性图例说明列
			var cataList = data.cataList; //存储x轴上的标识列
			var dataList = data.dataList; //获取各数据列信息
			var len = cataList.length;
			//截取数据列中的数据，防止数据过多
			for(var num = 0 ; num <dataList.length ; num++){
				if(dataList[num].length>len){
					dataList[num] = dataList[num].slice(0,len);
				}
			}
			if(<portlet:namespace />choose_type == 'day'){
				//设置图例说明列
				for(var i = 0 ; i<name.split(",").length;i++){
					if(legendList.length>i){
						newLegendList.push(legendList[i]);
					}else{
						newLegendList.push("series" + (i+1));
					}
				}
			}else if(<portlet:namespace />choose_type == 'week'){
				var cList = ["周一","周二","周三","周四","周五","周六","周日"];
				//居中标题的值
				<portlet:namespace />centerTitle = <portlet:namespace />c_title + "-" + data.cataList[0].substring(0,2) + "-" + data.cataList[0].substring(3) + "~"
				  + <portlet:namespace />c_title + "-" + data.cataList[data.cataList.length-1].substring(0,2) + "-" + data.cataList[data.cataList.length-1].substring(3);
				
				 //设置图例说明列
				for(var i = 0 ; i<name.split(",").length;i++){
					if(legendList.length>i){
						newLegendList.push(legendList[i]);
					}else{
						newLegendList.push("series" + (i+1));
					}
				}
				cataList = cList ; //根据类别个数个性化定义x轴标签
			}else{
				//设置图例说明列
				for(var i = 0 ; i<name.split(",").length;i++){
					if(legendList.length>i){
						newLegendList.push(legendList[i]);
					}else{
						newLegendList.push("series" + (i+1));
					}
				}
			}
			
			/*
			 *渲染图表
			 *该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToMixCharts.js中，用来生成图表
			 */
			 autoRenderToMixCharts(chartId, //对应的渲染位置 ---
					chartType1 + "," + chartType2, //图表类型---
					bg_color, //图表绘图区域背景颜色---
					name.split(",").length, //获取选取name的个数---
					xStep, //X轴间隔---
					<portlet:namespace />centerTitle, //居中标题---
					gridLineStyle, //图表网格线的样式--
					gridLineColor, //网格线颜色
					symbol, //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"---
					symbolWidth, //图例图形宽度---
					lineWidth, //线宽，此为具体曲线点的点线宽---
					connLineWidth, //连接线线宽，为空则默认为2，为0则不显示连接线---								
					leftTitle, //Y轴左侧标题---
					rightTitle, //Y轴右侧标题---
					leftColor,	//左标题颜色 ---
					rightColor,	//右标题颜色---
					showLegend, //是否显示图例说明---
					showX, //是否显示X轴网格线---
					showY, //是否显示Y轴网格线---
					xColor, //X轴轴线颜色---
					yColor,	//Y轴轴线颜色---
					yWidth, //Y轴轴线宽度---
					xLabelColor, //X轴标签颜色---
					yLabelColor, //Y轴标签颜色 ---
					newLegendList, //图例说明---
					legendColor, //图例说明文字颜色---
					colorList, //颜色列表---
					dataList, //数据列表---
					fill_color, //填充颜色列表---
					radiusList, //曲线点半径列表---
					ySymbol, //Y轴单位---
					yAxisList, //Y轴数据列表---
					cataList); //X轴数据信息---
		},'json');
	}
	//图表数据下载事件——用电量部分
	function <portlet:namespace />electricityToExcel(){
		<portlet:namespace />outPutToExcel(<portlet:namespace />legendList1,<portlet:namespace />expColumnName1,<portlet:namespace />title1,
				<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />choose_ispd1,<portlet:namespace />choose_type);
	}
	//图表数据下载事件——制冷量部分
	function <portlet:namespace />regrigerationToExcel(){
		<portlet:namespace />outPutToExcel(<portlet:namespace />legendList2,<portlet:namespace />expColumnName2,<portlet:namespace />title2,
				<portlet:namespace />choose_name2,<portlet:namespace />choose_id2,<portlet:namespace />choose_ispd2,<portlet:namespace />choose_type);
	}
	//图表数据下载事件——客流量部分
	function <portlet:namespace />passengerToExcel(){
		<portlet:namespace />outPutToExcel(<portlet:namespace />legendList3,<portlet:namespace />expColumnName3,<portlet:namespace />title3,
				<portlet:namespace />choose_name3,<portlet:namespace />choose_id3,<portlet:namespace />choose_ispd3,<portlet:namespace />choose_type);
	}
	// 导出数据到excel
	function <portlet:namespace />outPutToExcel(legendList,expColmnName,excelName,name,id,ispd,type){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date;//保存导出到excel中的时间 
		var sdateList = sdate.split(",");
		
		// 根据配置的图例个数，匹配时间个数和图例个数一致 
		var startdate = [];
		for(var i=0;i<sdateList.length;i++){
			for(var k=0;k<legendList.length;k++){
				startdate.push(sdateList[i]);
			}
		}
		sdate = startdate.join();//将每个日期对应的数据列保存
		var expColumnName = expColmnName;
		var expUrl = '';
		if(name.split(",").length>1){
			// 导出excel的Url
			expUrl = "<portlet:resourceURL id='expOutSideChartDataToExcel'></portlet:resourceURL>"
					+ "&excelName="
					+ excelName
					+ "&from="
					+ sdate
					+ "&name="
					+ name
					+ "&id="
					+ id
					+ "&ispd="
					+ ispd
					+ "&type="
					+ type
					+ "&isNotCompare="
					+ isNotCompare
					+ "&expColumnName="
					+ (expColumnName==""?excelName:expColumnName);
		}else{
			expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ excelName
				+ "&from="
				+ sdate
				+ "&name="
				+ name
				+ "&id="
				+ id
				+ "&ispd="
				+ ispd
				+ "&type="
				+ type
				+ "&isNotCompare="
				+ isNotCompare
				+ "&expColumnName="
				+ (expColumnName==""?excelName:expColumnName);
		}
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + excelName
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
	var cur_time = new Date();
	//设置开始时间默认值 
	if(publicTime != ""){
		<portlet:namespace />start_date = publicTime;
	} else {
		if("${tbinfo.buildTime}" == ""){
			<portlet:namespace />start_date = cur_time.getFullYear() + "-" + (cur_time.getMonth()+1) + "-" + cur_time.getDate();
		}else{
			<portlet:namespace />start_date ="${tbinfo.buildTime}";
		}
	}

	// 根据配置项，控制客流量视图以及其它视图的样式 
	$(".holo_passenger_chart").css("display", "${tbinfo.isShowPassenger}"); // 控制全息图中客流量是否显示
	if('${tbinfo.isShowPassenger}' == 'none') { // 配置项中的客流量不显示
		$(".smart_chart").addClass("small_chart_width");
		$(".smart_chart_content").addClass("small_chart_width");
	}
	<portlet:namespace />change_parameter(); // 获取图表数据信息
</script>


