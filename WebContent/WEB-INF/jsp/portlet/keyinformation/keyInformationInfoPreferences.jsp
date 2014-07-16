<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 关键信息首选项页面
 -->
<style type="text/css">
.spanwidth {
	width: 130px;
	margin-top: 5px;
}
</style>

<portlet:actionURL var="savePreferencesUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>

<div id="msg"></div>

<form:form commandName="preferenceinfo" id="coreinfo" method="post"
	class="tb_space" action="#" style="background-color: white;">

	<br />
	<div class="ftitle">
		<a style="color: #666;"
			href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a>
	</div>
	<br />

	<div class="div-table">
		<!-- 建筑基本信息配置项 -->
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="ftitle">
					<span>建筑基本信息</span><span class="title-back"></span>
				</div>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">选择建筑：</span> <input
					id="buildId" name="buildId" type="text"
					value="<%=prefs.getValue("buildId", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">建筑描述：</span> <input
					id="description" name="description" type="text"
					value="<%=prefs.getValue("description", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">模块背景颜色：</span> <input
					id="backgroundColor" name="backgroundColor" type="text"
					value="<%=prefs.getValue("backgroundColor", "")%>">
			</div>
		</div>
		<!-- 室外状态配置项 -->
		<br />
		<br />
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="ftitle">
					<span>室外状态</span>
				</div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="choose_name1" name="choose_name1" type="text"
					value="<%=prefs.getValue("choose_name1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="choose_id1" name="choose_id1" type="text"
					value="<%=prefs.getValue("choose_id1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input id="ispd1"
					name="ispd1" type="text" value="<%=prefs.getValue("ispd1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title1"
					name="title1" type="text" value="<%=prefs.getValue("title1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description_1" name="description_1" type="text"
					value="<%=prefs.getValue("description_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals1" name="decimals1" style="width: 29.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">模块背景颜色：</span> <input
					id="backgroundColor_1" name="backgroundColor_1" type="text"
					value="<%=prefs.getValue("backgroundColor_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型：</span> <select
					id="chartType_1" name="chartType_1" style="width: 29.5%">
					<option value="spline">双曲线图</option>
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_1" name="xStep_1" type="text"
					value="<%=prefs.getValue("xStep_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime1" name="defaulttime1" type="text"
					value="<%=prefs.getValue("defaulttime1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左侧标题：</span> <input
					id="yLeftTitle" name="yLeftTitle" type="text"
					value="<%=prefs.getValue("yLeftTitle", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右侧标题：</span> <input
					id="yRightTitle" name="yRightTitle" type="text"
					value="<%=prefs.getValue("yRightTitle", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴网格线：</span> <select
					id="showXGridLine1" name="showXGridLine1" style="width: 29.5%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴网格线：</span> <select
					id="showYGridLine1" name="showYGridLine1" style="width: 29.5%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表中线样式：</span> <input
					id="gridLineDashStyle" name="gridLineDashStyle" type="text"
					value="<%=prefs.getValue("gridLineDashStyle", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="chartFillColorList" name="chartFillColorList" type="text"
					value="<%=prefs.getValue("chartFillColorList", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth" name="lineWidth" type="text"
					value="<%=prefs.getValue("lineWidth", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表图例列表：</span> <input
					id="chartLegendList" name="chartLegendList" type="text"
					value="<%=prefs.getValue("chartLegendList", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">点类型列表：</span> <input
					id="chartSymbolList" name="chartSymbolList" type="text"
					value="<%=prefs.getValue("chartSymbolList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">点半径列表：</span> <input
					id="chartRadiusList" name="chartRadiusList" type="text"
					value="<%=prefs.getValue("chartRadiusList", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴显示间隔：</span> <input
					id="yStep_1" name="yStep_1" type="text"
					value="<%=prefs.getValue("yStep_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴数据列表：</span> <input
					id="chartYAxisList" name="chartYAxisList" type="text"
					value="<%=prefs.getValue("chartYAxisList", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表颜色列表：</span> <input
					id="chartColorList" name="chartColorList" type="text"
					value="<%=prefs.getValue("chartColorList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName1" name="expColumnName1" type="text"
					value="<%=prefs.getValue("expColumnName1", "")%>">
			</div>
		</div>

		<br />
		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div class="ftitle">
					<span>客流量</span>
				</div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="choose_name2" name="choose_name2" type="text"
					value="<%=prefs.getValue("choose_name2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="choose_id2" name="choose_id2" type="text"
					value="<%=prefs.getValue("choose_id2", "")%>">
			</div>
		</div>


		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input id="ispd2"
					name="ispd2" type="text" value="<%=prefs.getValue("ispd2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_2" name="xStep_2" type="text"
					value="<%=prefs.getValue("xStep_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title2"
					name="title2" type="text" value="<%=prefs.getValue("title2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description_2" name="description_2" type="text"
					value="<%=prefs.getValue("description_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">模块背景颜色：</span> <input
					id="backgroundColor_2" name="backgroundColor_2" type="text"
					value="<%=prefs.getValue("backgroundColor_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表中线样式：</span> <input
					id="gridLineDashStyle2" name="gridLineDashStyle2" type="text"
					value="<%=prefs.getValue("gridLineDashStyle2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型1：</span> <select
					id="chartType_2_1" name="chartType_2_1" style="width: 25.0%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <select
					id="chartType_2_2" name="chartType_2_2" style="width: 25.0%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴网格线：</span> <select
					id="showXGridLine2" name="showXGridLine2" style="width: 25.0%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴网格线：</span> <select
					id="showYGridLine2" name="showYGridLine2" style="width: 25.0%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左侧标题：</span> <input
					id="yLeftTitle_2" name="yLeftTitle_2" type="text"
					value="<%=prefs.getValue("yLeftTitle_2", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右侧标题：</span> <input
					id="yRightTitle_2" name="yRightTitle_2" type="text"
					value="<%=prefs.getValue("yRightTitle_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="yLeftTitle_2" name="ySymbol2" type="text"
					value="<%=prefs.getValue("ySymbol2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals2" name="decimals2" style="width: 25.0%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColorList_2" name="chartColorList_2" type="text"
					value="<%=prefs.getValue("chartColorList_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="chartFillColorList_2" name="chartFillColorList_2" type="text"
					value="<%=prefs.getValue("chartFillColorList_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegendList_2" name="chartLegendList_2" type="text"
					value="<%=prefs.getValue("chartLegendList_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表半径列表：</span> <input
					id="chartRadiusList_2" name="chartRadiusList_2" type="text"
					value="<%=prefs.getValue("chartRadiusList_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">连接线线宽：</span> <input
					id="connectLineWidth_2" name="connectLineWidth_2"
					title="为空则默认为2，为0则不显示连接线" type="text"
					value="<%=prefs.getValue("connectLineWidth_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth_2" name="lineWidth_2" type="text"
					value="<%=prefs.getValue("lineWidth_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol2" name="symbol2" style="width: 25.0%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴数据列表：</span> <input
					id="chartYAxisList_2" name="chartYAxisList_2" type="text"
					value="<%=prefs.getValue("chartYAxisList_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime2" name="defaulttime2" type="text"
					value="<%=prefs.getValue("defaulttime2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName2" name="expColumnName2" type="text"
					value="<%=prefs.getValue("expColumnName2", "")%>">
			</div>
		</div>

		<br /> <br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑总能耗</span>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="choose_name3" name="choose_name3" type="text"
					value="<%=prefs.getValue("choose_name3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="choose_id3" name="choose_id3" type="text"
					value="<%=prefs.getValue("choose_id3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input id="ispd3"
					name="ispd3" type="text" value="<%=prefs.getValue("ispd3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_3" name="xStep_3" type="text"
					value="<%=prefs.getValue("xStep_3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title3"
					name="title3" type="text" value="<%=prefs.getValue("title3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description_3" name="description_3" type="text"
					value="<%=prefs.getValue("description_3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">模块背景颜色：</span> <input
					id="backgroundColor_3" name="backgroundColor_3" type="text"
					value="<%=prefs.getValue("backgroundColor_3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表中线样式：</span> <input
					id="gridLineDashStyle3" name="gridLineDashStyle3" type="text"
					value="<%=prefs.getValue("gridLineDashStyle3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型1：</span> <select
					id="chartType_3_1" name="chartType_3_1" style="width: 29.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <select
					id="chartType_3_2" name="chartType_3_2" style="width: 29.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴网格线：</span> <select
					id="showXGridLine3" name="showXGridLine3" style="width: 29.5%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴网格线：</span> <select
					id="showYGridLine3" name="showYGridLine3" style="width: 29.5%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左侧标题：</span> <input
					id="yLeftTitle_3" name="yLeftTitle_3" type="text"
					value="<%=prefs.getValue("yLeftTitle_3", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右侧标题：</span> <input
					id="yRightTitle_3" name="yRightTitle_3" type="text"
					value="<%=prefs.getValue("yRightTitle_3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="yLeftTitle_3" name="ySymbol3" type="text"
					value="<%=prefs.getValue("ySymbol3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals3" name="decimals3" style="width: 29.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColorList_3" name="chartColorList_3" type="text"
					value="<%=prefs.getValue("chartColorList_3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="chartFillColorList_3" name="chartFillColorList_3" type="text"
					value="<%=prefs.getValue("chartFillColorList_3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegendList_3" name="chartLegendList_3" type="text"
					value="<%=prefs.getValue("chartLegendList_3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表半径列表：</span> <input
					id="chartRadiusList_3" name="chartRadiusList_3" type="text"
					value="<%=prefs.getValue("chartRadiusList_3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">连接线线宽：</span> <input
					id="connectLineWidth_3" name="connectLineWidth_3"
					title="为空则默认为2，为0则不显示连接线" type="text"
					value="<%=prefs.getValue("connectLineWidth_3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth_3" name="lineWidth_3" type="text"
					value="<%=prefs.getValue("lineWidth_3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol3" name="symbol3" style="width: 29.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴数据列表：</span> <input
					id="chartYAxisList_3" name="chartYAxisList_3" type="text"
					value="<%=prefs.getValue("chartYAxisList_3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime3" name="defaulttime3" type="text"
					value="<%=prefs.getValue("defaulttime3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName3" name="expColumnName3" type="text"
					value="<%=prefs.getValue("expColumnName3", "")%>">
			</div>
		</div>

		<br /> <br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑总用电量</span>
			</div>
		</div>

		<br />
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="choose_name4" name="choose_name4" type="text"
					value="<%=prefs.getValue("choose_name4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="choose_id4" name="choose_id4" type="text"
					value="<%=prefs.getValue("choose_id4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input id="ispd4"
					name="ispd4" type="text" value="<%=prefs.getValue("ispd4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_4" name="xStep_4" type="text"
					value="<%=prefs.getValue("xStep_4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title4"
					name="title4" type="text" value="<%=prefs.getValue("title4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description_4" name="description_4" type="text"
					value="<%=prefs.getValue("description_4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">模块背景颜色：</span> <input
					id="backgroundColor_4" name="backgroundColor_4" type="text"
					value="<%=prefs.getValue("backgroundColor_4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表中线样式：</span> <input
					id="gridLineDashStyle4" name="gridLineDashStyle4" type="text"
					value="<%=prefs.getValue("gridLineDashStyle4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型1：</span> <select
					id="chartType_4_1" name="chartType_4_1" style="width: 29.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <select
					id="chartType_4_2" name="chartType_4_2" style="width: 29.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴网格线：</span> <select
					id="showXGridLine4" name="showXGridLine4" style="width: 29.5%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴网格线：</span> <select
					id="showYGridLine4" name="showYGridLine4" style="width: 29.5%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左侧标题：</span> <input
					id="yLeftTitle_4" name="yLeftTitle_4" type="text"
					value="<%=prefs.getValue("yLeftTitle_4", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右侧标题：</span> <input
					id="yRightTitle_4" name="yRightTitle_4" type="text"
					value="<%=prefs.getValue("yRightTitle_4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="yLeftTitle_4" name="ySymbol4" type="text"
					value="<%=prefs.getValue("ySymbol4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals4" name="decimals4" style="width: 29.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColorList_4" name="chartColorList_4" type="text"
					value="<%=prefs.getValue("chartColorList_4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="chartFillColorList_4" name="chartFillColorList_4" type="text"
					value="<%=prefs.getValue("chartFillColorList_4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegendList_4" name="chartLegendList_4" type="text"
					value="<%=prefs.getValue("chartLegendList_4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表半径列表：</span> <input
					id="chartRadiusList_4" name="chartRadiusList_4" type="text"
					value="<%=prefs.getValue("chartRadiusList_4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">连接线线宽：</span> <input
					id="connectLineWidth_4" name="connectLineWidth_4"
					title="为空则默认为2，为0则不显示连接线" type="text"
					value="<%=prefs.getValue("connectLineWidth_4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth_4" name="lineWidth_4" type="text"
					value="<%=prefs.getValue("lineWidth_4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol4" name="symbol4" style="width: 29.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴数据列表：</span> <input
					id="chartYAxisList_4" name="chartYAxisList_4" type="text"
					value="<%=prefs.getValue("chartYAxisList_4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime4" name="defaulttime4" type="text"
					value="<%=prefs.getValue("defaulttime4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName4" name="expColumnName4" type="text"
					value="<%=prefs.getValue("expColumnName4", "")%>">
			</div>
		</div>

		<br /> <br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div class="ftitle">
					<span>建筑用电分项</span>
				</div>
			</div>
		</div>
		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="choose_name5" name="choose_name5" type="text"
					value="<%=prefs.getValue("choose_name5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="choose_id5" name="choose_id5" type="text"
					value="<%=prefs.getValue("choose_id5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input id="ispd5"
					name="ispd5" type="text" value="<%=prefs.getValue("ispd5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否需要乘数：</span> <input
					id="multiplier" name="multiplier" type="text"
					value="<%=prefs.getValue("multiplier", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">左侧求值Name：</span> <input
					id="valuename" name="valuename" type="text"
					value="<%=prefs.getValue("valuename", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">左侧求值Id：</span> <input
					id="valueid" name="valueid" type="text"
					value="<%=prefs.getValue("valueid", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">左侧求值Ispd：</span> <input
					id="valueispd" name="valueispd" type="text"
					value="<%=prefs.getValue("valueispd", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName5" name="expColumnName5" type="text"
					value="<%=prefs.getValue("expColumnName5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title5"
					name="title5" type="text" value="<%=prefs.getValue("title5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals5" name="decimals5" style="width: 29.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description_5" name="description_5" type="text"
					value="<%=prefs.getValue("description_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime5" name="defaulttime5" type="text"
					value="<%=prefs.getValue("defaulttime5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">模块背景颜色：</span> <input
					id="backgroundColor_5" name="backgroundColor_5" type="text"
					value="<%=prefs.getValue("backgroundColor_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型：</span> <input
					id="chartType_5" name="chartType_5" type="text"
					value="<%=prefs.getValue("chartType_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表图例列表：</span> <input
					id="chartLegendList_5" name="chartLegendList_5" type="text"
					value="<%=prefs.getValue("chartLegendList_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表数据列表：</span> <input
					id="chartDataList_5" name="chartDataList_5" type="text"
					value="<%=prefs.getValue("chartDataList_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表颜色列表：</span> <input
					id="chartColorList_5" name="chartColorList_5" type="text"
					value="<%=prefs.getValue("chartColorList_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例展示方式：</span> <input
					id="chartLegendLayout_5" name="chartLegendLayout_5" type="text"
					value="<%=prefs.getValue("chartLegendLayout_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例对齐方式：</span> <input
					id="chartLegendAlign_5" name="chartLegendAlign_5" type="text"
					value="<%=prefs.getValue("chartLegendAlign_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表字体颜色：</span> <input
					id="chartWordColor" name="chartWordColor" type="text"
					value="<%=prefs.getValue("chartWordColor", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标签与饼图间距：</span> <input
					id="distance" name="distance" type="text"
					value="<%=prefs.getValue("distance", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">连接线宽度：</span> <input
					id="connectLineWidth_5" name="connectLineWidth_5" type="text"
					value="<%=prefs.getValue("connectLineWidth_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">饼图输出项：</span> <input
					id="itemName" name="itemName" type="text"
					value="<%=prefs.getValue("itemName", "")%>">
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑用电分项对比图相关设置</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">y轴标题：</span> <input
					id="yLeftTitle_6" name="yLeftTitle_6" type="text"
					value="<%=prefs.getValue("yLeftTitle_6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">对比图表类型：</span> <select
					id="chartType_6_1" name="chartType_6_1" style="width: 29.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">对比颜色列表：</span> <input
					id="chartColorList_6" name="chartColorList_6" type="text"
					value="<%=prefs.getValue("chartColorList_6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="chartFillColorList_6" name="chartFillColorList_6" type="text"
					value="<%=prefs.getValue("chartFillColorList_6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表半径列表：</span> <input
					id="chartRadiusList_6" name="chartRadiusList_6" type="text"
					value="<%=prefs.getValue("chartRadiusList_6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol6" name="ySymbol6" type="text"
					value="<%=prefs.getValue("ySymbol6", "")%>">
			</div>

		</div>

		<br />
		<br />

		<div id="buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>savePreference()">保存</a>
		</div>
	</div>
