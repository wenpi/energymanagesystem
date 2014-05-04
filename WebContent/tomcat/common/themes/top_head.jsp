<%
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ include file="/html/common/init.jsp" %>

<c:if test="<%= PropsValues.MONITORING_PORTAL_REQUEST %>">
	<%@ include file="/html/common/themes/top_monitoring.jspf" %>
</c:if>

<%@ include file="/html/common/themes/top_meta.jspf" %>
<%@ include file="/html/common/themes/top_meta-ext.jsp" %>

<link rel="Shortcut Icon" href="<%= themeDisplay.getPathThemeImages() %>/<%= PropsValues.THEME_SHORTCUT_ICON %>" />
<%-- Portal CSS --%>

 <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/html5.js")) %>" language="javascript"></script>
    <![endif]-->

<link href="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/portal/css.jsp")) %>" rel="stylesheet" type="text/css" />
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery-1.9.1.min.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery-migrate-1.2.1.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery.slides.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery-easyui/jquery.easyui.min.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery-easyui/locale/easyui-lang-zh_CN.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery-easyui/jquery.easyui.validator.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery-easyui/datagrid-detailview.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery.json-2.3.min.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/serializeObject.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/i18n/jquery.ui.datepicker-zh-CN.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery.ui.core.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery.ui.datepicker.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/highcharts.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/common.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/indexcommon.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/renderToCharts.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/toEnerEffiCharts.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/autoRenderToCharts.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery-ui-1.10.3.custom.min.js")) %>" language="javascript"></script>
<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/My97DatePicker/WdatePicker.js")) %>" language="javascript"></script>
<link href="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/styles/themes/smoothness/jquery-ui-1.10.3.custom.css")) %>" rel="stylesheet" type="text/css" />
<!--  <script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/scripts/jquery-ui-1.9.2.custom.min.js")) %>" language="javascript"></script>  -->
<link href="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/styles/themes/bootstrap/easyui.css")) %>" rel="stylesheet" type="text/css" />
<link href="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/styles/themes/default/assetms.css")) %>" rel="stylesheet" type="text/css" />
<link href="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/styles/themes/icon.css")) %>" rel="stylesheet" type="text/css" />
<link href="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathContext() + "/html/company/styles/themes/smoothness/jquery-ui-1.8.21.custom.css")) %>" rel="stylesheet" type="text/css" />

