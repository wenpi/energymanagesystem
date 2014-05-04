<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 报表管理首选项页面
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
	class="" action="#" style="background-color: white;">

	<br />
	
	<div class="ftitle">
		<span class="spanwidth" align="right">增加小时数：</span> <input id="hours"
			name="hours" type="text" value="<%=prefs.getValue("hours", "")%>">
		<span class=""><a
			href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
	</div>
	
	<br /><br />
	
	<div class="div-table">
		<!-- 报表管理配置项 -->
		<br /> <br />
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="ftitle">
					<span>报表管理</span><span class="title-back"><a
						href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
				</div>
			</div>
		</div>
		<br />
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题名称：</span> <input id="title"
					name="title" type="text" value="<%=prefs.getValue("title", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">样式类型：</span> <select
					id="gridLineDashStyle6" name="gridLineDashStyle6" style="width: 29.5%">
					<option value="">一行三列</option>
					<option value="doubleColumn">一行两列</option>
				</select>
			</div>
		</div>
		
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

$("#gridLineDashStyle6").val('<%=prefs.getValue("gridLineDashStyle6","")%>');
</script>