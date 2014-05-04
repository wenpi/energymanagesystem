
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
<div class="ftitle">
	<span>建筑信息111221</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
</div>
<div id="<portlet:namespace/>tab-container" class="easyui-tabs"
	style="width: 960px;">
	<div title="基本信息1111" style="padding: 10px;">
		<%@ include file="editBuildTab.jsp"%>
	</div>
	<div title="扩展信息222" style="padding: 10px;"
		href="<portlet:renderURL portletMode="edit" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
		<portlet:param name="action" value="buildexinfo"></portlet:param>
		<portlet:param name="buildId" value="${buildinfo.buildId}"></portlet:param>
	</portlet:renderURL>">扩展信息222</div>
	<div title="附加文件333" style="padding: 10px;">
		<a
			href="<portlet:renderURL portletMode="edit" windowState="<%=LiferayWindowState.POP_UP.toString()%>">
		<portlet:param name="action" value="buildaddfile"></portlet:param>
		<portlet:param name="buildId" value="000003020003"></portlet:param>
	</portlet:renderURL>">附加文件333</a>
	</div>
	<div title="区域设置444" style="padding: 10px;">
		<a
			href="<portlet:renderURL portletMode="edit" windowState="<%=LiferayWindowState.POP_UP.toString()%>">
		<portlet:param name="action" value="buildregioninfo"></portlet:param>
		<portlet:param name="buildId" value="000003020003"></portlet:param>
	</portlet:renderURL>">区域设置444</a>
	</div>
	<div title="网络设置" style="padding: 10px;">
		<a
			href="<portlet:renderURL portletMode="edit" windowState="<%=LiferayWindowState.POP_UP.toString()%>">
		<portlet:param name="action" value="buildsettinginfo"></portlet:param>
		<portlet:param name="buildId" value="000003020003"></portlet:param>
	</portlet:renderURL>">网络设置</a>
	</div>
</div>