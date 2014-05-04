<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-10 下午12:47:25
	LastModified Date:
	Description:
 -->
 
 <portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>
<div id="msg"></div>
<div class="ftitle">数据类型: 平台、建筑群、 单体建筑</div>
<form:form commandName="subscription" method="post" class="editform" action="#">  
<div class="div-table">
	<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="subReceiverate">接收频率：</form:label>
					 <form:select path="subReceiverate" cssClass="easyui-validatebox" required="true">
		             <form:option value="日报">日报</form:option>
		             <form:option value="周报">周报</form:option>
		             <form:option value="月报">月报</form:option>
		             </form:select> 
				</div>
	</div>
 </div>
   <div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="subReceiveemail">接收Email：</form:label>
					<form:input path="subReceiveemail" 
					 cssClass="easyui-validatebox" maxlength="10" required="true" />
				</div>
	</div>
 </div>   
</div>	
   <form:hidden path="subId" />
</form:form>	
	
<div id="buttons" style="padding-left:80px">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" 
		onclick="<portlet:namespace/>savePreference()">保存</a>
</div>
<script language="javascript">
	/**
	* 保存
	*/
	function <portlet:namespace/>savePreference() {
		$("#subscription").form('submit', {
			url:'<%=renderResponse.encodeURL(savePrefUrl)%>',
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
			}
		});
	}
</script>
 

