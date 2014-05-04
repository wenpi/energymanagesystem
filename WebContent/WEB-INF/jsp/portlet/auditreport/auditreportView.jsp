<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-30 下午03:27:26
	LastModified Date:
	Description:
 -->
<div class="layout-sidebar" style="width: 20%;">
	<div class="title">
		<h4>报告列表</h4>
	</div>
	<c:forEach var="listBuild" items="${buildinfoList}" begin='0'
		varStatus="status">
		<ul class="report-list">
			<li>${listBuild.buildName}
				<ul class="">
					<c:forEach var="list" items="${auditreportList}" begin='0'
						varStatus="status">
						<c:if test="${listBuild.buildId==list.buildId}">
							<li><a
								href="<portlet:renderURL portletMode='view'><portlet:param name='action' value='gets' /><portlet:param name='reportid' value='${list.reportid}'/></portlet:renderURL>"><fmt:formatDate
										value="${list.createdondate}" type="both" pattern="yyyy-MM" />
							</a>
							</li>
						</c:if>
					</c:forEach>
				</ul></li>
		</ul>
	</c:forEach>
</div>
<div class="layout-body" style="width: 78%;">
	<div class="title">
		<h4>报告内容</h4>
	</div>
	<form:form commandName="auditrepor" method="post" class="editform"
		action="#">
		<div class="div-table">
			<div class="div-table-row" align="center">
				<div class="div-table-col">
					<div class="fitem">
						<h4>${auditreport.title}</h4>
					</div>
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-col">
					<div class="fitem">${auditreport.mycontent}</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="reportid" value="${auditreport.reportid}" />
		<c:if test="<%= permissionChecker.isOmniadmin() %>">
		<hr />
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit"
				plain="true" onclick="<portlet:namespace/>edit()">修改</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-remove" plain="true"
				onclick="<portlet:namespace/>remove()">删除</a>
		</c:if>
	</form:form>
</div>
<div id="change" style="clear: both"></div>
<script type="text/javascript">
	//编辑记录
	function <portlet:namespace/>edit() {
		var reportid = $("#reportid").val();
		var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editForm' /><portlet:param name='reportid' value='tempId' /></portlet:renderURL>";
		var url = editUrl.replace("tempId", reportid);
		window.location.href = url;
	}

	/**
	 * 删除记录
	 */
	function <portlet:namespace/>remove() {
		var reportid = $("#reportid").val();
		$.messager
				.confirm(
						'删除确认',
						'确定要删除此选定的数据吗?',
						function(r) {
							if (r) {
								var removeUrl = "<portlet:resourceURL id='remove'></portlet:resourceURL>";
								$.post(removeUrl, {
									reportid : reportid
								}, function(result) {
									if (result.success) {
										$.messager.alert('提示', '数据删除成功!',
												'info');
									}
								}, 'json');
								var searchUrl = "<portlet:renderURL portletMode='view'><portlet:param name='action' value='Refreash' /></portlet:renderURL>";
								window.location.href = searchUrl;
							}
						});

	}
</script>