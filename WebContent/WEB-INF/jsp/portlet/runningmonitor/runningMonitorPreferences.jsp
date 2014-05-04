<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-15 下午12点51分
	LastModified Date:
	Description: 运行监测
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

<form:form commandName="preferenceinfo" id="runningmonitor"
	method="post" class="" action="#">

	<br />

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
					<span>运行监测</span><span class="title-back"><a
						href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
				</div>
			</div>
		</div>

		<br /> <br />

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
					&nbsp;&nbsp;&nbsp; <a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid','valuename','valueid','valueispd')">获取求值name、id、ispd</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('valuename','valueid','valueispd')">清空求值name/id/ispd</a>
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
				<span class="spanwidth" align="right">标题：</span> <input id="title"
					name="title" type="text" value="<%=prefs.getValue("title", "")%>">
			</div>
		</div>

		<br />
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ValueName：</span> <input
					id="valuename" name="valuename" type="text"
					value="<%=prefs.getValue("valuename", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ValueId：</span> <input
					id="valueid" name="valueid" type="text"
					value="<%=prefs.getValue("valueid", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">valueIspd：</span> <input
					id="valueispd" name="valueispd" type="text"
					value="<%=prefs.getValue("valueispd", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime" name="defaulttime" type="text"
					value="<%=prefs.getValue("defaulttime", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表类型：</span> <select
					id="chartType" name="chartType" style="width: 43.5%">
					<option value="line">曲线图</option>
					<option value="spline">双曲线图</option>
					<option value="column">柱状图</option>
					<option value="area">面积图</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals" name="decimals" style="width: 43.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表右边距：</span> <input
					id="marginRight" name="marginRight" type="text"
					value="<%=prefs.getValue("marginRight", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">背景颜色：</span> <input
					id="backgroundColor" name="backgroundColor" type="text"
					value="<%=prefs.getValue("backgroundColor", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表下边距：</span> <input
					id="marginBottom" name="marginBottom" type="text"
					value="<%=prefs.getValue("marginBottom", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">左上角标题：</span> <input
					id="chartTitle" name="chartTitle" type="text"
					value="<%=prefs.getValue("chartTitle", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题字体颜色：</span> <input
					id="titleColor" name="titleColor" type="text"
					value="<%=prefs.getValue("titleColor", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题字体大小：</span> <input
					id="fontSize" name="fontSize" type="text"
					value="<%=prefs.getValue("fontSize", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题字体加粗：</span> <input
					id="fontWeight" name="fontWeight" type="text"
					value="<%=prefs.getValue("fontWeight", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表标题字体：</span> <input
					id="fontFamily" name="fontFamily" type="text"
					value="<%=prefs.getValue("fontFamily", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题X轴位置：</span> <input
					id="xTitlePosition" name="xTitlePosition" type="text"
					value="<%=prefs.getValue("xTitlePosition", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">X轴距离：</span> <input id="xStep"
					name="xStep" type="text" value="<%=prefs.getValue("xStep", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴标题：</span> <input
					id="yLeftTitle" name="yLeftTitle" type="text"
					value="<%=prefs.getValue("yLeftTitle", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴字体颜色：</span> <input
					id="yFontColor" name="yFontColor" type="text"
					value="<%=prefs.getValue("yFontColor", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Y轴单位信息：</span> <input
					id="valueSuffix" name="valueSuffix" type="text"
					value="<%=prefs.getValue("valueSuffix", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例展示方式：</span> <input
					id="chartLegendLayout" name="chartLegendLayout" type="text"
					value="<%=prefs.getValue("chartLegendLayout", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例对齐方式：</span> <input
					id="chartLegendAlign" name="chartLegendAlign" type="text"
					value="<%=prefs.getValue("chartLegendAlign", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例展示方式：</span> <input
					id="verticalAlign" name="verticalAlign" type="text"
					value="<%=prefs.getValue("verticalAlign", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例的边框：</span> <input
					id="borderWidth" name="borderWidth" type="text"
					value="<%=prefs.getValue("borderWidth", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例X轴位置：</span> <input
					id="legendXPosition" name="legendXPosition" type="text"
					value="<%=prefs.getValue("legendXPosition", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图例Y轴位置：</span> <input
					id="legendYPosition" name="legendYPosition" type="text"
					value="<%=prefs.getValue("legendYPosition", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">曲线点半径：</span> <input
					id="seriesRadius" name="seriesRadius" type="text"
					value="<%=prefs.getValue("seriesRadius", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">线宽：</span> <input
					id="lineWidth" name="lineWidth" type="text"
					value="<%=prefs.getValue("lineWidth", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表图例列表：</span> <input
					id="chartLegendList" name="chartLegendList" type="text"
					value="<%=prefs.getValue("chartLegendList", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">图表颜色列表：</span> <input
					id="chartColorList" name="chartColorList" type="text"
					value="<%=prefs.getValue("chartColorList", "")%>">
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
	$("#runningmonitor").form('submit', {
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

//渲染 运行监测  的效果
renderDataGrid("dgrid");
$('#defaulttime').datebox();//默认时间
$("#chartType").val('<%=prefs.getValue("chartType", "")%>');
$("#decimals").val('<%=prefs.getValue("decimals", "")%>');
</script>