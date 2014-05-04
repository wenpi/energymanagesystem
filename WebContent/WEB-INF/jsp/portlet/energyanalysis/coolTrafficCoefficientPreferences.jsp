<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-15 上午10点33分
	LastModified Date:
	Description:  能效分析-冷却水输运系数
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

<form:form commandName="preferenceinfo" id="cooltrafficcoefficient"
	method="post" class="" action="#">

	<div class="ftitle">
		<span></span><span class="title-back"><a
			href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
	</div>
	
	<div class="div-table">

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">URL名称：</span> <input
					id="urlName" name="urlName" type="text"
					value="<%=prefs.getValue("urlName", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description" name="description" type="text"
					value="<%=prefs.getValue("description", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">背景颜色：</span> <input
					id="backgroundColor" name="backgroundColor" type="text"
					value="<%=prefs.getValue("backgroundColor", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">左上角标题：</span> <input
					id="yLeftTitle" name="yLeftTitle" type="text"
					value="<%=prefs.getValue("yLeftTitle", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep" name="xStep" type="text"
					value="<%=prefs.getValue("xStep", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型1：</span> <input
					id="chartType_1" name="chartType_1" type="text"
					value="<%=prefs.getValue("chartType_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线颜色1：</span> <input
					id="lineColor_1" name="lineColor_1" type="text"
					value="<%=prefs.getValue("lineColor_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色1：</span> <input
					id="fillColor_1" name="fillColor_1" type="text"
					value="<%=prefs.getValue("fillColor_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例名称1：</span> <input
					id="dataName_1" name="dataName_1" type="text"
					value="<%=prefs.getValue("dataName_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <input
					id="chartType_2" name="chartType_2" type="text"
					value="<%=prefs.getValue("chartType_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例名称2：</span> <input
					id="dataName_2" name="dataName_2" type="text"
					value="<%=prefs.getValue("dataName_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色2：</span> <input
					id="fillColor_2" name="fillColor_2" type="text"
					value="<%=prefs.getValue("fillColor_2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth" name="lineWidth" type="text"
					value="<%=prefs.getValue("lineWidth", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点类型：</span> <input
					id="symbol" name="symbol" type="text"
					value="<%=prefs.getValue("symbol", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴数值符号：</span> <input
					id="ySymbol" name="ySymbol" type="text"
					value="<%=prefs.getValue("ySymbol", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接名称1：</span> <input
					id="linkName_1" name="linkName_1" type="text"
					value="<%=prefs.getValue("linkName_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接地址1：</span> <input
					id="linkUrl_1" name="linkUrl_1" type="text"
					value="<%=prefs.getValue("linkUrl_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接名称2：</span> <input
					id="linkName_2" name="linkName_2" type="text"
					value="<%=prefs.getValue("linkName_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">链接地址2：</span> <input
					id="linkUrl_2" name="linkUrl_2" type="text"
					value="<%=prefs.getValue("linkUrl_2", "")%>">
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
	$("#cooltrafficcoefficient").form('submit', {
		url:'<%=renderResponse.encodeURL(savePreferencesUrl)%>',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
		}
	});
}
</script>