<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-15 下午6点52分
	LastModified Date:
	Description: 能耗统计-建筑总体能耗(tab)
 -->

<style type="text/css">
.spanwidth {
	width: 85px;
	margin-top: 5px;
}
</style>


<portlet:actionURL var="savePreferencesUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>

<div id="msg"></div>

<form:form commandName="preferenceinfo" id="buildtotalconsumption"
	method="post" class="" action="#">

	<br />
	<br />

	<div class="ftitle">
		<span class="spanwidth" align="right">增加小时数：</span> <input id="hours"
			name="hours" type="text"
			title="因java代码中获取的时间和系统时间可能存在误差，为避免设置java中的各种文件，用此方式来增加时间以保证时间一致"
			value="<%=prefs.getValue("hours", "")%>">
	</div>

	<br />

	<div class="ftitle">
		<span>建筑总能耗</span><span class="title-back"><a
			href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
	</div>

	<br />
	<div class="div-table">

		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid1"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid1','choose_name1','choose_id1','ispd1')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('choose_name1','choose_id1','ispd1')">清空name/id/ispd</a>
				</div>
			</div>
		</div>

		<br /> <br />

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
				<span class="spanwidth" align="right">y轴标题：</span> <input
					id="yLeftTitle_1" name="yLeftTitle_1" type="text"
					value="<%=prefs.getValue("yLeftTitle_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title1"
					name="title1" type="text" value="<%=prefs.getValue("title1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description_1" name="description_1" type="text"
					value="<%=prefs.getValue("description_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">模块背景颜色：</span> <input
					id="backgroundColor_1" name="backgroundColor_1" type="text"
					value="<%=prefs.getValue("backgroundColor_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">居中标题：</span> <input
					id="centerTitle_1" name="centerTitle_1" type="text"
					value="<%=prefs.getValue("centerTitle_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型1：</span> <select
					id="chartType_1_1" name="chartType_1_1" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <select
					id="chartType_1_2" name="chartType_1_2" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColorList_1" name="chartColorList_1" type="text"
					value="<%=prefs.getValue("chartColorList_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="chartFillColorList_1" name="chartFillColorList_1" type="text"
					value="<%=prefs.getValue("chartFillColorList_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegendList_1" name="chartLegendList_1" type="text"
					value="<%=prefs.getValue("chartLegendList_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表半径列表：</span> <input
					id="chartRadiusList_1" name="chartRadiusList_1" type="text"
					value="<%=prefs.getValue("chartRadiusList_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考图例名称：</span> <input
					id="referenceLegend_1" name="referenceLegend_1" type="text"
					value="<%=prefs.getValue("referenceLegend_1", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考颜色：</span> <input
					id="referenceColor_1" name="referenceColor_1" type="text"
					value="<%=prefs.getValue("referenceColor_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考值：</span> <input
					id="referencevalue1" name="referencevalue1" type="text"
					value="<%=prefs.getValue("referencevalue1", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_1" name="xStep_1" type="text"
					value="<%=prefs.getValue("xStep_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">连接线线宽：</span> <input
					id="connectLineWidth_1" name="connectLineWidth_1"
					title="为空则默认为2，为0则不显示连接线" type="text"
					value="<%=prefs.getValue("connectLineWidth_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth_1" name="lineWidth_1" type="text"
					value="<%=prefs.getValue("lineWidth_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol1" name="symbol1" style="width: 44.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否需要乘数：</span> <input
					id="multiplier_1" name="multiplier_1" type="text"
					value="<%=prefs.getValue("multiplier_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol1" name="ySymbol1" type="text"
					value="<%=prefs.getValue("ySymbol1", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime1" name="defaulttime1" type="text"
					value="<%=prefs.getValue("defaulttime1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals1" name="decimals1" style="width: 44.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName1" name="expColumnName1" type="text"
					value="<%=prefs.getValue("expColumnName1", "")%>">
			</div>
		</div>


		<div class="div-table-row">

			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接名称1：</span> <input
					id="linkName_1_1" name="linkName_1_1" type="text"
					value="<%=prefs.getValue("linkName_1_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接地址1：</span> <input
					id="linkUrl_1_1" name="linkUrl_1_1" type="text"
					value="<%=prefs.getValue("linkUrl_1_1", "")%>">
			</div>

		</div>

		<div class="div-table-row">

			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接名称2：</span> <input
					id="linkName_2_1" name="linkName_2_1" type="text"
					value="<%=prefs.getValue("linkName_2_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接地址2：</span> <input
					id="linkUrl_2_1" name="linkUrl_2_1" type="text"
					value="<%=prefs.getValue("linkUrl_2_1", "")%>">
			</div>

		</div>

		<br /> <br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑总能耗分项：</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid2"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid2','choose_name2','choose_id2','ispd2')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('choose_name2','choose_id2','ispd2')">清空name/id/ispd</a>
				</div>
			</div>
		</div>

		<br /> <br />

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
				<span class="spanwidth" align="right">y轴标题：</span> <input
					id="yLeftTitle_2" name="yLeftTitle_2" type="text"
					value="<%=prefs.getValue("yLeftTitle_2", "")%>">
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
				<span class="spanwidth" align="right">居中标题：</span> <input
					id="centerTitle_2" name="centerTitle_2" type="text"
					value="<%=prefs.getValue("centerTitle_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型1：</span> <select
					id="chartType_2_1" name="chartType_2_1" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <select
					id="chartType_2_2" name="chartType_2_2" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
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
				<span class="spanwidth" align="right">参考图例名称：</span> <input
					id="referenceLegend_2" name="referenceLegend_2" type="text"
					value="<%=prefs.getValue("referenceLegend_2", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考颜色：</span> <input
					id="referenceColor_2" name="referenceColor_2" type="text"
					value="<%=prefs.getValue("referenceColor_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考值：</span> <input
					id="referencevalue2" name="referencevalue2" type="text"
					value="<%=prefs.getValue("referencevalue2", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_2" name="xStep_2" type="text"
					value="<%=prefs.getValue("xStep_2", "")%>">
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
					id="symbol2" name="symbol2" style="width: 44.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol2" name="ySymbol2" type="text"
					value="<%=prefs.getValue("ySymbol2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime2" name="defaulttime2" type="text"
					value="<%=prefs.getValue("defaulttime2", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals2" name="decimals2" style="width: 44.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">

			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接名称1：</span> <input
					id="linkName_1_2" name="linkName_1_2" type="text"
					value="<%=prefs.getValue("linkName_1_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接地址1：</span> <input
					id="linkUrl_1_2" name="linkUrl_1_2" type="text"
					value="<%=prefs.getValue("linkUrl_1_2", "")%>">
			</div>

		</div>

		<div class="div-table-row">

			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接名称2：</span> <input
					id="linkName_2_2" name="linkName_2_2" type="text"
					value="<%=prefs.getValue("linkName_2_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接地址2：</span> <input
					id="linkUrl_2_2" name="linkUrl_2_2" type="text"
					value="<%=prefs.getValue("linkUrl_2_2", "")%>">
			</div>

		</div>

		<br /> <br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑总用电趋势：</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid3"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid3','choose_name3','choose_id3','ispd3')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('choose_name3','choose_id3','ispd3')">清空name/id/ispd</a>
				</div>
			</div>
		</div>

		<br /> <br />

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
				<span class="spanwidth" align="right">y轴标题：</span> <input
					id="yLeftTitle_3" name="yLeftTitle_3" type="text"
					value="<%=prefs.getValue("yLeftTitle_3", "")%>">
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
				<span class="spanwidth" align="right">居中标题：</span> <input
					id="centerTitle_3" name="centerTitle_3" type="text"
					value="<%=prefs.getValue("centerTitle_3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型1：</span> <select
					id="chartType_3_1" name="chartType_3_1" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <select
					id="chartType_3_2" name="chartType_3_2" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
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
				<span class="spanwidth" align="right">参考图例名称：</span> <input
					id="referenceLegend_3" name="referenceLegend_3" type="text"
					value="<%=prefs.getValue("referenceLegend_3", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考颜色：</span> <input
					id="referenceColor_3" name="referenceColor_3" type="text"
					value="<%=prefs.getValue("referenceColor_3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考值：</span> <input
					id="referencevalue3" name="referencevalue3" type="text"
					value="<%=prefs.getValue("referencevalue3", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_3" name="xStep_3" type="text"
					value="<%=prefs.getValue("xStep_3", "")%>">
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
					id="symbol3" name="symbol3" style="width: 44.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否需要乘数：</span> <input
					id="multiplier_3" name="multiplier_3" type="text"
					value="<%=prefs.getValue("multiplier_3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol3" name="ySymbol3" type="text"
					value="<%=prefs.getValue("ySymbol3", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime3" name="defaulttime3" type="text"
					value="<%=prefs.getValue("defaulttime3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals3" name="decimals3" style="width: 44.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName3" name="expColumnName3" type="text"
					value="<%=prefs.getValue("expColumnName3", "")%>">
			</div>
		</div>

		<div class="div-table-row">

			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接名称1：</span> <input
					id="linkName_1_3" name="linkName_1_3" type="text"
					value="<%=prefs.getValue("linkName_1_3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接地址1：</span> <input
					id="linkUrl_1_3" name="linkUrl_1_3" type="text"
					value="<%=prefs.getValue("linkUrl_1_3", "")%>">
			</div>

		</div>

		<div class="div-table-row">

			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接名称1：</span> <input
					id="linkName_2_3" name="linkName_2_3" type="text"
					value="<%=prefs.getValue("linkName_2_3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接地址1：</span> <input
					id="linkUrl_2_3" name="linkUrl_2_3" type="text"
					value="<%=prefs.getValue("linkUrl_2_3", "")%>">
			</div>

		</div>

		<br /> <br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑总用水趋势：</span>
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
				<span class="spanwidth" align="right">y轴标题：</span> <input
					id="yLeftTitle_4" name="yLeftTitle_4" type="text"
					value="<%=prefs.getValue("yLeftTitle_4", "")%>">
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
				<span class="spanwidth" align="right">居中标题：</span> <input
					id="centerTitle_4" name="centerTitle_4" type="text"
					value="<%=prefs.getValue("centerTitle_4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型1：</span> <select
					id="chartType_4_1" name="chartType_4_1" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <select
					id="chartType_4_2" name="chartType_4_2" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
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
				<span class="spanwidth" align="right">参考图例名称：</span> <input
					id="referenceLegend_4" name="referenceLegend_4" type="text"
					value="<%=prefs.getValue("referenceLegend_4", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考颜色：</span> <input
					id="referenceColor_4" name="referenceColor_4" type="text"
					value="<%=prefs.getValue("referenceColor_4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考值：</span> <input
					id="referencevalue4" name="referencevalue4" type="text"
					value="<%=prefs.getValue("referencevalue4", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_4" name="xStep_4" type="text"
					value="<%=prefs.getValue("xStep_4", "")%>">
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
					id="symbol4" name="symbol4" style="width: 44.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否需要乘数：</span> <input
					id="multiplier_4" name="multiplier_4" type="text"
					value="<%=prefs.getValue("multiplier_4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol4" name="ySymbol4" type="text"
					value="<%=prefs.getValue("ySymbol4", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime4" name="defaulttime4" type="text"
					value="<%=prefs.getValue("defaulttime4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals4" name="decimals4" style="width: 44.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName4" name="expColumnName4" type="text"
					value="<%=prefs.getValue("expColumnName4", "")%>">
			</div>
		</div>

		<br /> <br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑总用气趋势：</span>
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
				<span class="spanwidth" align="right">y轴标题：</span> <input
					id="yLeftTitle_5" name="yLeftTitle_5" type="text"
					value="<%=prefs.getValue("yLeftTitle_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title5"
					name="title5" type="text" value="<%=prefs.getValue("title5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description_5" name="description_5" type="text"
					value="<%=prefs.getValue("description_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">模块背景颜色：</span> <input
					id="backgroundColor_5" name="backgroundColor_5" type="text"
					value="<%=prefs.getValue("backgroundColor_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">居中标题：</span> <input
					id="centerTitle_5" name="centerTitle_5" type="text"
					value="<%=prefs.getValue("centerTitle_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型1：</span> <select
					id="chartType_5_1" name="chartType_5_1" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <select
					id="chartType_5_2" name="chartType_5_2" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
					id="chartColorList_5" name="chartColorList_5" type="text"
					value="<%=prefs.getValue("chartColorList_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="chartFillColorList_5" name="chartFillColorList_5" type="text"
					value="<%=prefs.getValue("chartFillColorList_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegendList_5" name="chartLegendList_5" type="text"
					value="<%=prefs.getValue("chartLegendList_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表半径列表：</span> <input
					id="chartRadiusList_5" name="chartRadiusList_5" type="text"
					value="<%=prefs.getValue("chartRadiusList_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考图例名称：</span> <input
					id="referenceLegend_5" name="referenceLegend_5" type="text"
					value="<%=prefs.getValue("referenceLegend_5", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考颜色：</span> <input
					id="referenceColor_5" name="referenceColor_5" type="text"
					value="<%=prefs.getValue("referenceColor_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考值：</span> <input
					id="referencevalue5" name="referencevalue5" type="text"
					value="<%=prefs.getValue("referencevalue5", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_5" name="xStep_5" type="text"
					value="<%=prefs.getValue("xStep_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">连接线线宽：</span> <input
					id="connectLineWidth_5" name="connectLineWidth_5"
					title="为空则默认为2，为0则不显示连接线" type="text"
					value="<%=prefs.getValue("connectLineWidth_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth_5" name="lineWidth_5" type="text"
					value="<%=prefs.getValue("lineWidth_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol5" name="symbol5" style="width: 44.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否需要乘数：</span> <input
					id="multiplier_5" name="multiplier_5" type="text"
					value="<%=prefs.getValue("multiplier_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol5" name="ySymbol5" type="text"
					value="<%=prefs.getValue("ySymbol5", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime5" name="defaulttime5" type="text"
					value="<%=prefs.getValue("defaulttime5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals5" name="decimals5" style="width: 44.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName5" name="expColumnName5" type="text"
					value="<%=prefs.getValue("expColumnName5", "")%>">
			</div>
		</div>


		<br /> <br />

		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑碳足迹：</span>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid6"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid6','choose_name6','choose_id6','ispd6')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('choose_name6','choose_id6','ispd6')">清空name/id/ispd</a>
				</div>
			</div>
		</div>

		<br /> <br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="choose_name6" name="choose_name6" type="text"
					value="<%=prefs.getValue("choose_name6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="choose_id6" name="choose_id6" type="text"
					value="<%=prefs.getValue("choose_id6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input id="ispd6"
					name="ispd6" type="text" value="<%=prefs.getValue("ispd6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">y轴标题：</span> <input
					id="yLeftTitle_6" name="yLeftTitle_6" type="text"
					value="<%=prefs.getValue("yLeftTitle_6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title6"
					name="title6" type="text" value="<%=prefs.getValue("title6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description_6" name="description_6" type="text"
					value="<%=prefs.getValue("description_6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">模块背景颜色：</span> <input
					id="backgroundColor_6" name="backgroundColor_6" type="text"
					value="<%=prefs.getValue("backgroundColor_6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">居中标题：</span> <input
					id="centerTitle_6" name="centerTitle_6" type="text"
					value="<%=prefs.getValue("centerTitle_6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型1：</span> <select
					id="chartType_6_1" name="chartType_6_1" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <select
					id="chartType_6_2" name="chartType_6_2" style="width: 44.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">颜色列表：</span> <input
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
				<span class="spanwidth" align="right">图例列表：</span> <input
					id="chartLegendList_6" name="chartLegendList_6" type="text"
					value="<%=prefs.getValue("chartLegendList_6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表半径列表：</span> <input
					id="chartRadiusList_6" name="chartRadiusList_6" type="text"
					value="<%=prefs.getValue("chartRadiusList_6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考图例名称：</span> <input
					id="referenceLegend_6" name="referenceLegend_6" type="text"
					value="<%=prefs.getValue("referenceLegend_6", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考颜色：</span> <input
					id="referenceColor_6" name="referenceColor_6" type="text"
					value="<%=prefs.getValue("referenceColor_6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">参考值：</span> <input
					id="referencevalue6" name="referencevalue6" type="text"
					value="<%=prefs.getValue("referencevalue6", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_6" name="xStep_6" type="text"
					value="<%=prefs.getValue("xStep_6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">连接线线宽：</span> <input
					id="connectLineWidth_6" name="connectLineWidth_6"
					title="为空则默认为2，为0则不显示连接线" type="text"
					value="<%=prefs.getValue("connectLineWidth_6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth_6" name="lineWidth_6" type="text"
					value="<%=prefs.getValue("lineWidth_6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <select
					id="symbol6" name="symbol6" style="width: 44.5%">
					<option value="circle">圆点</option>
					<option value="square">正方形</option>
					<option value="diamond">方形</option>
					<option value="triangle">三角形</option>
					<option value="triangle-down">倒三角</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol6" name="ySymbol6" type="text"
					value="<%=prefs.getValue("ySymbol6", "")%>">
			</div>

		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime6" name="defaulttime6" type="text"
					value="<%=prefs.getValue("defaulttime6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals6" name="decimals6" style="width: 44.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName6" name="expColumnName6" type="text"
					value="<%=prefs.getValue("expColumnName6", "")%>">
			</div>
		</div>

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
	$("#buildtotalconsumption").form('submit', {
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


// 渲染datagrid
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
			{field:'name',title:'urlName',width:$(this).width() * 0.2},
			{field:'id',title:'urlId',width:$(this).width() * 0.15}, 
			{field:'ispd',title:'ispd',width:$(this).width() * 0.1}
		]],
		onLoadSuccess : function (){
			//移除报表页面的tr标签的big_tr样式
			$("tr:even").removeClass("big_tr");
		}
	});
}

