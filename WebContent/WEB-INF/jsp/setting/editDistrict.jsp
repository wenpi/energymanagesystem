
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
<div class="ftitle">
	<span>行政区划设置</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
	</span>
</div>
 <div id="msg"></div>
<form:form commandName="districtinfo" method="post" cssClass="editform">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="districtId">行政区编号</form:label>
					<form:input path="districtId" 
						maxlength="10" required="true" cssClass="easyui-numberbox" precision="0" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="districtinfo.districtId">上级行政区</form:label>
					<form:input path="districtinfo.districtId" maxlength="10"/>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="districtName">行政区名称</form:label>
					<form:input path="districtName" cssClass="easyui-validatebox"
						maxlength="25" required="true" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="districtPinyin">名称拼音</form:label>
					<form:input path="districtPinyin" maxlength="50"/>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="districtPostcode">邮政编码</form:label>
					<form:input path="districtPostcode" maxlength="6" cssClass="easyui-numberbox" precision="0" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="districtAreacode">电话区号</form:label>
					<form:input path="districtAreacode" maxlength="6" cssClass="easyui-numberbox" precision="0"  />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="woeid">天气地区编码</form:label>
					<form:input path="woeid" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">

				</div>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="districtRemark">备注</form:label>
					<form:textarea path="districtRemark" maxlength="100" style="width:80%;height:40px;" />
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
		var url = '<portlet:resourceURL id="submitDistrictForm"></portlet:resourceURL>';
		$("#districtinfo").form('submit', {
			url: url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					if(isnew=='true') {
						var redirect = $("#<portlet:namespace/>redirect").val();
						redirect += "&<portlet:namespace/>action=editDistrictForm&<portlet:namespace/>districtId="+result.msg; 
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
		$('#districtinfo').form('clear');
	}

	
	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeDistrict'></portlet:resourceURL>";
					$.post(removeUrl,{districtId:'${districtinfo.districtId}'},function(result){
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
	$("#districtinfo\\.districtId").combogrid({
		panelWidth:500,
		value:$("#districtinfo\\.districtId").val(),
		idField:'districtId',
		textField:'districtName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getDistricts"></portlet:resourceURL>',
		columns:[[
			{field:'districtId',title:'行政区编号',width:100},
			{field:'districtName',title:'行政区名称',width:100},
			{field:'districtinfo',title:'上级行政区',width:100,formatter:function(value,row){
				if(value!=null)
					return value.districtId;
			}},
			{field:'districtPostcode',title:'邮编',width:60},
			{field:'districtAreacode',title:'区号',width:60}
		]],keyHandler: {
			up: function(){},
			down: function(){},
			enter: function(){},
			query: function(q){
				$('#districtinfo\\.districtId').combogrid("grid").datagrid("reload", { 'keyword': q });
                $('#districtinfo\\.districtId').combogrid("setValue", q);
			}
		}
	});
</script>