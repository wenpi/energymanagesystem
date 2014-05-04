 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午10:00:52
	LastModified Date:
	Description:
 -->
<div class="ftitle">
	<span>能源字典设置</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
	</span>
</div>
<form:form commandName="energydict" method="post" cssClass="editform">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energydictId">能源ID</form:label>
					<form:input path="energydictId" cssClass="easyui-validatebox"
						maxlength="16" required="true"/>
					<form:errors path="energydictId"></form:errors>
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energydictName">能源名称</form:label>
					<form:input path="energydictName" cssClass="easyui-validatebox"
						maxlength="24" required="true" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energydictCalorificvalue">热值</form:label>
					<form:input path="energydictCalorificvalue" maxlength="18" cssClass="easyui-numberbox" />千卡
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energydictCalorificvalueKj">热值</form:label>
					<form:input path="energydictCalorificvalueKj" maxlength="18" cssClass="easyui-numberbox"  />千焦
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energydictUnit">计量单位</form:label>
					<form:input path="energydictUnit" maxlength="16" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energydictRate">折标准煤系数</form:label>
					<form:input path="energydictRate" maxlength="18" precision="4" cssClass="easyui-numberbox" />
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energyDictRateElectricity">折标准电系数</form:label>
					<form:input path="energyDictRateElectricity" maxlength="18" precision="4" cssClass="easyui-numberbox" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					
				</div>
			</div>
		</div>

	</div>
	<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
</form:form>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-remove"
		onclick="<portlet:namespace/>remove()">删除</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>
<script language="javascript">
function <portlet:namespace/>saveForm() {
		var url = '<portlet:resourceURL id="submitEnergydictForm"></portlet:resourceURL>';
		$("#energydict").form('submit', {
			url: url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					var redirect = $("#<portlet:namespace/>redirect").val();
					$.messager.confirm('Confirm','保存成功，是否继续新增?',function(r){
						 if (r){
							 redirect += "&<portlet:namespace/>action=addEnergydictForm"
							window.location.href = redirect;
						 } else {
							 var isnew = $("#isnew").val();
								if(isnew=='true') {
									redirect += "&<portlet:namespace/>action=editEnergydictForm&<portlet:namespace/>energydictId="+result.msg; 
									window.location.href = redirect;		
								}
						 }
					});
	
				} else {
					$.messager.alert('错误',result.msg,'error');
				}
			}
		});
	}


	function <portlet:namespace/>resetForm() {
		$('#energydict').form('clear');
	}

	
	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeEnergydict'></portlet:resourceURL>";
					$.post(removeUrl,{energydictId:'${energydict.energydictId}'},function(result){
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
</script>