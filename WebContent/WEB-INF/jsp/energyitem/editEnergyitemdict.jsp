 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午11:33:24
	LastModified Date:
	Description:编辑能耗分类分项信息
 -->
<div class="ftitle">
	<span>能耗分类分项设置</span>
	<span class="title-back"><a href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
</div>

<form:form commandName="energyitemdict" method="post" cssClass="editform" action="#">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energyItemcode">分类分项代码</form:label>
					<form:input path="energyItemcode"  cssClass="easyui-validatebox" maxlength="10" required="true" /> *
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energyItemname">分类分项名称</form:label>
					<form:input path="energyItemname" cssClass="easyui-validatebox"
						maxlength="32" required="true" /> * 
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energyitemdict.energyItemcode">上级分类分项</form:label>
					<portlet:resourceURL id="getEnergyitemdicts" var="getEnergyitemdictsURL"></portlet:resourceURL>
					<form:input path="energyitemdict.energyItemcode" 
					url="<%=renderResponse.encodeURL(getEnergyitemdictsURL) %>"
						cssClass="easyui-combotree" panelHeight="300" panelWidth="300" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energydict.energydictId">所属能源ID</form:label>
					<form:input path="energydict.energydictId" maxlength="16" required="true" /> *
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energyItemtype">能耗分析类型</form:label>  
					<form:radiobutton path="energyItemtype" value="0" /> 分类能耗
					<form:radiobutton path="energyItemtype" value="1" /> 分项能耗 *
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="energyItemstate">启用状态</form:label>
					<form:radiobutton path="energyItemstate" value="0" />停用
					<form:radiobutton path="energyItemstate" value="1" />启用
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
</form:form>
<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>saveForm()">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="<portlet:namespace/>remove()">删除</a>
	 <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>
<script language="javascript">
$(function(){
	$("#energydict\\.energydictId").combobox({
		url:'<portlet:resourceURL id="getEnergydicts"></portlet:resourceURL>',
		valueField:'energydictId',
		textField:'energydictName'
	});
});


//保存数据
function <portlet:namespace/>saveForm() {
		var url = '<portlet:resourceURL id="submitEnergyitemdictForm"></portlet:resourceURL>';
		$("#energyitemdict").form('submit', {
			url: url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					var redirect = $("#<portlet:namespace/>redirect").val();
					$.messager.confirm('Confirm','数据保存成功，是否继续新增?',function(r){
						 if (r){
							 //redirect += "&<portlet:namespace/>action=addEnergyitemdictForm&<portlet:namespace/>energyItemcode=";
							 //window.location.href = redirect;	
							 $("#energyItemcode").val("");
							 $("#energyItemname").val("");
							 $("#isnew").val("true");
						 } else {
							 var isnew = $("#isnew").val();
								if(isnew=='true') {
									redirect += "&<portlet:namespace/>action=editEnergyitemdictForm&<portlet:namespace/>energyItemcode="+result.msg; 
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

	//删除数据
	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeEnergyitemdict'></portlet:resourceURL>";
					$.post(removeUrl,{energyItemcode:'${energyitemdict.energyItemcode}'},function(result){
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