 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午10:02:26
	LastModified Date:
	Description:
 -->
<div class="ftitle">
	<span>数据字典设置</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
	</span>
</div>
<div id="msg"></div>
<form:form commandName="dictitem" method="post" cssClass="editform">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="dictgroup.groupCode">字典类别</form:label>
					<form:input path="dictgroup.groupCode" cssClass="easyui-validatebox"
						maxlength="20" required="true" readOnly="true" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="itemCode">字典代码</form:label>
					<form:input path="itemCode" cssClass="easyui-validatebox"
						maxlength="20" required="true"/>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="itemName">字典名称</form:label>
					<form:input path="itemName" cssClass="easyui-validatebox"
						maxlength="50" required="true"/>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="itemShortname">字典简称</form:label>
					<form:input path="itemShortname" maxlength="20"/>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="itemOrder">排序No</form:label>
					<form:input path="itemOrder" cssClass="easyui-numberbox" required="true"/>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="itemRemark">备注说明</form:label>
					<form:textarea path="itemRemark" maxlength="250" rows="5" cols="40" />
				</div>
			</div>
		</div>
	</div>
	<form:hidden path="itemId" />
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
		var url = '<portlet:resourceURL id="submitDictitemForm"></portlet:resourceURL>';
		$("#dictitem").form('submit', {
			url: url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					var isnew = $("#isnew").val();
					if(isnew=='true') {
						var msg = result.msg;
						var redirect = $("#<portlet:namespace/>redirect").val();
						redirect += "&<portlet:namespace/>action=editDictitemForm&<portlet:namespace/>itemId="+msg; 
						window.location.href = redirect;	
					} else {
						$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
					}
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
					var removeUrl = "<portlet:resourceURL id='removeDictitem'></portlet:resourceURL>";
					$.post(removeUrl,{itemId:'${dictitem.itemId}'},function(result){
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