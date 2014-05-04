<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-20 上午09:58:02
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
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>数据来源：</label> <label style="width: 55px;">
					<input type="radio" name="sourcetype"  <% if(prefs.getValue("sourcetype","").equals("0")) {%>checked="checked"<% }%> value="0" /> 平台</label>
						<label><input type="radio" name="sourcetype"  <% if(prefs.getValue("sourcetype","").equals("2")) {%>checked="checked"<% }%> value="2" />
						单体建筑</label>

				</div>
			</div>
		</div>
		<div class="div-table-row" id="buildDiv">
			<div class="div-table-col">
				<div class="fitem">
					<label>目标建筑</label> <input type="text" id="buildId" name="buildId"
						value="<%=prefs.getValue("buildId", "") %>" /> <span class="taglib-icon-help"> <img
						title="设置数据来源建筑"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
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
	$("#buildDiv").hide();

	$(function() {
<%if (prefs == null || prefs.getMap().size() > 0) {
		if (prefs.getValue("sourcetype", "").equals("0")) {%>
	$("#buildDiv").hide();
<%} else if (prefs.getValue("sourcetype", "").equals("2")) {%>
	$("#buildDiv").show();
<%}
	} %>

	//设置数据来源
	$("input[name='sourcetype']").click(function() {
		if(this.value=="2") {
			$("#buildDiv").show();
		}
	});
	



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

/**
* 获取建筑信息列表
*/
$("#buildId").combogrid({
	panelWidth:500,
	value:$("#buildId").val(),
	idField:'buildId',
	textField:'buildName',
	pagination : true,//是否分页  
	rownumbers:true,
	fit: true,
	pageSize: 10,
	pageList: [10,20,30,40,50],
	url:'<portlet:resourceURL id="getBuildinfos"></portlet:resourceURL>',
	columns:[[
		{field:'buildId',title:'建筑编号',width:100},
		{field:'buildName',title:'建筑名称',width:100}
	]],keyHandler: {
		up: function(){},
		down: function(){},
		enter: function(){},
		query: function(q){
			$('#buildId').combogrid("grid").datagrid("reload", { 'keyword': q });
            $('#buildId').combogrid("setValue", q);
		}
	}
});
//-->
</script>