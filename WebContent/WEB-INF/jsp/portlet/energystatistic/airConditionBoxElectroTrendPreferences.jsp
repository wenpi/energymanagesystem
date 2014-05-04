<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-14 下午8点23分
	LastModified Date:
	Description: 能耗统计-空调箱用电趋势
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

<form:form commandName="preferenceinfo" id="airconditionboxelectrotrend"
	method="post" class="" action="#">

	<div class="ftitle">
		<span>空调箱用电趋势</span><span class="title-back"><a
			href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
	</div>

	<div class="div-table">

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">选择Name：</span> <input
					id="choose_name" name="choose_name" type="text"
					value="<%=prefs.getValue("choose_name", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">选择Id：</span> <input
					id="choose_id" name="choose_id" type="text"
					value="<%=prefs.getValue("choose_id", "")%>">
			</div>
		</div>

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
			<div class="div-table-2col">
				<span class="spanwidth" align="right">报表参数属性：</span> <input
					id="attribute" name="attribute" type="text"
					value="<%=prefs.getValue("attribute", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">报表时间间隔：</span> <input
					id="tspan" name="tspan" type="text"
					value="<%=prefs.getValue("tspan", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否为统计量：</span> <input
					id="ispd" name="ispd" type="text"
					value="<%=prefs.getValue("ispd", "")%>">
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
	$("#airconditionboxelectrotrend").form('submit', {
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
* 获取选择名称和id列表
*/
renderQueryScheme('<portlet:resourceURL id="getQuerySchemeList"></portlet:resourceURL>','choose_name','name');
renderQueryScheme('<portlet:resourceURL id="getQuerySchemeList"></portlet:resourceURL>','choose_id','id');
</script>