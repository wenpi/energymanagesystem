<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-9-26 下午13点41分
	LastModified Date: 2013-10-21 zzx修改
	Description: 运行监测，配置页面
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

<form:form commandName="preferenceinfo" id="holoCfg" method="post"
	class="" action="#">

	<br />
	<br />
	<br />
	<div class="ftitle">
		<span>&nbsp;&nbsp;&nbsp;<%=prefs.getValue("title", "")%></span><span
			class="title-back"><a
			href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
	</div>

	<div class="div-table">

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">增加小时数：</span> <input
					id="hours" name="hours" type="text"
					title="因java代码中获取的时间和系统时间可能存在误差，为避免设置java中的各种文件，用此方式来增加时间以保证时间一致"
					value="<%=prefs.getValue("hours", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">当前建筑：</span> <input
					id="buildId" name="buildId" type="text"
					value="<%=prefs.getValue("buildId", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">当前项目：</span> <select
					id="itemName" name="itemName" style="width: 43.5%">
					<option value="TaoBao">淘宝</option>
					<option value="ChinaArts" selected="selected">中国馆</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title"
					name="title" type="text" value="<%=prefs.getValue("title", "")%>">
			</div>

			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime" name="defaulttime" type="text"
					value="<%=prefs.getValue("defaulttime", "")%>">
			</div>
		</div>

		<div id="buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>savePreference()">保存</a>
		</div>
	</div>
</form:form>
<br />
<br />
<script type="text/javascript">
// 保存
function <portlet:namespace/>savePreference() {
	$("#holoCfg").form('submit', {
		url:'<%=renderResponse.encodeURL(savePreferencesUrl)%>',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
		}
	});
}

// 获取建筑信息列表
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
		{field:'buildName',title:'建筑名称',width:$(this).width() * 0.1},
		{field:'buildAliasname',title:'建筑字母别名',width:$(this).width() * 0.1},
		{field:'buildId',title:'建筑编号',width:$(this).width() * 0.1}
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

$("#itemName").val('<%=prefs.getValue("itemName", "")%>'); //当前项目 
$('#defaulttime').datebox(); // 默认时间 
</script>