<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-10-11 下午15点21分
	LastModified Date:
	Description: 共用的饼图的渲染页面  
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
		<span>&nbsp;&nbsp;&nbsp;<%=prefs.getValue("title", "")%></span><span
			class="title-back"><a
			href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
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
			<div class="div-table-col">
				<div class="ftitle">
					<span>建筑用电分项</span>
				</div>
			</div>
		</div>


		<br />
		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid5"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid5','choose_name5','choose_id5','ispd5')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('choose_name5','choose_id5','ispd5')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		<br />
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="choose_name5" name="choose_name5" type="text"
					value="<%=prefs.getValue("choose_name5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="choose_id5" name="choose_id5" type="text"
					value="<%=prefs.getValue("choose_id5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input id="ispd5"
					name="ispd5" type="text" value="<%=prefs.getValue("ispd5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否需要乘数：</span> <input
					id="multiplier" name="multiplier" type="text"
					value="<%=prefs.getValue("multiplier", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName5" name="expColumnName5" type="text"
					value="<%=prefs.getValue("expColumnName5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title5"
					name="title5" type="text" value="<%=prefs.getValue("title5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals5" name="decimals5" style="width: 43.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description_5" name="description_5" type="text"
					value="<%=prefs.getValue("description_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime5" name="defaulttime5" type="text"
					value="<%=prefs.getValue("defaulttime5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">模块背景颜色：</span> <input
					id="backgroundColor_5" name="backgroundColor_5" type="text"
					value="<%=prefs.getValue("backgroundColor_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型：</span> <input
					id="chartType_5" name="chartType_5" type="text"
					value="<%=prefs.getValue("chartType_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表图例列表：</span> <input
					id="chartLegendList_5" name="chartLegendList_5" type="text"
					value="<%=prefs.getValue("chartLegendList_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表颜色列表：</span> <input
					id="chartColorList_5" name="chartColorList_5" type="text"
					value="<%=prefs.getValue("chartColorList_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例展示方式：</span> <input
					id="chartLegendLayout_5" name="chartLegendLayout_5" type="text"
					value="<%=prefs.getValue("chartLegendLayout_5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例对齐方式：</span> <input
					id="chartLegendAlign_5" name="chartLegendAlign_5" type="text"
					value="<%=prefs.getValue("chartLegendAlign_5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表字体颜色：</span> <input
					id="chartWordColor" name="chartWordColor" type="text"
					value="<%=prefs.getValue("chartWordColor", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">饼图输出项：</span> <input
					id="itemName" name="itemName" type="text"
					value="<%=prefs.getValue("itemName", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑用电分项对比图相关设置</span>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">中间饼图大小：</span> <input
					id="innerSize" name="innerSize" type="text"
					value="<%=prefs.getValue("innerSize", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">对比图表类型：</span> <select
					id="chartType_6_1" name="chartType_6_1" style="width: 43.5%">
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">对比颜色列表：</span> <input
					id="chartColorList_6" name="chartColorList_6" type="text"
					value="<%=prefs.getValue("chartColorList_6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="chartFillColorList_6" name="chartFillColorList_6" type="text"
					value="<%=prefs.getValue("chartFillColorList_6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表半径列表：</span> <input
					id="chartRadiusList_6" name="chartRadiusList_6" type="text"
					value="<%=prefs.getValue("chartRadiusList_6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位：</span> <input
					id="ySymbol6" name="ySymbol6" type="text"
					value="<%=prefs.getValue("ySymbol6", "")%>">
			</div>

		</div>

		<br /> <br />


		<div id="buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>savePreference()">保存</a>
		</div>
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
function <portlet:namespace/>setNameAndId(dgrid_id,choose_name,choose_id,ispd){
	var names = [],ids = [],ispds = [];
	var rows = $('#<portlet:namespace/>'+dgrid_id).datagrid('getSelections');
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
 * 清空内容urlname、urlid、urlispd的值  
 */
function <portlet:namespace/>clear(choose_name,choose_id,ispd){
	$('#'+choose_name).val('');
	$('#'+choose_id).val('');
	$('#'+ispd).val('');
}


$("#<portlet:namespace/>dgrid5").datagrid({
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

$("#chartType_6_1").val('<%=prefs.getValue("chartType_6_1","")%>');
// 默认时间
$('#defaulttime5').datebox();
</script>