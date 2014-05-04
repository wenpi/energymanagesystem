 
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午10:14:20
	LastModified Date:
	Description:
 -->

    <div id="tab-container" class="easyui-tabs" style="width: 100%;">
	<div title="制冷机" style="padding: 10px;">
		<%@ include file="listChi.jsp"%>
	</div>

	<div title="锅炉" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listBoi"></portlet:param>
	</portlet:renderURL>">锅炉</div>

	<div title="水泵" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listPump"></portlet:param>
</portlet:renderURL>">水泵</div>

	<div title="冷却塔" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listCt"></portlet:param>
</portlet:renderURL>">冷却塔</div>

	<div title="空调箱" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listAhu"></portlet:param>
</portlet:renderURL>">空调箱</div>

   <div title="风机盘管" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listFcu"></portlet:param>
</portlet:renderURL>">风机盘管</div>

  <div title="变风量箱" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listVav"></portlet:param>
</portlet:renderURL>">变风量箱</div>

  <div title="灯具" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listLighting"></portlet:param>
</portlet:renderURL>">灯具</div>

    <div title="电梯" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listLift"></portlet:param>
</portlet:renderURL>">电梯</div>

    <div title="电加热器" style="padding: 10px;"
		href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
	<portlet:param name="action" value="listHeater"></portlet:param>
</portlet:renderURL>">电加热器</div>
</div>
