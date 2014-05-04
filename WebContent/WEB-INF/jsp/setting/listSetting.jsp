 
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午10:14:20
	LastModified Date:
	Description:
 -->

<div id="tab-container" class="easyui-tabs" style="width: 100%;">
	<div title="数据中心" style="padding: 10px;">
		<%@ include file="listDatacenter.jsp"%>
	</div>
	
	

	<div title="数据字典" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listDictionary"></portlet:param>
	</portlet:renderURL>">数据字典</div>

	<div title="行政区划" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listDistrict"></portlet:param>
</portlet:renderURL>">行政区划</div>

	<div title="气候区设置" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listBigdistrict"></portlet:param>
</portlet:renderURL>">气候区设置</div>

	<div title="能源设置" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listEnergydict"></portlet:param>
</portlet:renderURL>">能源设置</div>

   <div title="能源价格信息" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listEnergyprice"></portlet:param>
</portlet:renderURL>">能源价格信息</div>

  <div title="能耗统计报表" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listEnergytotal"></portlet:param>
</portlet:renderURL>">能耗统计报表</div>

  <div title="建筑能耗标准" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listEnergystandard"></portlet:param>
</portlet:renderURL>">建筑能耗标准</div>
</div>
