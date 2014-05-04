<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-25 上午09:12:29
	LastModified Date:
	Description:
 -->
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>
<div id="msg"></div>
<form id="prefs" name="prefs" method="post"
	action="<%=renderResponse.encodeURL(savePrefUrl)%>">
	<div class="ftitle">数据来源</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>目标建筑</label> <input type="text" id="buildId" name="buildId"
						value="<%=prefs.getValue("buildId", "") %>" /> <span class="taglib-icon-help"> <img
						title="设置数据来源建筑"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
	</div>
	<input type="button" value="保存首选项"
		onclick="<portlet:namespace/>savePreference()" />
</form>
<script type="text/javascript">
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
			var message = '<%=request.getAttribute("message")%>';
			$("#msg").addClass("portlet-msg-success").html("您的请求"+ message +".");
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