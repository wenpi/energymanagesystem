<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-15 下午4点24分
	LastModified Date:
	Description: 首页-关键信息切换页面
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

	<br />
	<div class="ftitle">
		<span>&nbsp;&nbsp;&nbsp;<%=prefs.getValue("title", "")%></span><span><a
			href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
	</div>
	<div class="ftitle">
		<span class="spanwidth" align="right">增加小时数：</span> <input id="hours"
			name="hours" type="text" value="<%=prefs.getValue("hours", "")%>">
	</div>

	<br />

	<div class="div-table">

		<div class="div-table-row">
			<div class="div-table-col">
				<div class="ftitle">
					<span>建筑能耗分项</span>
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
					&nbsp;&nbsp;&nbsp; <a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid5','valuename','valueid','valueispd')">获取求值name、id、ispd</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('valuename','valueid','valueispd')">清空求值name/id/ispd</a>
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
				<span class="spanwidth" align="right">左侧求值Name：</span> <input
					id="valuename" name="valuename" type="text"
					value="<%=prefs.getValue("valuename", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">左侧求值Id：</span> <input
					id="valueid" name="valueid" type="text"
					value="<%=prefs.getValue("valueid", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">左侧求值Ispd：</span> <input
					id="valueispd" name="valueispd" type="text"
					value="<%=prefs.getValue("valueispd", "")%>">
			</div>
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
					id="decimals" name="decimals">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime5" name="defaulttime5" type="text"
					value="<%=prefs.getValue("defaulttime5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表描述1：</span> <input
					id="description_1" name="description_1" type="text"
					value="<%=prefs.getValue("description_1", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表描述2：</span> <input
					id="description_2" name="description_2" type="text"
					value="<%=prefs.getValue("description_2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表描述3：</span> <input
					id="description_3" name="description_3" type="text"
					value="<%=prefs.getValue("description_3", "")%>">
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
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表数据列表：</span> <input
					id="chartDataList_5" name="chartDataList_5" type="text"
					value="<%=prefs.getValue("chartDataList_5", "")%>">
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
			<div class="div-table-2col">
				<span class="spanwidth" align="right">显示图例：</span> <select
					id="showLegend" name="showLegend">
					<option value="false">不显示</option>
					<option value="true">显示</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑能耗分项对比图相关设置</span>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">y轴标题：</span> <input
					id="yLeftTitle_6" name="yLeftTitle_6" type="text"
					value="<%=prefs.getValue("yLeftTitle_6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">对比图表类型：</span> <select
					id="chartType_6_1" name="chartType_6_1">
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
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">网格线颜色：</span> <input
					id="gridLineColor" name="gridLineColor" type="text"
					value="<%=prefs.getValue("gridLineColor", "")%>">
			</div>
		</div>
		<br /> <br />

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

//渲染 建筑能耗分项  的效果
renderDataGrid("dgrid5");
$("#decimals5").val('<%=prefs.getValue("decimals5","")%>');
$("#chartType_6_1").val('<%=prefs.getValue("chartType_6_1","")%>');
$('#defaulttime5').val('<%=prefs.getValue("defaulttime5","")%>');
$('#defaulttime5').datebox();//默认时间
</script>