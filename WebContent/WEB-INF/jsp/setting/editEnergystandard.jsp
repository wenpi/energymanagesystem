
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">

<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
<c:if test="${energyStandard.standardType eq 'EnergyItemStandardDetail'}">
<div class="ftitle">
	<span>能耗标准</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
	</span>
 </div>
 <div id="msg"></div>
<form:form commandName="energyStandard" method="post" cssClass="editform">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="standardName">标准名称：</form:label>
					<form:input path="standardName"/>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="standardType">标准类型：</form:label>
					<form:select path="standardType" cssClass="easyui-validatebox" style="width:130px; height:25px" >
		             <form:option value="EnergyItemStandardDetail">分类分项</form:option>
		      <!--       <form:option value="EnergyRegionalStandardDetail">建筑气候区 </form:option> --> 
		            </form:select>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col"> 
				<div class="fitem">
					<form:label path="isdefault">是否默认标准：</form:label>
					 <form:select path="isdefault" cssClass="easyui-validatebox" style="width:130px; height:25px">
		             <form:option value="0">否</form:option>
		             <form:option value="1">是</form:option>
		            </form:select>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="description">标准说明：</form:label>
					<form:textarea path="description" maxlength="200" style="width:130px; height:50px"/>
				</div>
			</div>
		</div>
	</div>
	<form:hidden path="standardId" />
	<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
<div class="ftitle">分类分项能耗标准明细</div>
<div>
<table id="<portlet:namespace/>detaildg" title="明细信息" class="easyui-datagrid" style="height:250px"
			toolbar="#<portlet:namespace/>detailToolbar" url="<portlet:resourceURL id="findEnergyItemStandardDetails"><portlet:param name="standardId" value="${energyStandard.standardId}" /></portlet:resourceURL>"
			rownumbers="true" fitColumns="true" singleSelect="true" idField="detailId">
		<thead>
			<tr>
				<th field="buildFunction" width="80">建筑类别</th>
				<th field="energyItemcode" width="80">分类分项代码</th>
				<th field="unit" width="80">计量单位</th>
				<th field="standardValue" width="80">标准值</th>
				<th field="description" width="80">备注</th>
			</tr>
		</thead>
</table>
<div id="<portlet:namespace/>detailToolbar">
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add(0)">添加明细</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit(0)">编辑明细</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="<portlet:namespace/>removeDetail(0)">删除明细</a>
</div>
</div>
</form:form>
<div id="<portlet:namespace/>detaildlg" class="easyui-dialog" style="width:400px;height:350px;padding:10px 20px" closed="true" buttons="#<portlet:namespace/>dlg-buttons">
	<div class="ftitle">明细信息</div>
	<form:form commandName="energyItemStandardDetail" method="post" cssClass="editform">
		<div class="fitem">
			<form:label path="buildFunction">建筑类型：</form:label>
			<form:input path="buildFunction" cssClass="easyui-validatebox" required="true" />
		</div>
		<div class="fitem">
			<form:label path="energyItemcode">分类分项代码：</form:label>
			<form:input path="energyItemcode"/>
		</div>
		<div class="fitem">
			<form:label path="unit">计量单位：</form:label>
			<form:input path="unit"/>
		</div>
		<div class="fitem">
			<form:label path="standardValue">标准值：</form:label>
			<form:input path="standardValue" />
		</div>
		<div class="fitem">
			<form:label path="description">备注：</form:label>
			<form:textarea path="description" maxlength="200" style="width:130px; height:30px"/>
		</div>
		<form:hidden path="detailId" />
		<form:hidden path="energyStandard.standardId" />
	</form:form>
</div>
<div id="<portlet:namespace/>dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="<portlet:namespace/>saveEnergyItemStandardDetail()">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#<portlet:namespace/>detaildlg').dialog('close')">取消</a>
</div>


</c:if>
<c:if test="${energyStandard.standardType eq 'EnergyRegionalStandardDetail'}">
 <div class="ftitle">
	<span>能耗标准</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
	</span>
 </div>
 <div id="msg"></div>
<form:form commandName="energyStandard" method="post" cssClass="editform">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="standardName">标准名称：</form:label>
					<form:input path="standardName"/>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="standardType">标准类型：</form:label>
					<form:select path="standardType" cssClass="easyui-validatebox" style="width:130px; height:25px" >
		     <!--   <form:option value="EnergyItemStandardDetail">分类分项</form:option> -->
		             <form:option value="EnergyRegionalStandardDetail">建筑气候区 </form:option>
		            </form:select>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col"> 
				<div class="fitem">
					<form:label path="isdefault">是否默认标准：</form:label>
					 <form:select path="isdefault" cssClass="easyui-validatebox" style="width:130px; height:25px">
		             <form:option value="0">否</form:option>
		             <form:option value="1">是</form:option>
		            </form:select>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="description">标准说明：</form:label>
					<form:textarea path="description" maxlength="200" style="width:130px; height:50px"/>
				</div>
			</div>
		</div>
	</div>
	<form:hidden path="standardId" />
	<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
