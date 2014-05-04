<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-4 上午11:05:16
	LastModified Date:
	Description: 配置显示快速导航
 -->
 
 <portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>

<div id="msg"></div>
<form:form commandName="navigationForm" method="post" class="form-horizontal" action="#">
	<div class="ftitle">图表常规设置
	<span class="title-back"><a href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
	</div>
 
 <div class="control-group">
    <form:label path="cssClass" cssClass="control-label">链接样式</form:label>
    <div class="controls">
      <form:input path="cssClass" placeholder="链接样式" />
    </div>
  </div>
 
  <div class="control-group">
    <form:label path="activeCssClass" cssClass="control-label">活动链接样式</form:label>
    <div class="controls">
      <form:input path="activeCssClass" placeholder="活动链接样式" />
    </div>
  </div>
  
  
  <table class="table table-hover">
    <tr>
		<th>#</th>
        <th>图标地址</th>
        <th>链接名称</th>
        <th>链接地址</th>
        <th>描述</th>
    </tr>
    <c:forEach items="${navigationForm.navigations}" var="navigation" varStatus="status">
        <tr>
            <td align="center">${status.count}</td>
            <td><input name="navigations[${status.index}].icon" value="${navigation.icon}"/></td>
            <td><input name="navigations[${status.index}].name" value="${navigation.name}"/></td>
            <td><input name="navigations[${status.index}].url" value="${navigation.url}"/></td>
            <td><input name="navigations[${status.index}].desc" value="${navigation.desc}"/></td>
        </tr>
    </c:forEach>
</table> 
  
</form:form>

<div id="buttons">
	<button class="btn btn-primary"
		onclick="<portlet:namespace/>savePreference()"> <i class="icon-ok icon-white"></i> 保存首选项</button>
		
			<button
		class="btn" 
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'"><i class="icon-share-alt"></i> 取消</button>
</div>
<script language="javascript">

/**
* 保存首选项信息
*/
function <portlet:namespace/>savePreference() {
	$("#navigationForm").form('submit', {
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


