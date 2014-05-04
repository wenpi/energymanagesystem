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
 <portlet:resourceURL id="getVavs" var="getVavUrl">
</portlet:resourceURL>
<table id="<portlet:namespace/>dgVav" title="变风量箱" class="easyui-datagrid" width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getVavUrl)%>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="id" toolbar="#<portlet:namespace/>tbVav">
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
				<th field="power" width="50">功率</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>tbVav">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>add()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit()">修改</a>  
			
			<span style="margin-left:20px;">
			编号: <input id="deviceNoVav" name="deviceNoVav" />
			项目: <select id="buildIdVav" name="buildIdVav"></select>
			区域: <input id="regionIdVav" name="regionIdVav"/>
			<a href="javascript:<portlet:namespace/>search();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">Search</a></span>
			<a href="javascript:<portlet:namespace/>expVavModel();" class="easyui-linkbutton" iconCls="icon-excel"  plain="true">模板</a>
			<a href="javascript:<portlet:namespace/>expVavExcel();" class="easyui-linkbutton" iconCls="icon-excel"  plain="true">导出</a>
	        <a href="javascript:<portlet:namespace/>importVavExcel();" class="easyui-linkbutton" iconCls="icon-excel"  plain="true">导入</a>
	        <iframe name="vavtmpFrame" id="vavtmpFrame" width="1" height="1" style="visibility:hidden;position:absolute;display:none"></iframe>
	</div>
	
	<script language="javascript">

	function <portlet:namespace/>add() {
		var addUrl = '<portlet:renderURL portletMode="edit"><portlet:param name="action" value="addVavForm" /></portlet:renderURL>';
		addUrl=addUrl.replace("pop_up","normal");
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>edit() {
		var node = $('#<portlet:namespace/>dgVav').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editVavForm' /><portlet:param name='id' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.id);
			url=url.replace("pop_up","normal");
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>search() {
		var no = $("#deviceNoVav").val();
		var buildId = $('#buildIdVav').combogrid("getValue");
		var regionId = $('#regionIdVav').combotree("getValue");
		var url = "<portlet:resourceURL id='getVavsBySearch'><portlet:param name='deviceNo' value='tempdeviceNo' /><portlet:param name='buildId' value='tempbuildId' /><portlet:param name='regionId' value='tempregionId' /></portlet:resourceURL>";
		url = url.replace("tempdeviceNo",no).replace("tempbuildId",buildId).replace("tempregionId",regionId);
		$('#<portlet:namespace/>dgVav').datagrid('options').url= url;
		$('#<portlet:namespace/>dgVav').datagrid("reload");
	}
	$(function(){
		$("#buildIdVav").combogrid({
			panelWidth : 500,
			value : $("#buildIdVav").val(),
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
					$('#buildIdVav').combogrid("grid").datagrid("reload", {
						'keyword' : q
					});
					$('#buildIdVav').combogrid("setValue", q);
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
		$("#regionIdVav").combotree({
			url:resUrl,
			width:134
		});
	}

	function <portlet:namespace/>expVavExcel() {
        var regionId = "";
        var deviceNo = $("#deviceNo").val();
        var buildId = $('#buildId').combogrid("getValue");
        if(buildId==""){
        	regionId = ""; 
        }
        else{
        regionId = $('#regionId').combotree("getValue");
        }
		var expUrl = '<portlet:resourceURL id="expVavExcel"><portlet:param name="regionId" value="tempregionId" /><portlet:param name="deviceNo" value="tempdeviceNo" /><portlet:param name="buildId" value="tempbuildId" /></portlet:resourceURL>';
		var removeUrl = '<portlet:resourceURL id="deleteFile"><portlet:param name="fileName" value="tempfileName" /></portlet:resourceURL>';
		expUrl = expUrl.replace('tempregionId',regionId).replace('tempdeviceNo',deviceNo).replace('tempbuildId',buildId);
		removeUrl = removeUrl.replace('tempfileName',"Vav");
        var hostport= document.location.host;
        var hSrc = "http://"+hostport+"/energymanagesystem/uploadfiles/变风量箱.xls";
		$.ajax({
			type: "POST",
			url: expUrl,
			contentType: 'application/x-msdownload;charset=UTF-8',
			success: function (result) {
			$("#vavtmpFrame").attr('src', hSrc);
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

	function <portlet:namespace/>expVavModel() {
		var VavUrl = "<portlet:resourceURL id='expVavModel'></portlet:resourceURL>";
		var removeUrl = '<portlet:resourceURL id="deleteModelFile"><portlet:param name="fileName" value="tempfileName" /></portlet:resourceURL>';
		removeUrl = removeUrl.replace('tempfileName',"VavModel");
		var hostport= document.location.host;
	    var hSrc = "http://"+hostport+"/energymanagesystem/uploadfiles/变风量箱模板.xls";
	     $.ajax({
				type: "POST",
				url: VavUrl,
				contentType: 'application/x-msdownload;charset=UTF-8',
				success: function (result) {
				$("#vavtmpFrame").attr('src', hSrc);
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
	
	function <portlet:namespace/>importVavExcel() {
  		$('#<portlet:namespace/>addfilechi').dialog('open').dialog('setTitle','变风量箱');
  		$("#fileData").val("");
  		$("#addfileName").val("vav");
  	}
</script>