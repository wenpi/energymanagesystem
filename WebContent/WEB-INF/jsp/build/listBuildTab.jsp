<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init-ext.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-6-19 下午03:55:51
	LastModified Date:
	Description:
 -->
<portlet:resourceURL id="getBuildinfos" var="getBuildinfosURL">
</portlet:resourceURL>
<div id="<portlet:namespace/>buildtb" style="min-height:100px;">
	<div style="margin-bottom: 5px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="<portlet:namespace/>addBuildinfo()">新增</a> 
		<a href="#"
			class="easyui-linkbutton" iconCls="icon-edit" plain="true"
			onclick="<portlet:namespace/>editBuildinfo()">修改123</a> 
		<a href="javascript:<portlet:namespace/>searchBuildinfo();"
			class="easyui-linkbutton" iconCls="icon-search" plain="true">查找</a>
	</div>
	<div id="<portlet:namespace/>search">
		<form:form commandName="buildinfo">
			<div class="div-table">
				<div class="div-table-row">
					<div class="div-table-3col">
						<div class="fitem">
							<form:label path="buildId">建筑编号：</form:label>
							<form:input path="buildId" maxlength="12" />
						</div>
					</div>
					<div class="div-table-3col">
						<div class="fitem">
							<form:label path="buildName">建筑名称：</form:label>
							<form:input path="buildName" />
						</div>
					</div>
					<div class="div-table-3col">
						<div class="fitem">
							<form:label path="datacenterinfo.datacenterId">数据中心：</form:label>
							<form:input path="datacenterinfo.datacenterId" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-3col">
						<div class="fitem">
							<form:label path="buildAliasname">建筑别名：</form:label>
							<form:input path="buildAliasname" />
						</div>
					</div>
					<div class="div-table-3col">
						<div class="fitem">
							<form:label path="buildOwner">建筑业主：</form:label>
							<form:input path="buildOwner" />
						</div>
					</div>
					<div class="div-table-3col">
						<div class="fitem">
							<form:label path="buildState">监测状态111：</form:label>
							<form:select path="buildState">
								<form:option value=""></form:option>
								<form:option value="1">启用监测</form:option>
								<form:option value="0">停用监测</form:option>
							</form:select>
						</div>
					</div>
				</div>
				
			</div>
		</form:form>
	</div>
</div>
<table id="<portlet:namespace/>buildinfosdg" title="建筑管理" class="easyui-datagrid"
	width="100%" style="height:auto;"
	url="<%=renderResponse.encodeURL(getBuildinfosURL)%>" rownumbers="true"
	pagination="true" fitColumns="true" singleSelect="true"
	idField="buildId" toolbar="#<portlet:namespace/>buildtb">
	<thead>
		<tr>
			<th field="datacenterinfo" width="60" formatter="formatDatacenterinfo">数据中心</th>
			<th field="buildId" width="60" align="center">建筑ID</th>
			<th field="buildName" width="100">建筑名称</th>
			<th field="buildAliasname" width="80">建筑别名</th>
			<th field="buildOwner" width="80">建筑业主</th>
			<th field="buildState" width="80" align="center" formatter="formatBuildState">监测状态</th>
			<th field="buildDistrictid" width="80">行政区划</th>
		</tr>
	</thead>
</table>

<script language="javascript">

$(function() {
	//数据中心列表
	$("#datacenterinfo\\.datacenterId").combogrid({
		panelWidth:450,
		value:$("#datacenterinfo\\.datacenterId").val(),
		idField:'datacenterId',
		textField:'datacenterName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10],
		url:'<portlet:resourceURL id="getDatacenters"></portlet:resourceURL>',
		columns:[[
			{field:'datacenterId',title:'数据中心ID',width:100},
			{field:'datacenterName',title:'中心名称',width:100},
			{field:'datacenterType',title:'中心类型',width:100,formatter:function(value,row){
				if(value==1) {
					return "数据中心";
				} else {
					return "数据中转站";
				}
			}}
		]]
	});
})
	function formatDatacenterinfo(val,row) {
		return val.datacenterId;
	}
	
	function formatBuildState(val,row) {
		return val==1?"启用":"停用";
	}

	function <portlet:namespace/>addBuildinfo() {
		var addUrl = '<portlet:renderURL portletMode="edit"><portlet:param name="action" value="addBuildinfoForm" /></portlet:renderURL>';
		addUrl=addUrl.replace("pop_up","normal");
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>editBuildinfo() {
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editBuildinfoForm' /><portlet:param name='buildId' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId","000003020003");
			window.location.href = url;
	}
	function <portlet:namespace/>searchBuildinfo() {
		var url = "<portlet:resourceURL id='searchBuildinfo'><portlet:param name='buildId' value='tempbuildId' /><portlet:param name='buildName' value='temppurbuildName' /><portlet:param name='buildAliasname' value='tempbuildAliasname' /><portlet:param name='buildOwner' value='tempbuildOwner' /><portlet:param name='buildState' value='tempbuildState' /><portlet:param name='datacenterId' value='tempdatacenterId' /></portlet:resourceURL>";
		url = url.replace("tempbuildId",$("#buildId").val()).replace("temppurbuildName",$("#buildName").val()).replace("tempbuildAliasname",$("#buildAliasname").val()).replace("tempbuildOwner",$("#buildOwner").val()).replace("tempbuildState",$("#buildState").val()).replace("tempdatacenterId",$("#datacenterinfo\\.datacenterId").val());
		$('#<portlet:namespace/>buildinfosdg').datagrid('options').url= url;
		$('#<portlet:namespace/>buildinfosdg').datagrid("reload");
	}
	
</script>