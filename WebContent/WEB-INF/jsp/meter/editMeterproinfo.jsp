
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午10:03:52
	LastModified Date:
	Description: 编辑仪表产品信息和仪表产品参数
 -->
<div class="ftitle">
	<span>仪表产品设置</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
	</span>
</div>
<div class="easyui-layout" style="width: 100%; height: 450px;">
	<div region="east" icon="icon-reload" title="仪表产品参数" split="true"
		style="width: 400px;" tools="#<portlet:namespace/>tt">
		<portlet:resourceURL id="getMeterparaminfoByProductid" var="getMeterparaminfoByProductidURL"></portlet:resourceURL>
		<table id="<portlet:namespace/>params" class="easyui-datagrid"
			width="100%" style="height: 420px;"
			url="<%=renderResponse.encodeURL(getMeterparaminfoByProductidURL)%>"
			idField="meterParamid" rownumbers="true" singleSelect="true">
			<thead>
				<tr>
					<th field="meterParamname" width="80">代码</th>
					<th field="meterParamvalue" width="80">参数值</th>
					<th field="meterChangerate" width="60">转换比率</th>
					<th field="meterValuetype" width="100" formatter="formatMeterValuetype">值类型</th>
				</tr>
			</thead>
</table>

	</div>
	<div region="center" title="仪表产品信息"
		style="background: #fafafa; overflow: hidden">
		<form:form commandName="meterproinfo" method="post"
			cssClass="editform">
			<div id="msg"></div>
			<div class="div-table">
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="meterProductid">仪表产品代码</form:label>
							<c:choose>
								<c:when test="${empty meterproinfo.meterProductid}">
									<form:input path="meterProductid" value="系统生成" readOnly="true" />
								</c:when>
								<c:otherwise>
									<c:out value="${meterproinfo.meterProductid}"></c:out>
									<form:hidden path="meterProductid" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="meterProductname">仪表产品名称</form:label>
							<form:input path="meterProductname" cssClass="easyui-validatebox"
								maxlength="24" required="true" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="meterType">仪表产品类型</form:label>
							<form:input path="meterType" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="meterProducter">仪表生产厂家</form:label>
							<form:input path="meterProducter" maxlength="48" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="meterModel">仪表型号</form:label>
							<form:input path="meterModel" maxlength="48" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="meterProductdesc">仪表描述</form:label>
							<form:textarea path="meterProductdesc" maxlength="160" />
						</div>
					</div>
				</div>
				<c:if test="${!empty meterproinfo.meterProductid}">
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							 产品图片
							<img alt="产品图片" id="meter" height="60"  src="${meterproinfo.meterPhoto}" /> <br />
							<label></label><a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="editPhoto()">修改</a>
							<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-delete'"  onclick="deletePhoto()">删除</a>
						</div>
					</div>
				</div>
				</c:if>
			</div>
			<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
			<input type="hidden" id="meterPhoto" name="meterPhoto"/>
		</form:form>
		<div id="buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-remove"
				onclick="<portlet:namespace/>remove()">删除</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-back"
				onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
		</div>
	</div>
</div>
<div id="<portlet:namespace/>tt">
	<a href="#" class="icon-add"
		onclick="<portlet:namespace/>addParam()" title="新增参数"></a> <a
		href="#" class="icon-edit"
		onclick="<portlet:namespace/>editParam()" title="编辑参数"></a> <a
		href="#" class="icon-remove"
		onclick="<portlet:namespace/>removeParam()" title="删除参数"></a>
</div>
<c:if test="${!empty meterproinfo.meterProductid}">
<!-- 仪表产品图片上传对话框  -->
<div id="<portlet:namespace/>photodlg" class="easyui-dialog"
	style="width: 350px; height: 200px; padding: 10px 15px" closed="true"
	buttons="#<portlet:namespace/>photodlg-buttons">
	<form:form commandName="fileUploadBase" method="post"
			cssClass="editform" enctype="multipart/form-data">
				<form:input path="fileData" type="file"/>
			</form:form>