<div class="ftitle">建筑气候区能耗标准明细</div>
<div>
<table id="<portlet:namespace/>detaildg" title="明细信息" class="easyui-datagrid" style="height:250px"
			toolbar="#<portlet:namespace/>detailToolbar" url="<portlet:resourceURL id="findEnergyRegionalStandardDetails"><portlet:param name="standardId" value="${energyStandard.standardId}" /></portlet:resourceURL>"
			rownumbers="true" fitColumns="true" singleSelect="true" idField="detailId">
		<thead>
			<tr>
				<th field="buildFunction" width="80">建筑类别</th>
				<th field="avgValue" width="80">均值</th>
				<th field="highValue" width="80">高值</th>
				<th field="midValue" width="80">中值</th>
				<th field="lowValue" width="80">低值</th>
				<th field="description" width="100">备注</th>
			</tr>
		</thead>
</table>
<div id="<portlet:namespace/>detailToolbar">
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add(1)">添加明细</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit(1)">编辑明细</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="<portlet:namespace/>removeDetail(1)">删除明细</a>
</div>
</div>
</form:form>

<div id="<portlet:namespace/>detaildlg" class="easyui-dialog" style="width:420px;height:400px;padding:10px 20px" closed="true" buttons="#<portlet:namespace/>dlg-buttons">
	<div class="ftitle">明细信息</div>
	<form:form commandName="energyRegionalStandardDetail" method="post" cssClass="editform">
		<div class="fitem">
			<form:label path="bigdistrictId">气候区：</form:label>
			<form:input path="bigdistrictId"/>
		</div>
		<div class="fitem">
			<form:label path="buildFunction">建筑类别：</form:label>
			<form:input path="buildFunction"/>
		</div>
		<div class="fitem">
			<form:label path="avgValue">均值：</form:label>
			<form:input path="avgValue"  onkeyup="value=value.replace(/[^\d]/g,'') "    
onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
		</div>
		<div class="fitem">
			<form:label path="highValue">高值：</form:label>
			<form:input path="highValue" onkeyup="value=value.replace(/[^\d]/g,'') "    
onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
		</div>
		<div class="fitem">
			<form:label path="midValue">中值：</form:label>
			<form:input path="midValue" onkeyup="value=value.replace(/[^\d]/g,'') "    
onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
		</div>
		<div class="fitem">
			<form:label path="lowValue">低值：</form:label>
			<form:input path="lowValue" onkeyup="value=value.replace(/[^\d]/g,'') "    
onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
		</div>
		<div class="fitem">
			<form:label path="description">备注：</form:label>
			<form:textarea path="description" maxlength="200" style="width:130px; height:30px"/>
		</div>
		<form:hidden path="detailId" />
		<form:hidden path="energyStandard.standardId" />
	</form:form>
</div>
<div id="<portlet:namespace/>dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="<portlet:namespace/>saveRegionalStandardDetail()">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#<portlet:namespace/>detaildlg').dialog('close')">取消</a>
</div>
</c:if>

<c:if test="${energyStandard.standardType == null}">
<div class="ftitle">
	<span>能耗标准</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
	</span>
 </div>
 <div id="msg"></div>
<form:form commandName="energyStandard" method="post" cssClass="editform">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="standardName">标准名称：</form:label>
					<form:input path="standardName"/>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="standardType">标准类型：</form:label>
					<form:select path="standardType" cssClass="easyui-validatebox" style="width:130px; height:25px" >
		             <form:option value="EnergyItemStandardDetail">分类分项</form:option>
		             <form:option value="EnergyRegionalStandardDetail">建筑气候区 </form:option>
		            </form:select>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col"> 
				<div class="fitem">
					<form:label path="isdefault">是否默认标准：</form:label>
					 <form:select path="isdefault" cssClass="easyui-validatebox" style="width:130px; height:25px">
		             <form:option value="0">否</form:option>
		             <form:option value="1">是</form:option>
		            </form:select>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="description">标准说明：</form:label>
					<form:textarea path="description" maxlength="200" style="width:130px; height:50px"/>
				</div>
			</div>
		</div>
	</div>
	<form:hidden path="standardId" />
	<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
</form:form>  
</c:if>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-remove"
		onclick="<portlet:namespace/>remove()">删除</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>
<script>
function <portlet:namespace/>add(para) {
	var Id = $("#standardId").val();
	if(Id=="") {
		$.messager.alert('提示信息','必须先保存建筑能耗标准!','info');
	} else {
		$('#<portlet:namespace/>detaildlg').dialog('open').dialog('setTitle','新增明细');
		if(para=='0')
		$('#energyItemStandardDetail').form('clear');
		if(para=='1')
		$('#energyRegionalStandardDetail').form('clear');
	}
}