<script type="text/javascript">
var report_pageSize = 12; // 报表管理中放大页面的分页条数 
// 二级菜单定位
function locateMenu(name){
	var finalUrl = '', num = 0; // li标签的索引
	if(name == "<%=new String("关键信息".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_coreInfo", num = 0;
	if(name == "<%=new String("模块概览".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_modelPreview", num = 1;
	if(name == "<%=new String("设备监测".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "monitoring", num = 0;
	if(name == "<%=new String("全息图".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "hologram", num = 1;
	if(name == "<%=new String("重要能耗信息".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_energyinfo", num = 0;
	if(name == "<%=new String("建筑总体能耗".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_totalenergy", num = 1;
	if(name == "<%=new String("建筑系统能耗".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_systemenergy", num = 2;
	if(name == "<%=new String("建筑设备能耗".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_deviceenergy", num = 3;
	if(name == "<%=new String("重要能效指标".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_target", num = 0;
	if(name == "<%=new String("建筑总体能效指标".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_totaltarget", num = 1;
	if(name == "<%=new String("建筑系统能效指标".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_systemtarget", num = 2;
	if(name == "<%=new String("建筑设备能效指标".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_devicetarget", num = 3;
	if(name == "<%=new String("能耗报表".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_energyreport", num = 0;
	if(name == "<%=new String("能效指标".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_energytarget", num = 1;
	if(name == "<%=new String("运行参数".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_runningparam", num = 2;
	if(name == "<%=new String("设备台账".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_devicemachine", num = 3;
	if(name == "<%=new String("建筑用能账单".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_energymachine", num = 4;
	if(name == "<%=new String("计量报表".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_measurereport", num = 5;
	if(name == "<%=new String("能耗异常".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_energyexception", num = 0;
	if(name == "<%=new String("设备故障".getBytes("ISO-8859-1"),"UTF-8")%>") 
		finalUrl = "#_devices", num = 1;
	location.href = finalUrl;
	
	// 处理菜单上的样式效果
	$("#tb_div_navigation>ul>li").each(
		function(index) {
			if ($(this).hasClass("selected")) {
				
				var colors = $(this).children("div").children("a").children("i").css("background-color");
				$(this).children("div").children("a").children("p").css("background-color", colors);
				// 移除原来选择的二级菜单样式
				$("#tb_div_navigation>ul>.selected>ul>li").each(
					function(childIndex) {
						if ($(this).hasClass("selected")) {
							$(this).removeClass("selected");
						}
					}
				);
				// 为新选择的二级菜单添加选中样式
				$(this).children("ul").children("li:eq(" + num + ")").addClass("selected"); // 二级菜单选中
				$(this).children().css("display", "block"); // 显示对应的子菜单
			}
		}
	);
}
</script>

<%
List<Portlet> portlets = null;

if (layout != null) {
	String ppid = ParamUtil.getString(request, "p_p_id");

	if (ppid.equals(PortletKeys.PORTLET_CONFIGURATION)) {
		portlets = new ArrayList<Portlet>();

		portlets.add(PortletLocalServiceUtil.getPortletById(company.getCompanyId(), PortletKeys.PORTLET_CONFIGURATION));

		ppid = ParamUtil.getString(request, PortalUtil.getPortletNamespace(ppid) + "portletResource");

		if (Validator.isNotNull(ppid)) {
			portlets.add(PortletLocalServiceUtil.getPortletById(company.getCompanyId(), ppid));
		}
	}
	else if (layout.isTypePortlet()) {
		portlets = layoutTypePortlet.getAllPortlets();

		if (themeDisplay.isStateMaximized() || themeDisplay.isStatePopUp()) {
			if (Validator.isNotNull(ppid)) {
				Portlet portlet = PortletLocalServiceUtil.getPortletById(company.getCompanyId(), ppid);

				if (!portlets.contains(portlet)) {
					portlets.add(portlet);
				}
			}
		}
	}
	else if ((layout.isTypeControlPanel() || layout.isTypePanel()) && Validator.isNotNull(ppid)) {
		portlets = new ArrayList<Portlet>();

		portlets.add(PortletLocalServiceUtil.getPortletById(company.getCompanyId(), ppid));
	}

	request.setAttribute(WebKeys.LAYOUT_PORTLETS, portlets);
}
%>

<%-- Portlet CSS References --%>

<c:if test="<%= portlets != null %>">

	<%
	Set<String> headerPortalCssSet = new LinkedHashSet<String>();

	for (Portlet portlet : portlets) {
		for (String headerPortalCss : portlet.getHeaderPortalCss()) {
			if (!HttpUtil.hasProtocol(headerPortalCss)) {
				headerPortalCss = PortalUtil.getStaticResourceURL(request, request.getContextPath() + headerPortalCss, portlet.getTimestamp());
			}

			if (!headerPortalCssSet.contains(headerPortalCss)) {
				headerPortalCssSet.add(headerPortalCss);
	%>

				<link href="<%= HtmlUtil.escape(headerPortalCss) %>" rel="stylesheet" type="text/css" />

	<%
			}
		}
	}

	Set<String> headerPortletCssSet = new LinkedHashSet<String>();

	for (Portlet portlet : portlets) {
		for (String headerPortletCss : portlet.getHeaderPortletCss()) {
			if (!HttpUtil.hasProtocol(headerPortletCss)) {
				headerPortletCss = PortalUtil.getStaticResourceURL(request, portlet.getContextPath() + headerPortletCss, portlet.getTimestamp());
			}

			if (!headerPortletCssSet.contains(headerPortletCss)) {
				headerPortletCssSet.add(headerPortletCss);
	%>

				<link href="<%= HtmlUtil.escape(headerPortletCss) %>" rel="stylesheet" type="text/css" />

	<%
			}
		}
	}
	%>

</c:if>

<%-- Portal JavaScript References --%>

<%@ include file="/html/common/themes/top_js.jspf" %>
<%@ include file="/html/common/themes/top_js-ext.jspf" %>

<%-- Portlet JavaScript References --%>

<c:if test="<%= portlets != null %>">

	<%
	Set<String> headerPortalJavaScriptSet = new LinkedHashSet<String>();

	for (Portlet portlet : portlets) {
		for (String headerPortalJavaScript : portlet.getHeaderPortalJavaScript()) {
			if (!HttpUtil.hasProtocol(headerPortalJavaScript)) {
				headerPortalJavaScript = PortalUtil.getStaticResourceURL(request, request.getContextPath() + headerPortalJavaScript, portlet.getTimestamp());
			}

			if (!headerPortalJavaScriptSet.contains(headerPortalJavaScript) && !themeDisplay.isIncludedJs(headerPortalJavaScript)) {
				headerPortalJavaScriptSet.add(headerPortalJavaScript);
	%>

				<script src="<%= HtmlUtil.escape(headerPortalJavaScript) %>" type="text/javascript"></script>

	<%
			}
		}
	}

	Set<String> headerPortletJavaScriptSet = new LinkedHashSet<String>();

	for (Portlet portlet : portlets) {
		for (String headerPortletJavaScript : portlet.getHeaderPortletJavaScript()) {
			if (!HttpUtil.hasProtocol(headerPortletJavaScript)) {
				headerPortletJavaScript = PortalUtil.getStaticResourceURL(request, portlet.getContextPath() + headerPortletJavaScript, portlet.getTimestamp());
			}

			if (!headerPortletJavaScriptSet.contains(headerPortletJavaScript)) {
				headerPortletJavaScriptSet.add(headerPortletJavaScript);
	%>

				<script src="<%= HtmlUtil.escape(headerPortletJavaScript) %>" type="text/javascript"></script>

	<%
			}
		}
	}
	%>

</c:if>

<%-- Raw Text --%>

<%
List<String> markupHeaders = (List<String>)request.getAttribute(MimeResponse.MARKUP_HEAD_ELEMENT);

if (markupHeaders != null) {
	for (String markupHeader : markupHeaders) {
%>

		<%= markupHeader %>

<%
	}
}

StringBundler pageTopSB = (StringBundler)request.getAttribute(WebKeys.PAGE_TOP);
%>

<c:if test="<%= pageTopSB != null %>">

	<%
	pageTopSB.writeTo(out);
	%>

</c:if>

<%-- Theme CSS --%>

<link class="lfr-css-file" href="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getPathThemeCss() + "/main.css")) %>" rel="stylesheet" type="text/css" />

<style type="text/css">
	/* <![CDATA[ */
		<c:if test="<%= !themeDisplay.getCompanyLogo().equals(StringPool.BLANK) %>">
			#heading .logo {
				background: url(<%= HtmlUtil.escape(themeDisplay.getCompanyLogo()) %>) no-repeat;
				display: block;
				font-size: 0;
				height: <%= themeDisplay.getCompanyLogoHeight() %>px;
				text-indent: -9999em;
				width: <%= themeDisplay.getCompanyLogoWidth() %>px;
			}
		</c:if>

		<c:if test="<%= BrowserSnifferUtil.isIe(request) && (BrowserSnifferUtil.getMajorVersion(request) < 7) %>">
			img, .png {
				position: relative;
				behavior: expression(
					(this.runtimeStyle.behavior = "none") &&
					(
						this.pngSet || (this.src && this.src.toLowerCase().indexOf('spacer.png') > -1) ?
							this.pngSet = true :
								(
									this.nodeName == "IMG" &&
									(
										(
											(this.src.toLowerCase().indexOf('.png') > -1) ||
											(this.className && ([''].concat(this.className.split(' ')).concat(['']).join('|').indexOf('|png|')) > -1)
										) &&
										(this.className.indexOf('no-png-fix') == -1)
									) ?
										(
											this.runtimeStyle.backgroundImage = "none",
											this.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + this.src + "', sizingMethod='image')",
											this.src = "<%= themeDisplay.getPathThemeImages() %>/spacer.png"
										) :
											(
												(
													(this.currentStyle.backgroundImage.toLowerCase().indexOf('.png') > -1) ||
													(this.className && ([''].concat(this.className.split(' ')).concat(['']).join('|').indexOf('|png|')) > -1)
												) ?
													(
															this.origBg = this.origBg ?
																this.origBg :
																this.currentStyle.backgroundImage.toString().replace('url("','').replace('")',''),
																this.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + this.origBg + "', sizingMethod='crop')",
																this.runtimeStyle.backgroundImage = "none"
													) :
														''
											)
								),
								this.pngSet = true
					)
				);
			}
		</c:if>
	/* ]]> */
</style>

<%-- User Inputted Layout CSS --%>

<c:if test="<%= (layout != null) && Validator.isNotNull(layout.getCssText()) %>">
	<style type="text/css">
		<%= layout.getCssText() %>
	</style>
</c:if>

<%-- User Inputted Portlet CSS --%>

<c:if test="<%= portlets != null %>">
	<style type="text/css">

		<%
		for (Portlet portlet : portlets) {
			PortletPreferences portletSetup = PortletPreferencesFactoryUtil.getLayoutPortletSetup(layout, portlet.getPortletId());

			String portletSetupCss = portletSetup.getValue("portlet-setup-css", StringPool.BLANK);
		%>

			<c:if test="<%= Validator.isNotNull(portletSetupCss) %>">

				<%
				try {
				%>

					<%@ include file="/html/common/themes/portlet_css.jspf" %>

				<%
				}
				catch (Exception e) {
					if (_log.isWarnEnabled()) {
						_log.warn(e.getMessage());
					}
				}
				%>

			</c:if>

		<%
		}
		%>

	</style>
</c:if>

<%!
private static Log _log = LogFactoryUtil.getLog("portal-web.docroot.html.common.themes.top_head.jsp");
%>