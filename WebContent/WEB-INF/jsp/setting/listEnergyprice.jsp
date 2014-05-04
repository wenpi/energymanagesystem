 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
<portlet:resourceURL id="getListEnergyprice" var="getListEnergypriceUrl">
</portlet:resourceURL>
<table id="<portlet:namespace/>pricedg" title="能源价格" class="easyui-datagrid" width="100%" style="height:auto;"
			url="<%=renderResponse.encodeURL(getListEnergypriceUrl)%>"
			rownumbers="true" pagination="true" fitColumns="true" singleSelect="true"
			idField="priceid" toolbar="#<portlet:namespace/>pricetb">
		<thead>
			<tr>
				<th field="energydict" width="100" formatter="formatParent">能源</th>
				<th field="pricetype" width="100" formatter="formatpricetype">收费方式</th>
				<th field="pricetypevalue" width="60" align="left" formatter="formatpricetypevalue">收费方式分类</th>
				<th field="price" width="120" align="left">能源单价</th>
				<th field="comment"  width="120">备注</th>
			</tr>
		</thead>
	</table>
	<div id="<portlet:namespace/>pricetb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="<portlet:namespace/>addEnergyprice()">新增</a>  
   		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="<portlet:namespace/>editEnergyprice()">修改</a>  
			<span style="margin-left:20px;">
			
			收费方式:<select id="pricetype" onChange="setPricetype()">
				<option value="0">不启用收费方式 </option>
				<option value="1">峰顶峰谷收费 </option>
				<option value="2">阶梯收费</option>
			</select>
			
			收费方式分类:<select id="pricetypevalue">
				<option value="0">基础价格 </option>
			</select>
		    
			<a href="javascript:<portlet:namespace/>searchEnergyprice();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">Search</a></span>
	</div>
	<br />
	<script language="javascript">

	function <portlet:namespace/>addEnergyprice() {
		var addUrl = '<portlet:renderURL portletMode="edit" windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name="action" value="addEnergypriceForm" /></portlet:renderURL>';
		addUrl=addUrl.replace("pop_up","normal");
		window.location.href = addUrl;
	}
	
	function <portlet:namespace/>editEnergyprice() {
		var node = $('#<portlet:namespace/>pricedg').datagrid('getSelected');
		if (node){
			var editUrl = "<portlet:renderURL portletMode='edit' windowState="<%= LiferayWindowState.NORMAL.toString() %>"><portlet:param name='action' value='editEnergypriceForm' /><portlet:param name='priceid' value='tempId' /></portlet:renderURL>";
			var url=editUrl.replace("tempId",node.priceid);
			url=url.replace("pop_up","normal");
			window.location.href = url;
		} else {
			alert("请选择数据行");
		}
	}
	function <portlet:namespace/>searchEnergyprice() {
		var url = "<portlet:resourceURL id='getListEnergyprice'><portlet:param name='pricetype' value='temppricetype' /><portlet:param name='pricetypevalue' value='temppricetypevalue' /></portlet:resourceURL>";
		url = url.replace("temppricetype",$("#pricetype").val()).replace("temppricetypevalue",$("#pricetypevalue").val());
		$('#<portlet:namespace/>pricedg').datagrid('options').url= url;
		$('#<portlet:namespace/>pricedg').datagrid("reload");
	}
	
	function formatParent(val,row) {
		return val==null ? '' : val.energydictName;
	}

	function formatpricetype(val,row) {
		if(val==0){
			return 	"不启用收费方式 ";
		}
		if(val==1){
			return 	"峰顶峰谷收费 ";
		}
		if(val==2){
			return 	"阶梯收费";
		}
	}

	function formatpricetypevalue(val,row) {
		if(val==0){
			return 	"基础价格  ";
		}
		if(val==11){
			return 	"峰谷价格 ";
		}
		if(val==12){
			return 	"峰顶价格";
		}
		if(val==23){
			return 	"第二档价格";
		}
		if(val==24){
			return 	"第三档价格";
		}
	}

	/**
	* 设置价格类型
	*/
	function setPricetype(){

		var pricetypevalue0 = [{pricetypevalue:0,pricetypetext:'基础价格'}];
		var pricetypevalue1 = [{pricetypevalue:0,pricetypetext:'基础价格'},{pricetypevalue:11,pricetypetext:'峰谷价格'},{pricetypevalue:12,pricetypetext:'峰顶价格'}];
		var pricetypevalue2 = [{pricetypevalue:0,pricetypetext:'基础价格'},{pricetypevalue:23,pricetypetext:'第二档价格'},{pricetypevalue:24,pricetypetext:'第三档价格'}];
		
		var pricetypes = [{pricetype:0,pricetypevalue:pricetypevalue0},{pricetype:1,pricetypevalue:pricetypevalue1},{pricetype:2,pricetypevalue:pricetypevalue2}];

		 $("#pricetype").change(function(){
				var currVal = $(this).val();
				$("#pricetypevalue").empty();
				
				$.each(pricetypes,function(index,obj){
					if(obj.pricetype==currVal) {
						$.each(obj.pricetypevalue,function(index,opt){
						    $("<option />").attr("value",opt.pricetypevalue).text(opt.pricetypetext).appendTo("#pricetypevalue");
						});
					}
				});
			 });
		} 

	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeEnergyprice'></portlet:resourceURL>";
					$.post(removeUrl,{priceid:'${energyprice.priceid}'},function(result){
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

	$(function(){
		setPricetype();
	});
	
</script>  