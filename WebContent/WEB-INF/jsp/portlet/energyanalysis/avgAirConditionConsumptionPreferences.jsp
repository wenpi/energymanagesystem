<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-15 上午9点22分
	LastModified Date:
	Description: 能效分析-人均空调系统能耗
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

<form:form commandName="preferenceinfo" id="avgairconditionconsumption"
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
				<span class="spanwidth" align="right">图表类型：</span> <input
					id="chartType" name="chartType" type="text"
					value="<%=prefs.getValue("chartType", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表居中标题：</span> <input
					id="centerTitle" name="centerTitle" type="text"
					value="<%=prefs.getValue("centerTitle", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep" name="xStep" type="text"
					value="<%=prefs.getValue("xStep", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">左上角标题：</span> <input
					id="yLeftTitle" name="yLeftTitle" type="text"
					value="<%=prefs.getValue("yLeftTitle", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线颜色：</span> <input
					id="lineColor" name="lineColor" type="text"
					value="<%=prefs.getValue("lineColor", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色：</span> <input
					id="fillColor" name="fillColor" type="text"
					value="<%=prefs.getValue("fillColor", "")%>">
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
	$("#avgairconditionconsumption").form('submit', {
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