 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-20 上午09:57:42
	LastModified Date:
	Description: 建筑设备运行数据报表
 -->

<portlet:renderURL var="addReadmeterForm"  portletMode="edit" windowState="normal">
	<portlet:param name="action" value="addReadmeterForm" />
</portlet:renderURL>

<div id="<portlet:namespace/>tb" style="padding:5px;height:auto">
	<div class="fitem"> 
		建筑名称：<select id="buildId" name="buildId"></select>
		类型：<select id="energydictId" name="energydictId"></select>  
		抄表日期：<input id="readingDate" name="readingDate" class="easyui-datebox" />
		抄表人：   <input id="readingPerson" name="readingPerson" /> 
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="<portlet:namespace/>search()">查找</a>
    </div>
    <div style="margin-bottom:5px" class="toolbar">
		<a href="${addReadmeterForm}" class="easyui-linkbutton" iconCls="icon-add" plain="true">创建</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>edit()">修改</a>
   		<a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="<portlet:namespace/>remove()">删除</a>
   </div>
</div>

<table id="<portlet:namespace/>dg" style="height:510px" class="easyui-datagrid"
			title="抄表记录" url="<portlet:resourceURL id="getReadmeters"></portlet:resourceURL>"
			toolbar="#<portlet:namespace/>tb" rownumbers="true" pagination="true" idField="readingid">
		<thead>
			<tr>
				<th field="ck" checkbox="true"></th>
				<th field="meterId" width="200" align="center" >仪表</th>
				<th field="readingData" width="200" align="center" >抄表数</th>
				<th field="readingDate" width="120" align="center" formatter="formatDate">抄表日期</th>
				<th field="readingPerson" width="80" align="center">抄表人</th>
				<th field="energydict" width="80" align="center" formatter="formatType">类型</th>
			</tr>
		</thead>
</table>

<script language="javascript">
	$(function() {
        /**
		 * 获取建筑信息列表
		 */
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
			}
		});

		/**
		   * 获取能源列表
		   */
		$("#energydictId").combogrid({
			panelWidth:500,
			value:$("#energydictId").val(),
			idField:'energydictId',
			textField:'energydictName',
			pagination : true,//是否分页  
			rownumbers:true,
			fit: true,
			pageSize: 10,
			pageList: [10,20,30,40,50],
			url:'<portlet:resourceURL id="getEnergydicts"></portlet:resourceURL>',
			columns:[[
				{field:'energydictName',title:'能源名称',width:100}
			]],keyHandler: {
				up: function(){},
				down: function(){},
				enter: function(){},
				query: function(q){
					$('#energydictId').combogrid("grid").datagrid("reload", { 'keyword': q });
		            $('#energydictId').combogrid("setValue", q);
				}
			}
		  });
	}
	)
	
	function  <portlet:namespace/>search() {
		var bId = $('#buildId').combogrid("getValue");
		var mty = $("#energydictId").combogrid("getValue");
		var rd =  $('#readingDate').combogrid("getValue");
		
		var url = "<portlet:resourceURL id='getReadmeters'><portlet:param name='buildId' value='tempbuildId' /><portlet:param name='energydictId' value='tempmeterType' /><portlet:param name='readingDate' value='tempreadingDate' /><portlet:param name='readingPerson' value='tempreadingPerson' /></portlet:resourceURL>";
		url = url.replace("tempbuildId",bId).replace("tempmeterType",mty).replace("tempreadingDate",rd).replace("tempreadingPerson",$("#readingPerson").val());
		$('#<portlet:namespace/>dg').datagrid('options').url= url;
		$('#<portlet:namespace/>dg').datagrid("reload");
		}

	//编辑记录
	function <portlet:namespace/>edit() {
		var row = $('#<portlet:namespace/>dg').datagrid('getSelected');
		if (row){
			var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editReadmeterForm' /><portlet:param name='readingid' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",row.readingid);
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}

	/**
	* 删除记录
	*/
	function <portlet:namespace/>remove() {
		var ids = [];
		var rows = $('#<portlet:namespace/>dg').datagrid('getSelections');
		if (rows){
			for(var i=0; i<rows.length; i++){
				ids.push(rows[i].readingid);
			}
			ids.join(',');
			$.messager.confirm('删除确认','确定要删除此选定的数据吗?',function(r){
				if (r){
					var removeUrl = "<portlet:actionURL portletMode='edit'><portlet:param name='action' value='removeReadmeters' /><portlet:param name='readingids' value='tempId' /></portlet:actionURL>";
					var url=removeUrl.replace("tempId",ids);
					window.location.href = url;
				}
			});
			
		} else {
			alert("请选择数据行"); 
		}
	}

	function formatBuild(val,row) {
	   var 	buildname = "";
       if(val==null){ 
       }
       else{
    	   $.post('<portlet:resourceURL id="getBuildinfoByBuildId"></portlet:resourceURL>',{buildId:val},function(data){
    		   buildname =  data;
    		   return buildname;
    	   });
       }
	}

	function formatType(val,row) {
		return val==null ? '' : val.energydictName;
	}
	
	function formatDate(val,row) {
		if(val!=null) {
			var date = new Date(val);
			return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
		}
		return "";
	}
</script>