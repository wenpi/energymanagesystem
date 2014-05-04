<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-30 下午03:27:26
	LastModified Date:
	Description:
 -->
	<div class="div-table" id="auditreport">
		<div class="div-table-row" align="center">
			<div class="div-table-2col">
				<div class="fitem">
				         <b>${auditreport.title}</b>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
				         ${auditreport.mycontent}
				</div>
			</div>
		</div>
	</div>

