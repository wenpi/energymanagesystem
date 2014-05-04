<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>

<portlet:resourceURL id="auditreportList" var="getAuditreportListUrl">
</portlet:resourceURL>

<table id="<portlet:namespace/>gridtree" title="审计报告列表" class="easyui-treegrid" width="100%" style="height:300px"
			url="<%=renderResponse.encodeURL(getAuditreportListUrl)%>"
			rownumbers="true" pagination="true"
			idField="reportid"  toolbar="#<portlet:namespace/>tb">
		<thead>
			<tr>
			    <th field="title"   width="80">标题</th>
				<th field="version" width="80">版本</th>
			</tr>
		</thead>
</table>



<script language="javascript">
</script>