</form:form>

<script type="text/javascript">
/**
* 保存
*/
function <portlet:namespace/>savePreference() {
	$("#coreinfo").form('submit', {
		url:'<%=renderResponse.encodeURL(savePreferencesUrl)%>',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
		}
	});
}

/**
* 获取建筑信息列表
*/
$("#buildId").combogrid({
	panelWidth:500,
	value:$("#buildId").val(),
	idField:'buildId',
	textField:'buildName',
	pagination : true,//是否分页  
	rownumbers:true,
	fit: true,
	pageSize: 10,
	pageList: [10,20,30,40,50],
	url:'<portlet:resourceURL id="getBuildinfos"></portlet:resourceURL>',
	columns:[[
		{field:'buildId',title:'建筑编号',width:$(this).width() * 0.1},
		{field:'buildName',title:'建筑名称',width:$(this).width() * 0.1}
	]],keyHandler: {
		up: function(){},
		down: function(){},
		enter: function(){},
		query: function(q){
			$('#buildId').combogrid("grid").datagrid("reload", { 'keyword': q });
            $('#buildId').combogrid("setValue", q);
		}
	}
});

/**
 * 为urlName和urlId赋值
 */
function <portlet:namespace/>setNameAndId(id,choose_name,choose_id,ispd){
	var names = [],ids = [],ispds = [];
	var rows = $('#<portlet:namespace/>'+id).datagrid('getSelections');
	if(rows.length==0){
		alert('请在列表中选择相应的值！');
	}else{
		for(var i=0;i<rows.length;i++){
			names.push(rows[i].name);
			ids.push(rows[i].id);
			ispds.push(rows[i].ispd);
		}
		// 赋值
		$('#'+choose_name).val(names.join(','));
		$('#'+choose_id).val(ids.join(','));
		$('#'+ispd).val(ispds.join(','));
	}
}

