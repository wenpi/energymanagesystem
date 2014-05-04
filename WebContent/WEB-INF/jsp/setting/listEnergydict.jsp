 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午10:00:20
	LastModified Date:
	Description:
 -->
<portlet:resourceURL id="getEnergydicts" var="getEnergydictsUrl">
</portlet:resourceURL>
<table id="<portlet:namespace/>energydictdg" title="能源字典" class="easyui-datagrid" width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getEnergydictsUrl)%>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="energydictId" toolbar="#<portlet:namespace/>energydicttb">
		<thead>
			<tr>
				<th field="energydictId" width="60">能源ID</th>
				<th field="energydictName" width="100">能源名称</th>
				<th field="energydictCalorificvalue" width="100">热值(千卡)</th>
				<th field="energydictCalorificvalueKj" width="60" align="left">热值(千焦)</th>
				<th field="energydictUnit" width="120" align="left">计量单位</th>
				<th field="energydictRate"  width="120">折标准煤系数</th>
				<th field="energyDictRateElectricity"  width="120">折标准电系数</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>energydicttb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>addEnergydict()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>editEnergydict()">修改</a>  
			<span style="margin-left:20px;">
			能源ID: <input id="energydictId" name="energydictId" style="width:80px" />
			能源名称: <input id="energydictName" name="energydictName" /> 
			<a href="javascript:<portlet:namespace/>searchEnergydict();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">Search</a></span>
	</div>
	
	<br />
	 <div class="portlet-msg-info"> 
		参考：《中国能源统计年鉴》 附录4、各种能源折标准煤参考系数
	</div>
	<script language="javascript">

	function <portlet:namespace/>addEnergydict() {
		var addUrl = '<portlet:renderURL portletMode="edit"><portlet:param name="action" value="addEnergydictForm" /></portlet:renderURL>';
		addUrl=addUrl.replace("pop_up","normal");
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>editEnergydict() {
		var node = $('#<portlet:namespace/>energydictdg').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editEnergydictForm' /><portlet:param name='energydictId' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.energydictId);
			url=url.replace("pop_up","normal");
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>searchEnergydict() {
		var url = "<portlet:resourceURL id='getEnergydicts'><portlet:param name='energydictId' value='tempId' /><portlet:param name='energydictName' value='tempName' /></portlet:resourceURL>";
		url = url.replace("tempId",$("#energydictId").val()).replace("tempName",$("#energydictName").val());
		$('#<portlet:namespace/>energydictdg').datagrid('options').url= url;
		$('#<portlet:namespace/>energydictdg').datagrid("reload");
		
	}
	
</script>