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

<form id="buildinfo" method="post" class="editform" action="#">
<c:if test="${bz eq ''}">
	<div class="ftitle">数据来源</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>目标建筑</label>
					<input id="buildId" name="buildId" type="text" value="<%=prefs.getValue("buildId", "")%>">
					<span class="taglib-icon-help"> <img title="设置数据来源建筑"
								src="/html/themes/classic/images/portlet/help.png" />
							</span>
				</div>
			</div>
		</div>
	</div>
	<div class="ftitle">图片大小配置</div>
     <div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
				<label>图片大小</label>宽：<input id="buildWidth" name="buildWidth" type="text" value="<%=prefs.getValue("buildWidth", "")%>" size="3"> 
				高：<input id="buildHeight" name="buildHeight" type="text" value="<%=prefs.getValue("buildHeight", "")%>" size="3">
				</div>
			</div>
	</div>
</c:if>

<c:if test="${bz eq '1'}">
	<div class="ftitle">设备ID</div>
	<div class="div-table-row">
			<div class="div-table-col">
			   <div id="sbid"></div>
			       <div class="fitem">
			                           电量(TagIDs):
			         <input id="seriech1" name="seriech1" type="text" style="width: 300px" value="${seriech1}" ><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                             冷量(TagIDs):
			         <input id="seriech2" name="seriech2" type="text" style="width: 300px" value="${seriech2}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                              湿度(TagIDs):
			         <input id="seriech4" name="seriech4" type="text" style="width: 300px" value="${seriech4}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                              人流(TagIDs):
			         <input id="seriech5" name="seriech5" type="text" style="width: 300px" value="${seriech5}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                               水量(TagIDs):
			         <input id="seriech6" name="seriech6" type="text" style="width: 300px" value="${seriech6}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			       <div class="fitem">
			                              其它(TagIDs):
			         <input id="seriech7" name="seriech7" type="text" style="width: 300px" value="${seriech7}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			         <input type="hidden" id="regionId"  name="regionId"  value="${regionId}" />
			       </div>
			</div>
     </div>	
     <div class="ftitle">图片大小配置</div>
     <div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
				<label>图片大小</label>宽：<input id="width" name="width" type="text" value="<%=prefs.getValue("width", "")%>" size="3"> 
				高：<input id="height" name="height" type="text" value="<%=prefs.getValue("height", "")%>" size="3">
				</div>
			</div>
	</div>
</c:if>	
<c:if test="${bz eq '2'}">
	<div class="ftitle">设备ID</div>
	<div class="div-table-row">
			<div class="div-table-col">
			   <div id="sbid"></div>
			       <div class="fitem">
			                              电量(TagIDs):
			         <input id="seriecg1" name="seriecg1" type="text" style="width: 300px" value="${seriecg1}" ><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                             冷量(TagIDs):
			         <input id="seriecg2" name="seriecg2" type="text" style="width: 300px" value="${seriecg2}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                              湿度(TagIDs):
			         <input id="seriecg4" name="seriecg4" type="text" style="width: 300px" value="${seriecg4}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                              人流(TagIDs):
			         <input id="seriecg5" name="seriecg5" type="text" style="width: 300px" value="${seriecg5}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                               水量(TagIDs):
			         <input id="seriecg6" name="seriecg6" type="text" style="width: 300px" value="${seriecg6}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			       <div class="fitem">
			                              其它(TagIDs):
			         <input id="seriecg7" name="seriecg7" type="text" style="width: 300px" value="${seriecg7}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			         <input type="hidden" id="regionId"  name="regionId"  value="${regionId}" />
			       </div>
			</div>
     </div>	
     <div class="ftitle">图片大小配置</div>
     <div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
				<label>图片大小</label>宽：<input id="widthcg" name="widthcg" type="text" value="<%=prefs.getValue("widthcg", "")%>" size="3"> 
				高：<input id="heightcg" name="heightcg" type="text" value="<%=prefs.getValue("heightcg", "")%>" size="3">
				</div>
			</div>
	</div>
</c:if>	
</form>
<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>savePreference()">保存</a>
</div>
<script language="javascript">

$(function(){
	
});
	/**
	* 保存
	*/
	function <portlet:namespace/>savePreference() {
		$("#buildinfo").form('submit', {
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
		},
	});
</script>
