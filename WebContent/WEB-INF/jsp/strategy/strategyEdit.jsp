<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-27 下午04:53:20
	LastModified Date:
	Description:
 -->
 <div class="ftitle">
	<span>策略信息设置</span>
	<span class="title-back"><a href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
</div>

<div id="tab-container" class="easyui-tabs" style="width:960px;">
	<div id="tab1" title="策略信息" style="padding: 10px;">
		<%@ include file="strategyEditTab.jsp"%>
	</div>
	<div id="tab2" title="策略设置" style="padding: 10px;"
		href="<portlet:renderURL portletMode="edit" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
		<portlet:param name="action" value="strategydetail"></portlet:param>
		<portlet:param name="strategyid" value="${strategy.strategyid}"></portlet:param>
	</portlet:renderURL>"></div>
</div>