</div>
<div id="<portlet:namespace/>photodlg-buttons" align="center">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="<portlet:namespace/>savePhoto()">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#<portlet:namespace/>photodlg').dialog('close')">取消</a>
</div>


<div id="helpMsg" class="portlet-msg-info">
仪表产品维护主要用于记录能源项目中所用到的监测仪表信息。<br />
仪表参数列表中列出仪表所能监测到的数据项目。

</div>

</c:if>
<!-- 仪表产品参数编辑对话框  -->
<div id="<portlet:namespace/>dlg" class="easyui-dialog"
	style="width: 420px; height: 360px; padding: 10px 15px" closed="true"
	buttons="#<portlet:namespace/>dlg-buttons">
<div class="ftitle">仪表产品参数</div>
	<form:form commandName="meterparaminfo" method="post" cssClass="editform" action="#">
		<div class="fitem">
			<form:label path="meterParamid">参数代码:</form:label>
			<c:choose>
				<c:when test="${empty meterparaminfo.meterParamid}">
					<form:input path="meterParamid" value="系统生成" readOnly="true" />
				</c:when>
				<c:otherwise>
					<c:out value="${meterparaminfo.meterParamid}"></c:out>
					<form:hidden path="meterParamid" />
				</c:otherwise>
			</c:choose>
		</div>
		<div class="fitem">
			<form:label path="meterParamname">参数名称:</form:label>
			<form:input path="meterParamname" cssClass="easyui-validatebox" maxlength="24" required="true" placeholder="数据名称" /> *
		</div>
		<div class="fitem">
			<form:label path="meterParamvalue">参数值:</form:label>
			<form:input path="meterParamvalue" maxlength="24"  cssClass="easyui-numberbox"  precision="0" required="true" placeholder="参数值" /> *
		</div>
		<div class="fitem">
			<form:label path="meterChangerate">转换比率:</form:label>
			<form:input path="meterChangerate"  cssClass="easyui-numberbox"  precision="4" required="true"  /> *
		</div>
		<div class="fitem">
			<form:label path="meterValuetype">数据值类型:</form:label>
			<form:select path="meterValuetype">
				<form:option value="1">累计值</form:option>
				<form:option value="2">变化值</form:option>
				<form:option value="3">瞬时值</form:option>
			</form:select> *
		</div>
		<div class="fitem">
			<form:label path="meterParamstate">参数状态:</form:label>
			<form:radiobutton path="meterParamstate" value="0" /> 无效
			<form:radiobutton path="meterParamstate" value="1" /> 有效
		</div>
		<form:hidden path="meterproinfo.meterProductid" value="${meterproinfo.meterProductid}" />
	</form:form>
</div>
<div id="<portlet:namespace/>dlg-buttons" align="center">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="<portlet:namespace/>saveParam()">保存</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#<portlet:namespace/>dlg').dialog('close')">取消</a>
</div>

