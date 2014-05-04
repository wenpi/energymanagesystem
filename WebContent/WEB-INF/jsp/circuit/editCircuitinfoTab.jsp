
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init-ext.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-24上午09:32:47
	LastModified Date:
	Description:
 -->
<div class="ftitle">
	<span>支路拓扑描述设置</span>
</div>
 <div id="msg"></div>
<form:form commandName="circuitinfo" method="post" cssClass="editform"
	action="#">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="circuitId">支路ID</form:label>
					<c:choose>
						<c:when test="${empty circuitinfo.circuitId}">
							<form:input path="circuitId" readOnly="true" value="系统生成" />
						</c:when>
						<c:otherwise>
							<c:out value="${circuitinfo.circuitId}"></c:out>
							<form:hidden path="circuitId" />
						</c:otherwise>
					</c:choose>

				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="buildinfo.buildId">所属建筑</form:label>
					<form:input path="buildinfo.buildId" maxlength="16" required="true" />
					*
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="circuitCode">支路编码</form:label>
					<form:input path="circuitCode" maxlength="32" required="true" />
					*
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="circuitName">支路名称</form:label>
					<form:input path="circuitName" cssClass="easyui-validatebox"
						maxlength="32" required="true" />
					*
				</div>
			</div>

		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="circuitinfo.circuitId">上级支路</form:label>
					<form:input path="circuitinfo.circuitId"
						cssClass="easyui-combotree" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="circuitState">启用状态</form:label>
					<form:radiobutton path="circuitState" value="0" />
					停用
					<form:radiobutton path="circuitState" value="1" />
					启用
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="circuitImage">支路拓扑图</form:label>
					<form:hidden path="circuitImage" />
				</div>
			</div>

		</div>
	</div>
	<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
</form:form>
<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-remove"
		onclick="<portlet:namespace/>remove()">删除</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>
<script language="javascript">
//保存数据
function <portlet:namespace/>saveForm() {
		var url='<portlet:resourceURL id="submitCircuitinfoForm"></portlet:resourceURL>';
		$("#circuitinfo").form('submit', {
			url: url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					var isnew = $("#isnew").val();
					if(isnew=='true') {
						var redirect = $("#<portlet:namespace/>redirect").val();
						redirect += "&<portlet:namespace/>action=editCircuitinfoForm&<portlet:namespace/>circuitId="+result.msg; 
						window.location.href = redirect;		
					}
					$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
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
					var removeUrl = "<portlet:resourceURL id='removeCircuitinfo'></portlet:resourceURL>";
					$.post(removeUrl,{circuitId:'${circuitinfo.circuitId}'},function(result){
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
	* 获取建筑信息列表
	*/
	$("#buildinfo\\.buildId").combogrid({
		panelWidth:500,
		value:$("#buildinfo\\.buildId").val(),
		idField:'buildId',
		textField:'buildName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getBuildinfos"></portlet:resourceURL>',
		columns:[[
			{field:'buildId',title:'建筑编号',width:100},
			{field:'buildName',title:'建筑名称',width:100}
		]],keyHandler: {
			up: function(){},
			down: function(){},
			enter: function(){},
			query: function(q){
				$('#buildinfo\\.buildId').combogrid("grid").datagrid("reload", { 'keyword': q });
                $('#buildinfo\\.buildId').combogrid("setValue", q);
			}
		},
		onSelect:function(index,row){
	        loadCircuitinfos(row.buildId);
	    }
	});

	
	function loadCircuitinfos(buildId) {
		var resUrl = '<portlet:resourceURL id="getCircuitinfos"><portlet:param name="buildId" value="tempId" /></portlet:resourceURL>';
		resUrl = resUrl.replace('tempId',buildId);
		$("#circuitinfo\\.circuitId").combotree({
			url:resUrl,
			width:134
		});
	}
</script>