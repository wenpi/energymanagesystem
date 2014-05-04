 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午11:32:54
	LastModified Date:
	Description:能耗分类分项
 -->
<portlet:resourceURL id="getEnergyitemdicts" var="getEnergyitemdictsURL">
</portlet:resourceURL>
<table id="<portlet:namespace/>dg" title="能耗分类分项" class="easyui-treegrid" width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getEnergyitemdictsURL)%>"
			rownumbers="true"  fitColumns="true" singleSelect="true"
			idField="energyItemcode" treeField="energyItemname" toolbar="#<portlet:namespace/>tb">
		<thead>
			<tr>
				<th field="energyItemcode" width="80">分类分项编码</th>
				<th field="energyItemname" width="100" align="left">分类分项名称编码</th>
				<th field="energyItemtype" width="100" align="left" formatter="formatEnergyItemtype">分类分析类型</th>
				<th field="energydict" width="80" formatter="formatEnergydict">能源名称</th>
				<th field="energyItemstate" width="60" formatter="formatEnergyItemstate">状态</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>tb">
	 <form id="searchform" id="energyitemdict">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit()">修改</a>  
			<span style="margin-left:20px;">
			代码: <input id="energyItemcode" name="energyItemcode" /> 
			名称: <input id="energyItemname" name="energyItemname" />
			类型:<select id="energyItemtype">
					<option value="0">分类能耗</option>
					<option value="1">分项能耗</option>
			 </select></form> 
			<a href="javascript:<portlet:namespace/>search();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">查找</a></span>
	</div>
	
	<script language="javascript">
		
	function formatEnergyItemtype(val,row) {
		return val==0?"分类能耗 ":"分项能耗";
	}
	
	function formatEnergyItemstate(val,row) {
		return val==0?"停用":"启用"; 
	}
	
	function formatEnergydict(val,row) {
		return val.energydictName;
	}
	
	function <portlet:namespace/>add() {
		var node = $('#<portlet:namespace/>dg').treegrid('getSelected');
		var addUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='addEnergyitemdictForm' /><portlet:param name='energyItemcode' value='tempId' /></portlet:renderURL>";

		if (node){
			addUrl=addUrl.replace("tempId",node.energyItemcode);
		} else {
			addUrl=addUrl.replace("tempId","");
		}
		window.location.href = addUrl;
		
	}
	
	function <portlet:namespace/>edit() {
		var node = $('#<portlet:namespace/>dg').treegrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editEnergyitemdictForm' /><portlet:param name='energyItemcode' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.energyItemcode);
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>search() {		
	//	var url = $('#<portlet:namespace/>dg').treegrid('options').url;  
	//	var myqueryParams = $('#<portlet:namespace/>dg').treegrid('options').queryParams; 
    //	var queryParams = $.toJSON($("#searchform").serializeObject());
	//	for(var i=0;i<queryParams.length;i++) {
	//		alert(queryParams[i]);
	//	}
		
		
		//$('#<portlet:namespace/>dg').treegrid('options').queryParams= queryParams;
		//$('#<portlet:namespace/>dg').treegrid("reload");
		var url = "<portlet:resourceURL id='searchEnergyitemdict'><portlet:param name='energyItemcode' value='tempenergyItemcode' /><portlet:param name='energyItemname' value='tempenergyItemname' /><portlet:param name='energyItemtype' value='tempenergyItemtype' /></portlet:resourceURL>";
		url = url.replace("tempenergyItemcode",$("#energyItemcode").val()).replace("tempenergyItemname",$("#energyItemname").val()).replace("tempenergyItemtype",$("#energyItemtype").val());
		$('#<portlet:namespace/>dg').treegrid('options').url= url;
		$('#<portlet:namespace/>dg').treegrid("reload");
	}
	
</script>