<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../init-ext.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-30 下午04:32:00
	LastModified Date:
	Description:
 -->
<c:choose>
	<c:when test="${empty strategy}">
		<div id="tip" class="tip-info" style="margin-bottom: 10px;">
			<div class="op-tip icon-tip">&nbsp;</div>
			<div>必段先保存策略信息</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="easyui-layout" style="width: 100%; height: 480px;">
			<div region="west" split="true" title="设备列表" style="width: 180px;">
				<table id="strategydetails" class="easyui-datagrid" url="<portlet:resourceURL id="getStrategydetails"></portlet:resourceURL>"
					singleSelect="true" style="width: 172px;height:440px;" idField="detailid">
					<thead>
						<tr>
							<th field="devicename" width="160">名称</th>
						</tr>
					</thead>
				</table>
			</div>
			<div region="center" title="详细设置"
				style="background: #fafafa; padding: 20px;">
				<div id="msg"></div>
				<form:form commandName="strategydetail" method="post" action="#">
					<div class="div-table">
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="devicename">设备名称</form:label>
									<form:input path="devicename" cssClass="easyui-validatebox"
										maxlength="25" required="true" />
									<form:hidden path="strategy.strategyid"
										value="${strategy.strategyid}" />
								</div>
							</div>
						</div>
					</div>
					<div class="div-table">
						<div class="ftitle">参数设置</div>
						<div class="div-table-row">
							<div class="div-table-4col">
								<div class="fitem">
									<label>参数名称</label>
								</div>
							</div>
							<div class="div-table-4col">
								<div class="fitem">
									<label>参数值</label>
								</div>
							</div>
						</div>
						<%
							for (int i = 0; i < 8; i++) {
						%>
						<div class="div-table-row deviceparams" id="paramrow<%=i%>">
							<div class="div-table-4col">
								<div class="fitem">
									<input type="text" name="detailparams[<%=i%>].paramname"
										value="${detailparam.paramname}">
								</div>
							</div>
							<div class="div-table-4col">
								<div class="fitem">
									<input type="text" name="detailparams[<%=i%>].paramvalue"
										value=""> <input type="hidden"
										name="detailparams[<%=i%>].paramtypeid" value="0"> <input
										type="hidden" name="detailparams[<%=i%>].paramid" value="">
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="ftitle">用电设置</div>
					<div class="div-table-row" id="paramrow8">
						<div class="div-table-2col">
							<div class="fitem">
								<label>用电量</label> <input type="hidden"
									name="detailparams[8].paramname" value="用电量"> <input
									type="text" name="detailparams[8].paramvalue" value="">
							</div>
						</div>
						<div class="div-table-2col">
							<div class="fitem">
								<label>计量TagID</label> <input type="text"
									name="detailparams[8].tagid" value=""> <input
									type="hidden" name="detailparams[8].paramtypeid" value="2">
								<input type="hidden" name="detailparams[8].paramid" value="">
							</div>
						</div>
					</div>

					<div class="ftitle">温度设置</div>
					<div class="div-table-row" id="paramrow9">
						<div class="div-table-2col">
							<div class="fitem">
								<label>温度</label> <input type="hidden"
									name="detailparams[9].paramname" value="温度"> <input
									type="text" name="detailparams[9].paramvalue" id="">
							</div>
						</div>
						<div class="div-table-2col">
							<div class="fitem">
								<label>计量TagID</label> <input type="text"
									name="detailparams[9].tagid" value=""> <input
									type="hidden" name="detailparams[9].paramtypeid" value="3">
								<input type="hidden" name="detailparams[9].paramid" value="">
							</div>
						</div>
					</div>


					<form:hidden path="detailid" />
				</form:form>
				<div id="<portlet:namespace/>dlg-buttons" style="margin: 20px;">
					<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-add',disabled:true" id="new"
						onclick="<portlet:namespace/>create()">新增</a> <a href="#"
						class="easyui-linkbutton" iconCls="icon-ok"
						onclick="<portlet:namespace/>save()">保存</a> <a href="#"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-ok',disabled:true" id="saveasnew"
						onclick="<portlet:namespace/>saveasnew()">保存为新策略</a> <a href="#"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-ok',disabled:true" id="exec"
						onclick="<portlet:namespace/>exec()">执行策略</a> <a href="#"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-remove',disabled:true" id="remove"
						onclick="<portlet:namespace/>remove()">删除设置</a>
				</div>
			</div>

		</div>

		<portlet:renderURL var="currentUrl"
			windowState="<%= com.liferay.portal.kernel.portlet.LiferayWindowState.POP_UP.toString() %>">
			<portlet:param name="action" value="strategydetail"></portlet:param>
			<portlet:param name="strategyid" value="${strategy.strategyid}"></portlet:param>
		</portlet:renderURL>

		<script language="javascript">
	$(document).ready(function(){ 

	}) 

	
	/**
	* 保存表单数据
	*/
	function <portlet:namespace/>save() {
		var url='<portlet:resourceURL id="submitStrategydetailForm"></portlet:resourceURL>';
		$("#strategydetail").form('submit', {
			url: url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
					$('#strategydetails').datagrid('reload');
				} else {
					$.messager.alert('错误',result.msg,'error');
				};
			}
		});
		
	}
	
	function <portlet:namespace/>saveasnew(){
		$("#detailid").val("");
		var devicename = $("#devicename").val();
		$("#devicename").val(devicename+"-复制");
		<portlet:namespace/>save();
	}
	
	function <portlet:namespace/>remove() {
		var detailid = $("#detailid").val();
		if(detailid.length>0) {
			$.messager.confirm('删除确认','确认要策略设置吗?',function(r){
				if (r){
					var url = '<portlet:resourceURL id="removeStrategydetail"></portlet:resourceURL>';
					$.get(url,{detailid:detailid},function(result){
						if (result.success){
							$('#strategydetails').datagrid('reload');	// reload the user data
						} else {
							$.messager.alert('Error',result.msg,'error');
						}
					},'json'); 
				}
			});
		};
	}
	
	function <portlet:namespace/>exec() {
		
	}

	/**
	* 显示明细信息
	*/
	$("#strategydetails").datagrid({
		onClickRow:function(row,data) {
			$("#new").linkbutton({disabled:false});
			$("#saveasnew").linkbutton({disabled:false});
			$("#exec").linkbutton({disabled:false});
			$("#remove").linkbutton({disabled:false});
			
			$("#devicename").val(data.devicename);
			$("#detailid").val(data.detailid);
			$("#strategy\\.strategyid").val('${strategy.strategyid}');

			
			$.post("<portlet:resourceURL id="getStrategydetailparams"></portlet:resourceURL>",{detailid:data.detailid},
					function(data){
				
				$.each(data,function(index,obj) {
					var typeid = $("input[name='detailparams["+ index +"].paramtypeid']").val();
					
					//按明细类型显示
					if(obj.paramtypeid==0) {
						$("input[name='detailparams["+ index +"].paramname']").val(obj.paramname);
						$("input[name='detailparams["+ index +"].paramvalue']").val(obj.paramvalue);
						$("input[name='detailparams["+ index +"].paramid']").val(obj.paramid);
					}
					if(obj.paramtypeid==2) {
						$("input[name='detailparams[8].paramvalue']").val(obj.paramvalue);
						$("input[name='detailparams[8].tagid']").val(obj.tagid);
						$("input[name='detailparams[8].paramid']").val(obj.paramid);
					}
					if(obj.paramtypeid==3) {
						$("input[name='detailparams[9].paramvalue']").val(obj.paramvalue);
						$("input[name='detailparams[9].tagid']").val(obj.tagid);
						$("input[name='detailparams[9].paramid']").val(obj.paramid);
					}
				});
			}); 
		}
	});

	
	function <portlet:namespace/>create() {
		var tab = $('#tab-container').tabs('getSelected'); 
		tab.panel('refresh', '<%=renderResponse.encodeURL(currentUrl)%>');
	}
	
</script>
	</c:otherwise>
</c:choose>