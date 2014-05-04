<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init-ext.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-20 上午11:05:42
	LastModified Date:
	Description:
 -->
<ul id="buildregiontree" class="easyui-tree"></ul>
<script language="javascript">
	$(function() {
		$('#buildregiontree').tree({
			url: '<portlet:resourceURL id="getBuildregionstree"></portlet:resourceURL>',
			method:'get',
			onClick:function(node){
				$.post('<portlet:resourceURL id="getMeteruseinfosByRegionid"></portlet:resourceURL>',{regionId:node.id},function(data){
					$('#<portlet:namespace/>Meteruseinfos').datagrid('loadData',data);
				},'json');
			}
		});
	});
</script>