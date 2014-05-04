<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:  2012-6-5
	LastModified Date:
 -->
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="saveArticle" />
</portlet:actionURL>
<portlet:resourceURL id="getCategoryTree" var="categoryTreeUrl">
</portlet:resourceURL>
<div class="ftitle" style="width:50%">
<span>知识信息</span>
<span class="title-back" ><a href="javascript:history.go(-2);" >«返回</a></span>
</div>
<form:form modelAttribute="article" method="post" class="editform" action="#">
	<div class="div-table">
	    <div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="articlecategoryByCatId.catId">所属类别：</form:label>
					<form:input path="articlecategoryByCatId.catId" 
					style="width:205px; height:30px"/> 
				</div>
				<div class="fitem">
					<form:label path="articlecategoryByCatField.catId">所属领域：</form:label>
					<form:input path="articlecategoryByCatField.catId" 
					style="width:205px; height:30px"/> 
				</div>
				<div class="fitem">
					<form:label path="articlecategoryByCatBusiness.catId">所属业务：</form:label>
					<form:input path="articlecategoryByCatBusiness.catId" 
					style="width:205px; height:30px"/> 
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>资料标题：</label>
					<form:input path="title" cssClass="easyui-validatebox" required="true"  style="width:200px" /> *
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>资料来源：</label>
					<form:input path="source" cssClass="easyui-validatebox"  style="width:200px" /> 
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>资料作者：</label>
					<form:input path="author" cssClass="easyui-validatebox"   style="width:200px" /> 
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>资料摘要：</label>
					<form:textarea path="description" cssClass="easyui-validatebox" rows="5"  style="width:200px" /> 
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>资料内容：</label>
					<form:textarea path="content"  style="width:200px" />
					<script type="text/javascript" src="/html/js/editor/ckeditor/ckeditor.js"></script>
		            <script type="text/javascript" >
		            CKEDITOR.replace( 'content', 
		    		  {    
		            	    enterMode : Number( 2),//设置enter键的输入1.<p>2为<br/>3为<div> 
		                 	shiftEnterMode : Number( 1), // 设置shiftenter的输入 
		    	            language : 'zh-cn',
		    	            width: '50%',
		    		  });
          </script>
				</div>
			</div>
		</div>
	</div>
	<form:hidden path="articleId" />	
</form:form>

<div id="buttons" >
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" style="padding-left: 350px"
		onclick="<portlet:namespace/>saveArticle()">保存</a>
</div>
<script language="javascript">

/*** 保存
	*/
	function <portlet:namespace/>saveArticle() {
		$("#article").form('submit', {
			url:'<%=renderResponse.encodeURL(savePrefUrl)%>',
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				$.messager.alert('提示','数据保存成功!','info');
			}
		});
	}

	$(function(){
		$("#articlecategoryByCatId\\.catId").combotree({
			url:'<%=renderResponse.encodeURL(categoryTreeUrl)%>',
		});
	});
	$(function(){
		$("#articlecategoryByCatField\\.catId").combotree({
			url:'<%=renderResponse.encodeURL(categoryTreeUrl)%>',
		});
	});
	$(function(){
		$("#articlecategoryByCatBusiness\\.catId").combotree({
			url:'<%=renderResponse.encodeURL(categoryTreeUrl)%>',
		});
	});	
</script>	