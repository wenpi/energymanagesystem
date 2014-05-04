<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-31 上午09:40:26
	LastModified Date:
	Description: 气候区设置
 -->
<table id="<portlet:namespace/>bigdistrictdg" title="气候区域" class="easyui-datagrid" width="100%" style="height:auto;"
			url="<portlet:resourceURL id="getBigdistricts"></portlet:resourceURL>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="bigdistrictId" toolbar="#<portlet:namespace/>bigdistricttb">
		<thead>
			<tr>
				<th field="bigdistrictName" width="80">区域名称</th>
				<th field="bigdistrictinfo" width="80" formatter="formatBigparent">上级区域</th>
				<th field="orderNo" width="45" align="left">序号</th>
				<th field="bigdistrictRemark"  width="320">备注</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>bigdistricttb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>addBigdistrict()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>editBigdistrict()">修改</a>  
			<span style="margin-left:20px;">
			区域编号: <input id="bigdistrictId" name="bigdistrictId" style="width:80px" />
			区域名称: <input id="bigdistrictName" name="bigdistrictName" />  
			<a href="javascript:<portlet:namespace/>searchBigdistrict();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">查找</a></span>
	</div>
	<br />
	 <div class="portlet-msg-info"> 
	</div>
	
	<script language="javascript">

	function <portlet:namespace/>addBigdistrict() {
		var addUrl = '<portlet:renderURL portletMode="edit" windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name="action" value="addBigdistrictForm" /></portlet:renderURL>';
		addUrl=addUrl.replace("pop_up","normal");
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>editBigdistrict() {
		var node = $('#<portlet:namespace/>bigdistrictdg').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit' windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name='action' value='editBigdistrictForm' /><portlet:param name='bigdistrictId' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.bigdistrictId);
			url=url.replace("pop_up","normal");
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>searchBigdistrict() {
		var url = "<portlet:resourceURL id='getBigdistricts'><portlet:param name='districtId' value='tempId' /><portlet:param name='districtName' value='tempName' /><portlet:param name='districtPostcode' value='tempPostcode' /><portlet:param name='districtAreacode' value='tempAreacode' /></portlet:resourceURL>";
		url = url.replace("tempId",$("#bigdistrictId").val()).replace("tempName",$("#bigdistrictName").val());
		$('#<portlet:namespace/>bigdistrictdg').datagrid('options').url= url;
		$('#<portlet:namespace/>bigdistrictdg').datagrid("reload");
		
	}
	
	function formatBigparent(val,row) {
		return val==null ? '' : val.bigdistrictName;
	}
	
</script>