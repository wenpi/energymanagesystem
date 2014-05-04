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
 <portlet:resourceURL id="getFcus" var="getFcuUrl">
</portlet:resourceURL>
<table id="<portlet:namespace/>dgFcu" title="风机盘管" class="easyui-datagrid" width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getFcuUrl)%>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="id" toolbar="#<portlet:namespace/>tbFcu">
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
				<th field="power" width="50">风机功率</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>tbFcu">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit()">修改</a>  
			
			<span style="margin-left:20px;">
			编号: <input id="deviceNoFcu" name="deviceNoFcu" />
			项目: <select id="buildIdFcu" name="buildIdFcu"></select>
			区域: <input id="regionIdFcu" name="regionIdFcu"/>
			<a href="javascript:<portlet:namespace/>search();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">Search</a></span>
			<a href="javascript:<portlet:namespace/>expFcuModel();" class="easyui-linkbutton" iconCls="icon-excel"  plain="true">模板</a>
			<a href="javascript:<portlet:namespace/>expFcuExcel();" class="easyui-linkbutton" iconCls="icon-excel"  plain="true">导出</a>
	        <a href="javascript:<portlet:namespace/>importFcuExcel();" class="easyui-linkbutton" iconCls="icon-excel"  plain="true">导入</a>
	        <iframe name="fcutmpFrame" id="fcutmpFrame" width="1" height="1" style="visibility:hidden;position:absolute;display:none"></iframe>
	</div>
	
	<script language="javascript">

	function <portlet:namespace/>add() {
		var addUrl = '<portlet:renderURL portletMode="edit"><portlet:param name="action" value="addFcuForm" /></portlet:renderURL>';
		addUrl=addUrl.replace("pop_up","normal");
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>edit() {
		var node = $('#<portlet:namespace/>dgFcu').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editFcuForm' /><portlet:param name='id' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.id);
			url=url.replace("pop_up","normal");
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>search() {
		var no = $("#deviceNoFcu").val();
		var buildId = $('#buildIdFcu').combogrid("getValue");
		var regionId = $('#regionIdFcu').combotree("getValue");
		var url = "<portlet:resourceURL id='getFcusBySearch'><portlet:param name='deviceNo' value='tempdeviceNo' /><portlet:param name='buildId' value='tempbuildId' /><portlet:param name='regionId' value='tempregionId' /></portlet:resourceURL>";
		url = url.replace("tempdeviceNo",no).replace("tempbuildId",buildId).replace("tempregionId",regionId);
		$('#<portlet:namespace/>dgFcu').datagrid('options').url= url;
		$('#<portlet:namespace/>dgFcu').datagrid("reload");
	}
	$(function(){
		$("#buildIdFcu").combogrid({
			panelWidth : 500,
			value : $("#buildIdFcu").val(),
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
					$('#buildIdFcu').combogrid("grid").datagrid("reload", {
						'keyword' : q
					});
					$('#buildIdFcu').combogrid("setValue", q);
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
		$("#regionIdFcu").combotree({
			url:resUrl,
			width:134
		});
	}

	function <portlet:namespace/>expFcuExcel() {
        var regionId = "";
        var deviceNo = $("#deviceNo").val();
        var buildId = $('#buildId').combogrid("getValue");
        if(buildId==""){
        	regionId = ""; 
        }
        else{
        regionId = $('#regionId').combotree("getValue");
        }
		var expUrl = '<portlet:resourceURL id="expFcuExcel"><portlet:param name="regionId" value="tempregionId" /><portlet:param name="deviceNo" value="tempdeviceNo" /><portlet:param name="buildId" value="tempbuildId" /></portlet:resourceURL>';
		var removeUrl = '<portlet:resourceURL id="deleteFile"><portlet:param name="fileName" value="tempfileName" /></portlet:resourceURL>';
		expUrl = expUrl.replace('tempregionId',regionId).replace('tempdeviceNo',deviceNo).replace('tempbuildId',buildId);
		removeUrl = removeUrl.replace('tempfileName',"Fcu");
        var hostport= document.location.host;
        var hSrc = "http://"+hostport+"/energymanagesystem/uploadfiles/风机盘管.xls";
		$.ajax({
			type: "POST",
			url: expUrl,
			contentType: 'application/x-msdownload;charset=UTF-8',
			success: function (result) {
			$("#fcutmpFrame").attr('src', hSrc);
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

	function <portlet:namespace/>expFcuModel() {
		var FcuUrl = "<portlet:resourceURL id='expFcuModel'></portlet:resourceURL>";
		var removeUrl = '<portlet:resourceURL id="deleteModelFile"><portlet:param name="fileName" value="tempfileName" /></portlet:resourceURL>';
		removeUrl = removeUrl.replace('tempfileName',"FcuModel");
		var hostport= document.location.host;
	    var hSrc = "http://"+hostport+"/energymanagesystem/uploadfiles/风机盘管模板.xls";
	     $.ajax({
				type: "POST",
				url: FcuUrl,
				contentType: 'application/x-msdownload;charset=UTF-8',
				success: function (result) {
				$("#fcutmpFrame").attr('src', hSrc);
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

    function <portlet:namespace/>importFcuExcel() {
  		$('#<portlet:namespace/>addfilechi').dialog('open').dialog('setTitle','风机盘管');
  		$("#fileData").val("");
  		$("#addfileName").val("fcu");
  	}
</script>