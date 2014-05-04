<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2013-5-14 上午09:45:01
	LastModified Date:
	Description: 报表设置
 -->
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>
<div id="msg"></div>

<form:form commandName="reportSetting" method="post" class="" action="#">
	<div class="ftitle">
		图表常规设置 <span class="title-back"><a
			href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
		</span>
	</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="caption">图表标题</form:label>
					<form:input path="caption" cssClass="easyui-validatebox"
						required="true" title="显示在图表顶部的标题！" />
					*
				</div>
			</div>
			<div class="div-table-2col">
				<div class="div-table-col">
					<div class="fitem">
						<form:label path="subcaption">图表副标题</form:label>
						<form:input path="subcaption" />
					</div>
				</div>
			</div>
		</div>

		<div class="div-table-row">

			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="queryType">报表类型</form:label>
					<form:select path="queryType">
						<form:option value="dayreport">用量日报</form:option>
						<form:option value="weekreport">用量周报</form:option>
						<form:option value="monthreport">用量月报</form:option>
						<form:option value="yearreport">用量年报</form:option>
						<form:option value="query">原始数据</form:option>
						<form:option value="usage">任意时间</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img
						title="设置数据查询方式:
任意时间(查询任意时间段的用量,最多同时32个变量)
用量日报(24小时内每个小时的用量，最多同时32个变量)
用量周报(一周内每天的用量，最多同时32个变量)
用量月报(一月内每天的用量，最多同时32个变量)
用量年报(一年内每月的用量，最多同时32个变量)
原始抄表(原始抄表数据明细)"
						src="/html/themes/classic/images/portlet/help.png" />
					</span>
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="buildId">目标建筑</form:label>
					<form:input path="buildId" required="true" />

					<span class="taglib-icon-help"> <img title="设置数据来源建筑"
						src="/html/themes/classic/images/portlet/help.png" />
					</span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="defStarttime">起始时间</form:label>
					<form:select path="defStarttime">
						<form:option value="today">今天</form:option>
						<form:option value="yesterday">昨天</form:option>
						<form:option value="firstofweek">本周第一天</form:option>
						<form:option value="firstofmonth">本月第一天</form:option>
						<form:option value="firstofyear">本年第一天</form:option>
						<form:option value="custom">自定义</form:option>
					</form:select>
					<span id="starttimeValueWrap"> <form:input
							path="starttimeValue" cssClass="easyui-datebox" />
					</span>
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="defEndtime">结束时间</form:label>
					<form:select path="defEndtime">
						<form:option value="">无</form:option>
						<form:option value="today">今天</form:option>
						<form:option value="yesterday">昨天</form:option>
						<form:option value="endofweek">本周最后一天</form:option>
						<form:option value="endofmonth">本月最后天</form:option>
						<form:option value="custom">自定义</form:option>
					</form:select>
					<span id="endtimeValueWrap"> <form:input path="endtimeValue"
							cssClass="easyui-datebox" />
					</span>
				</div>
			</div>
		</div>

	</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="tagids">设备变量ID</form:label>
					<br />
					<c:forTokens var="str" items="${reportSetting.formula}" delims=","
						varStatus="status">
						<label>设备${status.count}</label>
						<c:forTokens var="entry" items="${str}" delims=":"
							varStatus="entryStatus">

							<c:choose>
								<c:when test="${entryStatus.index==0}">
										名称：<input id="category${status.count}"
										name="category${status.count}" value="${entry}" type="text"
										class="taginfo" />
								</c:when>
								<c:otherwise>
										TagIDs：<input id="serie${status.count}"
										name="serie${status.count}" value="${entry}" type="text"
										class="taginfo" style="width: 400px;" />
									<span class="taglib-icon-help"> <img title=""
										src="/html/themes/classic/images/portlet/help.png" />
									</span>
									<br />
								</c:otherwise>
							</c:choose>
						</c:forTokens>
					</c:forTokens>
				</div>
			</div>
		</div>
	</div>


</form:form>
<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>savePreference()">保存首选项</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>
<script language="javascript">

	$(function(){
		
		
		<c:choose>
		<c:when test="${!empty chartsetting.defStarttime and chartsetting.defStarttime=='custom'}">
			$("#starttimeValueWrap").show();
		</c:when>
		<c:otherwise>
			$("#starttimeValueWrap").hide();
		</c:otherwise>
		</c:choose>
		
		<c:choose>
		<c:when test="${!empty chartsetting.defEndtime and chartsetting.defEndtime=='custom'}">
			$("#endtimeValueWrap").show();
		</c:when>
		<c:otherwise>
			$("#endtimeValueWrap").hide();
		</c:otherwise>
		</c:choose>

		
		/**
		* 设置显示和隐藏自定义开始时间
		*/
		$("#defStarttime").combobox({
			onSelect:function(val) {
				if(val.value=='custom') {
					$("#starttimeValueWrap").show();
				} else {
					$("#starttimeValueWrap").hide();
				}
			}
		});
		
		/**
		* 设置显示和隐藏自定义结束时间
		*/
		$("#defEndtime").combobox({
			onSelect:function(val) {
				if(val.value=='custom') {
					$("#endtimeValueWrap").show();
				} else {
					$("#endtimeValueWrap").hide();
				}
			}
		});
		
	
	});
	
	/**
	* 保存首选项信息
	*/
	function <portlet:namespace/>savePreference() {
		$("#reportSetting").form('submit', {
			url:'<%=renderResponse.encodeURL(savePrefUrl)%>',
			onSubmit : function() {
				//return $(this).form('validate');
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
</script>

