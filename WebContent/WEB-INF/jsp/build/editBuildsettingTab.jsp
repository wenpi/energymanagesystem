<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date: ${date} ${time}
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
		<form:form commandName="buildsettinginfo" method="post"
			cssClass="editform">
			<div class="ftitle">网络设置</div>
			<div class="div-table">
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="settingWsurl">web服务地址端口</form:label>
							<form:input path="settingWsurl" cssClass="easyui-validatebox" 
							required="true" title="http://开头的全路径地址" style="width:200px;" /> 
							<a href="javascript:ping();" class="easyui-linkbutton" plain="true" iconCls="icon-reload">测试</a>
							
						</div>
					</div>
				</div>
			</div>
<!--  <form:hidden path="buildId"/>-->	
			<form:hidden path="buildinfo.buildId"/>
		</form:form>
		<div id="buttons" align="center">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-remove"
				onclick="<portlet:namespace/>remove()">删除</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-back"
				onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
		</div>
		<script language="javascript">
		$(function(){  
			//url  
		    url = function(id, msg){  
		        $('#'+id).validatebox({  
		            validType: 'url',  
		            invalidMessage: msg  
		        });  
		    };  
		});
		
		/**
		* 保存建筑设置数据
		*/
		function <portlet:namespace/>saveForm() {
			var resurl = '<portlet:resourceURL id="submitBuildsettinginfoForm"></portlet:resourceURL>';
			$("#buildsettinginfo").form('submit', {
				url: resurl,
				onSubmit : function() {
					url('settingWshost','URL格式错误');
					return $(this).form('validate');
				},
				success: function(result){
					var result = eval('('+result+')');
					if (result.success){	
						$.messager.alert('提示','建筑设置保存成功','info');
						location.reload;
					} else {
						$.messager.alert('错误',result.msg,'error');
					}
				}
			});
		}	
		
		/**
		* 删除建筑设置信息
		*/
		function <portlet:namespace/>remove() {
			if($("#settingWshost").val()!="") {
				$.messager.confirm('Confirm','确定要删除建筑网络设置吗?',function(r){
					 if (r){
						var removeUrl = "<portlet:resourceURL id='removeBuildsettinginfo'></portlet:resourceURL>";
						$.post(removeUrl,{buildId:'${buildsettinginfo.buildId}'},function(result){
							if (result.success){
								$.messager.alert('提示','数据删除成功','info');
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
		
		function ping() {
			var serverUrl = "<portlet:resourceURL id='pingServer'></portlet:resourceURL>";
			var url = getHostname($("#settingWsurl").val());
			if(url.indexOf(':')>0) {
				url = url.substring(0,url.indexOf(':'));
			}
			$.post(serverUrl,{settingWsurl:url},function(result){
				if (result.success){
					if(result.success==true) {
						$.messager.alert('提示','服务器访问正常','info');
					} else {
						$.messager.alert('Error','服务器访问失败','error');
					}
				} else {
					$.messager.alert('Error','服务器访问失败','error');
				}
			},'json');
		}

		function getHostname(str) {
			var re = new RegExp('^(?:f|ht)tp(?:s)?\://([^/]+)', 'im');
			return str.match(re)[1].toString();
		}
		</script>
	</c:otherwise>
</c:choose>