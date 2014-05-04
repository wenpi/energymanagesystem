
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午11:31:10
	LastModified Date:
	Description:编辑监测仪表使用信息
 -->
<c:choose>
	<c:when test="${empty circuitinfo}">
		<div id="tip" class="tip-info" style="margin-bottom: 10px;">
			<div class="op-tip icon-tip">&nbsp;</div>
			<div>必须先保存支路信息</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="easyui-layout" style="width: 100%; height: 520px;">
			<div region="east" icon="icon-reload" title="仪表使用参数" split="true"
				style="width: 250px;" tools="#<portlet:namespace/>tt">
				<table id="<portlet:namespace/>Attributes" class="easyui-datagrid"
					width="100%" style="height: 480px;" idField="id" rownumbers="true" singleSelect="true">
					<thead>
						<tr>
							<th field="id" width="80" formatter="formatAttrname">属性名称</th>
							<th field="meterattrType" width="60"
								formatter="formatMeterattrType">属性类别</th>
							<th field="meterattrValue" width="100">属性值</th>
						</tr>
					</thead>
				</table>
			</div>
			<div region="west" split="true" title="支路仪表" style="width:350px;">
			<portlet:resourceURL id="getMeteruseinfosByCircuitid" var="getMeteruseinfosByCircuitidURL">
			</portlet:resourceURL>
				<table id="<portlet:namespace/>Meteruseinfos" class="easyui-datagrid"
					width="100%" style="height: 480px;"
					url="<%=renderResponse.encodeURL(getMeteruseinfosByCircuitidURL)%>"
					idField="meterId" rownumbers="true" pagination="true" singleSelect="true">
					<thead>
						<tr>
							<th field="meterId" width="120">仪表ID</th>
							<th field="meterName" width="100">仪表名称</th>
							<th field="meterproinfo" width="100"
								formatter="formatMeterproinfo">仪表产品名称</th>
						</tr>
					</thead>
				</table>
			</div>
			<div region="center" title="仪表使用信息"
				style="background: #fafafa; overflow: hidden">
				<form:form commandName="meteruseinfo" method="post"
					cssClass="editform">
					<div class="div-table">
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="meterId">仪表代码</form:label>
									<c:choose>
										<c:when test="${empty meteruseinfo.meterId}">
											<form:input path="meterId" value="系统生成" readOnly="true" />
										</c:when>
										<c:otherwise>
											<c:out value="meterId"></c:out>
											<form:hidden path="meterId" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="meterName">仪表名称</form:label>
									<form:input path="meterName" cssClass="easyui-validatebox"
										maxlength="24" required="true" /> *
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="meterproinfo.meterProductid">仪表产品</form:label>
									<form:input path="meterproinfo.meterProductid"
										 required="true"  />  *
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="buildregioninfo.regionId">所属建筑区域</form:label>
									<form:input path="buildregioninfo.regionId" maxlength="48" />
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<label>所属能耗分项</label>
									<input type="text" name="energyItemcode" id="energyItemcode" maxlength="10"  />
									<input type="hidden" name="resultId" id="resultId" value="" />
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="meterAddr1">监测仪表地址1</form:label>
									<form:input path="meterAddr1" maxlength="48" />
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="meterAddr2">监测仪表地址2</form:label>
									<form:input path="meterAddr2" maxlength="48" />
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="meterAddr3">监测仪表地址3</form:label>
									<form:input path="meterAddr3" maxlength="48" />
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="meterRate">互感器变化</form:label>
									<form:input path="meterRate" cssClass="easyui-numberbox"
										precision="4" />
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="meterState">仪表状态</form:label>
									<form:input path="meterState" maxlength="48" />
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="meterDesc">仪表描述</form:label>
									<form:textarea path="meterDesc" maxlength="160" rows="2" cols="22" />
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="deviceid">关联设备ID</form:label>
									<form:input path="deviceid" maxlength="75" size="18" /> 
									<span class="taglib-icon-help"> <img alt=""
						title="填写资产管理系统中对应的设备ID"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
								</div>
							</div>
						</div>
					</div>
					<form:hidden path="circuitinfo.circuitId" value="${circuitinfo.circuitId}" />
					<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
				</form:form>
				<div id="buttons" align="center">
					<a href="#" class="easyui-linkbutton" iconCls="icon-add"
						onclick="<portlet:namespace/>addForm()">新增</a>
					<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
						onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
						class="easyui-linkbutton" iconCls="icon-remove"
						onclick="<portlet:namespace/>remove()">删除</a> 
				</div>
			</div>
		</div>
		<div id="<portlet:namespace/>tt">
			<a href="#" class="icon-add"
				onclick="<portlet:namespace/>addAttribute()" title="新增参数"></a> <a
				href="#" class="icon-edit"
				onclick="<portlet:namespace/>editAttribute()" title="编辑参数"></a> <a
				href="#" class="icon-remove"
				onclick="<portlet:namespace/>removeAttribute()" title="删除参数"></a>
		</div>

		<!-- 仪表产品参数编辑对话框  -->
		<div id="<portlet:namespace/>dlg" class="easyui-dialog"
			style="width: 420px; height: 360px; padding: 10px 15px" closed="true"
			buttons="#<portlet:namespace/>dlg-buttons">
			<div class="ftitle">仪表使用属性</div>
			<form:form commandName="meteruseattribute" method="post"
				cssClass="editform" action="#">
				<div class="fitem">
					<form:label path="meterattrType">属性类别:</form:label>
					<form:select path="meterattrType" cssClass="easyui-combobox">
						<form:option value="0">设备TagID</form:option>
					</form:select>
				</div>
				<div class="fitem">
					<form:label path="id.meterattrName">属性名称:</form:label>
					<form:input path="id.meterattrName" cssClass="easyui-validatebox"
						maxlength="24" required="true" title="例如:低压I段1电能" />
					*
				</div>
				<div class="fitem">
					<form:label path="meterattrValue">属性值:</form:label>
					<form:input path="meterattrValue" cssClass="easyui-validatebox" required="true" title="例如:5826" /> *
				</div>
				<div class="fitem">
					<form:label path="meterattrDesc">属性说明:</form:label>
					<form:textarea path="meterattrDesc" style="width:90%;height:45px;" />
				</div>
	
			</form:form>
		</div>
		<div id="<portlet:namespace/>dlg-buttons" align="center">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>saveAttribute()">保存</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-cancel"
				onclick="javascript:$('#<portlet:namespace/>dlg').dialog('close')">取消</a>
		</div>
