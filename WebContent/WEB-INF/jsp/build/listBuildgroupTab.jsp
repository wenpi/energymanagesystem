 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
<div id="<portlet:namespace/>buildgrouptb">
	<div style="margin-bottom: 5px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="<portlet:namespace/>addgroup()">新增 </a> 
		<a href="#"
			class="easyui-linkbutton" iconCls="icon-edit" plain="true"
			onclick="<portlet:namespace/>editgroup()">修改11</a> 
			<span style="margin-left:20px;">组名称: <input id="buildgroupName" name="buildgroupName" type="text" value="" /> 
		<a href="javascript:<portlet:namespace/>groupsearch();"
			class="easyui-linkbutton" iconCls="icon-search" plain="true">Search</a></span>
	</div>
</div>
<portlet:resourceURL id="getBuildgroupinfos" var="getBuildgroupinfosURL">
</portlet:resourceURL>
<table id="<portlet:namespace/>groupdg" title="建筑群管理" class="easyui-datagrid"
	width="100%" style="height:auto;"
	url="<%=renderResponse.encodeURL(getBuildgroupinfosURL)%>" rownumbers="true"
	pagination="true" fitColumns="true" singleSelect="true"
	idField="buildgroupId" toolbar="#<portlet:namespace/>buildgrouptb">
	<thead>
		<tr>
			<th field="buildgroupId" width="60">群ID</th>
			<th field="buildgroupName" width="60" align="center">建筑群名称</th>
			<th field="buildgroupAliasname" width="100">字母别名</th>
			<th field="buildgroupDesc" width="200">群描述</th>
		</tr>
	</thead>
</table>

<script language="javascript">
	//
	function <portlet:namespace/>addgroup() {
		var addUrl = '<portlet:renderURL portletMode="edit" windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name="action" value="addBuildgroupinfoForm" /></portlet:renderURL>';
		addUrl=addUrl.replace('pop_up','normal');
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>editgroup() {
		var node = $('#<portlet:namespace/>groupdg').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editBuildgroupinfoForm' /><portlet:param name='buildgroupId' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.buildgroupId).replace('pop_up','normal');
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>groupsearch() {
		var url = "<portlet:resourceURL id='getBuildgroupinfos'></portlet:resourceURL>";
		$.post(url,{buildgroupName:$('#buildgroupName').val()},function(data){
				$('#<portlet:namespace/>groupdg').datagrid('loadData',data);
			},'json');	
	}
	
</script>