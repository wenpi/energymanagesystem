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
<portlet:resourceURL id="getListEnergystandard" var="getListEnergystandardUrl">
</portlet:resourceURL>
<table id="<portlet:namespace/>pricedg" title="建筑能耗标准" class="easyui-datagrid" width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getListEnergystandardUrl)%>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="standardId" toolbar="#<portlet:namespace/>pricetb">
		<thead>
			<tr>
				<th field="standardName" width="100" >标准名称</th>
				<th field="standardType" width="100"  formatter="formatstandardType">标准类型</th>
				<th field="description"  width="120">标准说明</th>
				<th field="isdefault"    width="120"   formatter="formatisdefault">是否默认标准</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>pricetb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>addEnergystandard()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>editEnergystandard()">修改</a>
   		<span style="margin-left:20px;">
			标准名称: <input id="standardName" name="standardName" />
			标准类型: <select id="standardType">
			    <option value=""></option>
				<option value="EnergyItemStandardDetail">分类分项 </option>
				<option value="EnergyRegionalStandardDetail">建筑气候区</option>
			</select>
		<a href="javascript:<portlet:namespace/>searchEnergystandard();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">Search</a>
		</span>
	</div>
	<br />
	<script language="javascript">

	function <portlet:namespace/>addEnergystandard() {
		var addUrl = '<portlet:renderURL portletMode="edit" windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name="action" value="addEnergystandardForm" /></portlet:renderURL>';
		addUrl=addUrl.replace("pop_up","normal");
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>editEnergystandard() {
		var node = $('#<portlet:namespace/>pricedg').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit' windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name='action' value='editEnergystandardForm' /><portlet:param name='standardId' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.standardId);
			url=url.replace("pop_up","normal");
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>searchEnergystandard() {
		var url = "<portlet:resourceURL id='getListEnergystandard'><portlet:param name='standardName' value='tempstandardName' /><portlet:param name='standardType' value='tempstandardType' /></portlet:resourceURL>";
		url = url.replace("tempstandardName",$("#standardName").val()).replace("tempstandardType",$("#standardType").val());
		$('#<portlet:namespace/>pricedg').datagrid('options').url= url;
		$('#<portlet:namespace/>pricedg').datagrid("reload");
	}

	function formatisdefault(val,row) {
		if(val==0){
			return 	"否";
		}
		if(val==1){
			return 	"是 ";
		}
	}

	function formatstandardType(val,row) {
		if(val=="EnergyItemStandardDetail"){
			return 	"分类分项";
		}
		if(val=="EnergyRegionalStandardDetail"){
			return 	"建筑气候区 ";
		}
	}

	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeEnergyprice'></portlet:resourceURL>";
					$.post(removeUrl,{priceid:'${energyprice.priceid}'},function(result){
						if (result.success){
							alert("数据删除成功!");
							var redirect = $("#<portlet:namespace/>redirectview").val();
							window.location.href = redirect;		
						} else {
							$.messager.alert('Error',result.msg,'error');
						}
					},'json');
				} 
			});
		}
	}

	$(function(){
	});
	
</script>  