// 渲染 建筑总能耗 的效果
renderDataGrid("dgrid1");
$("#chartType_1_1").val('<%=prefs.getValue("chartType_1_1","")%>');
$("#chartType_1_2").val('<%=prefs.getValue("chartType_1_2","")%>');
$("#decimals1").val('<%=prefs.getValue("decimals1","")%>');
$('#defaulttime1').datebox();

// 渲染 建筑总能耗分项  的效果
renderDataGrid("dgrid2");
$("#chartType_2_1").val('<%=prefs.getValue("chartType_2_1","")%>');
$("#chartType_2_2").val('<%=prefs.getValue("chartType_2_2","")%>');
$("#decimals2").val('<%=prefs.getValue("decimals2","")%>');
$('#defaulttime2').datebox();

// 渲染 建筑总用电趋势  的效果
renderDataGrid("dgrid3");
$("#chartType_3_1").val('<%=prefs.getValue("chartType_3_1","")%>');
$("#chartType_3_2").val('<%=prefs.getValue("chartType_3_2","")%>');
$("#decimals3").val('<%=prefs.getValue("decimals3","")%>');
$('#defaulttime3').datebox();

// 渲染 建筑总用水趋势  的效果
$("#chartType_4_1").val('<%=prefs.getValue("chartType_4_1","")%>');
$("#chartType_4_2").val('<%=prefs.getValue("chartType_4_2","")%>');
$("#decimals4").val('<%=prefs.getValue("decimals4","")%>');

// 渲染 建筑总用气趋势  的效果
$("#chartType_5_1").val('<%=prefs.getValue("chartType_5_1","")%>');
$("#chartType_5_2").val('<%=prefs.getValue("chartType_5_2","")%>');
$("#decimals5").val('<%=prefs.getValue("decimals5","")%>');

// 渲染 建碳足迹  的效果
renderDataGrid("dgrid6");
$("#chartType_6_1").val('<%=prefs.getValue("chartType_6_1","")%>');
$("#chartType_6_2").val('<%=prefs.getValue("chartType_6_2","")%>');
$("#decimals6").val('<%=prefs.getValue("decimals6","")%>');
$('#defaulttime6').datebox();

</script>