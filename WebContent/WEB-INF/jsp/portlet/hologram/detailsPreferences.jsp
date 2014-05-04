<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-12-18 下午16:10
	LastModified Date:
	Description: 全息图——楼栋详情首选项页面
 -->
<div class="div-table-row">
	<div class="ftitle">
		<span>层用电量及温度公共信息</span><span class="title-back">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">背景颜色：</span> <input
			id="floorEctChartColor" name="floorEctChartColor" type="text"
			value="<%=prefs.getValue("floorEctChartColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">填充颜色列表：</span> <input
			id="floorEctFillColor" name="floorEctFillColor" type="text"
			value="<%=prefs.getValue("floorEctFillColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">连接线宽：</span> <input
			id="floorEctConnLine" name="floorEctConnLine"
			title="为空则默认为2，为0则不显示连接线" type="text"
			value="<%=prefs.getValue("floorEctConnLine", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例列表：</span> <input
			id="floorEctLegendList" name="floorEctLegendList" type="text"
			value="<%=prefs.getValue("floorEctLegendList", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">颜色列表：</span> <input
			id="floorEctColorList" name="floorEctColorList" type="text"
			value="<%=prefs.getValue("floorEctColorList", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">曲线点类型：</span> <select
			id="floorEctSymbol" name="floorEctSymbol" style="width: 29.5%">
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
			id="floorEctDecimals" name="floorEctDecimals" style="width: 29.5%">
			<option value="0.00">保留两位小数</option>
			<option value="0.0">保留一位小数</option>
			<option value="0">取整数</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线宽：</span> <input
			id="floorEctLineWidth" name="floorEctLineWidth" type="text"
			value="<%=prefs.getValue("floorEctLineWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴间隔：</span> <input
			id="floorEctXStep" name="floorEctXStep" type="text"
			value="<%=prefs.getValue("floorEctXStep", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线样式：</span> <input
			id="floorEctGridStyle" name="floorEctGridStyle" type="text"
			value="<%=prefs.getValue("floorEctGridStyle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型1：</span> <select
			id="floorEctChartType1" name="floorEctChartType1"
			style="width: 29.5%">
			<option value="line">曲线图</option>
			<option value="column">柱状图</option>
			<option value="area">面积图</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型2：</span> <select
			id="floorEctChartType2" name="floorEctChartType2"
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
			id="floorEctShowX" name="floorEctShowX" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">显示Y轴网格线:</span> <select
			id="floorEctShowY" name="floorEctShowY" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴左标题：</span> <input
			id="floorEctLeftTitle" name="floorEctLeftTitle" type="text"
			value="<%=prefs.getValue("floorEctLeftTitle", "")%>">
	</div>

	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴右标题：</span> <input
			id="floorEctRightTitle" name="floorEctRightTitle" type="text"
			value="<%=prefs.getValue("floorEctRightTitle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴单位：</span> <input
			id="floorEctYSymbol" name="floorEctYSymbol" type="text"
			value="<%=prefs.getValue("floorEctYSymbol", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴数据列表：</span> <input
			id="floorEctYAxis" name="floorEctYAxis" type="text"
			value="<%=prefs.getValue("floorEctYAxis", "")%>">
	</div>
</div>

