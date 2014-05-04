<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet"%>
<%@ taglib uri="http://liferay.com/tld/security"
	prefix="liferay-security"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util"%>

<%@ page import="javax.portlet.MimeResponse"%>
<%@ page import="javax.portlet.PortletConfig"%>
<%@ page import="javax.portlet.PortletContext"%>
<%@ page import="javax.portlet.PortletException"%>
<%@ page import="javax.portlet.PortletMode"%>
<%@ page import="javax.portlet.PortletPreferences"%>
<%@ page import="javax.portlet.PortletRequest"%>
<%@ page import="javax.portlet.PortletResponse"%>
<%@ page import="javax.portlet.PortletSession"%>
<%@ page import="javax.portlet.PortletURL"%>
<%@ page import="javax.portlet.RenderRequest"%>
<%@ page import="javax.portlet.RenderResponse"%>
<%@ page import="javax.portlet.ResourceURL"%>
<%@ page import="javax.portlet.UnavailableException"%>
<%@ page import="javax.portlet.ValidatorException"%>
<%@ page import="javax.portlet.WindowState"%>
<%@ page import="javax.portlet.PortletSession"%>

<%@ page import="com.liferay.counter.service.CounterLocalServiceUtil"%>
<%@ page import="com.liferay.portal.NoSuchUserException"%>
<%@ page import="com.liferay.portal.kernel.captcha.CaptchaMaxChallengesException"%>
<%@ page import="com.liferay.portal.kernel.captcha.CaptchaTextException"%>
<%@ page import="com.liferay.portal.kernel.bean.BeanParamUtil"%>
<%@ page import="com.liferay.portal.kernel.bean.BeanPropertiesUtil"%>
<%@ page import="com.liferay.portal.kernel.cal.Recurrence"%>
<%@ page import="com.liferay.portal.kernel.configuration.Filter"%>
<%@ page import="com.liferay.portal.kernel.dao.orm.QueryUtil"%>
<%@ page import="com.liferay.portal.kernel.dao.search.DAOParamUtil"%>
<%@ page import="com.liferay.portal.kernel.dao.search.DisplayTerms"%>
<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow"%>
<%@ page import="com.liferay.portal.kernel.dao.search.RowChecker"%>
<%@ page import="com.liferay.portal.kernel.dao.search.ScoreSearchEntry"%>
<%@ page import="com.liferay.portal.kernel.dao.search.SearchContainer"%>
<%@ page import="com.liferay.portal.kernel.dao.search.SearchEntry"%>
<%@ page import="com.liferay.portal.kernel.dao.search.TextSearchEntry"%>
<%@ page import="com.liferay.portal.kernel.exception.PortalException"%>
<%@ page import="com.liferay.portal.kernel.exception.SystemException"%>
<%@ page import="com.liferay.portal.kernel.io.unsync.UnsyncStringReader"%>
<%@ page import="com.liferay.portal.kernel.json.JSONArray"%>
<%@ page import="com.liferay.portal.kernel.json.JSONFactoryUtil"%>
<%@ page import="com.liferay.portal.kernel.json.JSONObject"%>
<%@ page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@ page import="com.liferay.portal.kernel.language.LanguageWrapper"%>
<%@ page import="com.liferay.portal.kernel.language.UnicodeLanguageUtil"%>
<%@ page import="com.liferay.portal.kernel.log.Log"%>
<%@ page import="com.liferay.portal.kernel.log.LogFactoryUtil"%>
<%@ page import="com.liferay.portal.kernel.log.LogUtil"%>
<%@ page import="com.liferay.portal.kernel.messaging.DestinationNames"%>
<%@ page import="com.liferay.portal.kernel.messaging.MessageBusUtil"%>
<%@ page import="com.liferay.portal.kernel.portlet.DynamicRenderRequest"%>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayPortletMode"%>
<%@ page
	import="com.liferay.portal.kernel.portlet.LiferayPortletRequest"%>
<%@ page
	import="com.liferay.portal.kernel.portlet.LiferayPortletResponse"%>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayPortletURL"%>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>
<%@ page import="com.liferay.portal.kernel.search.Field"%>
<%@ page import="com.liferay.portal.kernel.servlet.BrowserSnifferUtil"%>
<%@ page
	import="com.liferay.portal.kernel.servlet.ImageServletTokenUtil"%>
<%@ page import="com.liferay.portal.kernel.servlet.ServletContextUtil"%>
<%@ page import="com.liferay.portal.kernel.servlet.SessionErrors"%>
<%@ page import="com.liferay.portal.kernel.servlet.SessionMessages"%>
<%@ page
	import="com.liferay.portal.kernel.servlet.StringServletResponse"%>
