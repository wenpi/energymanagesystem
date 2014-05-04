
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
<div class="easyui-layout" style="width: 100%; height: 420px;">
	<div region="west" split="true" title="建筑列表" style="width: 400px;">
		<table id="<portlet:namespace/>buildinfogb" class="easyui-datagrid"
			toolbar="#<portlet:namespace/>buildtb" idField="buildId" 
			<c:if test="${!empty buildgroupinfo.buildgroupId}">
				url = "<portlet:resourceURL id="getBuildinfosBygroupId"></portlet:resourceURL>"
			</c:if>
			>
			<thead>
		      <tr>
		    <th field="buildId" width="60" align="center">建筑ID</th> 
			<th field="buildName" width="100">建筑名称</th>
			<th field="buildAliasname" width="80">建筑别名</th>
			<th field="buildOwner" width="80">建筑业主</th>
		     </tr>
	        </thead>
		</table>
		<div id="<portlet:namespace/>buildtb">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="<portlet:namespace/>addBuildgrouprelainfo()">新增建筑</a> <a
				href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
				onclick="<portlet:namespace/>removeBuildgrouprelainfo()">删除建筑</a>
		</div>
		<!-- 建筑群对应的建筑对话框  -->
		<div id="<portlet:namespace/>dlg" class="easyui-dialog"
			style="width: 400px; height: 240px; padding: 10px 15px" closed="true"
			buttons="#<portlet:namespace/>dlg-buttons">
			<div class="ftitle">建筑信息</div>
			<form:form commandName="buildinfo" method="post"
				cssClass="editform" action="#">

				<div class="fitem">
					<form:label path="buildId">建筑ID:</form:label>
					<form:input path="buildId" maxlength="25" cssClass="easyui-validatebox" />
				</div>
			</form:form>
		</div>
		<div id="<portlet:namespace/>dlg-buttons" align="center">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>saveBuildgrouprelainfo()">保存</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#<portlet:namespace/>dlg').dialog('close')">取消</a>
		</div>
		
		
	</div>
	<div region="center" title="建筑群信息" style="background: #fafafa;">
		<form:form commandName="buildgroupinfo" method="post"
			cssClass="editform">
			<div class="div-table">
				
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildDistrictid">所属地区</form:label>
							<c:choose>
							<c:when test="${empty buildgroupinfo.buildgroupId}">
								<form:input path="buildDistrictid" required="true" /> * (所属地区创建后不能修改,请谨慎选择)
							</c:when>
							<c:otherwise>
								<form:hidden path="buildDistrictid" />
								<c:out value="${buildgroupinfo.buildDistrictid}"></c:out>
							</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildgroupId">建筑群ID</form:label>
							<c:choose>
								<c:when test="${empty buildgroupinfo.buildgroupId}">
									<form:input path="buildgroupId" value="系统生成" readOnly="true" />
								</c:when>
								<c:otherwise>
									<c:out value="${buildgroupinfo.buildgroupId}"></c:out>
									<form:hidden path="buildgroupId" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildgroupName">建筑群名称</form:label>
							<form:input path="buildgroupName" maxlength="25" cssClass="easyui-validatebox" required="true"  /> *
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildgroupAliasname">字母别名</form:label>
							<form:input path="buildgroupAliasname" maxlength="16" /> 
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildgroupDesc">建筑群描述</form:label>
							<form:textarea path="buildgroupDesc" maxlength="400" style="width:60%;height:60px;" /> 
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
		</form:form>
		<div id="buttons" align="center">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-remove"
				onclick="<portlet:namespace/>removeBuildgroupinfo()">删除</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-back"
				onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
		</div>
	</div>
</div>
<div id="<portlet:namespace/>buildgroupToolbar">
	<a href="#" class="icon-add"
		onclick="<portlet:namespace/>addBuildgroupinfo()" title="新增群组"></a> <a href="#"
		class="icon-edit" onclick="<portlet:namespace/>editBuildgroupinfo()" title="编辑群组"></a> <a
		href="#" class="icon-remove"
		onclick="<portlet:namespace/>removeBuildgroupinfo" title="删除群组"></a>
</div>
<portlet:resourceURL id="getBuildinfosByBuildgroupId"
	var="getBuildinfosByBuildgroupIdURL">
	<portlet:param name="buildgroupId" value="tempId" />
</portlet:resourceURL>

<script language="javascript">

