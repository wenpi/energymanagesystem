<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-11 上午10:32:15
	LastModified Date:
	Description:
 -->
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>
<div id="msg"></div>
<form id="prefs" name="prefs" method="post" class="editform"
	action="<portlet:actionURL><portlet:param name="action" value="savePreferences" /></portlet:actionURL>">
	<div class="ftitle">数据设置</div>
	<div class="div-table">
		<div class="div-table-row" id="buildDiv">
			<div class="div-table-col">
				<div class="fitem">
					<label>默认日期：</label>
					<input type="text" name="startdate" id="startdate"
					value="<%=prefs.getValue("startdate","")%>"
					 />
				</div>
			</div>
		</div>
	</div>
</form>

<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>savePreference()">保存首选项</a>
		
			<a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>

<script type="text/javascript">
<!--
	$(function() {
<%if (prefs == null || prefs.getMap().size() > 0) {
				if (prefs.getValue("sourcetype", "") == "0") {%>
	$("#buildDiv").hidden();
		$("#buildgroupDiv").hidden();
<%} else if (prefs.getValue("sourcetype", "") == "1") {%>
	$("#buildDiv").show();
		$("#buildgroupDiv").hidden();
<%} else if (prefs.getValue("sourcetype", "") == "1") {%>
	$("#buildDiv").hidden();
		$("#buildgroupDiv").show();
<%}
			} else {%>
	$("#buildDiv").hidden();
		$("#buildgroupDiv").hidden();
<%}%>


		/**
		 * 起始日期
		 */
		$("#startdate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			changeYear : true,
			numberOfMonths : 2
		});
		
		

	});
	
/**
* 保存首选项信息
*/
function <portlet:namespace/>savePreference() {
	$("#prefs").form('submit', {
		url:'<%=renderResponse.encodeURL(savePrefUrl)%>',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
		}
	});
}
//-->
</script>
