<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-2 下午05:11:56
	LastModified Date:
	Description:
 -->
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>
<div id="msg"></div>
<form id="buildgrouprelainfoId" method="post" class="editform" action="#">
	<div class="div-table">
	    <div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>单体建筑</label>
					<input id="buildId" name="buildId" type="text" value="<%=prefs.getValue("buildId", "")%>">
					<span class="taglib-icon-help"> <img title="设置数据来源建筑"
								src="/html/themes/classic/images/portlet/help.png" />
							</span>
				</div>
			</div>
		</div> 
	
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>建筑群</label>
					<input id="buildgroupId" name="buildgroupId" type="text" value="<%=prefs.getValue("buildgroupId", "")%>" >
					<span class="taglib-icon-help"> <img title="设置数据来源建筑群"
								src="/html/themes/classic/images/portlet/help.png" />
							</span>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
				<label>显示</label>
				<input type="radio" id="showDesc" name="showDesc" value="true" >显示单体建筑&nbsp&nbsp
				<input type="radio" id="showDesc" name="showDesc" value="false" >显示建筑群建筑&nbsp&nbsp
				<input type="radio" id="showDesc" name="showDesc" value="PT" >显示平台建筑
				<script language="javascript">
					var showDesc='<%=prefs.getValue("showDesc","true") %>';
					$("input[name='showDesc'][value='"+ showDesc +"']").attr("checked",true);  
				</script>
				
				</div>
			</div>
		</div>
	</div>
</form>


<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>savePreference()">保存</a>
</div>
<script language="javascript">
	/**
	* 保存
	*/
	function <portlet:namespace/>savePreference() {
		
		$("#buildgrouprelainfoId").form('submit', {
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
	* 获取建筑群信息列表
	*/
	$("#buildgroupId").combogrid({
		panelWidth:500,
		value:$("#buildgroupId").val(),
		idField:'buildgroupId',
		textField:'buildgroupName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getBuildgroupinfos"></portlet:resourceURL>',
		columns:[[
			{field:'buildgroupId',title:'建筑群编号',width:100},
			{field:'buildgroupName',title:'建筑群名称',width:100}
		]],keyHandler: {
			up: function(){},
			down: function(){},
			enter: function(){},
			query: function(q){
				$('#buildgroupId').combogrid("grid").datagrid("reload", { 'keyword': q });
	            $('#buildgroupId').combogrid("setValue", q);
			}
		}
	});

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
