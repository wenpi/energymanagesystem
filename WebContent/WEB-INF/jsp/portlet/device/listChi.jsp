<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../init-ext.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午11:26:23
	LastModified Date:
	Description: 数据中心列表
 -->
 <portlet:resourceURL id="getChis" var="getChiUrl">
</portlet:resourceURL>
<table id="<portlet:namespace/>dg" title="制冷机" class="easyui-datagrid" width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getChiUrl)%>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="id" toolbar="#<portlet:namespace/>tb">
		<thead>
			<tr>
			    <th hidden="true" field="id" width="50">ID</th>
			    <th field="deviceNo" width="50">编号</th>
			    <!--  
			    <th field="buildId" width="50" >项目</th>
			    <th field="regionId" width="50">区域</th>-->
			    <th field="position" width="50">位置</th>
				<th field="maker" width="50" >厂家</th>
				<th field="model" width="50" >型号</th>
				<th field="cap" width="50">额定制冷量</th>
				<th field="power" width="50">额定功率</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>tb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit()">修改</a>  
			
			<span style="margin-left:20px;">
			编号: <input id="deviceNo" name="deviceNo" />
			项目: <select id="buildId" name="buildId"></select>
			区域: <input id="regionId" name="regionId"/>
			<a href="javascript:<portlet:namespace/>search();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">Search</a></span>
			<a href="javascript:<portlet:namespace/>expChiModel();" class="easyui-linkbutton" iconCls="icon-excel"  plain="true">模板</a>
			<a href="javascript:<portlet:namespace/>expChiExcel();" class="easyui-linkbutton" iconCls="icon-excel"   plain="true">导出</a>
	        <a href="javascript:<portlet:namespace/>importChiExcel();" class="easyui-linkbutton" iconCls="icon-excel"  plain="true">导入</a>
	        <iframe name="chitmpFrame" id="chitmpFrame" width="1" height="1" style="visibility:hidden;position:absolute;display:none"></iframe>
	</div>
	
	<div id="<portlet:namespace/>addfilechi" class="easyui-dialog"
			style="width: 400px; height: 150px; padding: 10px 20px" closed="true"
			buttons="#<portlet:namespace/>chi-buttons">
				<form:form commandName="buildaddfile" method="post" cssClass="editform" action="#"  enctype="multipart/form-data">
					<div class="fitem">
						<form:label path="addfilePath">文件路径:</form:label>
							<form:input path="fileData" type="file"/>
					</div>
					<form:hidden path="addfileName" />
			</form:form>
	</div>
	<div id="<portlet:namespace/>chi-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="<portlet:namespace/>saveaddfile()" >保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#<portlet:namespace/>addfilechi').dialog('close')">取消</a>
    </div>
	
	<script language="javascript">

	function <portlet:namespace/>add() {
		var addUrl = '<portlet:renderURL portletMode="edit"><portlet:param name="action" value="addChiForm" /></portlet:renderURL>';
		addUrl=addUrl.replace("pop_up","normal");
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>edit() {
		var node = $('#<portlet:namespace/>dg').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editChiForm' /><portlet:param name='id' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.id);
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>search() {
		var no = $("#deviceNo").val();
		var buildId = $('#buildId').combogrid("getValue");
		var regionId = $('#regionId').combotree("getValue");
		var url = "<portlet:resourceURL id='getChisBySearch'><portlet:param name='deviceNo' value='tempdeviceNo' /><portlet:param name='buildId' value='tempbuildId' /><portlet:param name='regionId' value='tempregionId' /></portlet:resourceURL>";
		url = url.replace("tempdeviceNo",no).replace("tempbuildId",buildId).replace("tempregionId",regionId);
		$('#<portlet:namespace/>dg').datagrid('options').url= url;
		$('#<portlet:namespace/>dg').datagrid("reload");
	}
	$(function(){
		if($("#tab-container").length>0) {
			$('#tab-container').tabs({width: $("#tab-container").parent().width(),height: "auto"}); 
		}

		$("#buildId").combogrid({
			panelWidth : 500,
			value : $("#buildId").val(),
			idField : 'buildId',
			textField : 'buildName',
			pagination : true,//是否分页  
			rownumbers : true,
			fit : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50 ],
			url : '<portlet:resourceURL id="getBuildinfos"></portlet:resourceURL>',
			columns : [ [ {
				field : 'buildId',
				title : '建筑编号',
				width : 100
			}, {
				field : 'buildName',
				title : '建筑名称',
				width : 100
			} ] ],
			keyHandler : {
				up : function() {
				},
				down : function() {
				},
				enter : function() {
				},
				query : function(q) {
					$('#buildId').combogrid("grid").datagrid("reload", {
						'keyword' : q
					});
					$('#buildId').combogrid("setValue", q);
				}
			},
			onSelect:function(index,row){
		        loadregioninfos(row.buildId);
		    }
		});
	});
	
	function loadregioninfos(buildId) {
		var resUrl = '<portlet:resourceURL id="getregionIds"><portlet:param name="buildId" value="tempId" /></portlet:resourceURL>';
		resUrl = resUrl.replace('tempId',buildId);
		$("#regionId").combotree({
			url:resUrl,
			width:134
		});
	}
	
	function <portlet:namespace/>expChiExcel() {
		            var regionId = "";
		            var deviceNo = $("#deviceNo").val();
		            var buildId = $('#buildId').combogrid("getValue");
		            if(buildId==""){
		            	regionId = ""; 
		            }
		            else{
		            regionId = $('#regionId').combotree("getValue");
		            }
					var expUrl = '<portlet:resourceURL id="expChiExcel"><portlet:param name="regionId" value="tempregionId" /><portlet:param name="deviceNo" value="tempdeviceNo" /><portlet:param name="buildId" value="tempbuildId" /></portlet:resourceURL>';
					var removeUrl = '<portlet:resourceURL id="deleteFile"><portlet:param name="fileName" value="tempfileName" /></portlet:resourceURL>';
					expUrl = expUrl.replace('tempregionId',regionId).replace('tempdeviceNo',deviceNo).replace('tempbuildId',buildId);
					removeUrl = removeUrl.replace('tempfileName',"CHI");
		            var hostport= document.location.host;
		            var hSrc = "http://"+hostport+"/energymanagesystem/uploadfiles/制冷机.xls";
					$.ajax({
						type: "POST",
						url: expUrl,
						contentType: 'application/x-msdownload;charset=UTF-8',
						success: function (result) {
						$("#chitmpFrame").attr('src', hSrc);
						 $.post(removeUrl,function(result){
						if (result.success){
						} else {
							$.messager.alert('Error',result.msg,'error');
						}
					  });
						}, 
						error: function (result) { 
							alert('error'); 
						} 
			});
	    }

	function <portlet:namespace/>expChiModel() {
		var chiUrl = "<portlet:resourceURL id='expChiModel'></portlet:resourceURL>";
		var removeUrl = '<portlet:resourceURL id="deleteModelFile"><portlet:param name="fileName" value="tempfileName" /></portlet:resourceURL>';
		removeUrl = removeUrl.replace('tempfileName',"CHIModel");
		var hostport= document.location.host;
	    var hSrc = "http://"+hostport+"/energymanagesystem/uploadfiles/制冷机模板.xls";
	     $.ajax({
				type: "POST",
				url: chiUrl,
				contentType: 'application/x-msdownload;charset=UTF-8',
				success: function (result) {
				$("#chitmpFrame").attr('src', hSrc);
				 $.post(removeUrl,function(result){
				if (result.success){
				} else {
					$.messager.alert('Error',result.msg,'error');
				}
			  });
				}, 
				error: function (result) { 
					alert('error'); 
				} 
	       });
	 }

	function <portlet:namespace/>importChiExcel() {
		$('#<portlet:namespace/>addfilechi').dialog('open').dialog('setTitle','制冷机');
		$("#fileData").val("");
		$("#addfileName").val("chi");
	}

	function <portlet:namespace/>saveaddfile() {
		var valid = true;
		if($("#fileData").val()=="") {
				valid = false;
				alert("请选择你要上传的文件");
		}
		if(valid) {
			var resurl = '<portlet:actionURL><portlet:param name="action" value="submitExcel"></portlet:param></portlet:actionURL>';
			$("#buildaddfile").form('submit', {
				url: resurl,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success: function(result){
					$('#<portlet:namespace/>addfilechi').dialog('close');		// close the dialog
					$('#<portlet:namespace/>dg').datagrid('reload');	// reload the user data
					$('#<portlet:namespace/>dgBoi').datagrid('reload');
					$('#<portlet:namespace/>dgAhu').datagrid('reload');
					$('#<portlet:namespace/>dgCt').datagrid('reload');
					$('#<portlet:namespace/>dgFcu').datagrid('reload');
					$('#<portlet:namespace/>dgHeater').datagrid('reload');
					$('#<portlet:namespace/>dgLift').datagrid('reload');
					$('#<portlet:namespace/>dgLighting').datagrid('reload');
					$('#<portlet:namespace/>dgPump').datagrid('reload');
					$('#<portlet:namespace/>dgVav').datagrid('reload');
				} 
			});
		}
	}
</script>