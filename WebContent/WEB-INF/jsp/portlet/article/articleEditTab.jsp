<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-28 上午10:11:14
	LastModified Date:
	Description:
 -->
<portlet:resourceURL id="getBuildinfos" var="getBuildinfosURL">
</portlet:resourceURL>
<portlet:resourceURL id="getArticlePageList" var="getArticlePageListURL">
</portlet:resourceURL>
<portlet:renderURL var="addArticleForm"  portletMode="edit">
	<portlet:param name="action" value="addArticleForm" />
</portlet:renderURL>


<div id="<portlet:namespace/>ar" style="padding:5px height:auto">
	<div style="margin-bottom:5px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add()"> 新增</a>
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>update()">修改</a>
   		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="<portlet:namespace/>del()">删除</a>
	</div>
</div>

<table id="<portlet:namespace/>articlePage" title="知识信息管理" class="easyui-datagrid"
	width="100%" style="height:auto;"
	url="<%=renderResponse.encodeURL(getArticlePageListURL)%>" rownumbers="true"
	pagination="true" fitColumns="true"  singleSelect="true"
	idField="articleId" toolbar="#<portlet:namespace/>buildtb">
	<thead>
		<tr>
			<th field="title" width="100" align="center" >资料标题</th>
			<th field="articlecategoryByCatId" width="100" align="center" formatter="formatType">所属类别</th>
			<th field="author" width="100" align="center" >资料作者</th>
			<th field="source" width="100" align="center">资料来源</th>
		</tr>
	</thead>
</table>

<portlet:resourceURL id="getArticlecategoryList" var="getArticlecategoryList"></portlet:resourceURL>
<script language="javascript">

  function formatType(val,row) {
	return val==null ? '' : val.catName;
  }

	function <portlet:namespace/>add() {
		var addUrl = '<%=renderResponse.encodeURL(addArticleForm)%>';
		//addUrl = addUrl.replace('pop_up','normal');
		window.location.href = addUrl;
	}


	//编辑记录
	function <portlet:namespace/>update() {
		var row = $('#<portlet:namespace/>articlePage').datagrid('getSelected');
		if (row){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editArticleForm' /><portlet:param name='articleId' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",row.articleId);
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	} 
	
	
	function <portlet:namespace/>del() {
		var rows = $('#<portlet:namespace/>articlePage').datagrid('getSelected');
		if (rows){
			$.messager.confirm('删除确认','确定要删除此选定的数据吗?',function(r){
				if (r){
					var removeUrl = "<portlet:resourceURL id='removeArticle'></portlet:resourceURL>";
					$.post(removeUrl,{articleId:rows.articleId},function(result){
						if (result.success){
							$.messager.alert('提示','数据删除成功!','info');
							$('#<portlet:namespace/>articlePage').datagrid('reload');
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