<c:if test="${empty buildgroupinfo.buildgroupId}">
	/**
	* 获取行政区划列表
	*/
	$("#buildDistrictid").combogrid({
		panelWidth:500,
		value:$("#buildDistrictid").val(),
		idField:'districtId',
		textField:'districtName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getDistricts"></portlet:resourceURL>',
		columns:[[
			{field:'districtId',title:'行政区编号',width:100},
			{field:'districtName',title:'行政区名称',width:100},
			{field:'districtinfo',title:'上级行政区',width:100,formatter:function(value,row){
				if(value!=null)
					return value.districtId;
			}},
			{field:'districtPostcode',title:'邮编',width:60},
			{field:'districtAreacode',title:'区号',width:60}
		]],keyHandler: {
			up: function(){},
			down: function(){},
			enter: function(){},
			query: function(q){
				$('#buildDistrictid').combogrid("grid").datagrid("reload", { 'keyword': q });
	            $('#buildDistrictid').combogrid("setValue", q);
			}
		}
	});
	
	</c:if>
	
	/**
	* 保存建筑群信息
	*/
	function <portlet:namespace/>saveForm() {
		var url = '<portlet:resourceURL id="submitBuildgroupinfoForm"></portlet:resourceURL>';
		$("#buildgroupinfo").form('submit', {
			url: url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					if($("#isnew").val()=="true") {
						$.messager.alert('提示',"数据保存成功!",'info');
						var redirect = $("#<portlet:namespace/>redirect").val();
						redirect += "&<portlet:namespace/>action=editBuildgroupinfoForm&<portlet:namespace/>buildgroupId="+result.msg; 
						window.location.href = redirect;	
					}
				} else {
					$.messager.alert('错误',result.msg,'error');
				}
			}
		});
	}
	
	/**
	* 删除建筑群信息
	*/
	function <portlet:namespace/>removeBuildgroupinfo() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeBuildgroupinfo'></portlet:resourceURL>";
					$.post(removeUrl,{buildgroupId:'${buildgroupinfo.buildgroupId}'},function(result){
						if (result.success){
							alert("数据删除成功!");
							var redirect = $("#<portlet:namespace/>redirectview").val();
							window.location.href = redirect;		
						} else {
							$.messager.alert('Error',result.msg,'error');
						}
					},'json');
				}
			});
		}
	}
	
	/**
	* 新增关联建筑数据
	*/
	function <portlet:namespace/>addBuildgrouprelainfo() {
		var buildgroupId = '${buildgroupinfo.buildgroupId}';
		if(buildgroupId!="") {
			$('#<portlet:namespace/>dlg').dialog('open').dialog('setTitle','添加建筑');
			$('#categoryattribute').form('clear');
		} else {
			$.messager.alert('提示','必须先保存建筑群信息','info');
		}
	}
	
	/**
	* 保存建筑群与建筑关联关系
	*/
	function <portlet:namespace/>saveBuildgrouprelainfo() {
		var buildgroupId = '${buildgroupinfo.buildgroupId}';
		if(buildgroupId!="") {
			var submitUrl = '<portlet:resourceURL id="submitBuildgrouprelainfoForm"></portlet:resourceURL>';
			$("#buildinfo").form('submit',{
				url:submitUrl,
				onSubmit:function() {
					return $(this).form('validate');
				},
				success: function(result){
					var result = eval('('+result+')');
					if (result.success){
						$('#<portlet:namespace/>dlg').dialog('close');		// close the dialog
						$('#<portlet:namespace/>buildinfogb').datagrid('reload');	// reload the user data
					} else {
						$.messager.alert('Error',result.msg,'error');
					}
				}
			});
		} else {
			$.messager.alert('提示','必须先保存建筑群信息','info');
		}
	}

	//删除关联建筑数据
	function <portlet:namespace/>removeBuildgrouprelainfo() {
		var row = $('#<portlet:namespace/>buildinfogb').datagrid('getSelected');
		if (row){
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeBuildgrouprelainfo'></portlet:resourceURL>";
					$.post(removeUrl,{itemCode:'${dictitem.id.itemCode}',groupCode:'${dictitem.id.groupCode}'},function(result){
						if (result.success){
							alert("数据删除成功!");
							var redirect = $("#<portlet:namespace/>redirectview").val();
							window.location.href = redirect;		
						} else {
							$.messager.alert('Error',result.msg,'error');
						}
					},'json');
				} 
			});
		} else {
			alert("请选择数据行");
		}
	}
	/**
	 * 显示建筑群组对应的建筑列表 
	 */
	function <portlet:namespace/>showBuildinfos(buildgroupId,buildgroupName) {
		
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