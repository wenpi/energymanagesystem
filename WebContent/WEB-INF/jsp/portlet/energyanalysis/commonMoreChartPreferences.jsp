<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-22 上午10点22分
	LastModified Date:
	Description: 共用的多个图表的渲染页面
 -->

<style type="text/css">
.spanwidth {
	width: 85px;
	margin-top: 5px;
}
</style>

<portlet:actionURL var="savePreferencesUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>

<div id="msg"></div>

<form:form commandName="preferenceinfo" id="commonmorechart"
	method="post" class="" action="#">

	<div class="ftitle">
		<span>&nbsp;&nbsp;</span><span class="title-back"><a
			href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a></span>
	</div>

	<div class="ftitle">
		<span class="spanwidth" align="right">增加小时数：</span> <input id="hours"
			name="hours" type="text"
			title="因java代码中获取的时间和系统时间可能存在误差，为避免设置java中的各种文件，用此方式来增加时间以保证时间一致"
			value="<%=prefs.getValue("hours", "")%>">
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
						onclick="<portlet:namespace/>setNameAndId('choose_name','choose_id','ispd')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('choose_name','choose_id','ispd')">清空name/id/ispd</a>
				</div>
			</div>

			<br /> <br />

			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">选择Name：</span> <input
						id="choose_name" name="choose_name" type="text"
						value="<%=prefs.getValue("choose_name", "")%>">
				</div>
				<div class="div-table-2col">
					<span class="spanwidth" align="right">选择Id：</span> <input
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
					<span class="spanwidth" align="right">参考值：</span> <input
						id="referencevalue" name="referencevalue" type="text"
						value="<%=prefs.getValue("referencevalue", "")%>">
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">标题：</span> <input id="title"
						name="title" type="text" value="<%=prefs.getValue("title", "")%>">
				</div>
				<div class="div-table-2col">
					<span class="spanwidth" align="right">描述：</span> <input
						id="description" name="description" type="text"
						value="<%=prefs.getValue("description", "")%>">
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">背景颜色：</span> <input
						id="backgroundColor" name="backgroundColor" type="text"
						value="<%=prefs.getValue("backgroundColor", "")%>">
				</div>
				<div class="div-table-2col">
					<span class="spanwidth" align="right">y轴标题：</span> <input
						id="yLeftTitle" name="yLeftTitle" type="text"
						value="<%=prefs.getValue("yLeftTitle", "")%>">
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">X轴显示间隔：</span> <input
						id="xStep" name="xStep" type="text"
						value="<%=prefs.getValue("xStep", "")%>">
				</div>
				<div class="div-table-2col">
					<span class="spanwidth" align="right">图表类型1：</span> <select
						id="chartType_1" name="chartType_1" style="width: 66%">
						<option value="line">曲线图</option>
						<option value="column">柱状图</option>
						<option value="area">面积图</option>
					</select>
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">线颜色1：</span> <input
						id="lineColor_1" name="lineColor_1" type="text"
						value="<%=prefs.getValue("lineColor_1", "")%>">
				</div>
				<div class="div-table-2col">
					<span class="spanwidth" align="right">填充颜色1：</span> <input
						id="fillColor_1" name="fillColor_1" type="text"
						value="<%=prefs.getValue("fillColor_1", "")%>">
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">图例名称1：</span> <input
						id="dataName_1" name="dataName_1" type="text"
						value="<%=prefs.getValue("dataName_1", "")%>">
				</div>
				<div class="div-table-2col">
					<span class="spanwidth" align="right">图表类型2：</span> <select
						id="chartType_2" name="chartType_2" style="width: 66%">
						<option value="line">曲线图</option>
						<option value="column">柱状图</option>
						<option value="area">面积图</option>
					</select>
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">图例名称2：</span> <input
						id="dataName_2" name="dataName_2" type="text"
						value="<%=prefs.getValue("dataName_2", "")%>">
				</div>
				<div class="div-table-2col">
					<span class="spanwidth" align="right">填充颜色2：</span> <input
						id="fillColor_2" name="fillColor_2" type="text"
						value="<%=prefs.getValue("fillColor_2", "")%>">
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-2col">
					<span class="spanwidth" align="right">线宽：</span> <input
						id="lineWidth" name="lineWidth" type="text"
						value="<%=prefs.getValue("lineWidth", "")%>">
				</div>
				<div class="div-table-2col">
					<span class="spanwidth" align="right">默认时间：</span> <input
						id="defaulttime" name="defaulttime" type="text"
						value="<%=prefs.getValue("defaulttime", "")%>">
				</div>
			</div>

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
	$("#commonmorechart").form('submit', {
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
* 获取选择名称和id列表
*/
//renderQueryScheme('<portlet:resourceURL id="getQuerySchemeList"></portlet:resourceURL>','choose_name','name');
//renderQueryScheme('<portlet:resourceURL id="getQuerySchemeList"></portlet:resourceURL>','choose_id','id');

/**
 * 为urlName和urlId赋值
 */
function <portlet:namespace/>setNameAndId(choose_name,choose_id,ispd){
	var names = [],ids = [],ispds = [];
	var rows = $('#<portlet:namespace/>dgrid').datagrid('getSelections');
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


$("#<portlet:namespace/>dgrid").datagrid({
	height : 500,
	width:450,
	rownumbers:true,//序号 
	collapsible:false,//是否可折叠的 
	//value:$("#dgrid"+renderid).val(),
	idField:'',
	textField:'',
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

$("#chartType_1").val('<%=prefs.getValue("chartType_1","")%>');
$("#chartType_2").val('<%=prefs.getValue("chartType_2","")%>');

// 默认时间
$('#defaulttime').datebox();
</script>