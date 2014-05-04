<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- 
	运行监测——设备检测首选项页面
	分7个大项，每个大项中包含两个小项：跳转前一项、跳转后一项
	@Author:ZHANGTIANLE
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

<form:form commandName="energyStaticPreferenceInfo"
	id="equipmentMonitor" method="post" class="" action="#">

	<br />
	<div class="ftitle">
		<span><a
			href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
	</div>

	<br />

	<div class="div-table" style="margin-left: 220px;">

		<!-- --------第一项---------- -->
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="ftitle">
					<span>运行趋势</span>
				</div>
			</div>
		</div>

		<br />
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime" name="defaulttime" type="text"
					value="<%=prefs.getValue("defaulttime", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals" name="decimals">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">x轴间隔：</span> <input id="xStep"
					name="xStep" type="text" value="<%=prefs.getValue("xStep", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色：</span> <input
					id="chartFillColorList" name="chartFillColorList" type="text"
					value="<%=prefs.getValue("chartFillColorList", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图形颜色：</span> <input
					id="chartColorList" name="chartColorList" type="text"
					value="<%=prefs.getValue("chartColorList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型：</span> <select
					id="chartType" name="chartType">
					<option value="line">曲线图</option>
					<option value="spline">平滑曲线图</option>
					<option value="column">柱形图</option>
					<option value="bar">条形图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="ftitle">
					<span>实时状态</span>
				</div>
			</div>
		</div>

		<br />
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime1" name="defaulttime1" type="text"
					value="<%=prefs.getValue("defaulttime1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals1" name="decimals1">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">x轴间隔：</span> <input
					id="xStep_1" name="xStep_1" type="text"
					value="<%=prefs.getValue("xStep_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色：</span> <input
					id="chartFillColorList_1" name="chartFillColorList_1" type="text"
					value="<%=prefs.getValue("chartFillColorList_1", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">设备详情图形颜色：</span> <input
					id="chartColorList_1" name="chartColorList_1" type="text"
					value="<%=prefs.getValue("chartColorList_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">设备详情图表类型：</span> <select
					id="chartType_1" name="chartType_1">
					<option value="line">曲线图</option>
					<option value="spline">平滑曲线图</option>
					<option value="column">柱形图</option>
					<option value="bar">条形图</option>
				</select>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">运行时间图形颜色：</span> <input
					id="chartColorList_2" name="chartColorList_2" type="text"
					value="<%=prefs.getValue("chartColorList_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">运行时间图表类型：</span> <select
					id="chartType_2" name="chartType_2">
					<option value="line">曲线图</option>
					<option value="spline">平滑曲线图</option>
					<option value="column">柱形图</option>
					<option value="bar">条形图</option>
				</select>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="ftitle">
					<span>是否显示数据项</span>
				</div>
			</div>
		</div>

		<br />
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">运行负载率：</span> <select
					id="isShowLoadRate" name="isShowLoadRate">
					<option value="block">显示</option>
					<option value="none">不显示</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">运行风量风压：</span> <select
					id="isShowWindPressure" name="isShowWindPressure">
					<option value="block">显示</option>
					<option value="none">不显示</option>
				</select>
			</div>
		</div>

	</div>

	<br />
	<div class="div-table-row">
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
	$("#equipmentMonitor").form('submit', {
		url:'<%=renderResponse.encodeURL(savePreferencesUrl)%>',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
		}
	});
}

$("#decimals").val('<%=prefs.getValue("decimals", "")%>');
$('#defaulttime').val('<%=prefs.getValue("defaulttime", "")%>');
$("#chartType").val('<%=prefs.getValue("chartType", "")%>');

$("#decimals1").val('<%=prefs.getValue("decimals1", "")%>');
$('#defaulttime1').val('<%=prefs.getValue("defaulttime1", "")%>');
$("#chartType_1").val('<%=prefs.getValue("chartType_1", "")%>');
$("#chartType_2").val('<%=prefs.getValue("chartType_2", "")%>');
$("#isShowLoadRate").val('<%=prefs.getValue("isShowLoadRate", "")%>');
$("#isShowWindPressure").val('<%=prefs.getValue("isShowWindPressure", "")%>');

</script>