/**
 * 为urlName和urlId赋值
 */
function <portlet:namespace/>clear(choose_name,choose_id,ispd){
	// 赋值
	$('#'+choose_name).val('');
	$('#'+choose_id).val('');
	$('#'+ispd).val('');
}

//渲染datagrid
function renderDataGrid(id){
	$("#<portlet:namespace/>"+id).datagrid({
		height : 500,
		width:450,
		rownumbers:true,//序号 
		collapsible:false,//是否可折叠的 
		pagination : true,//是否分页
		rownumbers:true,
		fit: true,
		pageSize: 50,
		pageList: [10,30,50,500,1000],
		url:'<portlet:resourceURL id="getQuerySchemeList"></portlet:resourceURL>',
		frozenColumns : [[{
			field : 'ff',
			checkbox : true,
			sortable : true
		}]],
		fitColumns: true,
		columns:[[
		  	{field:'comments',title:'名称',width:$(this).width() * 0.2},
			{field:'id',title:'urlId',width:$(this).width() * 0.15}, 
			{field:'name',title:'urlName',width:$(this).width() * 0.2},
			{field:'ispd',title:'ispd',width:$(this).width() * 0.1}
		]],
		onLoadSuccess : function (){
			//移除报表页面的tr标签的big_tr样式
			$("tr:even").removeClass("big_tr");
		}
	});
}

