 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午10:03:32
	LastModified Date:
	Description: 仪表产品信息
 -->
<portlet:resourceURL id="getMeterproinfos" var="getMeterproinfosURL">
</portlet:resourceURL>
<table id="<portlet:namespace/>dg" title="仪表产品" class="easyui-datagrid" width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getMeterproinfosURL)%>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="meterProductid" toolbar="#<portlet:namespace/>tb">
		<thead>
			<tr>
				<th field="meterProductid" width="60">产品ID</th>
				<th field="meterProductname" width="100">仪表产品名称</th>
				<th field="meterType" width="60" align="left" formatter="formatMetertype">仪表类型</th>
				<th field="meterProducter" width="120" align="left">生产厂家</th>
				<th field="meterModel"  width="120">仪表型号</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>tb">
		<form id="searchform">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit()">修改</a>  
			<span style="margin-left:20px;">
		
			ID: <input id="meterProductid" name="meterProductid" type="text" value="" style="width:80px" />
			名称:<input id="meterProductname" name="meterProductname" type="text" value="" /> 
			类型:<select id="meterType" name="meterType"></select></form>
			<a href="javascript:<portlet:namespace/>search();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">Search</a></span>
	</div>
	
	<script language="javascript">

	var meterTypes = [
	      			<c:forEach items="${meterTypes}" var="type">
	      				{itemCode:'<c:out value="${type.itemCode}"></c:out>',itemName:'<c:out value="${type.itemName}"></c:out>'},
	      			</c:forEach>           
	      		        ];

	function formatMetertype(val,row) {
		for(var i=0; i<meterTypes.length; i++){
			if (meterTypes[i].itemCode == val) return meterTypes[i].itemName;
		}
		return val;
	}
	
	$(function() {
		<portlet:namespace/>getDictitemsByGroupcode('meterType','meter_type');
	});
	
	function <portlet:namespace/>add() {
		var addUrl = '<portlet:renderURL portletMode="edit"><portlet:param name="action" value="addMeterproinfoForm" /></portlet:renderURL>';
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>edit() {
		var node = $('#<portlet:namespace/>dg').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editMeterproinfoForm' /><portlet:param name='meterProductid' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.meterProductid);
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>search() {
		
		var valMeterType = $('#meterType').combogrid('getValue');
		$.post('<portlet:resourceURL id="getMeterproinfos"></portlet:resourceURL>',
				{meterProductid:$("#meterProductid").val(),meterProductname:$("#meterProductname").val(),meterType:valMeterType},
				function(data){
					$('#<portlet:namespace/>dg').datagrid('loadData',data);
				},'json');
		
	}
	
</script>