<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-10 上午10:44:37
	LastModified Date:
	Description:
 -->

<portlet:renderURL var="selDatasourceURL" portletMode="edit">
	<portlet:param name="action" value="selectEnergyitemdict" />
</portlet:renderURL>
<portlet:renderURL var="selBuildsURL"     portletMode="edit">
	<portlet:param name="action" value="selectEnergyitemdict" />
</portlet:renderURL>
<portlet:renderURL var="sendParamsURL"     portletMode="edit">>
	<portlet:param name="action" value="selectEnergyitemdict" />
</portlet:renderURL>
<div id="subscription">
	<div class="banner">
		<img
			src="<%=renderRequest.getContextPath()%>/images/banner/subscription.png" />
	</div>
	<div class="nav">
		<ul>
			<c:choose>
				<c:when test="<%= themeDisplay.isSignedIn() %>">
					<li class="next"><a
						href="<%=renderResponse.encodeURL(selDatasourceURL)%>">登陆平台账户</a>
					</li>
					<li class="next"><a
						href="<%=renderResponse.encodeURL(selDatasourceURL)%>">选择订阅数据类型</a>
					</li>
					<li class="next"><a
						href="<%=renderResponse.encodeURL(selBuildsURL)%>">选择数据来源</a></li>
					<li class="last"><a
						href="<%=renderResponse.encodeURL(sendParamsURL)%>">填写发送参数</a></li>
				</c:when>
				<c:otherwise>

					<portlet:renderURL var="loginURL"
						secure="<%= request.isSecure() %>">
						<portlet:param name="saveLastPath" value="0" />
						<portlet:param name="struts_action" value="/login/login" />
					</portlet:renderURL>

					<li class="next"><a
						href="<%=themeDisplay.getPathMain()%>/portal/login"
						title="请登陆平台后进行操作">登陆平台账户</a></li>
					<li class="next"><a
						href="<%=themeDisplay.getPathMain()%>/portal/login"
						title="请登陆平台后进行操作">选择订阅数据类型</a></li>
					<li class="next"><a
						href="<%=themeDisplay.getPathMain()%>/portal/login"
						title="请登陆平台后进行操作">选择数据来源</a></li>
					<li class="last"><a
						href="<%=themeDisplay.getPathMain()%>/portal/login"
						title="请登陆平台后进行操作">填写发送参数</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>

	<div class="desc">数据订阅服务的意议（文字描述）</div>
	<portlet:renderURL var="helpUrl" portletMode="help"></portlet:renderURL>
	<div class="functions">
		<ul>
			<li class="break"><img
				src="<%=renderRequest.getContextPath()%>/images/icons/industry_32x32.png" />
				<a href="<%=renderResponse.encodeURL(helpUrl)%>#建筑物业">建筑物业</a>
				<p>建筑用能详细情况</p>
			</li>
			<li><img
				src="<%=renderRequest.getContextPath()%>/images/icons/testprinter.png" />
				<a href="<%=renderResponse.encodeURL(helpUrl)%>#能源专家">能源专家 </a>
				<p>提供不同区域用能数据</p></li>
			<li><img
				src="<%=renderRequest.getContextPath()%>/images/icons/devicedata.png" />
				<a href="<%=renderResponse.encodeURL(helpUrl)%>#">设备厂商 </a>
				<p>设备详细的运行能耗数据</p></li>
			<li><img
				src="<%=renderRequest.getContextPath()%>/images/icons/industry_32x32.png" />
				<a href="<%=renderResponse.encodeURL(helpUrl)%>#">政府部门 </a>
				<p>管辖区域建筑能耗情况</p></li>
			<li class="break"><img
				src="<%=renderRequest.getContextPath()%>/images/icons/industry_32x32.png" />
				<a href="<%=renderResponse.encodeURL(helpUrl)%>#">能耗报表 </a>
				<p>指定项目用能报表</p></li>
			<li><img
				src="<%=renderRequest.getContextPath()%>/images/icons/industry_32x32.png" />
				<a href="<%=renderResponse.encodeURL(helpUrl)%>#">区域数据 </a>
				<p>提供不同区域用能数据</p></li>
			<li><img
				src="<%=renderRequest.getContextPath()%>/images/icons/industry_32x32.png" />
				<a href="<%=renderResponse.encodeURL(helpUrl)%>#">设备数据</a>
				<p>设备详细的运行能耗数据</p></li>
			<li><img
				src="<%=renderRequest.getContextPath()%>/images/icons/industry_32x32.png" />
				<a href="<%=renderResponse.encodeURL(helpUrl)%>#">政府部门 </a>
				<p>管辖区域建筑能耗情况</p></li>
		</ul>
	</div>
</div>