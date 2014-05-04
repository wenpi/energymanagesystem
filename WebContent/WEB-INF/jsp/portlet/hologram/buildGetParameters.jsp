<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-12-18 下午18:45
	LastModified Date:
	Description: 全息图——建筑总体获取图表参数
 -->

<script type="text/javascript">
	//通过所选建筑标识，来读取不同参数
	function <portlet:namespace />change_parameter(){ 
		if(<portlet:namespace />choose_build == "建筑总体"){ // 建筑总体
			
			//用电量部分
			<portlet:namespace />choose_name1 = ect_name; //用电量图表所选name
			<portlet:namespace />choose_id1= ect_id; //用电量图表所选id
			<portlet:namespace />choose_ispd1 = ect_ispd; //用电量图表所选ispd
			<portlet:namespace />title1 = ect_title; //用电量图表标题 
			//制冷量部分
			<portlet:namespace />choose_name2 = ref_name; //制冷量图表所选name
			<portlet:namespace />choose_id2= ref_id; //制冷量图表所选id
			<portlet:namespace />choose_ispd2 = ref_ispd; //制冷量图表所选ispd
			<portlet:namespace />title2 = ref_title; //制冷量图表标题 
			//客流量部分
			if('${tbinfo.isShowPassenger}' != 'none') {
				<portlet:namespace />choose_name3 = pas_name; //客流量图表所选name
				<portlet:namespace />choose_id3= pas_id; //客流量图表所选id
				<portlet:namespace />choose_ispd3 = pas_ispd; //客流量图表所选ispd
				<portlet:namespace />title3 = pas_title; //客流量图表标题 
			}
			
			console.log("choose 建筑总体");
			
		} else { // 其他楼(A1/P1/P2/T1/T2/T3/T4/T5)
			
			//用电量部分
			<portlet:namespace />choose_name1 = eval((<portlet:namespace />choose_build + "_ect_name").toLowerCase()); //用电量图表所选name
			<portlet:namespace />choose_id1= eval((<portlet:namespace />choose_build + "_ect_id").toLowerCase()); //用电量图表所选id
			<portlet:namespace />choose_ispd1 = eval((<portlet:namespace />choose_build + "_ect_ispd").toLowerCase()); //用电量图表所选ispd
			<portlet:namespace />title1 = eval((<portlet:namespace />choose_build + "_ect_title").toLowerCase()); //用电量图表标题 
			//制冷量部分
			<portlet:namespace />choose_name2 = eval((<portlet:namespace />choose_build + "_ref_name").toLowerCase()); //制冷量图表所选name
			<portlet:namespace />choose_id2= eval((<portlet:namespace />choose_build + "_ref_id").toLowerCase()); //制冷量图表所选id
			<portlet:namespace />choose_ispd2 = eval((<portlet:namespace />choose_build + "_ref_ispd").toLowerCase()); //制冷量图表所选ispd
			<portlet:namespace />title2 = eval((<portlet:namespace />choose_build + "_ref_title").toLowerCase()); //制冷量图表标题 
			//客流量部分
			if('${tbinfo.isShowPassenger}' != 'none') {
				<portlet:namespace />choose_name3 = eval((<portlet:namespace />choose_build + "_pas_name").toLowerCase()); //客流量图表所选name
				<portlet:namespace />choose_id3= eval((<portlet:namespace />choose_build + "_pas_id").toLowerCase()); //客流量图表所选id
				<portlet:namespace />choose_ispd3 = eval((<portlet:namespace />choose_build + "_pas_ispd").toLowerCase()); //客流量图表所选ispd
				<portlet:namespace />title3 = eval((<portlet:namespace />choose_build + "_pas_title").toLowerCase()); //客流量图表标题
			}
			
			console.log("choose " + <portlet:namespace />choose_build + "楼");
		
 		}
		
		<portlet:namespace />bg_color1 = '${tbinfo.electricityChartColor}'; //用电量图表绘图区域背景颜色
		<portlet:namespace />fill_color1 = '${tbinfo.electricityFillColorList}'.split(","); //用电量图表填充颜色
		<portlet:namespace />connectionLineWidth1 = '${tbinfo.electricityConnectLineWidth}'; //用电量图表连接线宽度
		<portlet:namespace />legendList1 = '${tbinfo.electricityChartLegendList}'.split(","); //用电量图表图例说明列表
		<portlet:namespace />legendColor1 = '${tbinfo.electricityLegendColor}'; //用电量图表图例说明文字颜色
		<portlet:namespace />colorList1 = '${tbinfo.electricityChartColorList}'.split(","); //用电量图表数据列颜色列表
		<portlet:namespace />decimals1 = '${tbinfo.electricityDecimals}'; //用电量图表保留小数位数
		<portlet:namespace />lineWidth1 = '${tbinfo.electricityLineWidth}'; //用电量图表线宽
		<portlet:namespace />xStep1 = '${tbinfo.electricityXStep}'; //用电量图表显示间隔
		<portlet:namespace />electricityChartType1 = '${tbinfo.electricityChartType1}'; //用电量图表中图1类型
		<portlet:namespace />electricityChartType2 = '${tbinfo.electricityChartType2}'; //用电量图表中图2类型
		<portlet:namespace />showX1 = '${tbinfo.electricityShowX}'; //用电量图表是否显示x轴上网格线
		<portlet:namespace />showY1 = '${tbinfo.electricityShowY}'; //用电量图表是否显示y轴上网格线
		<portlet:namespace />xColor1 = '${tbinfo.electricityXColor}'; //用电量图表x轴轴线颜色
		<portlet:namespace />yColor1 = '${tbinfo.electricityYColor}'; //用电量图表y轴轴线颜色
		<portlet:namespace />yWidth1 = '${tbinfo.electricityYWidth}'.split(","); //用电量图表y轴轴线宽度
		<portlet:namespace />xLabelColor1 = '${tbinfo.electricityXLabelColor}'; //用电量图表x轴标签颜色
		<portlet:namespace />yLabelColor1 = '${tbinfo.electricityYLabelColor}'; //用电量图表y轴标签颜色
		<portlet:namespace />yLeftTitle1 = '${tbinfo.electricityYLeftTitle}'; //用电量图表左侧y轴标题
		<portlet:namespace />yRightTitle1 = '${tbinfo.electricityYRightTitle}'; //用电量图表右侧y轴标题
		<portlet:namespace />leftColor1 = '${tbinfo.electricityLeftColor}'; //用电量图表左标题颜色
		<portlet:namespace />rightColor1 = '${tbinfo.electricityRightColor}'; //用电量图表右标题颜色 
		<portlet:namespace />ySymbol1 = '${tbinfo.electricityYSymbol}'; //用电量图表y轴单位
		<portlet:namespace />radiusList1 = '${tbinfo.electricityRadiusList}'.split(","); //用电量图表数据点半径列表
		<portlet:namespace />symbol1 = '${tbinfo.electricitySymbol}'; //用电量图表数据点样式
		<portlet:namespace />symbolWidth1 = '${tbinfo.electricitySymbolWidth}'; //用电量图表图例图形宽度
		<portlet:namespace />gridLineStyle1 = '${tbinfo.electricityGridLineStyle}'; //用电量图表辅助线样式
		<portlet:namespace />gridLineColor1 = '${tbinfo.electricityGridLineColor}'; //用电量图表网格线颜色 
		<portlet:namespace />yAxisList1 = [${tbinfo.electricityYAxisList}]; //用电量图表y轴数据列表
		<portlet:namespace />expColumnName1 = '${tbinfo.electricityExpColumnName}'; //用电量图表导出表头
		
		<portlet:namespace />bg_color2 = '${tbinfo.refrigerationChartColor}'; //制冷量图表绘图区域背景颜色
		<portlet:namespace />fill_color2 = '${tbinfo.refrigerationFillColorList}'.split(","); //制冷量图表填充颜色
		<portlet:namespace />connectionLineWidth2 = '${tbinfo.refrigerationConnectLineWidth}'; //制冷量图表连接线宽度
		<portlet:namespace />legendList2 = '${tbinfo.refrigerationChartLegendList}'.split(","); //制冷量图表图例说明列表
		<portlet:namespace />legendColor2 = '${tbinfo.refrigerationLegendColor}'; //制冷量图表图例说明文字颜色
		<portlet:namespace />colorList2 = '${tbinfo.refrigerationChartColorList}'.split(","); //制冷量图表数据列颜色列表
		<portlet:namespace />decimals2 = '${tbinfo.refrigerationDecimals}'; //制冷量图表保留小数位数
		<portlet:namespace />lineWidth2 = '${tbinfo.refrigerationLineWidth}'; //制冷量图表线宽
		<portlet:namespace />xStep2 = '${tbinfo.refrigerationXStep}'; //制冷量图表显示间隔
		<portlet:namespace />refrigerationChartType1 = '${tbinfo.refrigerationChartType1}'; //制冷量图表中图1类型
		<portlet:namespace />refrigerationChartType2 = '${tbinfo.refrigerationChartType2}'; //制冷量图表中图2类型
		<portlet:namespace />showX2 = '${tbinfo.refrigerationShowX}'; //制冷量图表是否显示x轴上网格线
		<portlet:namespace />showY2 = '${tbinfo.refrigerationShowY}'; //制冷量图表是否显示y轴上网格线
		<portlet:namespace />xColor2 = '${tbinfo.refrigerationXColor}'; //制冷量图表x轴轴线颜色
		<portlet:namespace />yColor2 = '${tbinfo.refrigerationYColor}'; //制冷量图表y轴轴线颜色
		<portlet:namespace />yWidth2 = '${tbinfo.refrigerationYWidth}'.split(","); //制冷量图表y轴轴线宽度
		<portlet:namespace />xLabelColor2 = '${tbinfo.refrigerationXLabelColor}'; //制冷量图表x轴标签颜色
		<portlet:namespace />yLabelColor2 = '${tbinfo.refrigerationYLabelColor}'; //制冷量图表y轴标签颜色
		<portlet:namespace />yLeftTitle2 = '${tbinfo.refrigerationYLeftTitle}'; //制冷量图表左侧y轴标题
		<portlet:namespace />yRightTitle2 = '${tbinfo.refrigerationYRightTitle}'; //制冷量图表右侧y轴标题
		<portlet:namespace />leftColor2 = '${tbinfo.refrigerationLeftColor}'; //制冷量图表左标题颜色
		<portlet:namespace />rightColor2 = '${tbinfo.refrigerationRightColor}'; //制冷量图表右标题颜色 
		<portlet:namespace />ySymbol2 = '${tbinfo.refrigerationYSymbol}'; //制冷量图表y轴单位
		<portlet:namespace />radiusList2 = '${tbinfo.refrigerationRadiusList}'.split(","); //制冷量图表数据点半径列表
		<portlet:namespace />symbol2 = '${tbinfo.refrigerationSymbol}'; //制冷量图表数据点样式
		<portlet:namespace />symbolWidth2 = '${tbinfo.refrigerationSymbolWidth}'; //制冷量图表图例图形宽度
		<portlet:namespace />gridLineStyle2 = '${tbinfo.refrigerationGridLineStyle}'; //制冷量图表辅助线样式
		<portlet:namespace />gridLineColor2 = '${tbinfo.refrigerationGridLineColor}'; //制冷量图表网格线颜色 
		<portlet:namespace />yAxisList2 = [${tbinfo.refrigerationYAxisList}]; //制冷量图表y轴数据列表
		<portlet:namespace />expColumnName2 = '${tbinfo.refrigerationExpColumnName}'; //制冷量图表导出表头
		
		<portlet:namespace />bg_color3 = '${tbinfo.passengerChartColor}'; //客流量图表绘图区域背景颜色
		<portlet:namespace />fill_color3 = '${tbinfo.passengerFillColorList}'.split(","); //客流量图表填充颜色
		<portlet:namespace />connectionLineWidth3 = '${tbinfo.passengerConnectLineWidth}'; //客流量图表连接线宽度
		<portlet:namespace />legendList3 = '${tbinfo.passengerChartLegendList}'.split(","); //客流量图表图例说明列表
		<portlet:namespace />legendColor3 = '${tbinfo.passengerLegendColor}'; //客流量图表图例说明文字颜色
		<portlet:namespace />colorList3 = '${tbinfo.passengerChartColorList}'.split(","); //客流量图表数据列颜色列表
		<portlet:namespace />decimals3 = '${tbinfo.passengerDecimals}'; //客流量图表保留小数位数
		<portlet:namespace />lineWidth3 = '${tbinfo.passengerLineWidth}'; //客流量图表线宽
		<portlet:namespace />xStep3 = '${tbinfo.passengerXStep}'; //客流量图表显示间隔
		<portlet:namespace />passengerChartType1 = '${tbinfo.passengerChartType1}'; //客流量图表中图1类型
		<portlet:namespace />passengerChartType2 = '${tbinfo.passengerChartType2}'; //客流量图表中图2类型
		<portlet:namespace />showX3 = '${tbinfo.passengerShowX}'; //客流量图表是否显示x轴上网格线
		<portlet:namespace />showY3 = '${tbinfo.passengerShowY}'; //客流量图表是否显示y轴上网格线
		<portlet:namespace />xColor3 = '${tbinfo.passengerXColor}'; //客流量图表x轴轴线颜色
		<portlet:namespace />yColor3 = '${tbinfo.passengerYColor}'; //客流量图表y轴轴线颜色
		<portlet:namespace />yWidth3 = '${tbinfo.passengerYWidth}'.split(","); //客流量图表y轴轴线宽度
		<portlet:namespace />xLabelColor3 = '${tbinfo.passengerXLabelColor}'; //客流量图表x轴标签颜色
		<portlet:namespace />yLabelColor3 = '${tbinfo.passengerYLabelColor}'; //客流量图表y轴标签颜色
		<portlet:namespace />yLeftTitle3 = '${tbinfo.passengerYLeftTitle}'; //客流量图表左侧y轴标题
		<portlet:namespace />yRightTitle3 = '${tbinfo.passengerYRightTitle}'; //客流量图表右侧y轴标题
		<portlet:namespace />leftColor3 = '${tbinfo.passengerLeftColor}'; //客流量图表左标题颜色
		<portlet:namespace />rightColor3 = '${tbinfo.passengerRightColor}'; //客流量图表右标题颜色 
		<portlet:namespace />ySymbol3 = '${tbinfo.passengerYSymbol}'; //客流量图表y轴单位
		<portlet:namespace />radiusList3 = '${tbinfo.passengerRadiusList}'.split(","); //客流量图表数据点半径列表
		<portlet:namespace />symbol3 = '${tbinfo.passengerSymbol}'; //客流量图表数据点样式
		<portlet:namespace />symbolWidth3 = '${tbinfo.passengerSymbolWidth}'; //客流量图表图例图形宽度
		<portlet:namespace />gridLineStyle3 = '${tbinfo.passengerGridLineStyle}'; //客流量图表辅助线样式
		<portlet:namespace />gridLineColor3 = '${tbinfo.passengerGridLineColor}'; //客流量图表网格线颜色 
		<portlet:namespace />yAxisList3 = [${tbinfo.passengerYAxisList}]; //客流量图表y轴数据列表
		<portlet:namespace />expColumnName3 = '${tbinfo.passengerExpColumnName}'; //客流量图表导出表头
		
		<portlet:namespace />exp_start_date = <portlet:namespace />start_date;//为导出excel的开始时间赋初值 
		
		<portlet:namespace />centerTitle = <portlet:namespace />start_date;//为居中标题赋初值 
		
		var choose_type = '';
		$("#<portlet:namespace />build_date_select div").each(function(index){
			if($(this).hasClass("pressive")){
				if(index == 0){
					choose_type = 'day';
				}else if(index == 1){
					choose_type = 'week';
					<portlet:namespace />xStep1 = '2';
					<portlet:namespace />xStep2 = '2';
					<portlet:namespace />xStep3 = '2';
				}else {
					choose_type = 'month';
					<portlet:namespace />xStep1 = '6';
					<portlet:namespace />xStep2 = '6';
					<portlet:namespace />xStep3 = '6';
					<portlet:namespace />centerTitle = <portlet:namespace />centerTitle.substring(0,7);
				}
			}
		});
		
		<portlet:namespace />choose_type = choose_type;//设置选择类型初值 
		
		$(".chart_1 .smart_chart_title h2").text(<portlet:namespace />title1); //设置图表1标题
		$(".chart_2 .smart_chart_title h2").text(<portlet:namespace />title2); //设置图表2标题
		
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
		if('${tbinfo.isShowPassenger}' != 'none') {
			$(".chart_3 .smart_chart_title h2").text(<portlet:namespace />title3); //设置图表2标题
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
	}
 </script>