<%@ page import="com.liferay.portal.kernel.util.ArrayUtil"%>
<%@ page import="com.liferay.portal.kernel.util.BooleanWrapper"%>
<%@ page import="com.liferay.portal.kernel.util.BreadcrumbsUtil"%>
<%@ page import="com.liferay.portal.kernel.util.CalendarFactoryUtil"%>
<%@ page import="com.liferay.portal.kernel.util.CalendarUtil"%>
<%@ page import="com.liferay.portal.kernel.util.CharPool"%>
<%@ page import="com.liferay.portal.kernel.util.Constants"%>
<%@ page import="com.liferay.portal.kernel.util.ContentTypes"%>
<%@ page import="com.liferay.portal.kernel.util.DateFormatFactoryUtil"%>
<%@ page import="com.liferay.portal.kernel.util.DateUtil"%>
<%@ page import="com.liferay.portal.kernel.util.FastDateFormatFactoryUtil"%>
<%@ page import="com.liferay.portal.kernel.util.FileUtil"%>
<%@ page import="com.liferay.portal.kernel.util.GetterUtil"%>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil"%>
<%@ page import="com.liferay.portal.kernel.util.Http"%>
<%@ page import="com.liferay.portal.kernel.util.HttpUtil"%>
<%@ page import="com.liferay.portal.kernel.util.IntegerWrapper"%>
<%@ page import="com.liferay.portal.kernel.util.JavaConstants"%>
<%@ page import="com.liferay.portal.kernel.util.KeyValuePair"%>
<%@ page import="com.liferay.portal.kernel.util.KeyValuePairComparator"%>
<%@ page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@ page import="com.liferay.portal.kernel.util.LocaleUtil"%>
<%@ page import="com.liferay.portal.kernel.util.LocalizationUtil"%>
<%@ page import="com.liferay.portal.kernel.util.LongWrapper"%>
<%@ page import="com.liferay.portal.kernel.util.MathUtil"%>
<%@ page import="com.liferay.portal.kernel.util.ObjectValuePair"%>
<%@ page import="com.liferay.portal.kernel.util.ObjectValuePairComparator"%>
<%@ page import="com.liferay.portal.kernel.util.OrderByComparator"%>
<%@ page import="com.liferay.portal.kernel.util.OrderedProperties"%>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ page import="com.liferay.portal.kernel.util.PrefsParamUtil"%>
<%@ page import="com.liferay.portal.kernel.util.PropertiesParamUtil"%>
<%@ page import="com.liferay.portal.kernel.util.PropertiesUtil"%>
<%@ page import="com.liferay.portal.kernel.util.PropsKeys"%>
<%@ page import="com.liferay.portal.kernel.util.Randomizer"%>
<%@ page import="com.liferay.portal.kernel.util.ReleaseInfo"%>
<%@ page import="com.liferay.portal.kernel.util.ServerDetector"%>
<%@ page import="com.liferay.portal.kernel.util.SetUtil"%>
<%@ page import="com.liferay.portal.kernel.util.SortedProperties"%>
<%@ page import="com.liferay.portal.kernel.util.StackTraceUtil"%>
<%@ page import="com.liferay.portal.kernel.util.StringBundler"%>
<%@ page import="com.liferay.portal.kernel.util.StringPool"%>
<%@ page import="com.liferay.portal.kernel.util.StringUtil"%>
<%@ page import="com.liferay.portal.kernel.util.Time"%>
<%@ page import="com.liferay.portal.kernel.util.TimeZoneUtil"%>
<%@ page import="com.liferay.portal.kernel.util.UnicodeFormatter"%>
<%@ page import="com.liferay.portal.kernel.util.UnicodeProperties"%>
<%@ page import="com.liferay.portal.kernel.util.Validator"%>
<%@ page import="com.liferay.portal.kernel.workflow.WorkflowConstants"%>

<%@ page import="com.liferay.portal.model.*"%>
<%@ page import="com.liferay.portal.model.impl.*"%>
<%@ page import="com.liferay.portal.security.auth.AuthTokenUtil"%>
<%@ page import="com.liferay.portal.security.auth.PrincipalException"%>
<%@ page import="com.liferay.portal.security.permission.ActionKeys"%>
<%@ page
	import="com.liferay.portal.security.permission.PermissionChecker"%>
<%@ page import="com.liferay.portal.service.*"%>
<%@ page
	import="com.liferay.portal.service.permission.GroupPermissionUtil"%>
<%@ page
	import="com.liferay.portal.service.permission.LayoutPermissionUtil"%>
<%@ page
	import="com.liferay.portal.service.permission.LayoutPrototypePermissionUtil"%>
<%@ page
	import="com.liferay.portal.service.permission.LayoutSetPrototypePermissionUtil"%>
<%@ page
	import="com.liferay.portal.service.permission.PortletPermissionUtil"%>

<%@ page import="com.liferay.portal.theme.PortletDisplay"%>
<%@ page import="com.liferay.portal.theme.ThemeDisplay"%>

