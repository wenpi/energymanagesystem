 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午10:02:08
	LastModified Date:
	Description:
 -->
 <style type="text/css">
 	#<portlet:namespace/>dictgroups,#<portlet:namespace/>dictgroups ul li {
 		list-style:none;
 		padding:0px;
 		line-height:23px;
 	}
 	#<portlet:namespace/>dictgroups li a {
 		text-decoration:none;
 	 }
 </style>
<div class="easyui-layout" style="width: 100%; height: 420px;">
	<div region="west" split="true" title="字典类别" style="width: 180px;">
		<ul id="<portlet:namespace/>dictgroups">
			<c:if test="${!empty dictgroups}">
				<c:forEach items="${dictgroups}" var="dictgroup">
					<li><a href="javascript:void(0)" onclick="<portlet:namespace/>showDictitem('${dictgroup.groupCode}','${dictgroup.groupName}');">${dictgroup.groupName}</a></li>
				</c:forEach>
			</c:if>		
		</ul>
	</div>
	<div region="center"   title="数据字典" style="background: #fafafa;">	
	 <portlet:resourceURL id="getDictitems" var="getDictitemsUrl"></portlet:resourceURL>
		<table id="<portlet:namespace/>dictitemgb" class="easyui-datagrid" toolbar="#<portlet:namespace/>dictitemtb">
		</table>
		<div id="<portlet:namespace/>dictitemtb">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>addDictionary()">新增</a>  
   			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>editDictionary()">修改</a>  
		</div>
		<div id="tip" class="tip-info" style="margin-bottom:10px">
			<div class="op-tip icon-tip">&nbsp;</div>
			<div>请选择字典类别进行操作</div>
		</div>
	</div>
</div>
<input type="hidden" id="currentGroupCode" />
<portlet:resourceURL id="getDictitemByGroupcode" var="getDictitemBygroupCodeURL">
	<portlet:param name="groupCode" value="tempId" />
</portlet:resourceURL>
<script language="javascript">
//新增数据
function <portlet:namespace/>addDictionary() {
	var addUrl = '<portlet:renderURL portletMode="edit" windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name="action" value="addDictitemForm" /><portlet:param name='groupCode' value='tempId' /></portlet:renderURL>';
	addUrl=addUrl.replace("pop_up","normal");
	addUrl = addUrl.replace("tempId",$("#currentGroupCode").val());
	window.location.href = addUrl;
}

//编辑数据
function <portlet:namespace/>editDictionary() {
	var row = $('#<portlet:namespace/>dictitemgb').datagrid('getSelected');
	if (row){
		var editUrl = "<portlet:renderURL portletMode='edit' windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name='action' value='editDictitemForm' /><portlet:param name='itemId' value='tempId' /></portlet:renderURL>";
		var url=editUrl.replace("tempId",row.itemId);
		url=url.replace("pop_up","normal");
		window.location.href = url;
	} else {
		alert("请选择数据行");
	}
}

function <portlet:namespace/>showDictitem(groupCode,groupName) {
	var url = "";
	if(groupCode!=null) {
		$("#tip").remove();
		url = '<%=renderResponse.encodeURL(getDictitemBygroupCodeURL)%>';
		url = url.replace('tempId',groupCode);
		$("#currentGroupCode").val(groupCode);
		$("#<portlet:namespace/>dictitemgb").datagrid("options").title=groupName;
	}else {
		return;
	}
	
	$('#<portlet:namespace/>dictitemgb').datagrid({  
	    url:url,
		width: 800,
		height: 400,
		fitColumns: true,
		nowrap:false,
		rownumbers:true,
		singleSelect:true,
		idField:'itemId',
		columns:[[
			{field:'itemCode',title:'字典ID',width:80},
			{field:'itemName',title:'字典名称',width:160},
			{field:'itemShortname',title:'字典简称',width:80},
			{field:'itemOrder',title:'排序NO',width:60,align:'center'}
		]],
		onLoadError:function() {
			alert($("#<portlet:namespace/>dictitemgb").error);
		}
	});  
}
</script>