//编辑明细记录
function <portlet:namespace/>edit(para) {
	var row = $('#<portlet:namespace/>detaildg').datagrid('getSelected');
	if (row){
		$('#<portlet:namespace/>detaildlg').dialog('open').dialog('setTitle','编辑明细');
		    if(para=='0')
		    $('#energyItemStandardDetail').form('load',row);
			if(para=='1')
			$('#energyRegionalStandardDetail').form('load',row);
	}
}

//删除明细记录
function <portlet:namespace/>removeDetail(para) {
	var row = $('#<portlet:namespace/>detaildg').datagrid('getSelected');
	if(para=='0'){
	if (row){
		$.messager.confirm('删除确认','确定删除选择的数据吗?',function(r){
			if (r){
				$.post('<portlet:resourceURL id="removeEnergyItemStandardDetail"></portlet:resourceURL>',{detailId:row.detailId},function(result){
					if (result.success){
						$('#<portlet:namespace/>detaildg').datagrid('reload');	// reload the user data
					} else {
						$.messager.alert('错误',result.msg,'error');
					}
				},'json');
			}
		});
	  }
	 }
	if(para=='1'){
		if (row){
			$.messager.confirm('删除确认','确定删除选择的数据吗?',function(r){
				if (r){
					$.post('<portlet:resourceURL id="removeEnergyRegionalStandardDetail"></portlet:resourceURL>',{detailId:row.detailId},function(result){
						if (result.success){
							$('#<portlet:namespace/>detaildg').datagrid('reload');	// reload the user data
						} else {
							$.messager.alert('错误',result.msg,'error');
						}
					},'json');
				}
			});
		  }
	}
}

//提交保存明细
function <portlet:namespace/>saveRegionalStandardDetail() {
	var url = '<portlet:resourceURL id="submitEnergyRegionalStandardDetailForm"><portlet:param name="standardId" value="tempId" /></portlet:resourceURL>';
	var standardId = $("#standardId").val();
	url = url.replace("tempId",standardId);
	$('#energyRegionalStandardDetail').form('submit',{
		url: url,
		onSubmit: function(){
			return $(this).form('validate');
		},
		success: function(result){
			var result = eval('('+result+')');
			if (result.success){
				$('#<portlet:namespace/>detaildlg').dialog('close');		// close the dialog
				$('#<portlet:namespace/>detaildg').datagrid('reload');	// reload the user data
			} else {
				$.messager.alert('错误',result.msg,'error');
			}
		}
	});
}
//提交保存明细
function <portlet:namespace/>saveEnergyItemStandardDetail() {
	var url = '<portlet:resourceURL id="submitEnergyItemStandardDetailForm"><portlet:param name="standardId" value="tempId" /></portlet:resourceURL>';
	var standardId = $("#standardId").val();
	url = url.replace("tempId",standardId);
	$('#energyItemStandardDetail').form('submit',{
		url: url,
		onSubmit: function(){
			return $(this).form('validate');
		},
		success: function(result){
			var result = eval('('+result+')');
			if (result.success){
				$('#<portlet:namespace/>detaildlg').dialog('close');		// close the dialog
				$('#<portlet:namespace/>detaildg').datagrid('reload');	// reload the user data
			} else {
				$.messager.alert('错误',result.msg,'error');
			}
		}
	});
}
//添加明细记录
function <portlet:namespace/>saveForm() {
	var url = '<portlet:resourceURL id="submitEnergystandardForm"></portlet:resourceURL>';
	$("#energyStandard").form('submit', {
		url: url,
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			var result = eval('('+result+')');
			if (result.success){
				if(isnew=='true') {
					var redirect = $("#<portlet:namespace/>redirect").val();
					redirect += "&<portlet:namespace/>action=editEnergystandardForm&<portlet:namespace/>standardId="+result.msg; 
					window.location.href = redirect;
				}
				$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
			} else {
				$.messager.alert('错误',result.msg,'error');
			}
		}
	});
}
  
  
	function <portlet:namespace/>resetForm() {
		$('#energyStandard').form('clear');
	}
	
	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeEnergyStandard'></portlet:resourceURL>";
					$.post(removeUrl,{standardId:'${standardId}'},function(result){
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

	/**
	* 获取行政区划列表
	*/
	$("#bigdistrictId").combogrid({
		panelWidth:300,
		value:$("#bigdistrictId").val(),
		idField:'bigdistrictId',
		textField:'bigdistrictName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getBigdistricts"></portlet:resourceURL>',
		columns:[[
			{field:'bigdistrictName',title:'气候区名称',width:100},
			{field:'bigdistrictinfo',title:'上级气候区',width:100,formatter:function(value,row){
				if(value!=null)
					return value.bigdistrictId;
			}}
		]],keyHandler: {
			up: function(){},
			down: function(){},
			enter: function(){},
			query: function(q){
				$('#bigdistrictId').combogrid("grid").datagrid("reload", { 'keyword': q });
                $('#bigdistrictId').combogrid("setValue", q);
			}
		}
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

	$(function(){
	});
	
</script>