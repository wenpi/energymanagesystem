
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-2 下午05:11:56
	LastModified Date:
	Description:
 -->
<div class="ftitle">
	<span>知识信息</span> <span class="title-back"><a
		href="javascript:history.go(-1);">«返回</a> </span>
</div>
<div class="article-layout" id="article">
	<div class="arttitle">${article.title}</div>
	<div class="copyright">资料作者: ${article.author} 资料来源:
		${article.source}</div>

	<c:if test="${!empty article.description}">
		<div class="description">${article.description}</div>
	</c:if>
	<div class="artcontent">${article.content}</div>
</div>



