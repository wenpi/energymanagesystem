<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-12-18 下午16:10
	LastModified Date:2013-12-30 下午13：31
	Description: 全息图——建筑总体首选项页面
 -->
<div class="div-table-row">
	<div class="ftitle">
		<span>用电量配置</span>
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">导出列头名称：</span> <input
			id="electricityExpColumnName" name="electricityExpColumnName"
			type="text"
			value="<%=prefs.getValue("electricityExpColumnName", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例图形宽度：</span> <input
			id="electricitySymbolWidth" name="electricitySymbolWidth" type="text"
			value="<%=prefs.getValue("electricitySymbolWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">背景颜色：</span> <input
			id="electricityChartColor" name="electricityChartColor" type="text"
			value="<%=prefs.getValue("electricityChartColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">填充颜色列表：</span> <input
			id="electricityFillColorList" name="electricityFillColorList"
			type="text"
			value="<%=prefs.getValue("electricityFillColorList", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">连接线宽：</span> <input
			id="electricityConnectLineWidth" name="electricityConnectLineWidth"
			title="为空则默认为2，为0则不显示连接线" type="text"
			value="<%=prefs.getValue("electricityConnectLineWidth", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例列表：</span> <input
			id="electricityChartLegendList" name="electricityChartLegendList"
			type="text"
			value="<%=prefs.getValue("electricityChartLegendList", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">颜色列表：</span> <input
			id="electricityChartColorList" name="electricityChartColorList"
			type="text"
			value="<%=prefs.getValue("electricityChartColorList", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">曲线点类型：</span> <select
			id="electricitySymbol" name="electricitySymbol" style="width: 29.5%">
			<option value="circle">圆点</option>
			<option value="square">正方形</option>
			<option value="diamond">方形</option>
			<option value="triangle">三角形</option>
			<option value="triangle-down">倒三角</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">小数位数：</span> <select
			id="electricityDecimals" name="electricityDecimals"
			style="width: 29.5%">
			<option value="0.00">保留两位小数</option>
			<option value="0.0">保留一位小数</option>
			<option value="0">取整数</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线宽：</span> <input
			id="electricityLineWidth" name="electricityLineWidth" type="text"
			value="<%=prefs.getValue("electricityLineWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴间隔：</span> <input
			id="electricityXStep" name="electricityXStep" type="text"
			value="<%=prefs.getValue("electricityXStep", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线样式：</span> <input
			id="electricityGridLineStyle" name="electricityGridLineStyle"
			type="text"
			value="<%=prefs.getValue("electricityGridLineStyle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型1：</span> <select
			id="electricityChartType1" name="electricityChartType1"
			style="width: 29.5%">
			<option value="line">曲线图</option>
			<option value="column">柱状图</option>
			<option value="area">面积图</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型2：</span> <select
			id="electricityChartType2" name="electricityChartType2"
			style="width: 29.5%">
			<option value="line">曲线图</option>
			<option value="column">柱状图</option>
			<option value="area">面积图</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">显示X轴网格线：</span> <select
			id="electricityShowX" name="electricityShowX" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">显示Y轴网格线:</span> <select
			id="electricityShowY" name="electricityShowY" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴左标题：</span> <input
			id="electricityYLeftTitle" name="electricityYLeftTitle" type="text"
			value="<%=prefs.getValue("electricityYLeftTitle", "")%>">
	</div>

	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴右标题：</span> <input
			id="electricityYRightTitle" name="electricityYRightTitle" type="text"
			value="<%=prefs.getValue("electricityYRightTitle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">左标题颜色：</span> <input
			id="electricityLeftColor" name="electricityLeftColor" type="text"
			value="<%=prefs.getValue("electricityLeftColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">右标题颜色：</span> <input
			id="electricityRightColor" name="electricityRightColor" type="text"
			value="<%=prefs.getValue("electricityRightColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴标签颜色：</span> <input
			id="electricityYLabelColor" name="electricityYLabelColor" type="text"
			value="<%=prefs.getValue("electricityYLabelColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴标签颜色：</span> <input
			id="electricityXLabelColor" name="electricityXLabelColor" type="text"
			value="<%=prefs.getValue("electricityXLabelColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴颜色：</span> <input
			id="electricityYColor" name="electricityYColor" type="text"
			value="<%=prefs.getValue("electricityYColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴颜色：</span> <input
			id="electricityXColor" name="electricityXColor" type="text"
			value="<%=prefs.getValue("electricityXColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">网格线颜色：</span> <input
			id="electricityGridLineColor" name="electricityGridLineColor"
			type="text"
			value="<%=prefs.getValue("electricityGridLineColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例字体颜色：</span> <input
			id="electricityLegendColor" name="electricityLegendColor" type="text"
			value="<%=prefs.getValue("electricityLegendColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴单位：</span> <input
			id="electricityYSymbol" name="electricityYSymbol" type="text"
			value="<%=prefs.getValue("electricityYSymbol", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴宽度：</span> <input
			id="electricityYWidth" name="electricityYWidth" type="text"
			value="<%=prefs.getValue("electricityYWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴数据列表：</span> <input
			id="electricityYAxisList" name="electricityYAxisList" type="text"
			value="<%=prefs.getValue("electricityYAxisList", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">半径列表：</span> <input
			id="electricityRadiusList" name="electricityRadiusList" type="text"
			value="<%=prefs.getValue("electricityRadiusList", "")%>">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="ftitle">
		<span>制冷量配置</span><span class="title-back">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">导出列头名称：</span> <input
			id="refrigerationExpColumnName" name="refrigerationExpColumnName"
			type="text"
			value="<%=prefs.getValue("refrigerationExpColumnName", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例图形宽度：</span> <input
			id="refrigerationSymbolWidth" name="refrigerationSymbolWidth"
			type="text"
			value="<%=prefs.getValue("refrigerationSymbolWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">背景颜色：</span> <input
			id="refrigerationChartColor" name="refrigerationChartColor"
			type="text"
			value="<%=prefs.getValue("refrigerationChartColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">填充颜色列表：</span> <input
			id="refrigerationFillColorList" name="refrigerationFillColorList"
			type="text"
			value="<%=prefs.getValue("refrigerationFillColorList", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">连接线宽：</span> <input
			id="refrigerationConnectLineWidth"
			name="refrigerationConnectLineWidth" title="为空则默认为2，为0则不显示连接线"
			type="text"
			value="<%=prefs.getValue("refrigerationConnectLineWidth", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例列表：</span> <input
			id="refrigerationChartLegendList" name="refrigerationChartLegendList"
			type="text"
			value="<%=prefs.getValue("refrigerationChartLegendList", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">颜色列表：</span> <input
			id="refrigerationChartColorList" name="refrigerationChartColorList"
			type="text"
			value="<%=prefs.getValue("refrigerationChartColorList", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">曲线点类型：</span> <select
			id="refrigerationSymbol" name="refrigerationSymbol"
			style="width: 29.5%">
			<option value="circle">圆点</option>
			<option value="square">正方形</option>
			<option value="diamond">方形</option>
			<option value="triangle">三角形</option>
			<option value="triangle-down">倒三角</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">小数位数：</span> <select
			id="refrigerationDecimals" name="refrigerationDecimals"
			style="width: 29.5%">
			<option value="0.00">保留两位小数</option>
			<option value="0.0">保留一位小数</option>
			<option value="0">取整数</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线宽：</span> <input
			id="refrigerationLineWidth" name="refrigerationLineWidth" type="text"
			value="<%=prefs.getValue("refrigerationLineWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴间隔：</span> <input
			id="refrigerationXStep" name="refrigerationXStep" type="text"
			value="<%=prefs.getValue("refrigerationXStep", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线样式：</span> <input
			id="refrigerationGridLineStyle" name="refrigerationGridLineStyle"
			type="text"
			value="<%=prefs.getValue("refrigerationGridLineStyle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型1：</span> <select
			id="refrigerationChartType1" name="refrigerationChartType1"
			style="width: 29.5%">
			<option value="line">曲线图</option>
			<option value="column">柱状图</option>
			<option value="area">面积图</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型2：</span> <select
			id="refrigerationChartType2" name="refrigerationChartType2"
			style="width: 29.5%">
			<option value="line">曲线图</option>
			<option value="column">柱状图</option>
			<option value="area">面积图</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">显示X轴网格线：</span> <select
			id="refrigerationShowX" name="refrigerationShowX"
			style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">显示Y轴网格线:</span> <select
			id="refrigerationShowY" name="refrigerationShowY"
			style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴左标题：</span> <input
			id="refrigerationYLeftTitle" name="refrigerationYLeftTitle"
			type="text"
			value="<%=prefs.getValue("refrigerationYLeftTitle", "")%>">
	</div>

	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴右标题：</span> <input
			id="refrigerationYRightTitle" name="refrigerationYRightTitle"
			type="text"
			value="<%=prefs.getValue("refrigerationYRightTitle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">左标题颜色：</span> <input
			id="refrigerationLeftColor" name="refrigerationLeftColor" type="text"
			value="<%=prefs.getValue("refrigerationLeftColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">右标题颜色：</span> <input
			id="refrigerationRightColor" name="refrigerationRightColor"
			type="text"
			value="<%=prefs.getValue("refrigerationRightColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴标签颜色：</span> <input
			id="refrigerationYLabelColor" name="refrigerationYLabelColor"
			type="text"
			value="<%=prefs.getValue("refrigerationYLabelColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴标签颜色：</span> <input
			id="refrigerationXLabelColor" name="refrigerationXLabelColor"
			type="text"
			value="<%=prefs.getValue("refrigerationXLabelColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴颜色：</span> <input
			id="refrigerationYColor" name="refrigerationYColor" type="text"
			value="<%=prefs.getValue("refrigerationYColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴颜色：</span> <input
			id="refrigerationXColor" name="refrigerationXColor" type="text"
			value="<%=prefs.getValue("refrigerationXColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">网格线颜色：</span> <input
			id="refrigerationGridLineColor" name="refrigerationGridLineColor"
			type="text"
			value="<%=prefs.getValue("refrigerationGridLineColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例字体颜色：</span> <input
			id="refrigerationLegendColor" name="refrigerationLegendColor"
			type="text"
			value="<%=prefs.getValue("refrigerationLegendColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴单位：</span> <input
			id="refrigerationYSymbol" name="refrigerationYSymbol" type="text"
			value="<%=prefs.getValue("refrigerationYSymbol", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴宽度：</span> <input
			id="refrigerationYWidth" name="refrigerationYWidth" type="text"
			value="<%=prefs.getValue("refrigerationYWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴数据列表：</span> <input
			id="refrigerationYAxisList" name="refrigerationYAxisList" type="text"
			value="<%=prefs.getValue("refrigerationYAxisList", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">半径列表：</span> <input
			id="refrigerationRadiusList" name="refrigerationRadiusList"
			type="text"
			value="<%=prefs.getValue("refrigerationRadiusList", "")%>">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="ftitle">
		<span>客流量配置</span><span class="title-back">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">导出列头名称：</span> <input
			id="passengerExpColumnName" name="passengerExpColumnName" type="text"
			value="<%=prefs.getValue("passengerExpColumnName", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例图形宽度：</span> <input
			id="passengerSymbolWidth" name="passengerSymbolWidth" type="text"
			value="<%=prefs.getValue("passengerSymbolWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">背景颜色：</span> <input
			id="passengerChartColor" name="passengerChartColor" type="text"
			value="<%=prefs.getValue("passengerChartColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">填充颜色列表：</span> <input
			id="passengerFillColorList" name="passengerFillColorList" type="text"
			value="<%=prefs.getValue("passengerFillColorList", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">连接线宽：</span> <input
			id="passengerConnectLineWidth" name="passengerConnectLineWidth"
			title="为空则默认为2，为0则不显示连接线" type="text"
			value="<%=prefs.getValue("passengerConnectLineWidth", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例列表：</span> <input
			id="passengerChartLegendList" name="passengerChartLegendList"
			type="text"
			value="<%=prefs.getValue("passengerChartLegendList", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">颜色列表：</span> <input
			id="passengerChartColorList" name="passengerChartColorList"
			type="text"
			value="<%=prefs.getValue("passengerChartColorList", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">曲线点类型：</span> <select
			id="passengerSymbol" name="passengerSymbol" style="width: 29.5%">
			<option value="circle">圆点</option>
			<option value="square">正方形</option>
			<option value="diamond">方形</option>
			<option value="triangle">三角形</option>
			<option value="triangle-down">倒三角</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">小数位数：</span> <select
			id="passengerDecimals" name="passengerDecimals" style="width: 29.5%">
			<option value="0.00">保留两位小数</option>
			<option value="0.0">保留一位小数</option>
			<option value="0">取整数</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线宽：</span> <input
			id="passengerLineWidth" name="passengerLineWidth" type="text"
			value="<%=prefs.getValue("passengerLineWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴间隔：</span> <input
			id="passengerXStep" name="passengerXStep" type="text"
			value="<%=prefs.getValue("passengerXStep", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线样式：</span> <input
			id="passengerGridLineStyle" name="passengerGridLineStyle" type="text"
			value="<%=prefs.getValue("passengerGridLineStyle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型1：</span> <select
			id="passengerChartType1" name="passengerChartType1"
			style="width: 29.5%">
			<option value="line">曲线图</option>
			<option value="column">柱状图</option>
			<option value="area">面积图</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型2：</span> <select
			id="passengerChartType2" name="passengerChartType2"
			style="width: 29.5%">
			<option value="line">曲线图</option>
			<option value="column">柱状图</option>
			<option value="area">面积图</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">显示X轴网格线：</span> <select
			id="passengerShowX" name="passengerShowX" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">显示Y轴网格线:</span> <select
			id="passengerShowY" name="passengerShowY" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴左标题：</span> <input
			id="passengerYLeftTitle" name="passengerYLeftTitle" type="text"
			value="<%=prefs.getValue("passengerYLeftTitle", "")%>">
	</div>

	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴右标题：</span> <input
			id="passengerYRightTitle" name="passengerYRightTitle" type="text"
			value="<%=prefs.getValue("passengerYRightTitle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">左标题颜色：</span> <input
			id="passengerLeftColor" name="passengerLeftColor" type="text"
			value="<%=prefs.getValue("passengerLeftColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">右标题颜色：</span> <input
			id="passengerRightColor" name="passengerRightColor" type="text"
			value="<%=prefs.getValue("passengerRightColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴标签颜色：</span> <input
			id="passengerYLabelColor" name="passengerYLabelColor" type="text"
			value="<%=prefs.getValue("passengerYLabelColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴标签颜色：</span> <input
			id="passengerXLabelColor" name="passengerXLabelColor" type="text"
			value="<%=prefs.getValue("passengerXLabelColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴颜色：</span> <input
			id="passengerYColor" name="passengerYColor" type="text"
			value="<%=prefs.getValue("passengerYColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴颜色：</span> <input
			id="passengerXColor" name="passengerXColor" type="text"
			value="<%=prefs.getValue("passengerXColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">网格线颜色：</span> <input
			id="passengerGridLineColor" name="passengerGridLineColor" type="text"
			value="<%=prefs.getValue("passengerGridLineColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例字体颜色：</span> <input
			id="passengerLegendColor" name="passengerLegendColor" type="text"
			value="<%=prefs.getValue("passengerLegendColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴单位：</span> <input
			id="passengerYSymbol" name="passengerYSymbol" type="text"
			value="<%=prefs.getValue("passengerYSymbol", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴宽度：</span> <input
			id="passengerYWidth" name="passengerYWidth" type="text"
			value="<%=prefs.getValue("passengerYWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴数据列表：</span> <input
			id="passengerYAxisList" name="passengerYAxisList" type="text"
			value="<%=prefs.getValue("passengerYAxisList", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">半径列表：</span> <input
			id="passengerRadiusList" name="passengerRadiusList" type="text"
			value="<%=prefs.getValue("passengerRadiusList", "")%>">
	</div>
