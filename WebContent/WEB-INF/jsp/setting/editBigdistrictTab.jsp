<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init-ext.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-3 下午01:21:00
	LastModified Date:
	Description:
 -->
<form:form commandName="bigdistrictinfo" method="post"
	cssClass="editform">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:hidden path="bigdistrictId" />
					<form:label path="bigdistrictName">气候区名称</form:label>
					<form:input path="bigdistrictName" cssClass="easyui-validatebox" maxLength="50" required="true" /> *
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="bigdistrictinfo.bigdistrictId">上级气候区</form:label>
					<form:input path="bigdistrictinfo.bigdistrictId" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="primaryIndicator">主要指标</form:label>
					<form:input path="primaryIndicator" size="100" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="secondaryIndicator">辅助指标</form:label>
					<form:input path="secondaryIndicator" size="100" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="orderNo">顺序号</form:label>
					<form:input path="orderNo" class="easyui-numberspinner"
						min="0" max="1000" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="bigdistrictRemark">气候区备注</form:label>
					<form:textarea path="bigdistrictRemark" rows="4" cols="100" />
					<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
				</div>
			</div>
		</div>
	</div>
</form:form>


<script language="javascript">
function <portlet:namespace/>saveForm() {
		var url = '<portlet:resourceURL id="submitBigdistrictForm"></portlet:resourceURL>';
		$("#bigdistrictinfo").form('submit', {
			url: url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					var redirect = $("#<portlet:namespace/>redirect").val();
					redirect += "&<portlet:namespace/>action=editBigdistrictForm&<portlet:namespace/>bigdistrictId="+result.msg; 
					window.location.href = redirect;						
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
					var removeUrl = "<portlet:resourceURL id='removeBigdistrict'></portlet:resourceURL>";
					$.post(removeUrl,{bigdistrictId:'${bigdistrictinfo.bigdistrictId}'},function(result){
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
	$("#bigdistrictinfo\\.bigdistrictId").combogrid({
		panelWidth:500,
		value:$("#bigdistrictinfo\\.bigdistrictId").val(),
		idField:'bigdistrictId',
		textField:'bigdistrictName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getBigdistricts"></portlet:resourceURL>',
		columns:[[
			{field:'bigdistrictId',title:'气候区编号',width:80},
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
				$('#bigdistrictinfo\\.bigdistrictId').combogrid("grid").datagrid("reload", { 'keyword': q });
                $('#bigdistrictinfo\\.bigdistrictId').combogrid("setValue", q);
			}
		}
	});
</script>
