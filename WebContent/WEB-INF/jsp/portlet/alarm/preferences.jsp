<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-23 下午05:12:46
	LastModified Date:
	Description:
 -->
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>
<div id="msg"></div>
<form:form commandName="prefsinfo" method="post" class="" action="#">
	<div class="ftitle">设置报警常规设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="queryType">查询类型:</form:label>
					<form:select path="queryType">
						<form:option value="active">活动报警</form:option>
						<form:option value="history">报警历史</form:option>
					</form:select>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="devicename">设备名称:</form:label>
					<form:input path="devicename" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="tagname">变量名称:</form:label>
					<form:input path="tagname" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="groupname">报警组名:</form:label>
					<form:input path="groupname" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="count">显示条数:</form:label>
					<form:input path="count" />
				</div>
			</div>
		</div>
	</div>
	<div class="ftitle">数据来源</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="buildId">目标建筑</form:label>
					<form:input path="buildId" required="true" />
					<span class="taglib-icon-help"> <img title="设置数据来源建筑"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="settingWsUrl">服务地址</form:label>
					<form:input path="settingWsUrl" style="width:200px;"/>
					<span class="taglib-icon-help"> <img title="设置数据来源服务地址"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
	</div>
	<input type="button" value="保存首选项"
		onclick="<portlet:namespace/>savePreference()" />
</form:form>


<script type="text/javascript">
/**
* 保存首选项信息
*/
function <portlet:namespace/>savePreference() {
	$("#prefsinfo").form('submit', {
		url:'<%=renderResponse.encodeURL(savePrefUrl)%>',
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
		{field:'buildId',title:'建筑编号',width:100},
		{field:'buildName',title:'建筑名称',width:100}
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
</script>

