<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-28 上午10:10:46
	LastModified Date:
	Description:
 -->

<div id="tab-container" class="easyui-tabs" style="width:1200px;">
	<div title="知识类别" style="padding: 10px;">
		<%@ include file="articlecategoryTab.jsp"%>
	</div>
	 <div title="节能知识" style="padding: 10px;"
		href="<portlet:renderURL portletMode="edit" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
		<portlet:param name="action" value="article"></portlet:param>
	</portlet:renderURL>"></div>
	</div>
</div>