<%@ page import="com.liferay.portal.util.Portal"%>
<%@ page import="com.liferay.portal.util.PortalUtil"%>
<%@ page import="com.liferay.portal.util.PortletCategoryKeys"%>
<%@ page import="com.liferay.portal.util.PortletKeys"%>

<%@ page
	import="com.liferay.portal.util.comparator.PortletCategoryComparator"%>
<%@ page
	import="com.liferay.portal.util.comparator.PortletTitleComparator"%>
<%@ page import="com.liferay.portlet.InvokerPortlet"%>
<%@ page import="com.liferay.portlet.PortalPreferences"%>
<%@ page import="com.liferay.portlet.PortletConfigFactoryUtil"%>
<%@ page import="com.liferay.portlet.PortletInstanceFactoryUtil"%>
<%@ page import="com.liferay.portlet.PortletPreferencesFactoryUtil"%>
<%@ page import="com.liferay.portlet.UserAttributes"%>


<%@ page import="java.io.Serializable"%>

<%@ page import="java.math.BigDecimal"%>

<%@ page import="java.net.InetAddress"%>
<%@ page import="java.net.UnknownHostException"%>

<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.Format"%>
<%@ page import="java.text.MessageFormat"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.Currency"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="java.util.LinkedHashSet"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.MissingResourceException"%>
<%@ page import="java.util.Properties"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Stack"%>
<%@ page import="java.util.TimeZone"%>
<%@ page import="java.util.TreeMap"%>
<%@ page import="java.util.TreeSet"%>

<%@ page import="javax.portlet.MimeResponse"%>
<%@ page import="javax.portlet.PortletConfig"%>
<%@ page import="javax.portlet.PortletContext"%>
<%@ page import="javax.portlet.PortletException"%>
<%@ page import="javax.portlet.PortletMode"%>
<%@ page import="javax.portlet.PortletPreferences"%>
<%@ page import="javax.portlet.PortletRequest"%>
<%@ page import="javax.portlet.PortletResponse"%>
<%@ page import="javax.portlet.PortletSession"%>
<%@ page import="javax.portlet.PortletURL"%>
<%@ page import="javax.portlet.RenderRequest"%>
<%@ page import="javax.portlet.RenderResponse"%>
<%@ page import="javax.portlet.ResourceURL"%>
<%@ page import="javax.portlet.UnavailableException"%>
<%@ page import="javax.portlet.ValidatorException"%>
<%@ page import="javax.portlet.WindowState"%>


<style type="text/css">
input.spinner-text {
	padding: 0px 1px;
}

input.easyui-numberspinner {
	padding: 0px 0px;
}

input.easyui-datebox {
	height: 20px;
}

input.combo-text {
	padding: 0px;
	height: 20px;
	margin: 0px;
}

#<
portlet:namespace />search select {
	width: 135px;
}

span.combo {
	min-width: 135px;
}
</style>
<liferay-theme:defineObjects />
<portlet:defineObjects />
<%
PortletURL portletURL = renderResponse.createRenderURL();
String portletURLString = portletURL.toString();

portletURL.setPortletMode(PortletMode.VIEW);
String portletViewURLString = portletURL.toString();

PortletPreferences prefs = renderRequest.getPreferences();
String portletResource = ParamUtil.getString(request,
		"portletResource");
%>
<script language="javascript">
	/**
	 * 获取数据字典
	 * @param elementId form元素ID
	 * @param groupcode 字典分组代码
	 * @return 数据字典列表
	 */
	function <portlet:namespace/>getDictitemsByGroupcode(elementId, groupcode) {
		var resUrl = '<portlet:resourceURL id="getDictitemByGroupcode"><portlet:param name="groupCode" value="tempId" /></portlet:resourceURL>';
		resUrl = resUrl.replace("tempId", groupcode);

		$("#" + elementId + "").combogrid({
			panelWidth : 450,
			value : $("#" + elementId + "").val(),
			idField : 'itemCode',
			textField : 'itemName',
			pagination : true,//是否分页  
			rownumbers : true,
			fit : true,
			pageSize : 10,
			pageList : [ 10 ],
			url : resUrl,
			columns : [ [ {
				field : 'itemCode',
				title : '字典ID',
				width : 80
			}, {
				field : 'itemName',
				title : '字典项名称',
				width : 160
			} ] ]
		});
	}
	
	// 顶部累计用电量取值使用的url 
	var topValueUrl = "<portlet:resourceURL id='getValueByNameAndId'></portlet:resourceURL>";
	var importUrl = "<portlet:resourceURL id='commonImportExcelData'></portlet:resourceURL>";
	//alert(str);
</script>
<input name="<portlet:namespace/>redirect"
	id="<portlet:namespace/>redirect" type="hidden"
	value="<%=portletURLString%>" />
<input name="<portlet:namespace/>redirectview"
	id="<portlet:namespace/>redirectview" type="hidden"
	value="<%=portletViewURLString%>" />