<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->


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
					<span>建筑总能耗</span>
				</div>
			</div>
		</div>

		<br />
		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid1"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid1','choose_name1','choose_id1','ispd1')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('choose_name1','choose_id1','ispd1')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		<br />
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="choose_name1" name="choose_name1" type="text"
					value="<%=prefs.getValue("choose_name1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="choose_id1" name="choose_id1" type="text"
					value="<%=prefs.getValue("choose_id1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input id="ispd1"
					name="ispd1" type="text" value="<%=prefs.getValue("ispd1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title1"
					name="title1" type="text" value="<%=prefs.getValue("title1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals" name="decimals">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
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
					id="backgroundColor_1" name="backgroundColor_1" type="text"
					value="<%=prefs.getValue("backgroundColor_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型：</span> <select
					id="chartType_1" name="chartType_1">
					<option value="spline">双曲线图</option>
					<option value="line">曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴显示间隔：</span> <input
					id="xStep_1" name="xStep_1" type="text"
					value="<%=prefs.getValue("xStep_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime1" name="defaulttime1" type="text"
					value="<%=prefs.getValue("defaulttime1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴左侧标题：</span> <input
					id="yLeftTitle" name="yLeftTitle" type="text"
					value="<%=prefs.getValue("yLeftTitle", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴右侧标题：</span> <input
					id="yRightTitle" name="yRightTitle" type="text"
					value="<%=prefs.getValue("yRightTitle", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">提示字体颜色：</span> <input
					id="chartToolTipColor" name="chartToolTipColor" type="text"
					value="<%=prefs.getValue("chartToolTipColor", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表提示文字：</span> <input
					id="chartToolTipTitle" name="chartToolTipTitle" type="text"
					value="<%=prefs.getValue("chartToolTipTitle", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">提示栏单位：</span> <input
					id="chartTipUnit" name="chartTipUnit" type="text"
					value="<%=prefs.getValue("chartTipUnit", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表中线样式：</span> <input
					id="gridLineDashStyle" name="gridLineDashStyle" type="text"
					value="<%=prefs.getValue("gridLineDashStyle", "")%>">
			</div>
		</div>



		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth" name="lineWidth" type="text"
					value="<%=prefs.getValue("lineWidth", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表图例列表：</span> <input
					id="chartLegendList" name="chartLegendList" type="text"
					value="<%=prefs.getValue("chartLegendList", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表颜色列表：</span> <input
					id="chartColorList" name="chartColorList" type="text"
					value="<%=prefs.getValue("chartColorList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">导出列头名称：</span> <input
					id="expColumnName1" name="expColumnName1" type="text"
					value="<%=prefs.getValue("expColumnName1", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="chartFillColorList" name="chartFillColorList" type="text"
					value="<%=prefs.getValue("chartFillColorList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">点半径列表：</span> <input
					id="chartRadiusList" name="chartRadiusList" type="text"
					value="<%=prefs.getValue("chartRadiusList", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">点类型列表：</span> <input
					id="chartSymbolList" name="chartSymbolList" type="text"
					value="<%=prefs.getValue("chartSymbolList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴数据列表：</span> <input
					id="chartYAxisList" name="chartYAxisList" type="text"
					value="<%=prefs.getValue("chartYAxisList", "")%>">
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">网格线颜色：</span> <input
					id="gridLineColor" name="gridLineColor" type="text"
					value="<%=prefs.getValue("gridLineColor", "")%>">
			</div>
		</div>


		<div class="div-table-row">
			<div class="ftitle">
				<span>建筑总能耗对比图相关设置</span>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">y轴标题：</span> <input
					id="yLeftTitle_1" name="yLeftTitle_1" type="text"
					value="<%=prefs.getValue("yLeftTitle_1", "")%>">
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
			<div class="div-table-2col">
				<span class="spanwidth" align="right">连接线线宽：</span> <input
					id="connectLineWidth_1" name="connectLineWidth_1"
					title="为空则默认为2，为0则不显示连接线" type="text"
					value="<%=prefs.getValue("connectLineWidth_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth_1" name="lineWidth_1" type="text"
					value="<%=prefs.getValue("lineWidth_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型2：</span> <select
					id="chartType_2" name="chartType_2">
					<option value="column">柱状图</option>
					<option value="spline">双曲线</option>
					<option value="line">曲线图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">对比颜色列表：</span> <input
					id="chartColorList_1" name="chartColorList_1" type="text"
					value="<%=prefs.getValue("chartColorList_1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">填充颜色列表：</span> <input
					id="chartFillColorList_1" name="chartFillColorList_1" type="text"
					value="<%=prefs.getValue("chartFillColorList_1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表半径列表：</span> <input
					id="chartRadiusList_1" name="chartRadiusList_1" type="text"
					value="<%=prefs.getValue("chartRadiusList_1", "")%>">
			</div>
		</div>
	</div>
	<br />
	<br />

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

// 渲染效果
renderDataGrid("dgrid1");
$("#chartType_1").val('<%=prefs.getValue("chartType_1","")%>');
$("#chartType_2").val('<%=prefs.getValue("chartType_2","")%>');
$("#decimals").val('<%=prefs.getValue("decimals","")%>');
$('#defaulttime1').val('<%=prefs.getValue("defaulttime1","")%>');
</script>