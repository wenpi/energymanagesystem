<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init-ext.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午11:26:23
	LastModified Date:
	Description: 数据中心列表
 -->
 <portlet:resourceURL id="getDatacenters" var="getDatacenterUrl">
</portlet:resourceURL>
<table id="<portlet:namespace/>dg" title="数据中心" class="easyui-datagrid" width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getDatacenterUrl)%>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="datacenterId" toolbar="#<portlet:namespace/>tb">
		<thead>
			<tr>
				<th field="datacenterId" width="60">Id</th>
				<th field="datacenterName" width="100">名称</th>
				<th field="datacenterType" width="60" align="left">类型</th>
				<th field="datacenterManager" width="120" align="left">单位</th>
				<th field="datacenterContact"  width="120">联系人</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>tb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit()">修改</a>  
			
			<span style="margin-left:20px;">ID: <input id="datacenterId" name="datacenterId" style="width:80px" />
			名称: <input id="datacenterName" name="datacenterName" /> 
			类型:<select id="datacenterType">
				<option value=""></option>
				<option value="1">数据中心 </option>
				<option value="2">数据中转站</option>
			</select>
			<a href="javascript:<portlet:namespace/>search();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">Search</a></span>
	</div>
	
	<script language="javascript">

	function <portlet:namespace/>add() {
		var addUrl = '<portlet:renderURL portletMode="edit"><portlet:param name="action" value="addDatacenterForm" /></portlet:renderURL>';
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>edit() {
		var node = $('#<portlet:namespace/>dg').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editDatacenterForm' /><portlet:param name='datacenterId' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.datacenterId);
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>search() {
		var id = $("#datacenterId").val();
		var name = $("#datacenterName").val();
		var type = $("#datacenterType").val();

		var url = "<portlet:resourceURL id='getDatacentersBySearch'><portlet:param name='datacenterId' value='tempId' /><portlet:param name='datacenterName' value='tempName' /><portlet:param name='datacenterType' value='tempType' /></portlet:resourceURL>";
		url = url.replace("tempId",id).replace("tempName",name).replace("tempType",type);
		$('#<portlet:namespace/>dg').datagrid('options').url= url;
		$('#<portlet:namespace/>dg').datagrid("reload");
		
	}
	
	
	$(function(){
		if($("#tab-container").length>0) {
			$('#tab-container').tabs({width: $("#tab-container").parent().width(),height: "auto"}); 
		}
	});
	
</script>