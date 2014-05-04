 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午11:23:06
	LastModified Date: 2013-03-20 PING.CHEN
	Description: 支路拓扑描述
 -->
<portlet:resourceURL id="getCircuitinfos" var="getCircuitinfosURL">
</portlet:resourceURL>
<table id="<portlet:namespace/>dg" title="支路拓扑描述 " width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getCircuitinfosURL)%>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="circuitId" treeField="circuitName" toolbar="#<portlet:namespace/>tb">
		<thead>
			<tr>
				<th field="circuitId" width="80">支路编码</th>
				<th field="circuitName" width="100" formatter="formatName" align="left">支路名称</th>
				<th field="circuitState" width="100" formatter="formatState" align="left">支路状态</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>tb">
		<form:form commandName="searchform">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit()">修改</a>  
			<span style="margin-left:20px;"> </span>
			代码: <form:input path="circuitId" />
			名称: <form:input path="circuitName" />
			状态: <form:select path="circuitState">
					<form:option value="1">启用</form:option>
					<form:option value="0">停用</form:option>
			</form:select><a href="javascript:<portlet:namespace/>search();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">查找</a></form:form>
			
	</div>
	
	<script language="javascript">
	
	var console = console || {"log":function(){}};

	function formatState(val,row) {
		return val=="1"?"启用":"停用";
	}
	
	function formatBuildinfo(val,row) {
		return val.buildName;
	}
	
	function formatName(val,row) {
		if(row.circuitinfo!=null) {
			var pre = "";
			var i = parseTree(row.circuitinfo);
			console.log(i);
			
			var tag = "─",prefix = "└",blank="&nbsp;&nbsp;",tree = "";
			for(var j=1;j<i;j++) {
				if(j==1) {
					tree = prefix;
				}
				else {
					tree += "─";
					tree=blank+tree;
				}
			}
			return tree + val;
			
		} else {
			return val;
		}
	}
	
	//解析并转换树标记
	function parseTree(parent) {
	    var hasNonLeafNodes = false;
	    var childCount = 1;
	    for (var child in parent) {
	        if (typeof parent[child] === 'object') {
	            childCount += parseTree(parent[child]);
	            hasNonLeafNodes = true;
	        }
	    }

	    if (hasNonLeafNodes) {
	        // Add 'num_children' element and return the recursive result:
	        parent.num_children = childCount;
	        return childCount;
	    } else {
	        // This is a leaf item, so return 1:
	        return 1;
	    }
	}
	
	function <portlet:namespace/>add() {	
		//var node = $('#<portlet:namespace/>dg').treegrid('getSelected');
		var node = $('#<portlet:namespace/>dg').datagrid('getSelected');
		var addUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='addCircuitinfoForm' /><portlet:param name='circuitId' value='tempId' /></portlet:renderURL>";
		if (node){
			addUrl=addUrl.replace("tempId",node.circuitId);
		} else {
			addUrl=addUrl.replace("tempId","");
		}
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>edit() {
		//var node = $('#<portlet:namespace/>dg').treegrid('getSelected');
		var node = $('#<portlet:namespace/>dg').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editCircuitinfoForm' /><portlet:param name='circuitId' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.circuitId);
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	
	$(function(){
		
		//$('#<portlet:namespace/>dg').treegrid();
		$('#<portlet:namespace/>dg').datagrid({pageList:[20,30,40,50]});
	});
	
	
	function <portlet:namespace/>search() {		
		$.post('<portlet:resourceURL id="getCircuitinfos"></portlet:resourceURL>',{circuitId:$("#circuitId").val(),circuitName:$("#circuitName").val(),circuitState:$("#circuitState").val()},function(data){
			$('#<portlet:namespace/>dg').datagrid('loadData',data);
				},'json');
		//alert($('#<portlet:namespace/>dg').treegrid("getData"));
	}
	
</script>