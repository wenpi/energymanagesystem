<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-27 下午04:53:11
	LastModified Date:
	Description:
 -->
<portlet:resourceURL id="getStrategies" var="getStrategiesURL">
</portlet:resourceURL>
<table id="<portlet:namespace/>dg" class="easyui-datagrid"
	style="width: 960px; height: 250px"
	url="<%=renderResponse.encodeURL(getStrategiesURL)%>"
	toolbar="#<portlet:namespace/>tb" pagination="true" rownumbers="true"
	idField="strategyid" treeField="strategyname" fitColumns="true">
	<thead>
		<tr>
			<th field="ck" checkbox="true"></th>
			<th field="strategyname" width="50">策略名称</th>
			<th field="author" width="50">制订人</th>
			<th field="createdondate" width="50">制订日期</th>
			<th field="strategydesc" width="50">策略描述</th>
		</tr>
	</thead>
</table>
<div id="<portlet:namespace/>tb">
	<form:form commandName="searchform">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="<portlet:namespace/>add()">新增</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
			onclick="<portlet:namespace/>edit()">编辑</a>
		<span style="margin-left: 20px;"> </span>
			建筑: <form:input path="buildinfo.buildId" />
			策略名称: <form:input path="strategyname" />
			订制者:<form:input path="author" />
			状态: <form:select path="status">
			<form:option value=""></form:option>
			<form:option value="-1">未配置</form:option>
			<form:option value="1">已启用</form:option>
			<form:option value="0">已禁用</form:option>
		</form:select>
		<a href="javascript:<portlet:namespace/>search();"
			class="easyui-linkbutton" iconCls="icon-search" plain="true">查找</a>
	</form:form>

</div>



<script type="text/javascript">
		var url;
		function <portlet:namespace/>add() {
			var node = $('#<portlet:namespace/>dg').treegrid('getSelected');
			var addUrl = '<portlet:renderURL portletMode="edit"><portlet:param name="action" value="addStrategy" /><portlet:param name="strategyid" value="tempId" /></portlet:renderURL>';
			if (node){
				addUrl=addUrl.replace("tempId",node.strategyid);
			} else {
				addUrl=addUrl.replace("tempId","");
			}
			window.location.href = addUrl;
		}
		
		function <portlet:namespace/>edit() {
			var node = $('#<portlet:namespace/>dg').datagrid('getSelected');
			if (node){
				var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editStrategy' /><portlet:param name='strategyid' value='tempId' /></portlet:renderURL>";
				var url=editUrl.replace("tempId",node.strategyid);
				window.location.href = url;
			} else {
				alert("请选择数据行");
			}
		}
		
		$(function(){
			$('#<portlet:namespace/>dg').treegrid();
		});
		
		function <portlet:namespace/>search() {		
			$.post('<portlet:resourceURL id="getStrategies"></portlet:resourceURL>',
					{"buildinfo.buildId":$("#buildinfo\\.buildId").val(),strategyname:$("#strategyname").val(),author:$("#author").val(),status:$("#status").val()},function(data){
				$('#<portlet:namespace/>dg').treegrid('loadData',data);
					},'json');
			//alert($('#<portlet:namespace/>dg').treegrid("getData"));
		}

		/**
		* 获取建筑信息列表
		*/
		$("#buildinfo\\.buildId").combogrid({
			panelWidth:500,
			value:$("#buildinfo\\.buildId").val(),
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
					$('#buildinfo\\.buildId').combogrid("grid").datagrid("reload", { 'keyword': q });
	                $('#buildinfo\\.buildId').combogrid("setValue", q);
				}
			},
			onSelect:function(index,row){
		        loadCircuitinfos(row.buildId);
		    }
		});
		
	</script>
