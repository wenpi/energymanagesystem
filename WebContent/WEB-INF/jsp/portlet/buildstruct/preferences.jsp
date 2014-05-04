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
	<div class="ftitle">设备ID</div>
	<div class="div-table-row">
			<div class="div-table-col">
			   <div id="sbid"></div>
			       <div class="fitem">
			                              电量(TagIDs):
			         <input id="serie1" name="serie1" type="text" style="width: 300px" value="${serie1}" ><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                             冷量(TagIDs):
			         <input id="serie2" name="serie2" type="text" style="width: 300px" value="${serie2}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                              湿度(TagIDs):
			         <input id="serie4" name="serie4" type="text" style="width: 300px" value="${serie4}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                              人流(TagIDs):
			         <input id="serie5" name="serie5" type="text" style="width: 300px" value="${serie5}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			        <div class="fitem">
			                               水量(TagIDs):
			         <input id="serie6" name="serie6" type="text" style="width: 300px" value="${serie6}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			       </div>
			       <div class="fitem">
			                              其它(TagIDs):
			         <input id="serie7" name="serie7" type="text" style="width: 300px" value="${serie7}"><span class="taglib-icon-help"> <img title="TagIDs可以是单个ID,也可以是多个ID，多个ID时中间用逗号隔开"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
			         <input type="hidden" id="regionId"  name="regionId"  value="${regionId}" />
			       </div>
			       <div class="fitem">
			        <div class="ftitle">温度区域配置</div>
	            <div class="div-table-row">
			           <div class="div-table-col">
			                 <div id="sbid"></div>
			       <div class="fitem" >
			                                      区域名称:   
			          <input id="serie14" name="serie14" type="text" style="width: 100px" value="${serie14}" >                  
			                               left:
			         <input id="serie11" name="serie11" type="text" style="width: 100px" value="${serie11}" >
			                               top:
			         <input id="serie12" name="serie12" type="text" style="width: 100px" value="${serie12}" >
			                               TagID:
			         <input id="serie13" name="serie13" type="text" style="width: 100px" value="${serie13}" >
			       </div>
			        <div class="fitem">
			                               区域名称: 
			         <input id="serie24" name="serie24" type="text" style="width: 100px" value="${serie24}" > 
			                              left:
			         <input id="serie21" name="serie21" type="text" style="width: 100px" value="${serie21}" >
			                              top:
			         <input id="serie22" name="serie22" type="text" style="width: 100px" value="${serie22}" >
			                              TagID:
			         <input id="serie23" name="serie23" type="text" style="width: 100px" value="${serie23}" >
			       </div>
			        <div class="fitem">
			                             区域名称: 
			         <input id="serie34" name="serie34" type="text" style="width: 100px" value="${serie34}" >
			        
			                              left:
			         <input id="serie31" name="serie31" type="text" style="width: 100px" value="${serie31}" >
			                              top:
			         <input id="serie32" name="serie32" type="text" style="width: 100px" value="${serie32}" >
			                              TagID:
			         <input id="serie33" name="serie33" type="text" style="width: 100px" value="${serie33}" >
			       </div>
			        <div class="fitem">
			                                区域名称: 
			         <input id="serie44" name="serie44" type="text" style="width: 100px" value="${serie44}" >
			        
			                             left:
			         <input id="serie41" name="serie41" type="text" style="width: 100px" value="${serie41}" >
			                              top:
			         <input id="serie42" name="serie42" type="text" style="width: 100px" value="${serie42}" >
			                              TagID:
			         <input id="serie43" name="serie43" type="text" style="width: 100px" value="${serie43}" >
			       </div>
			        <div class="fitem">
			                                区域名称: 
			         <input id="serie54" name="serie54" type="text" style="width: 100px" value="${serie54}" >
			        
			                             left:
			         <input id="serie51" name="serie51" type="text" style="width: 100px" value="${serie51}" >
			                              top:
			         <input id="serie52" name="serie52" type="text" style="width: 100px" value="${serie52}" >
			                              TagID:
			         <input id="serie53" name="serie53" type="text" style="width: 100px" value="${serie53}" >
			       </div>
			        <div class="fitem">
			                                 区域名称: 
			         <input id="serie64" name="serie64" type="text" style="width: 100px" value="${serie64}" >
			        
			                              left:
			         <input id="serie61" name="serie61" type="text" style="width: 100px" value="${serie61}" >
			                              top:
			         <input id="serie62" name="serie62" type="text" style="width: 100px" value="${serie62}" >
			                              TagID:
			         <input id="serie63" name="serie63" type="text" style="width: 100px" value="${serie63}" >
			       </div>
			       <div class="fitem">
			                                  区域名称: 
			         <input id="serie74" name="serie74" type="text" style="width: 100px" value="${serie74}" >
			        
			                              left:
			         <input id="serie71" name="serie71" type="text" style="width: 100px" value="${serie71}" >
			                              top:
			         <input id="serie72" name="serie72" type="text" style="width: 100px" value="${serie72}" >
			                              TagID:
			         <input id="serie73" name="serie73" type="text" style="width: 100px" value="${serie73}" >
			       </div>
			       <div class="fitem">
			                                  区域名称: 
			         <input id="serie84" name="serie84" type="text" style="width: 100px" value="${serie84}" >
			        
			                              left:
			         <input id="serie81" name="serie81" type="text" style="width: 100px" value="${serie81}" >
			                              top:
			         <input id="serie82" name="serie82" type="text" style="width: 100px" value="${serie82}" >
			                              TagID:
			         <input id="serie83" name="serie83" type="text" style="width: 100px" value="${serie83}" >
			         <input type="hidden" id="regionId"  name="regionId"  value="${regionId}" />
			       </div>
			     </div>
            </div> 
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