//渲染室外状态的效果
$("#chartType_1").val('<%=prefs.getValue("chartType_1","")%>');
$("#chartType_1_1").val('<%=prefs.getValue("chartType_1_1","")%>');
$("#decimals1").val('<%=prefs.getValue("decimals1","")%>');
$("#showXGridLine1").val('<%=prefs.getValue("showXGridLine1","")%>');
$("#showYGridLine1").val('<%=prefs.getValue("showYGridLine1","")%>');
//渲染建筑客流量的效果
$("#chartType_2_1").val('<%=prefs.getValue("chartType_2_1","")%>');
$("#chartType_2_2").val('<%=prefs.getValue("chartType_2_2","")%>');
$("#decimals2").val('<%=prefs.getValue("decimals2","")%>');
$("#showXGridLine2").val('<%=prefs.getValue("showXGridLine2","")%>');
$("#showYGridLine2").val('<%=prefs.getValue("showYGridLine2","")%>');

//渲染 建筑总能耗 的效果
$("#chartType_3_1").val('<%=prefs.getValue("chartType_3_1","")%>');
$("#chartType_3_2").val('<%=prefs.getValue("chartType_3_2","")%>');
$("#decimals3").val('<%=prefs.getValue("decimals3","")%>');
$("#showXGridLine3").val('<%=prefs.getValue("showXGridLine3","")%>');
$("#showYGridLine3").val('<%=prefs.getValue("showYGridLine3","")%>');

//渲染 建筑总用电量 的效果
$("#chartType_4_1").val('<%=prefs.getValue("chartType_4_1","")%>');
$("#chartType_4_2").val('<%=prefs.getValue("chartType_4_2","")%>');
$("#decimals4").val('<%=prefs.getValue("decimals4","")%>');
$("#showXGridLine4").val('<%=prefs.getValue("showXGridLine4","")%>');
$("#showYGridLine4").val('<%=prefs.getValue("showYGridLine4","")%>');

//渲染 建筑用电分项  的效果
$("#decimals5").val('<%=prefs.getValue("decimals5","")%>');
$("#chartType_6_1").val('<%=prefs.getValue("chartType_6_1","")%>');
</script>