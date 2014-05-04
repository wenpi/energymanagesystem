<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init-ext.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-28 上午10:11:14
	LastModified Date:
	Description:
 -->
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="saveArticlecategory" />
</portlet:actionURL>
<portlet:resourceURL id="getCategoryTree" var="categoryTreeUrl">
</portlet:resourceURL>
<portlet:resourceURL id="getArticlecategoryList" var="getArticlecategoryListURL">
</portlet:resourceURL>
<div id="<portlet:namespace/>dlg" class="easyui-dialog"
	style="width: 420px; height: 300px; padding: 10px 15px" closed="true"
	buttons="#<portlet:namespace/>dlg-buttons">
	<div class="ftitle">知识类别信息</div>
<form:form commandName="articlecategory" method="post" class="editform" action="#">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>类别名称：</label>
					<form:input path="catName" cssClass="easyui-validatebox" required="true"  style="width:200px" />*
				</div>
			</div>
		</div>
		
	  <div class="div-table-row">	
		<div class="div-table-col">
				<div class="fitem">
					<form:label path="articlecategory.catId">上级类别：</form:label>
					<form:input path="articlecategory.catId"  style="width:205px; height:30px"  />
				</div>
		</div>
	   </div>
	   	
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="catType">类别类型：</form:label>
					 <form:select path="catType" cssClass="easyui-validatebox"  style="width:205px; height:30px" >
		             <form:option value="能源领域">能源领域</form:option>
		             <form:option value="能源业务">能源业务</form:option>
		             <form:option value="国别分类">国别分类</form:option>
		            </form:select> 
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>类别备注：</label>
					<form:input path="catDesc" cssClass="easyui-validatebox"   style="width:200px" /> 
				</div>
			</div>
		</div>
	</div>
	 <form:hidden path="catId" />
</form:form>
<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" style="padding-left:150px;"
		onclick="<portlet:namespace/>saveArticlecategory()">保存</a>
</div>
</div>


<div id="<portlet:namespace/>tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add()">新增</a>
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit()">修改</a>
   		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="<portlet:namespace/>remove()">删除</a>
	</div>
</div>

 <table id="<portlet:namespace/>articlecategory" title="知识类别管理" class="easyui-datagrid"
	width="100%" style="height:auto;"
	url="<%=renderResponse.encodeURL(getArticlecategoryListURL)%>" rownumbers="true"
	pagination="true" fitColumns="true"  singleSelect="true"
	idField="catId" toolbar="#<portlet:namespace/>buildtb">
	<thead>
		<tr>
			<th field="catName" width="100" align="center">类别名称</th>
			<th field="articlecategory" width="100" align="center" formatter="formatparent">上级类别</th>
			<th field="catType" width="100" align="center">类别类型</th>
			<th field="catDesc" width="100" align="center">类别备注</th>
		</tr>
	</thead>
</table>
<script type="text/javascript">
	function formatparent(val,row) {
		return val==null ? '' : val.catName;
	}

   function <portlet:namespace/>add(){
	   $('#<portlet:namespace/>dlg').dialog('open').dialog('setTitle','编辑知识类别信息');
	   $(function(){
			$("#articlecategory\\.catId").combotree({
				url:'<%=renderResponse.encodeURL(categoryTreeUrl)%>',
				onChange:function() {
					var t = $("#articlecategory\\.catId").combotree('tree');
					var n = t.tree('getSelected');
					catType.value=n.iconCls;
					catType.disabled=true;
				}
			});
		});
	   $('#articlecategory').form('clear');
	   catType.disabled=false;
	   }
 //编辑
	function <portlet:namespace/>edit() {
		var row = $('#<portlet:namespace/>articlecategory').datagrid('getSelected');
		if (row){
			$('#<portlet:namespace/>dlg').dialog('open').dialog('setTitle','编辑知识类别信息');
			$('#articlecategory').form('load',row);
			
			$("#articlecategory\\.catId").combotree('setValue','');
			$.each(row.articlecategory,function(index,obj){
				if(index=='catId') {
					$("#articlecategory\\.catId").combotree('setValue',obj);
				}	
			});

		}
	}
	/**
	* 保存
	*/
	function <portlet:namespace/>saveArticlecategory() {
		$("#articlecategory").form('submit', {
			url:'<%=renderResponse.encodeURL(savePrefUrl)%>',
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				$.messager.alert('提示','数据保存成功!','info');
				$('#<portlet:namespace/>articlecategory').datagrid('reload');	
				$('#<portlet:namespace/>dlg').dialog('close');
				
			}
		});
	}

	$(function(){
		$("#articlecategory\\.catId").combotree({
			url:'<%=renderResponse.encodeURL(categoryTreeUrl)%>',
			//idFiled:'catId',
			onChange:function() {
				var t = $("#articlecategory\\.catId").combotree('tree');
				var n = t.tree('getSelected');
				catType.value=n.iconCls;
				catType.disabled=true;
			}
		});
	});

	/**
	* 删除记录
	*/
	function <portlet:namespace/>remove() {
		var ids = [];
		var rows = $('#<portlet:namespace/>articlecategory').datagrid('getSelected');
		if (rows){
			$.messager.confirm('删除确认','确定要删除此选定的数据吗?',function(r){
				if (r){
					var removeUrl = "<portlet:resourceURL id='removeArticlecategory'></portlet:resourceURL>";
					$.post(removeUrl,{catId:rows.catId},function(result){
						if (result.success){
							$.messager.alert('提示','数据删除成功!','info');
							$('#<portlet:namespace/>articlecategory').datagrid('reload');
						} else {
							$.messager.alert('提示','请先删除所选类别的子类别!','info');
						}
					},'json');
				} 
			});
		}else {
			$.messager.alert('提示','请选择您要删除行','info');
		}
	}
</script>
 
 

