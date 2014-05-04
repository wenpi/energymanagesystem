 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午11:23:35
	LastModified Date:
	Description:
 -->
 <div class="ftitle">
	<span>支路拓扑及装表维护</span>
	<span class="title-back"><a href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
</div>

<div id="tab-container" class="easyui-tabs" style="width:960px;">
	<div id="tab1" title="支路拓扑信息" style="padding: 10px;">
		<%@ include file="editCircuitinfoTab.jsp"%>
	</div>
	<div id="tab2" title="支路装表信息" style="padding: 10px;"
		href="<portlet:renderURL portletMode="edit" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
		<portlet:param name="action" value="meteruseinfo"></portlet:param>
		<portlet:param name="circuitId" value="${circuitinfo.circuitId}"></portlet:param>
	</portlet:renderURL>"></div>
</div>