<div id="test"></div>
		<script language="javascript">
		
		/**
		* 获取仪表产品名称
		*/
		function formatMeterproinfo(val,row) {
			return val.meterProductname;
		}

		/**
		* 新增仪表信息
		*/
		function <portlet:namespace/>addForm() {
			$("#meteruseinfo").form('clear');
			$("#circuitinfo\\.circuitId").val('${circuitinfo.circuitId}');
			$("#isnew").val(false);
			$("#meterId").val("自动生成");
		}
		
		/**
		* 提交仪表信息
		*/
		function <portlet:namespace/>saveForm() {
			var url = '<portlet:resourceURL id="submitMeteruseinfoForm"></portlet:resourceURL>';
			$("#meteruseinfo").form('submit', {
				url: url,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success: function(result){
					var result = eval('('+result+')');
					if (result.success){
						$.messager.alert('提示','数据保存成功!','info');
						$("#<portlet:namespace/>Meteruseinfos").datagrid('reload');
					} else {
						$.messager.alert('错误',result.msg,'error');
					}
				}
			});
		}
		
		/**
		*  删除指定的仪表
		*/
		function <portlet:namespace/>remove() {
			var row = $("#<portlet:namespace/>Meteruseinfos").datagrid('getSelected');
			if(row) {
				$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
					 if (r){
						var removeUrl = "<portlet:resourceURL id='removeMeteruseinfo'></portlet:resourceURL>";
						$.post(removeUrl,{meterId:row.meterId},function(result){
							if (result.success){
								$.messager.alert('提示','数据删除成功!','info');
								$("#<portlet:namespace/>Meteruseinfos").datagrid('reload');
								<portlet:namespace/>addForm();
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
		
		/**
		* 设置仪表属性名称
		*/
		function formatAttrname(val,row) {
			return val.meterattrName;
		}

		/**
		* 设置仪表属性类型
		*/
		function formatMeterattrType(val,row) {
			if(val==0)
				return "设备TagID";
		}

		/**
		* 添加仪表属性
		*/
		function <portlet:namespace/>addAttribute() {	
			var row = $("#<portlet:namespace/>Meteruseinfos").datagrid('getSelected');
			if(row) {
				$('#<portlet:namespace/>dlg').dialog('open').dialog('setTitle','添加装表属性');
				$('#categoryattribute').form('clear');
				$("#circuitinfo\\.circuitId").val('${circuitinfo.circuitId}');
				$('#id\\.meterattrName').val("");
				$('#meterattrValue').val("");
				$('#meterattrDesc').val("");
			} else {
				$.messager.alert('提示','没有选择装表信息','info');
			}
		}
		
		/**
		* 编辑仪表属性
		*/
		function <portlet:namespace/>editAttribute() {
			var row = $('#<portlet:namespace/>Attributes').datagrid('getSelected');
			if (row){
				$('#<portlet:namespace/>dlg').dialog('open').dialog('setTitle','编辑装表属性');
				$('#meteruseattribute').form('load',row);
				$('#id\\.meterattrName').val(row.id.meterattrName);

				//console.log(row);
				$('#meterattrType').combobox('setValue', row.meterattrType);
				
			}
		}
		/**
		* 删除仪表属性
		*/
		function <portlet:namespace/>removeAttribute() {
			var row = $('#<portlet:namespace/>Attributes').datagrid('getSelected');
			if (row){
				$.messager.confirm('删除确认','确认要删除该产品参数吗?',function(r){
					if (r){
						var url = '<portlet:resourceURL id="removeAttribute"><portlet:param name="meterId" value="tempId" /><portlet:param name="meterattrName" value="tempName" /></portlet:resourceURL>';
						var removeurl=url.replace("tempId",row.id.meterId).replace("tempName",row.id.meterattrName);
						  $.get(removeurl,function(result){
							if (result.success){
								$('#<portlet:namespace/>Attributes').datagrid('reload');	// reload the user data
							} else {
								$.messager.alert('Error',result.msg,'error');
							}
						},'json'); 
					}
				});
			}
		}
		/**
		* 保存仪表属性
		*/
		function <portlet:namespace/>saveAttribute() {
			var row = $("#<portlet:namespace/>Meteruseinfos").datagrid('getSelected');
			if(row) {
				var submitUrl = '<portlet:resourceURL id="submitMeteruseattributeForm"><portlet:param name="meterId" value="tempId" /></portlet:resourceURL>';
				submitUrl=submitUrl.replace('tempId',row.meterId);
				$("#meteruseattribute").form('submit',{
					url:submitUrl,
					onSubmit:function() {
						return $(this).form('validate');
					},
					success: function(result){
						var result = eval('('+result+')');
						if (result.success){
							$('#<portlet:namespace/>dlg').dialog('close');		// close the dialog
							$('#<portlet:namespace/>Attributes').datagrid('reload');	// reload the user data
							
							$('#meterattrValue').val("");
							$('#id\\.meterattrName').val("");
							$('#meterattrDesc').val("");
							
						} else {
							$.messager.alert('Error',result.msg,'error');
						}
					}
				});
			} else {
				$.messager.alert('提示','没有选择装表信息','info');
			}
		}
		
		var meterTypes = [
			<c:forEach items="${meterTypes}" var="type">
				{itemCode:'<c:out value="${type.itemCode}"></c:out>',itemName:'<c:out value="${type.itemName}"></c:out>'},
			</c:forEach>           
		        ];


		/**
		* 仪表产品列表
		*/
		$("#meterproinfo\\.meterProductid").combogrid({
			panelWidth:500,
			panelHeight:330,
			value:$("#meterproinfo\\.meterProductid").val(),
			idField:'meterProductid',
			textField:'meterProductname',
			pagination : true,//是否分页  
			rownumbers:true,
			fit: true,
			pageList: [10,20,30],
			url:'<portlet:resourceURL id="getMeterproinfos"></portlet:resourceURL>',
			columns:[[
				{field:'meterProductid',title:'仪表ID',width:60},
				{field:'meterProductname',title:'仪表名称',width:160},
				{field:'meterType',title:'仪表类型',width:80,formatter:function(value){
					for(var i=0; i<meterTypes.length; i++){
						if (meterTypes[i].itemCode == value) return meterTypes[i].itemName;
					}
					return value;
				}},
				{field:'meterProducter',title:'仪表厂商',width:80},
				{field:'meterModel',title:'仪表型号',width:80}
			]]
			
		});
	
		/**
		* 获取建筑区域列表
		*/
		$("#buildregioninfo\\.regionId").combogrid({
			panelWidth:450,
			panelHeight:330,
			value:$("#buildregioninfo\\.regionId").val(),
			idField:'regionId',
			textField:'regionName',
			pagination : true,//是否分页  
			rownumbers:true,
			fit: true,
			pageSize: 10,
			pageList: [10,20,30],
			url:'<portlet:resourceURL id="getBuildregioninfoByBuildId"><portlet:param name="buildId" value="${circuitinfo.buildinfo.buildId}" /></portlet:resourceURL>',
			columns:[[
				{field:'regionId',title:'区域ID',width:140},
				{field:'regionName',title:'区域名称',width:160},
				{field:'regionRemark',title:'区域说明',width:80}
			]]
		});
		
		/**
		* 加载能耗分类分项列表
		*/
		$("#energyItemcode").combogrid({
			panelWidth:460,
			panelHeight:300,
			value:$("#energyItemcode").val(),
			idField:'energyItemcode',
			textField:'energyItemname',
			pagination : true,//是否分页  
			rownumbers:true,
			fit: true,
			pageSize: 10,
			pageList: [10,20,30,40,50],
			url:'<portlet:resourceURL id="getEnergyitemdicts"></portlet:resourceURL>',
			columns:[[
				{field:'energyItemcode',title:'分类分项代码',width:90},
				{field:'energyItemname',title:'分类分项名称',width:100},
				{field:'energyitemdict',title:'上级类别',width:80,formatter:function(val,row){
					return val==null || val==""?"":val.energyItemname;
				}},
				{field:'energyItemtype',title:'能耗分析类型',width:80,formatter:function(val,row){
					return val=='0' ? "分类能耗 " : "分项能耗";
				}},
				{field:'energyItemstate',title:'状态',width:60,formatter:function(val,row){
					return val=='0' ? "未启用 " : "启用";
				}}
			]]
		});
		
		
		/**
		* 仪表数据表格行点击事件
		*/
		$("#<portlet:namespace/>Meteruseinfos").datagrid({
			onClickRow:function(row,data) {
				$("#meterId").val(data.meterId);
				$("#meterName").val(data.meterName);
				$("#meterAddr1").val(data.meterAddr1);
				$("#meterAddr2").val(data.meterAddr2);
				$("#meterAddr3").val(data.meterAddr3);
				$("#meterRate").val(data.meterRate);
				$("#meterState").val(data.meterState);
				$("#meterDesc").val(data.meterDesc);
				$("#deviceid").val(data.deviceid);
				
				$("#isnew").val(true);
				$("#energyItemcode").combogrid("setValue","");
				$("#resultId").val("");
				
			//	$("#test").html('<portlet:resourceURL id="getEnergyitemresult"></portlet:resourceURL>'+"&meterId="+ data.meterId );
				
				$.post('<portlet:resourceURL id="getEnergyitemresult"></portlet:resourceURL>',{meterId:data.meterId},
						function(data){
					try{
						$.each(data,function(index,val){
							if(val!=null) {
								//alert(val.energyitemdict.energyItemcode);
								$("#energyItemcode").combogrid("setValue",val.energyitemdict.energyItemcode);
								$("#resultId").val(val.resultId);
							}
						});
					}catch(e) {
						$("#energyItemcode").combogrid("setValue","");
						$("#resultId").val("");
					}
				},'json');
				
				
				$("#meterproinfo\\.meterProductid").combogrid("setValue",data.meterproinfo.meterProductid);
				$("#buildregioninfo\\.regionId").combogrid("setValue",data.buildregioninfo==null?"":data.buildregioninfo.regionId);
				
				var resUrl='<portlet:resourceURL id="getMeteruseattributes"></portlet:resourceURL>';
				$.post(resUrl,{meterId:data.meterId},
						function(data){
					try{
						$("#<portlet:namespace/>Attributes").datagrid('loadData',data);
					}catch(e) {
						$("#<portlet:namespace/>Attributes").datagrid('loadData',{total:0,rows:[]});
					}
				},'json');
				
				//获取仪表ID
				var proId = data.meterproinfo.meterProductid;
				if(proId.length) {
					console.log(proId);
					//获取参数
					 var resUrl='<portlet:resourceURL id="getMeterparaminfos"></portlet:resourceURL>';
					$.post(resUrl,{meterProductid:proId},
							function(data){
						try{
							if(null==data)
								return;
							
							$("#meterattrType").combobox({data:data.meterparaminfos,valueField:'meterParamvalue',textField:'meterParamname'});
							
							/* 
							$.each(data.meterparaminfos,function(index,obj){
								console.log(obj);

							});
							 */
							
						}catch(e) {

						}
					},'json'); 
					
				}
				
			}
		});
	
	</script>
	</c:otherwise>
</c:choose>