<div class="div-table-row">

	<div class="div-table-2col">
		<span class="spanwidth" align="right">半径列表：</span> <input
			id="floorEctRadius" name="floorEctRadius" type="text"
			value="<%=prefs.getValue("floorEctRadius", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">导出列头名称：</span> <input
			id="floorEctExpColumn" name="floorEctExpColumn" type="text"
			value="<%=prefs.getValue("floorEctExpColumn", "")%>">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="ftitle">
		<span>层Co2浓度公共信息</span><span class="title-back">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">背景颜色：</span> <input
			id="floorCo2ChartColor" name="floorCo2ChartColor" type="text"
			value="<%=prefs.getValue("floorCo2ChartColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">填充颜色列表：</span> <input
			id="floorCo2FillColor" name="floorCo2FillColor" type="text"
			value="<%=prefs.getValue("floorCo2FillColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">连接线宽：</span> <input
			id="floorCo2ConnLine" name="floorCo2ConnLine"
			title="为空则默认为2，为0则不显示连接线" type="text"
			value="<%=prefs.getValue("floorCo2ConnLine", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例列表：</span> <input
			id="floorCo2LegendList" name="floorCo2LegendList" type="text"
			value="<%=prefs.getValue("floorCo2LegendList", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">颜色列表：</span> <input
			id="floorCo2ColorList" name="floorCo2ColorList" type="text"
			value="<%=prefs.getValue("floorCo2ColorList", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">曲线点类型：</span> <select
			id="floorCo2Symbol" name="floorCo2Symbol" style="width: 29.5%">
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
			id="floorCo2Decimals" name="floorCo2Decimals" style="width: 29.5%">
			<option value="0.00">保留两位小数</option>
			<option value="0.0">保留一位小数</option>
			<option value="0">取整数</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线宽：</span> <input
			id="floorCo2LineWidth" name="floorCo2LineWidth" type="text"
			value="<%=prefs.getValue("floorCo2LineWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴间隔：</span> <input
			id="floorCo2XStep" name="floorCo2XStep" type="text"
			value="<%=prefs.getValue("floorCo2XStep", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线样式：</span> <input
			id="floorCo2GridStyle" name="floorCo2GridStyle" type="text"
			value="<%=prefs.getValue("floorCo2GridStyle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型1：</span> <select
			id="floorCo2ChartType1" name="floorCo2ChartType1"
			style="width: 29.5%">
			<option value="line">曲线图</option>
			<option value="column">柱状图</option>
			<option value="area">面积图</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型2：</span> <select
			id="floorCo2ChartType2" name="floorCo2ChartType2"
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
			id="floorCo2ShowX" name="floorCo2ShowX" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">显示Y轴网格线:</span> <select
			id="floorCo2ShowY" name="floorCo2ShowY" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴左标题：</span> <input
			id="floorCo2LeftTitle" name="floorCo2LeftTitle" type="text"
			value="<%=prefs.getValue("floorCo2LeftTitle", "")%>">
	</div>

	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴右标题：</span> <input
			id="floorCo2RightTitle" name="floorCo2RightTitle" type="text"
			value="<%=prefs.getValue("floorCo2RightTitle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴单位：</span> <input
			id="floorCo2YSymbol" name="floorCo2YSymbol" type="text"
			value="<%=prefs.getValue("floorCo2YSymbol", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴数据列表：</span> <input
			id="floorCo2YAxis" name="floorCo2YAxis" type="text"
			value="<%=prefs.getValue("floorCo2YAxis", "")%>">
	</div>
</div>

<div class="div-table-row">

	<div class="div-table-2col">
		<span class="spanwidth" align="right">半径列表：</span> <input
			id="floorCo2Radius" name="floorCo2Radius" type="text"
			value="<%=prefs.getValue("floorCo2Radius", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">导出列头名称：</span> <input
			id="floorCo2ExpColumn" name="floorCo2ExpColumn" type="text"
			value="<%=prefs.getValue("floorCo2ExpColumn", "")%>">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="ftitle">
		<span>层设备列表公共信息</span><span class="title-back">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">日视图特有列：</span> <input
			id="dayColumn" name="dayColumn" type="text"
			value="<%=prefs.getValue("dayColumn", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">公用列信息：</span> <input
			id="equipment_colName" name="equipment_colName" type="text"
			value="<%=prefs.getValue("equipment_colName", "")%>">
	</div>
</div>

<br /><br />

<div class="div-table-row">
	<div class="ftitle">
		<span>区域用电量及温度公共信息</span><span class="title-back">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">背景颜色：</span> <input
			id="areaEctChartColor" name="areaEctChartColor" type="text"
			value="<%=prefs.getValue("areaEctChartColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">填充颜色列表：</span> <input
			id="areaEctFillColor" name="areaEctFillColor" type="text"
			value="<%=prefs.getValue("areaEctFillColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">连接线宽：</span> <input
			id="areaEctConnLine" name="areaEctConnLine"
			title="为空则默认为2，为0则不显示连接线" type="text"
			value="<%=prefs.getValue("areaEctConnLine", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例列表：</span> <input
			id="areaEctLegendList" name="areaEctLegendList" type="text"
			value="<%=prefs.getValue("areaEctLegendList", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">颜色列表：</span> <input
			id="areaEctColorList" name="areaEctColorList" type="text"
			value="<%=prefs.getValue("areaEctColorList", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">曲线点类型：</span> <select
			id="areaEctSymbol" name="areaEctSymbol" style="width: 29.5%">
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
			id="areaEctDecimals" name="areaEctDecimals" style="width: 29.5%">
			<option value="0.00">保留两位小数</option>
			<option value="0.0">保留一位小数</option>
			<option value="0">取整数</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线宽：</span> <input
			id="areaEctLineWidth" name="areaEctLineWidth" type="text"
			value="<%=prefs.getValue("areaEctLineWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴间隔：</span> <input
			id="areaEctXStep" name="areaEctXStep" type="text"
			value="<%=prefs.getValue("areaEctXStep", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线样式：</span> <input
			id="areaEctGridStyle" name="areaEctGridStyle" type="text"
			value="<%=prefs.getValue("areaEctGridStyle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型1：</span> <select
			id="areaEctChartType1" name="areaEctChartType1"
			style="width: 29.5%">
			<option value="line">曲线图</option>
			<option value="column">柱状图</option>
			<option value="area">面积图</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型2：</span> <select
			id="areaEctChartType2" name="areaEctChartType2"
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
			id="areaEctShowX" name="areaEctShowX" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">显示Y轴网格线:</span> <select
			id="areaEctShowY" name="areaEctShowY" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴左标题：</span> <input
			id="areaEctLeftTitle" name="areaEctLeftTitle" type="text"
			value="<%=prefs.getValue("areaEctLeftTitle", "")%>">
	</div>

	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴右标题：</span> <input
			id="areaEctRightTitle" name="areaEctRightTitle" type="text"
			value="<%=prefs.getValue("areaEctRightTitle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴单位：</span> <input
			id="areaEctYSymbol" name="areaEctYSymbol" type="text"
			value="<%=prefs.getValue("areaEctYSymbol", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴数据列表：</span> <input
			id="areaEctYAxis" name="areaEctYAxis" type="text"
			value="<%=prefs.getValue("areaEctYAxis", "")%>">
	</div>
