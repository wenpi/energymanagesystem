
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
 <div id="msg"></div>
<form:form commandName="chi" method="post" cssClass="editform"
	action="#">
	<div class="ftitle">基本信息</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="id">ID：</form:label>
					<c:choose>
						<c:when test='${isnew==true}'>
								系统生成
						</c:when>
						<c:otherwise>
						${chi.id}
						</c:otherwise>
					</c:choose>
					<form:hidden path="id" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildId">项目：</form:label>
					<form:input path="buildId" 
						 required="true" />
					*
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="regionId">区域：</form:label>
					<form:input path="regionId" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="position">位置：</form:label>
					<form:input path="position"/>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="deviceNo">编号：</form:label>
					<form:input path="deviceNo" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="maker">厂家：</form:label>
					<form:input path="maker"/>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="model">型号：</form:label>
					<form:input path="model" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="total">数量：</form:label>
					<form:input path="total" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(数值)
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="comment">备注：</form:label>
					<form:textarea path="comment" style="width:128px; height:30px"/>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="description">说明：</form:label>
					<form:textarea path="description" style="width:128px; height:30px"/>
				</div>
			</div>
		</div>
	</div>
	<div class="ftitle">功能信息</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="cap">额定制冷量：</form:label>
					<form:input path="cap" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="power">额定功率：</form:label>
					<form:input path="power" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="cop">额定COP：</form:label>
					<form:input path="cop" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="frChw">额定冷冻水流量：</form:label>
					<form:input path="frChw" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="TChwS">额定冷冻水供水温度：</form:label>
					<form:input path="TChwS" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="TChwR">额定冷冻水回温度：</form:label>
					<form:input path="TChwR" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="frClw">额定冷却水流量：</form:label>
					<form:input path="frClw" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="TClwS">额定冷却水供水温度：</form:label>
					<form:input path="TClwS" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="TClwR">额定冷却水回水温度：</form:label>
					<form:input path="TClwR" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
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
	/**
	* 保存
	*/
	function <portlet:namespace/>saveForm() {
		var resurl = '<portlet:resourceURL id="submitChiForm"></portlet:resourceURL>';
		$("#chi").form('submit', {
			url: resurl,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					var isnew = $("#isnew").val();
					if(isnew=='true') {
						var redirect = $("#<portlet:namespace/>redirect").val();
						redirect += "&<portlet:namespace/>action=editChiForm&<portlet:namespace/>id="+result.msg; 
						window.location.href = redirect;		
					}
					$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
				} else {
					$.messager.alert('错误',result.msg,'error');
				}
			}
		});
	}

	/**
	* 删除
	*/
	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','确定要删除吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeChi'></portlet:resourceURL>";
					$.post(removeUrl,{id:'${chi.id}'},function(result){
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
	$("#buildId").combogrid({
		panelWidth:500,
		value:$("#buildId").val(),
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
				$('#buildId').combogrid("grid").datagrid("reload", { 'keyword': q });
                $('#buildId').combogrid("setValue", q);
			}
		},
		onSelect:function(index,row){
	        loadregioninfos(row.buildId);
	    }
	});
	
	function loadregioninfos(buildId) {
		var resUrl = '<portlet:resourceURL id="getregionIds"><portlet:param name="buildId" value="tempId" /></portlet:resourceURL>';
		resUrl = resUrl.replace('tempId',buildId);
		$("#regionId").combotree({
			url:resUrl,
			width:134
		});
	}
</script>