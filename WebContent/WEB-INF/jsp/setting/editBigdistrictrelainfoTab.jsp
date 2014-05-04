<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init-ext.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-3 下午01:21:29
	LastModified Date:
	Description:
 -->
<c:choose>
	<c:when test="${empty bigdistrictinfo}">
		<div id="tip" class="tip-info" style="margin-bottom: 10px;">
			<div class="op-tip icon-tip">&nbsp;</div>
			<div>必段先保存气候区基本资料</div>
		</div>
	</c:when>
	<c:otherwise>

		<table id="<portlet:namespace/>bigdistrictrelainfodg" title="气候区域"
			class="easyui-datagrid" width="100%" style="height: auto;"
			url="<portlet:resourceURL id="getBigdistrictrelainfos"></portlet:resourceURL>"
			rownumbers="true" pagination="true" fitColumns="true"
			singleSelect="true" idField="relationId"
			toolbar="#<portlet:namespace/>bigdistrictrelainfotb">
			<thead>
				<tr>
					<th field="districtinfo" width="150" formatter="formaterDistrictName">行政区名称</th>
				</tr>
			</thead>
		</table>
		<div id="<portlet:namespace/>bigdistrictrelainfotb">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="<portlet:namespace/>addBigdistrictrelainfo()">新增</a> <a
				href="#" class="easyui-linkbutton" iconCls="icon-remove"
				plain="true"
				onclick="<portlet:namespace/>removeBigdistrictrelainfo()">删除</a>
		</div>
		
		<div id="<portlet:namespace/>districtdlg" class="easyui-dialog"
			style="width: 360px; height: 160px; padding: 10px 20px" closed="true"
			buttons="#<portlet:namespace/>dlg-buttons">
				<form:form commandName="bigdistrictrelainfo" method="post" cssClass="editform" action="#">
						<div class="fitem">
							<form:label path="districtinfo.districtId">地区名称:</form:label>
							<form:input path="districtinfo.districtId" required="true" />
							<form:hidden path="relationId" />
						</div>
				</form:form>
			</div>
		<div id="<portlet:namespace/>dlg-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="<portlet:namespace/>savedistrict()">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#<portlet:namespace/>districtdlg').dialog('close')">取消</a>
		</div>

		<script language="javascript">
			
			function formaterDistrictName(val,row) {
				return val==null ? '' : val.districtName;
				
			}
		
			function <portlet:namespace/>addBigdistrictrelainfo() {
				
				$('#<portlet:namespace/>districtdlg').dialog('open').dialog('setTitle','新增地区');
				$('#districtinfo\\.districtId').combogrid("setValue", '');
			}
			function <portlet:namespace/>removeBigdistrictrelainfo() {
				var row = $('#<portlet:namespace/>bigdistrictrelainfodg').datagrid('getSelected');
				if (row) {
					$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
						 if (r){
							var removeUrl = "<portlet:resourceURL id='removeBigdistrictrelainfo'></portlet:resourceURL>";
							
							$.post(removeUrl,{relationId:row.relationId},function(result){
								if (result.success){
									$.messager.alert('提示','数据删除成功!','info');
									$('#<portlet:namespace/>bigdistrictrelainfodg').datagrid('reload');
								} else {
									$.messager.alert('Error',result.msg,'error');
								}
							},'json'); 
						} 
					});
				}else {
					$.messager.alert('提示','请选择装您要删除的仪表信息','info');
				}
			}
			
			function <portlet:namespace/>savedistrict() {
				var url = '<portlet:resourceURL id="submitBigdistrictrelainfo"></portlet:resourceURL>';
				$("#bigdistrictrelainfo").form('submit', {
					url: url,
					onSubmit : function() {
						return $(this).form('validate');
					},
					success: function(result){
						var result = eval('('+result+')');
						if (result.success){
							$('#<portlet:namespace/>districtdlg').dialog('close');		// close the dialog
							$('#<portlet:namespace/>bigdistrictrelainfodg').datagrid('reload');
						} else {
							$.messager.alert('错误',result.msg,'error');
						}
					}
				});
			}
			
			
			/**
			* 获取行政区划列表
			*/
			$("#districtinfo\\.districtId").combogrid({
				panelWidth:500,
				value:$("#districtinfo\\.districtId").val(),
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
						$('#districtinfo\\.districtId').combogrid("grid").datagrid("reload", { 'keyword': q });
		                $('#districtinfo\\.districtId').combogrid("setValue", q);
					}
				}
			});
		</script>

	</c:otherwise>
</c:choose>
