<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 运行监测首选项页面
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

<form:form commandName="preferenceinfo" id="coreinfo" method="post"
	class="" action="#" style="background-color: white;">

	<br />

	<div class="ftitle">
		<span class="spanwidth" align="right">增加小时数：</span> <input id="hours"
			name="hours" type="text" value="<%=prefs.getValue("hours", "")%>">
		<span><a href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
	</div>

	<div class="div-table">
		<!-- 运行监测配置项 -->
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="ftitle">
					<span>运行监测</span>
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
				<span class="spanwidth" align="right">图表标题：</span> <input id="chartTitle"
					name="chartTitle" type="text" value="<%=prefs.getValue("chartTitle", "")%>">
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
					id="chartType_1" name="chartType_1" style="width: 29.5%">
					<option value="column">柱状图</option>
					<option value="line">曲线图</option>
					<option value="area">面积图</option>
				</select>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否显示X轴网格线：</span> <select
					id="showXGridLine1" name="showXGridLine1" style="width: 29.5%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否显示Y轴网格线：</span> <select
					id="showYGridLine1" name="showYGridLine1" style="width: 29.5%">
					<option value="1">显示</option>
					<option value="0">不显示</option>
				</select>
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
				<span class="spanwidth" align="right">图表颜色列表：</span> <input
					id="chartColorList" name="chartColorList" type="text"
					value="<%=prefs.getValue("chartColorList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime1" name="defaulttime1" type="text"
					value="<%=prefs.getValue("defaulttime1", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否显示图例：</span> <select
					id="showLegend1" name="showLegend1" style="width: 29.5%">
					<option value="true">显示</option>
					<option value="false">不显示</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">下方开启name：</span> 
				<input id="valuename" name="valuename" type="text" value="<%=prefs.getValue("valuename", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">下方开启id：</span>
				<input id="valueid" name="valueid" type="text" value="<%=prefs.getValue("valueid", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">下方开启ispd：</span>
				<input id="valueispd" name="valueispd" type="text" value="<%=prefs.getValue("valueispd", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题颜色：</span> <input
					id="titleColor" name="titleColor" type="text"
					value="<%=prefs.getValue("titleColor", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals" name="decimals" style="width: 29.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">样式类型：</span> <select
					id="gridLineDashStyle6" name="gridLineDashStyle6" style="width: 29.5%">
					<option value="">一行三列</option>
					<option value="doubleColumn">一行两列</option>
				</select>
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
	$("#coreinfo").form('submit', {
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

//渲染datagrid
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

//渲染室外状态的效果
renderDataGrid("dgrid1");
$("#chartType_1").val('<%=prefs.getValue("chartType_1","")%>');
$("#decimals1").val('<%=prefs.getValue("decimals1","")%>');
$('#defaulttime1').datebox();//默认时间
$("#showLegend1").val('<%=prefs.getValue("showLegend1","")%>');
$("#showXGridLine1").val('<%=prefs.getValue("showXGridLine1","")%>');
$("#showYGridLine1").val('<%=prefs.getValue("showYGridLine1","")%>');
$("#gridLineDashStyle6").val('<%=prefs.getValue("gridLineDashStyle6","")%>');
</script>