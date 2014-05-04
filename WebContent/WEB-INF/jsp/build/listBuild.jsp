 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
<div id="tab-container" class="easyui-tabs" style="width:960px;">
	<div title="所有建筑" style="padding: 10px;">
		<%@ include file="listBuildTab.jsp"%>
	</div>
	<div title="建筑群" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listBuildgroup"></portlet:param>
	</portlet:renderURL>"></div>
</div>