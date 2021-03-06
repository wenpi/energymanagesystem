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

    <div class="ftitle">显示天数</div>
	<div class="div-table">
	    <div class="div-table-row">
	        <div class="div-table-col">
	           <div class="fitem">
				<select id="fate" name="fate">
		            <option value="2" >2</option>
		            <option value="3">3</option>
		            <option value="4">4</option>
		            <option value="5">5</option>
	    		</select>
              </div>
         </div>
     </div> 
  </div> 
	
	<div class="ftitle">目标建筑</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
				<input id="buildId" name="buildId" type="text" value="<%=prefs.getValue("buildId", "")%>">
					<span class="taglib-icon-help"> <img title="设置数据来源建筑"
								src="/html/themes/classic/images/portlet/help.png" />
					</span>
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
	}
});

  if(buildId.value==""){
	  fate.value ="3";
   }
  if(buildId.value!=""){
	 $("#fate").val('<%=prefs.getValue("fate","")%>'); 
   }
</script>
