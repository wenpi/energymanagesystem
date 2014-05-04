<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init-ext.jsp"%>
<%@ page isELIgnored="false"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-15 下午01:30:13
	LastModified Date:
	Description:
 -->

<table id="<portlet:namespace/>addfiledg" width="100%"
	style="height: auto;" rownumbers="true" fitColumns="true"
	singleSelect="true" idField="addfileId" class="easyui-datagrid"
	toolbar="#<portlet:namespace/>addfiletb">
	<thead>
		<tr title="双击查看附件信息">
			<th field="name" width="100" align="left">附件名称</th>
			<th field="description" width="200" align="left">描述</th>
		</tr>
	</thead>
</table>
<div id="<portlet:namespace/>addfiletb">
	<a href="#" class="easyui-linkbutton" iconCls="icon-detail"
		plain="true" onclick="<portlet:namespace/>editAddfile()" title="修改附件">修改附件</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
		plain="true" onclick="<portlet:namespace/>delAddfile()"
		title="删除附件">删除附件</a> <a href="#" class="easyui-linkbutton"
		iconCls="icon-detail" plain="true"
		onclick="<portlet:namespace/>showAttachinfo()" title="查看附件">查看附件</a>
</div>

<div id="<portlet:namespace/>addfileDlg" class="easyui-dialog"
	style="width: 480px; height: 420px; padding: 10px 15px" closed="true">
	<form method="post" id="attachment">
		<div class="fitem">
			<label>附件名称:</label> <span id="showAttachName"></span>
		</div>
		<div class="fitem">
			<label>附件描述:</label> <span id="showDescription"></span>
		</div>
		<div class="fitem">
			<label>附件预览:</label> <img id="showFilePath" />
		</div>
	</form>
</div>


	<div class="ftitle addfileTitle">附件信息</div>
	<form:form commandName="addfile" method="post" cssClass="editform"
		action="#" enctype="multipart/form-data">

		<div class="fitem">
			<form:label path="name">附件名称:</form:label>
			<form:input path="name" required="true" style="width:260px;" cssClass="easyui-validatebox" />
			*
		</div>
		<div class="fitem">
			<form:label path="type">附件类型:</form:label>
			<form:select path="type">
					<form:options items="${addfileTypes}" itemValue="itemCode" itemLabel="itemName" />
				</form:select>

		</div>
		<div class="fitem">
			<form:label path="description">附件描述:</form:label>
			<form:textarea path="description" cols="50" rows="4" />
		</div>
		<div class="fitem">
			<form:label path="filePath">上传附件</form:label>
			<form:input path="file" type="file" required="true"
				cssClass="easyui-validatebox" />
		</div>
		<form:hidden path="addfileId" />
		<form:hidden path="filePath" />
		<form:hidden path="version" />
		<input type="hidden" name="objectId" id="objectId" />
		<input type="hidden" name="objectName" id="objectName" />
		<div class="fitem" id="buttons">
			<label>&nbsp;</label>
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="<portlet:namespace/>saveAddfileForm()">保存附件信息</a>
		</div>
	</form:form>
<script type="text/javascript">

$(function(){
		
	//添加表格双击事件
	$('#<portlet:namespace/>addfiledg').datagrid({
		onDblClickRow : function(row, data) {
			<portlet:namespace/>showAttachinfo();
		}
	});
		
		
	var tablename = $("#tablename");
	if(tablename.length>0) {
		$("#objectName").val($(tablename).val());
		
	};

});

    //保存附件
	function <portlet:namespace/>saveAddfileForm() {
		var objectId = $("#objectId").val();
		var tablename = $("#tablename").val();
		var istrue = true;
		if(objectName=='') {
			alert('附件对象未设置');
			istrue = false;
		} else {
			$("#objectName").val(tablename);
		}
		if(objectId=='') {
			alert('附件对象ID未设置,请选择对象!');
			istrue = false;
		}
		if(istrue) {
			$("#addfile").form('submit',{
				url:'<portlet:actionURL><portlet:param name="action" value="submitAddfileForm" /></portlet:actionURL>',
				onSubmit:function() {
					return $(this).form('validate');
				},
				success: function(result){
					$("#name").val("");
					$("#description").val("");
					$("#filePath").val("");
					$("#addfileId").val("");
					
					if($('#<portlet:namespace/>addfiledg').length>0) {
						$('#<portlet:namespace/>addfiledg').datagrid('reload');
					};
				}
			}); 
		};	
	}
	
	//编辑附件信息
	function <portlet:namespace/>editAddfile() {
		var data = $('#<portlet:namespace/>addfiledg').datagrid('getSelected');
		if(data) {
			$("#addfile #name").val(data.name);
			$("#addfile #type").val(data.type);
			$("#addfile #description").val(data.description);
			$("#addfile #filePath").val(data.filePath);
			$("#addfile #addfileId").val(data.addfileId);
			$("#addfile #version").val(data.version);
			if(null!=data.filePath) {
				$("#addfile #file").removeClass();
			}
		};
	}
	
	
	/**
	* 删除附件信息
	*/
	function <portlet:namespace/>delAddfile() {
		var data = $('#<portlet:namespace/>addfiledg').datagrid('getSelected');
		if (data){
			$.messager.confirm('Confirm','你确定要删除附件吗?',function(r){
				if (r){
					$.post('<portlet:resourceURL id="delAddfile"></portlet:resourceURL>',
							{addfileId:data.addfileId,objectId:$("#objectId").val(),objectName:$("#objectName").val()},
							function(result){
					if (result.success){
						alert("数据删除成功!");
						$('#<portlet:namespace/>addfiledg').datagrid('reload');
					} else {
						$.messager.alert('Error',result.msg,'error');
					}
				},'json');
				}
			});
		}
	}
	
	
	/**
	* 显示附件信息
	*/
	function <portlet:namespace/>showAttachinfo() {	
		var data = $('#<portlet:namespace/>addfiledg').datagrid('getSelected');
		if (data){
			$("#showAttachName").html(data.name);
			$("#showDescription").html(data.description);
			$("#showFilePath").attr('src',data.filePath).attr("width",400);
			$('#<portlet:namespace/>addfileDlg').dialog('open').dialog('setTitle','附件信息');
		}
	}
</script>


