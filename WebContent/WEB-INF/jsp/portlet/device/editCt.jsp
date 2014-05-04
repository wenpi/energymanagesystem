
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
<form:form commandName="ct" method="post" cssClass="editform"
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
						${ct.id}
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
					<form:label path="frW">水量：</form:label>
					<form:input path="frW" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="frOa">风量：</form:label>
					<form:input path="frOa" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="totalF">风机数量：</form:label>
					<form:input path="totalF" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="power">风机功率：</form:label>
					<form:input path="power" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="pr">风机杨程：</form:label>
					<form:input path="pr" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="st">额定供水温度：</form:label>
					<form:input path="st" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="rt">额定回水温度：</form:label>
					<form:input path="rt" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="oat">额定室外温度：</form:label>
					<form:input path="oat" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="oarh">额定室外湿度：</form:label>
					<form:input path="oarh" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="eff">效率：</form:label>
					<form:input path="eff" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="totalHt">水加热器数量：</form:label>
					<form:input path="totalHt" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="powerHt">水加热器功率：</form:label>
					<form:input path="powerHt" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"  />(必须为数值)
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
		var resurl = '<portlet:resourceURL id="submitCtForm"></portlet:resourceURL>';
		$("#ct").form('submit', {
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
						redirect += "&<portlet:namespace/>action=editCtForm&<portlet:namespace/>id="+result.msg; 
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
					var removeUrl = "<portlet:resourceURL id='removeCt'></portlet:resourceURL>";
					$.post(removeUrl,{id:'${ct.id}'},function(result){
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