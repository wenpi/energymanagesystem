<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-9 上午09:03:53
	LastModified Date:
	Description:
 -->
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>
<div id="msg"></div>
<form:form commandName="preferenceModel" method="post">
	<div class="ftitle">设备源设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="buildId">所属建筑</form:label>
					<form:input path="buildId" required="true" />
					<span class="taglib-icon-help"> * <img alt="" title="当前设备所属建筑"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="svgFolder">静态文件目录</form:label>
					<form:input path="svgFolder" required="true" />
					<span class="taglib-icon-help"> * <img alt=""
						title="存放SVG文件的目录名称"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="currentSvg">当前画面名称</form:label>
					<form:input path="currentSvg" cssClass="easyui-validatebox" required="true"  style="width:50%;" /> *
					<span class="taglib-icon-help"> <img alt=""
						title="当前PORTLET画面名称"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
						
						 <span class="taglib-icon-help">画面名称，可以输出多个画面名 称，用半角","逗号分逗,如：排风,冷机</span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="width">画面显示宽度</form:label>
					<form:input path="width" cssClass="easyui-validatebox" required="true" />
					* <span class="taglib-icon-help"> <img alt=""
						title="画面显示宽度"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="height">画面显示高度</form:label>
					<form:input path="height" cssClass="easyui-validatebox" required="true" />
					* <span class="taglib-icon-help"> <img alt=""
						title="画面显示高度"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
	</div>
</form:form>
<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>savePreference()">保存首选项</a>
</div>
<script language="javascript">
	
	/**
	* 保存首选项信息
	*/
	function <portlet:namespace/>savePreference() {
		$("#preferenceModel").form('submit', {
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

</script>