</div>

<div class="div-table-row">

	<div class="div-table-2col">
		<span class="spanwidth" align="right">半径列表：</span> <input
			id="areaEctRadius" name="areaEctRadius" type="text"
			value="<%=prefs.getValue("areaEctRadius", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">导出列头名称：</span> <input
			id="areaEctExpColumn" name="areaEctExpColumn" type="text"
			value="<%=prefs.getValue("areaEctExpColumn", "")%>">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="ftitle">
		<span>区域Co2浓度公共信息</span><span class="title-back">
	</div>
</div>

<br />

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">背景颜色：</span> <input
			id="areaCo2ChartColor" name="areaCo2ChartColor" type="text"
			value="<%=prefs.getValue("areaCo2ChartColor", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">填充颜色列表：</span> <input
			id="areaCo2FillColor" name="areaCo2FillColor" type="text"
			value="<%=prefs.getValue("areaCo2FillColor", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">连接线宽：</span> <input
			id="areaCo2ConnLine" name="areaCo2ConnLine"
			title="为空则默认为2，为0则不显示连接线" type="text"
			value="<%=prefs.getValue("areaCo2ConnLine", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">图例列表：</span> <input
			id="areaCo2LegendList" name="areaCo2LegendList" type="text"
			value="<%=prefs.getValue("areaCo2LegendList", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">颜色列表：</span> <input
			id="areaCo2ColorList" name="areaCo2ColorList" type="text"
			value="<%=prefs.getValue("areaCo2ColorList", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">曲线点类型：</span> <select
			id="areaCo2Symbol" name="areaCo2Symbol" style="width: 29.5%">
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
			id="areaCo2Decimals" name="areaCo2Decimals" style="width: 29.5%">
			<option value="0.00">保留两位小数</option>
			<option value="0.0">保留一位小数</option>
			<option value="0">取整数</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线宽：</span> <input
			id="areaCo2LineWidth" name="areaCo2LineWidth" type="text"
			value="<%=prefs.getValue("areaCo2LineWidth", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">X轴间隔：</span> <input
			id="areaCo2XStep" name="areaCo2XStep" type="text"
			value="<%=prefs.getValue("areaCo2XStep", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">线样式：</span> <input
			id="areaCo2GridStyle" name="areaCo2GridStyle" type="text"
			value="<%=prefs.getValue("areaCo2GridStyle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型1：</span> <select
			id="areaCo2ChartType1" name="areaCo2ChartType1"
			style="width: 29.5%">
			<option value="line">曲线图</option>
			<option value="column">柱状图</option>
			<option value="area">面积图</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">表类型2：</span> <select
			id="areaCo2ChartType2" name="areaCo2ChartType2"
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
			id="areaCo2ShowX" name="areaCo2ShowX" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">显示Y轴网格线:</span> <select
			id="areaCo2ShowY" name="areaCo2ShowY" style="width: 29.5%">
			<option value="1">显示</option>
			<option value="0">不显示</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴左标题：</span> <input
			id="areaCo2LeftTitle" name="areaCo2LeftTitle" type="text"
			value="<%=prefs.getValue("areaCo2LeftTitle", "")%>">
	</div>

	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴右标题：</span> <input
			id="areaCo2RightTitle" name="areaCo2RightTitle" type="text"
			value="<%=prefs.getValue("areaCo2RightTitle", "")%>">
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴单位：</span> <input
			id="areaCo2YSymbol" name="areaCo2YSymbol" type="text"
			value="<%=prefs.getValue("areaCo2YSymbol", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">Y轴数据列表：</span> <input
			id="areaCo2YAxis" name="areaCo2YAxis" type="text"
			value="<%=prefs.getValue("areaCo2YAxis", "")%>">
	</div>
</div>

