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
</c:if>

<c:if test="${bz eq '1'}">
	<div class="ftitle">区域配置</div>
	<div class="div-table-row">
			<div class="div-table-col">
			   <div id="sbid"></div>
			       <div class="fitem" >
			                               A区域   
			                             
			                               left:
			         <input id="serie11" name="serie11" type="text" style="width: 100px" value="${serie11}" >
			                               top:
			         <input id="serie12" name="serie12" type="text" style="width: 100px" value="${serie12}" >
			                               TagIDs:
			         <input id="serie13" name="serie13" type="text" style="width: 100px" value="${serie13}" >
			       </div>
			        <div class="fitem">
			                              B区域:
			        
			                              left:
			         <input id="serie21" name="serie21" type="text" style="width: 100px" value="${serie21}" >
			                              top:
			         <input id="serie22" name="serie22" type="text" style="width: 100px" value="${serie22}" >
			                              TagIDs:
			         <input id="serie23" name="serie23" type="text" style="width: 100px" value="${serie23}" >
			       </div>
			        <div class="fitem">
			                              C区域:
			        
			                              left:
			         <input id="serie31" name="serie31" type="text" style="width: 100px" value="${serie31}" >
			                              top:
			         <input id="serie32" name="serie32" type="text" style="width: 100px" value="${serie32}" >
			                              TagIDs:
			         <input id="serie33" name="serie33" type="text" style="width: 100px" value="${serie33}" >
			       </div>
			        <div class="fitem">
			                              D区域:
			        
			                             left:
			         <input id="serie41" name="serie41" type="text" style="width: 100px" value="${serie41}" >
			                              top:
			         <input id="serie42" name="serie42" type="text" style="width: 100px" value="${serie42}" >
			                              TagIDs:
			         <input id="serie43" name="serie43" type="text" style="width: 100px" value="${serie43}" >
			       </div>
			        <div class="fitem">
			                              E区域:
			        
			                             left:
			         <input id="serie51" name="serie51" type="text" style="width: 100px" value="${serie51}" >
			                              top:
			         <input id="serie52" name="serie52" type="text" style="width: 100px" value="${serie52}" >
			                              TagIDs:
			         <input id="serie53" name="serie53" type="text" style="width: 100px" value="${serie53}" >
			       </div>
			        <div class="fitem">
			                               F区域:
			        
			                              left:
			         <input id="serie61" name="serie61" type="text" style="width: 100px" value="${serie61}" >
			                              top:
			         <input id="serie62" name="serie62" type="text" style="width: 100px" value="${serie62}" >
			                              TagIDs:
			         <input id="serie63" name="serie63" type="text" style="width: 100px" value="${serie63}" >
			       </div>
			       <div class="fitem">
			                               G区域:
			        
			                              left:
			         <input id="serie71" name="serie71" type="text" style="width: 100px" value="${serie71}" >
			                              top:
			         <input id="serie72" name="serie72" type="text" style="width: 100px" value="${serie72}" >
			                              TagIDs:
			         <input id="serie73" name="serie73" type="text" style="width: 100px" value="${serie73}" >
			       </div>
			       <div class="fitem">
			                               H区域:
			        
			                              left:
			         <input id="serie81" name="serie81" type="text" style="width: 100px" value="${serie81}" >
			                              top:
			         <input id="serie82" name="serie82" type="text" style="width: 100px" value="${serie82}" >
			                              TagIDs:
			         <input id="serie83" name="serie83" type="text" style="width: 100px" value="${serie83}" >
			         <input type="hidden" id="regionId"  name="regionId"  value="${regionId}" />
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
