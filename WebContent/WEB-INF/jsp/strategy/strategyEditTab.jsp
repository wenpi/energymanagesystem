<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init-ext.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-30 下午04:31:11
	LastModified Date:
	Description:
 -->

<div class="ftitle">基本设置</div>
<form:form commandName="strategy" method="post" cssClass="editform"
	action="#">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="strategyid">策略ID</form:label>
					<c:if test="${!empty strategy.strategyid}">
					${strategy.strategyid}
				</c:if>
					<form:hidden path="strategyid" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="buildinfo.buildId">所属建筑</form:label>
					<form:input path="buildinfo.buildId" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="strategyname">策略名称</form:label>
					<form:input path="strategyname" cssClass="easyui-validatebox"
						maxlength="30" required="true" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="strategy.strategyid">父级策略</form:label>
					<form:input path="strategy.strategyid" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="author">制订者</form:label>
					<form:input path="author" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="createdondate">制订时间</form:label>
					<form:input path="createdondate" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="planstartdate">计划开始时间</form:label>
					<form:input path="planstartdate" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="planstopdate">计划停止时间</form:label>
					<form:input path="planstopdate" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="strategydesc">策略简介</form:label>
					<form:textarea path="strategydesc" rows="5" cols="100" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="comment">策略注释</form:label>
					<form:textarea path="comment" rows="3" cols="100" />
				</div>
			</div>
		</div>
		<form:hidden path="status"/>
		<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
	</div>
</form:form>
<div id="buttons" style="margin: 10px 0;">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-remove"
		onclick="<portlet:namespace/>remove()">删除</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>

<script type="text/javascript">
	$(function(){
		$("#createdondate").datepicker();
		$( "#planstartdate" ).datepicker({
			changeMonth: true,
			changeYear: true
		});
		$("#planstopdate").datepicker();
	});


	/**
	* 保存表单数据
	*/
	function <portlet:namespace/>saveForm() {
		var url='<portlet:resourceURL id="submitStrategyForm"></portlet:resourceURL>';
		$("#strategy").form('submit', {
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
						redirect += "&<portlet:namespace/>action=editStrategy&<portlet:namespace/>strategyid="+result.msg; 
						window.location.href = redirect;		
					};
				} else {
					$.messager.alert('错误',result.msg,'error');
				};
			}
		});
	}
	
	/**
	* 删除对象
	*/
	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeStrategy'></portlet:resourceURL>";
					$.post(removeUrl,{strategyid:'${strategy.strategyid}'},function(result){
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
			loadParentStrategies(row.buildId);
	    }
	});
	
	function loadParentStrategies(buildId) {
		var resUrl = '<portlet:resourceURL id="getParentStrategies"><portlet:param name="buildId" value="tempId" /></portlet:resourceURL>';
		resUrl = resUrl.replace('tempId',buildId);
		$("#strategy\\.strategyid").combotree({
			url:resUrl,
			width:134
		});
	}
	
</script>

