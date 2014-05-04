
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
<c:choose>
	<c:when test="${empty buildinfo}">
		<div id="tip" class="tip-info" style="margin-bottom: 10px;">
			<div class="op-tip icon-tip">&nbsp;</div>
			<div>必段先保存建筑基本资料</div>
		</div>
	</c:when>
	<c:otherwise>
		<div id="<portlet:namespace/>addfiletb">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="<portlet:namespace/>addBuildaddfile()">新增</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true"
				onclick="<portlet:namespace/>editBuildaddfile()">修改</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-remove" plain="true"
				onclick="<portlet:namespace/>removeBuildaddfile()">删除</a>
				<a href="#"
				class="easyui-linkbutton" iconCls="icon-apply" plain="true"
				onclick="<portlet:namespace/>setBuildcover()">设为封面</a>
				
		</div>
		<portlet:resourceURL id="getBuildaddfiles" var="getBuildaddfilesURL"></portlet:resourceURL>
		<table id="<portlet:namespace/>addfilesdg" title="建筑附件"
			class="easyui-datagrid" width="100%" style="height: auto;"
			url="<%=renderResponse.encodeURL(getBuildaddfilesURL)%>"
			rownumbers="true" pagination="true" fitColumns="true"
			singleSelect="true" idField="addfileId"
			toolbar="#<portlet:namespace/>addfiletb">
			<thead>
				<tr>
					<th field="addfileName" width="120">名称</th>
					<th field="addfileDesc" width="120">描述</th>
					<th field="addfileFunctype" width="60" align="center" formatter="formatFunctype">功能类型</th>
					<th field="buildCover" width="60">是否封面</th>
					<th field="addfileSuffix" width="80">后缀</th>
					<th field="addfileSize" width="80">大小</th>
					<th field="addfileDate" width="80" formatter="formatAddfiledate">上传时间</th>
					<th field="addfilePath" width="200">路径</th>
				</tr>
			</thead>
		</table>
		<div id="<portlet:namespace/>addfiledlg" class="easyui-dialog"
			style="width: 400px; height: 380px; padding: 10px 20px" closed="true"
			buttons="#<portlet:namespace/>dlg-buttons">
			<div class="ftitle">明细信息</div>
				<form:form commandName="buildaddfile" method="post" cssClass="editform" action="#"  enctype="multipart/form-data">
					<div class="fitem">
						<form:label path="addfileName">文件名称:</form:label>
						<form:input path="addfileName" required="true" />
					</div>
					<div class="fitem">
						<form:label path="addfileFunctype">功能类型:</form:label>
						<form:input path="addfileFunctype" required="true" />
					</div>
					<div class="fitem">
						<form:label path="addfileDesc">文件描述:</form:label>
						<form:textarea path="addfileDesc" style="width:60%;height:40px;" />
					</div>
					<div class="fitem">
						<form:label path="addfilePath">文件路径:</form:label>
						<c:choose>
							<c:when test="${empty buildaddfile.addfilePath}">
								<form:input path="fileData" type="file"/>
							</c:when>
							<c:otherwise>
								<form:input path="addfilePath" />
							</c:otherwise>
						</c:choose>
						<img id="showAddfilePath" />
					</div>
					
					<form:hidden path="buildinfo.buildId" />
						<form:hidden path="addfileId" />
						<form:hidden path="addfileSuffix" />
						<form:hidden path="addfileSize" />
						<form:hidden path="addfileDate" />
						<form:hidden path="addfilePath" />
			</form:form>
			
		</div>
		<div id="<portlet:namespace/>dlg-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="<portlet:namespace/>saveaddfile()">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#<portlet:namespace/>addfiledlg').dialog('close')">取消</a>
		</div>

		<script language="javascript">
			var functypes = [
			       {itemCode:'0',itemName:'建筑照片'},
			       {itemCode:'1',itemName:'配电柜照片'},
			       {itemCode:'2',itemName:'支路布置图'},
			       {itemCode:'3',itemName:'部署方案'}
			     ];
			$(function(){
				<portlet:namespace/>getDictitemsByGroupcode('addfileFunctype','addfile_functype');	
			});
		
		    //新增附件
			function <portlet:namespace/>addBuildaddfile() {
				$('#<portlet:namespace/>addfiledlg').dialog('open').dialog('setTitle','新增附件');
				$("#addfileName").val("");
				$("#addfileDesc").val("");
				$("#addfilePath").val("");
				$("#addfileId").val("");
				$("#addfileSize").val("");
				$("#showAddfilePath").attr('src','');
			}
			
			//编辑附件
			function <portlet:namespace/>editBuildaddfile() {
				var row = $('#<portlet:namespace/>addfilesdg').datagrid('getSelected');
				if (row){
					$('#<portlet:namespace/>addfiledlg').dialog('open').dialog('setTitle','编辑附件');
					$('#buildaddfile').form('load',row);
					var newDate = new Date(row.addfileDate);
					var retDate = newDate.getFullYear()+'-'+(newDate.getMonth()+1)+'-'+newDate.getDate();
					$("#addfileDate").val(retDate);
					
					if(row.addfilePath!="") {
						$("#showAddfilePath").attr('src',row.addfilePath);
						$("#showAddfilePath").attr('width',200);
					}
				}
			}
			//保存附件
			function <portlet:namespace/>saveaddfile() {
				var valid = true;
				if($("#addfileId").val()=="") {
					if($("#fileData").val()=="") {
						valid = false;
						alert("请选择你要上传的文件");
					}
				} else {
					if($("#addfilePath").val()==""){
						valid = false;
						console.log("valid = false");
						alert("请选择你要上传的文件");
					}
				}
				
				if(valid) {
					var resurl = '<portlet:actionURL><portlet:param name="action" value="submitBuildaddfileForm"></portlet:param></portlet:actionURL>';
					$("#buildaddfile").form('submit', {
						url: resurl,
						onSubmit : function() {
							return $(this).form('validate');
						},
						success: function(result){
							$('#<portlet:namespace/>addfiledlg').dialog('close');		// close the dialog
							$('#<portlet:namespace/>addfilesdg').datagrid('reload');	// reload the user data
						} 
					});
				}
			}
			//删除附件
			function <portlet:namespace/>removeBuildaddfile() {
				var row = $('#<portlet:namespace/>addfilesdg').datagrid('getSelected');
				if (row) {
					$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
						 if (r){
							var removeUrl = "<portlet:resourceURL id='removeBuildaddfile'></portlet:resourceURL>";
							$.post(removeUrl,{addfileId:row.addfileId},function(result){
								if (result.success){
									$.messager.alert('提示','数据删除成功!','info');
									$('#<portlet:namespace/>addfilesdg').datagrid('reload');
								} else {
									$.messager.alert('Error',result.msg,'error');
								}
							},'json');
						} 
					});
				}else {
					$.messager.alert('提示','请选择您要删除的仪表信息','info');
				}
			}
			//设置建筑封面
			function <portlet:namespace/>setBuildcover() {
				var row = $('#<portlet:namespace/>addfilesdg').datagrid('getSelected');
				if (row) {
					if(row.addfileFunctype=='0') {
						$.post('<portlet:resourceURL id="setBuildcover"></portlet:resourceURL>',{addfileId:row.addfileId},function(result){
							if (result.success){
								$('#<portlet:namespace/>addfilesdg').datagrid('reload');
							} else {
								$.messager.alert('Error',result.msg,'error');
							}
						},'json');
					}
				}
			}
			
			//格式化附件类型
			function formatFunctype(val,row) {
				for(var i=0; i<functypes.length; i++){
					if (functypes[i].itemCode == val) return functypes[i].itemName;
				}
				return val;
				
			}
			//格式化附件日期
			function formatAddfiledate(date,row) {
				var newDate = new Date(date);
				return newDate.getFullYear()+'-'+(newDate.getMonth()+1)+'-'+newDate.getDate(); 
			}
			
		</script>
	</c:otherwise>
</c:choose>