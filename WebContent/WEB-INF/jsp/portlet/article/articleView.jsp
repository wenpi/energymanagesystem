
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
<style>

</style>

<div id="tab-container" class="easyui-tabs" style="width:972px;padding:10px;">
	<div title="按能源领域分类" style="padding: 10px;"
		class="articlecategory-container">
		<ul>
			<c:forEach items="${categories}" var="cat" varStatus="status">
				<c:if test="${cat.catType eq '能源领域'}">
					<li><a href="javascript:getArticleList('${cat.catId}')">${cat.catName}</a>
					</li>
				</c:if>
				<c:if test="${status.index eq 0}">
					<input type="hidden" name="catId" id="catId" value="${cat.catId}" />
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<div title="按业务领域分类" style="padding: 5px;"
		class="articlecategory-container">
		<ul>
			<c:forEach items="${categories}" var="cat" varStatus="status">
				<c:if test="${cat.catType eq '能源业务'}">
					<li><a href="javascript:getArticleList('${cat.catId}')">${cat.catName}</a>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<div title="按国别分类" style="padding: 10px;"
		class="articlecategory-container">
		<ul>
			<c:forEach items="${categories}" var="cat" varStatus="status">
				<c:if test="${cat.catType eq '国别分类'}">
					<li><a href="javascript:getArticleList('${cat.catId}')">${cat.catName}</a>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>


<div
	style="background: #f4f4f4; margin: 2px; padding: 5px; color: black; text-align: center; overflow: hidden;">
	关键字： <input id="search" type="text" style="height: 13px;" /> <input
		type="button" value="查找知识" style="font-size: 13px; width: 80px"
		onclick="search()" />
</div>


<table id="<portlet:namespace/>dg" title="知识库信息"
	toolbar="#<portlet:namespace/>tb" rownumbers="true" pagination="true"
	idField="articleId">
	<thead>
		<tr>
			<th field="title" width="350" align="left">资料标题</th>
			<th field="author" width="120" align="center">资料作者</th>
			<th field="source" width="120" align="center">资料来源</th>
		</tr>
	</thead>
</table>

<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
		var catid = $("#catId").val();
		if (catid != "") {
			getArticleList(catid);
		}

	});

	function getArticleList(catid) {
		var url = "<portlet:resourceURL id='getArticleList'><portlet:param name='catId' value='tempcatId' /></portlet:resourceURL>";
		url = url.replace("tempcatId", catid);
		$('#<portlet:namespace/>dg').datagrid({
				url : url,
				onDblClickRow : function(rowIndex, rowData) {
					var articleId = rowData.articleId;
					var url = '<portlet:renderURL><portlet:param value="showArticle" name="action" /><portlet:param value="tempid" name="articleId" /></portlet:renderURL>';
					url = url.replace('tempid', articleId);
					window.location.href = url;
				}
			});
	}

	function search() {
		var url = "<portlet:resourceURL id='getArticleListByContent'><portlet:param name='content' value='tempContent' /></portlet:resourceURL>";
		url = url.replace("tempContent", $("#search").val());
		$('#<portlet:namespace/>dg').datagrid({
			url : url
		});
	}
</script>