<script language="javascript">
	$(function() {
		<portlet:namespace/>getDictitemsByGroupcode('meterType','meter_type');
		
		var availableTags = ["最大报警限","最低报警限"];
		$( "#meterParamname" ).autocomplete({
			source: availableTags
		});

		
	});

	function <portlet:namespace/>saveForm() {
		if(meterProductid.value =="系统生成"){
		}
		else{
		meterPhoto.value = meter.src;	
		}
		var url = '<portlet:resourceURL id="submitMeterproinfoForm"></portlet:resourceURL>';
		$("#meterproinfo").form('submit', {
			url: url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					if($("#isnew").val()=="true") {
						var redirect = $("#<portlet:namespace/>redirect").val();
						redirect += "&<portlet:namespace/>action=editMeterproinfoForm&<portlet:namespace/>meterProductid="+result.msg; 
						window.location.href = redirect;	
					}
					$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
				} else {
					$.messager.alert('错误',result.msg,'error');
				}
			}
		});
	}
	
	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeMeterproinfo'></portlet:resourceURL>";
					$.post(removeUrl,{meterProductid:'${meterproinfo.meterProductid}'},function(result){
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

	function formatMeterValuetype(val,row) {
		//1累计值 2变化值 3瞬时值
		if(val==1)
			return "累计值";
		else if(val==2)
			return "变化值";
		else if(val==3)
			return "瞬时值";
	}


	//添加产品参数
	function <portlet:namespace/>addParam() {
		if($("#isnew").val()=="true") {
			alert("必须先保存产品信息")
		} else {
			$('#<portlet:namespace/>dlg').dialog('open').dialog('setTitle','添加产品参数');
			//$('#meterparaminfo').form('clear');
			
			$('#meterParamid').val("系统生成");
			$('#meterParamname').val("");
			$('#meterChangerate').val("");
			$('#meterValuetype').val("");
		}
	}
	
	//编辑产品参数
	function <portlet:namespace/>editParam() {
		var row = $('#<portlet:namespace/>params').datagrid('getSelected');
		if (row){
			$('#<portlet:namespace/>dlg').dialog('open').dialog('setTitle','编辑产品参数');
			$('#meterparaminfo').form('load',row);
		}
	}
	//删除产品参数
	function <portlet:namespace/>removeParam() {
		var row = $('#<portlet:namespace/>params').datagrid('getSelected');
		if (row){
			$.messager.confirm('删除确认','确认要删除该产品参数吗?',function(r){
				if (r){
					var url = '<portlet:resourceURL id="removeMeterparaminfo"></portlet:resourceURL>';
					$.post(url,{meterParamid:row.meterParamid},function(result){
						if (result.success){
							$.messager.alert('Success',"数据删除成功",'info');
							$('#<portlet:namespace/>params').datagrid('reload');	// reload the user data	
						} else {
							$.messager.alert('Error',result.msg,'error');
						}
					},'json');
					
				}
			});
		}
	}
	//保存产品参数
	function <portlet:namespace/>saveParam() {
		$("#meterparaminfo").form('submit',{
			url:'<portlet:resourceURL id="submitMeterparaminfo"></portlet:resourceURL>',
			onSubmit:function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					$('#<portlet:namespace/>dlg').dialog('close');		// close the dialog
					$('#<portlet:namespace/>params').datagrid('reload');	// reload the user data
				} else {
					$.messager.alert('Error',result.msg,'error');
				}
			}
		
		});
	}
	
	function editPhoto() {
		$('#<portlet:namespace/>photodlg').dialog('open').dialog('setTitle','设置产品图片');
	}
	
	function deletePhoto() {
		$("#meterparaminfo").form('submit',{
			url:'<portlet:resourceURL id="deleteMeterphoto"></portlet:resourceURL>',
			onSubmit:function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					$("#meterPhoto").attr('src','');
				} else {
					$.messager.alert('Error',result.msg,'error');
				}
			}
		
		});
	}
	
	/**
	* 上传仪表产品图片
	*/
	function <portlet:namespace/>savePhoto() {
		$("#fileUploadBase").form('submit',{
			url:'<portlet:actionURL><portlet:param name="action" value="submitMeterphoto"></portlet:param><portlet:param name="meterProductid" value="${meterproinfo.meterProductid}"></portlet:param></portlet:actionURL>',
			onSubmit:function() {
				return $(this).form('validate');
			},
			success: function(result){
				//关闭上传对话框
				$('#<portlet:namespace/>photodlg').dialog('close');		// close the dialog
				//重新获取对象,并给图片路径重新赋值
				$.get('<portlet:resourceURL id="getMeterproinfo"></portlet:resourceURL>',{meterProductid:'${meterproinfo.meterProductid}'},function(data){
					$.each(data,function(index,obj){
						$("#meter").attr('src',obj.meterPhoto);
					});		
				});
			}
		});

	}
	
</script>