<div class="div-table-row">

	<div class="div-table-2col">
		<span class="spanwidth" align="right">半径列表：</span> <input
			id="areaCo2Radius" name="areaCo2Radius" type="text"
			value="<%=prefs.getValue("areaCo2Radius", "")%>">
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">导出列头名称：</span> <input
			id="areaCo2ExpColumn" name="areaCo2ExpColumn" type="text"
			value="<%=prefs.getValue("areaCo2ExpColumn", "")%>">
	</div>
</div>

<!-- 是否显示需要的模块 -->
<div class="div-table-row">
	<div class="ftitle">
		<span>控制是否显示对应模块</span><span class="title-back">
	</div>
</div>
<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">全息图客流量：</span> <select
			id="isShowPassenger" name="isShowPassenger" style="width: 29.5%">
			<option value="block">显示</option>
			<option value="none">不显示</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">层参数平铺:</span> <select
			id="f_params_repeat" name="f_params_repeat" style="width: 29.5%">
			<option value="yes">平铺</option>
			<option value="no">不平铺</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">平面图：</span> <select
			id="isShowPlan" name="isShowPlan" style="width: 29.5%">
			<option value="block">显示</option>
			<option value="none">不显示</option>
		</select>
	</div>
	<div class="div-table-2col">
		<span class="spanwidth" align="right">区域用电：</span> <select
			id="isShowRegion" name="isShowRegion" style="width: 29.5%">
			<option value="block">显示</option>
			<option value="none">不显示</option>
		</select>
	</div>
</div>

<div class="div-table-row">
	<div class="div-table-2col">
		<span class="spanwidth" align="right">层CO2浓度：</span> <select
			id="isShowCo2" name="isShowCo2" style="width: 29.5%">
			<option value="block">显示</option>
			<option value="none">不显示</option>
		</select>
	</div>
</div>

<script type="text/javascript">
//楼栋层用电量及温度部分
$("#floorEctDecimals").val('<%=prefs.getValue("floorEctDecimals","")%>');
$("#floorEctChartType1").val('<%=prefs.getValue("floorEctChartType1","")%>');
$("#floorEctChartType2").val('<%=prefs.getValue("floorEctChartType2","")%>');
$("#floorEctShowX").val('<%=prefs.getValue("floorEctShowX","")%>');
$("#floorEctShowY").val('<%=prefs.getValue("floorEctShowY","")%>');
$("#floorEctSymbol").val('<%=prefs.getValue("floorEctSymbol","")%>');
//楼栋层Co2浓度部分
$("#floorCo2Decimals").val('<%=prefs.getValue("floorCo2Decimals","")%>');
$("#floorCo2ChartType1").val('<%=prefs.getValue("floorCo2ChartType1","")%>');
$("#floorCo2ChartType2").val('<%=prefs.getValue("floorCo2ChartType2","")%>');
$("#floorCo2ShowX").val('<%=prefs.getValue("floorCo2ShowX","")%>');
$("#floorCo2ShowY").val('<%=prefs.getValue("floorCo2ShowY","")%>');
$("#floorCo2Symbol").val('<%=prefs.getValue("floorCo2Symbol","")%>');

//楼栋区域用电量及温度部分
$("#areaEctDecimals").val('<%=prefs.getValue("areaEctDecimals","")%>');
$("#areaEctChartType1").val('<%=prefs.getValue("areaEctChartType1","")%>');
$("#areaEctChartType2").val('<%=prefs.getValue("areaEctChartType2","")%>');
$("#areaEctShowX").val('<%=prefs.getValue("areaEctShowX","")%>');
$("#areaEctShowY").val('<%=prefs.getValue("areaEctShowY","")%>');
$("#areaEctSymbol").val('<%=prefs.getValue("areaEctSymbol","")%>');
//楼栋区域Co2浓度部分
$("#areaCo2Decimals").val('<%=prefs.getValue("areaCo2Decimals","")%>');
$("#areaCo2ChartType1").val('<%=prefs.getValue("areaCo2ChartType1","")%>');
$("#areaCo2ChartType2").val('<%=prefs.getValue("areaCo2ChartType2","")%>');
$("#areaCo2ShowX").val('<%=prefs.getValue("areaCo2ShowX","")%>');
$("#areaCo2ShowY").val('<%=prefs.getValue("areaCo2ShowY","")%>');
$("#areaCo2Symbol").val('<%=prefs.getValue("areaCo2Symbol","")%>');
// 是否显示
$("#isShowPassenger").val('<%=prefs.getValue("isShowPassenger","")%>');
$("#isShowPlan").val('<%=prefs.getValue("isShowPlan","")%>');
$("#isShowRegion").val('<%=prefs.getValue("isShowRegion","")%>');
$("#f_params_repeat").val('<%=prefs.getValue("f_params_repeat","")%>');
</script>