</div>

<script type="text/javascript">
//建筑总体公用信息——用电量部分
$("#electricityDecimals").val('<%=prefs.getValue("electricityDecimals", "")%>');
$("#electricityChartType1").val('<%=prefs.getValue("electricityChartType1", "")%>');
$("#electricityChartType2").val('<%=prefs.getValue("electricityChartType2", "")%>');
$("#electricityShowX").val('<%=prefs.getValue("electricityShowX", "")%>');
$("#electricityShowY").val('<%=prefs.getValue("electricityShowY", "")%>');
$("#electricitySymbol").val('<%=prefs.getValue("electricitySymbol", "")%>');
//建筑总体公用信息——制冷量部分
$("#refrigerationDecimals").val('<%=prefs.getValue("refrigerationDecimals", "")%>');
$("#refrigerationChartType1").val('<%=prefs.getValue("refrigerationChartType1", "")%>');
$("#refrigerationChartType2").val('<%=prefs.getValue("refrigerationChartType2", "")%>');
$("#refrigerationShowX").val('<%=prefs.getValue("refrigerationShowX", "")%>');
$("#refrigerationShowY").val('<%=prefs.getValue("refrigerationShowY", "")%>');
$("#refrigerationSymbol").val('<%=prefs.getValue("refrigerationSymbol", "")%>');
//建筑总体公用信息——客流量部分
$("#passengerDecimals").val('<%=prefs.getValue("passengerDecimals", "")%>');
$("#passengerChartType1").val('<%=prefs.getValue("passengerChartType1", "")%>');
$("#passengerChartType2").val('<%=prefs.getValue("passengerChartType2", "")%>');
$("#passengerShowX").val('<%=prefs.getValue("passengerShowX", "")%>');
$("#passengerShowY").val('<%=prefs.getValue("passengerShowY", "")%>');
$("#passengerSymbol").val('<%=prefs.getValue("passengerSymbol", "")%>');
</script>