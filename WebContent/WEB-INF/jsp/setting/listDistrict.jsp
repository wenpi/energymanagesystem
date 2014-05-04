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
<portlet:resourceURL id="getDistricts" var="getDistrictsUrl">
</portlet:resourceURL>
<table id="<portlet:namespace/>districtdg" title="行政区划" class="easyui-datagrid" width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getDistrictsUrl)%>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="districtId" toolbar="#<portlet:namespace/>districttb">
		<thead>
			<tr>
				<th field="districtId" width="60">行政编号</th>
				<th field="districtinfo" width="100" formatter="formatParent">上级区划</th>
				<th field="districtName" width="100">区划名称</th>
				<th field="districtPostcode" width="60" align="left">区划邮编</th>
				<th field="districtAreacode" width="120" align="left">电话区号</th>
				<th field="districtRemark"  width="120">备注</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>districttb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>addDistrict()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>editDistrict()">修改</a>  
			<span style="margin-left:20px;">
			行政编号: <input id="districtId" name="districtId" style="width:80px" />
			区划名称: <input id="districtName" name="districtName" /> 
			区划邮编: <input id="districtPostcode" name="districtPostcode" style="width:80px" /> 
			电话区号: <input id="districtAreacode" name="districtAreacode" style="width:80px" /> 
			<a href="javascript:<portlet:namespace/>searchDistrict();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">Search</a></span>
	</div>
	<br />
	
	 <div class="portlet-msg-info"> 
	参考： <a href="http://www.gov.cn/test/2011-08/22/content_1930111.htm" target="_blank">中华人民共和国行政区划</a>
	</div>
	
	<script language="javascript">

	function <portlet:namespace/>addDistrict() {
		var addUrl = '<portlet:renderURL portletMode="edit" windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name="action" value="addDistrictForm" /></portlet:renderURL>';
		addUrl=addUrl.replace("pop_up","normal");
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>editDistrict() {
		var node = $('#<portlet:namespace/>districtdg').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit' windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name='action' value='editDistrictForm' /><portlet:param name='districtId' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.districtId);
			url=url.replace("pop_up","normal");
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>searchDistrict() {
		var url = "<portlet:resourceURL id='getDistricts'><portlet:param name='districtId' value='tempId' /><portlet:param name='districtName' value='tempName' /><portlet:param name='districtPostcode' value='tempPostcode' /><portlet:param name='districtAreacode' value='tempAreacode' /></portlet:resourceURL>";
		url = url.replace("tempId",$("#districtId").val()).replace("tempName",$("#districtName").val()).replace("tempPostcode",$("#districtPostcode").val()).replace("tempAreacode",$("#districtAreacode").val());
		$('#<portlet:namespace/>districtdg').datagrid('options').url= url;
		$('#<portlet:namespace/>districtdg').datagrid("reload");
		
	}
	
	function formatParent(val,row) {
		return val==null ? '' : val.districtName;
	}
	
</script>