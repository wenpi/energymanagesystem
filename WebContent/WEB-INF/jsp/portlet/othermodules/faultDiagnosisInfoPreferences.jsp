<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 故障诊断/节能评估首选项页面
 -->
<style type="text/css">
.spanwidth {
	width: 130px;
	margin-top: 5px;
}
</style>


<portlet:actionURL var="savePreferencesUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>

<div id="msg"></div>

<form:form commandName="preferenceinfo" id="consumptionstatistics"
	method="post" class="" action="#" style="background-color: white;">
	
	<br /><br />
	
	<div class="ftitle">
		<span class="spanwidth" align="right">增加小时数：</span> <input id="hours"
			name="hours" type="text" value="<%=prefs.getValue("hours", "")%>">
	</div>
	
	<br /><br />
	
	<div class="div-table">
		<!-- 故障诊断及财务分析配置项 -->
		<br /> <br />
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="ftitle">
					<span>&nbsp;</span><span class="title-back"><a
						href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
				</div>
			</div>
		</div>

		<br />
		<div class="div-table">

			<div class="div-table-row">
				<div class="div-table-col"
					style="height: 250px; width: 900px; margin-left: 30px;">
					<div id="<portlet:namespace/>dgrid"></div>
				</div>
			</div>

			<br />

			<div class="div-table-row">
				<div class="div-table-col">
					<div id="buttons" style="margin-left: 30px;">
						<a href="#" class="easyui-linkbutton"
							onclick="<portlet:namespace/>setNameAndId('dgrid','choose_name','choose_id','ispd')">获取name和id</a>
						<a href="#" class="easyui-linkbutton"
							onclick="<portlet:namespace/>clear('choose_name','choose_id','ispd')">清空name/id/ispd</a>
					</div>
				</div>
			</div>
			<br />
			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">Name：</span> <input
						id="choose_name" name="choose_name" type="text"
						value="<%=prefs.getValue("choose_name", "")%>">
				</div>
				<div class="div-table-2col">
					<span class="spanwidth" align="right">Id：</span> <input
						id="choose_id" name="choose_id" type="text"
						value="<%=prefs.getValue("choose_id", "")%>">
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">ispd：</span> <input id="ispd"
						name="ispd" type="text" value="<%=prefs.getValue("ispd", "")%>">
				</div>
				<div class="div-table-2col">
					<span class="spanwidth" align="right">模块类别：</span> <select
						id="chartType" name="chartType" style="width: 29.5%">
						<option value="faultdiagnosis">故障诊断</option>
						<option value="energysaving">节能评估</option>
					</select>
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">默认时间：</span> <input
						id="defaulttime" name="defaulttime" type="text"
						value="<%=prefs.getValue("defaulttime", "")%>">
				</div>
			</div>

		</div>
		
		<br /><br />
		
		<div id="buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>savePreference()">保存</a>
		</div>
	</div>

</form:form>


<script type="text/javascript">
/**
* 保存
*/
function <portlet:namespace/>savePreference() {
	$("#consumptionstatistics").form('submit', {
		url:'<%=renderResponse.encodeURL(savePreferencesUrl)%>',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
		}
	});
}

/**
 * 为urlName和urlId赋值
 */
function <portlet:namespace/>setNameAndId(id,choose_name,choose_id,ispd){
	var names = [],ids = [],ispds = [];
	var rows = $('#<portlet:namespace/>'+id).datagrid('getSelections');
	if(rows.length==0){
		alert('请在列表中选择相应的值！');
	}else{
		for(var i=0;i<rows.length;i++){
			names.push(rows[i].name);
			ids.push(rows[i].id);
			ispds.push(rows[i].ispd);
		}
		// 赋值
		$('#'+choose_name).val(names.join(','));
		$('#'+choose_id).val(ids.join(','));
		$('#'+ispd).val(ispds.join(','));
	}
}

/**
 * 为urlName和urlId赋值
 */
function <portlet:namespace/>clear(choose_name,choose_id,ispd){
	// 赋值
	$('#'+choose_name).val('');
	$('#'+choose_id).val('');
	$('#'+ispd).val('');
}


// 渲染datagrid
function renderDataGrid(id){
	$("#<portlet:namespace/>"+id).datagrid({
		height : 500,
		width:450,
		rownumbers:true,//序号 
		collapsible:false,//是否可折叠的 
		pagination : true,//是否分页
		rownumbers:true,
		fit: true,
		pageSize: 50,
		pageList: [10,30,50,500,1000],
		url:'<portlet:resourceURL id="getQuerySchemeList"></portlet:resourceURL>',
		frozenColumns : [[{
			field : 'ff',
			checkbox : true,
			sortable : true
		}]],
		fitColumns: true,
		columns:[[
		  	{field:'comments',title:'名称',width:$(this).width() * 0.2},
			{field:'id',title:'urlId',width:$(this).width() * 0.15}, 
			{field:'name',title:'urlName',width:$(this).width() * 0.2},
			{field:'ispd',title:'ispd',width:$(this).width() * 0.1}
		]],
		onLoadSuccess : function (){
			//移除报表页面的tr标签的big_tr样式
			$("tr:even").removeClass("big_tr");
		}
	});
}

// 渲染 建筑用能评分  的效果
renderDataGrid("dgrid");
$("#chartType").val('<%=prefs.getValue("chartType","")%>');
$('#defaulttime').datebox();//默认时间
</script>