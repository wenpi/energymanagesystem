 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午11:26:37
	LastModified Date:
	Description: 编辑数据中心资料
 -->

<div class="ftitle">
	<span>数据中心设置</span>
	<span class="title-back"><a href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
</div>
<form:form commandName="datacenterinfo" method="post" cssClass="editform">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="datacenterId">数据中心编号</form:label>
					<form:input path="datacenterId"  cssClass="easyui-validatebox" maxlength="6" required="true" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="datacenterName">数据中心名称</form:label>
					<form:input path="datacenterName" cssClass="easyui-validatebox"
						maxlength="24" required="true" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="datacenterType">数据中心类型</form:label>
					<form:radiobutton path="datacenterType" value="1" required="true" /> 数据中心
					<form:radiobutton path="datacenterType" value="2" required="true" />  数据中转站
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="datacenterManager">中心主管单位</form:label>
					<form:input path="datacenterManager" maxlength="24"  />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="datacenterContact">联系人</form:label>
					<form:input path="datacenterContact"  maxlength="24" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="datacenterTel">联系电话</form:label>
					<form:input path="datacenterTel"  maxlength="24" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="datacenterDesc">数据中心描述</form:label>
					<form:textarea path="datacenterDesc" maxlength="400" style="width:80%;" />
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
</form:form>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>saveForm()">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="<portlet:namespace/>remove()">删除</a>
	<a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>
<script language="javascript">
function <portlet:namespace/>saveForm() {
		var url = '<portlet:resourceURL id="submitDatacenterForm"></portlet:resourceURL>';
		$("#datacenterinfo").form('submit', {
			url: url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					var redirect = $("#<portlet:namespace/>redirect").val();
					redirect += "&<portlet:namespace/>action=editDatacenterForm&<portlet:namespace/>datacenterId="+result.msg; 
					window.location.href = redirect;						
				} else {
					$.messager.alert('错误',result.msg,'error');
				}
			}
		});
	}
	function <portlet:namespace/>resetForm() {
		$('#datacenterinfo').form('clear');
	}
	
	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeDatacenter'></portlet:resourceURL>";
					$.post(removeUrl,{datacenterId:'${datacenterinfo.datacenterId}'},function(result){
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