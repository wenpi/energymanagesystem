<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-26 下午6点27分
	LastModified Date:
	Description: 首页-评分模块
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

<form:form commandName="preferenceinfo" id="importantenergytarget"
	method="post" class="" action="#">

	<br />
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
					<span>建筑用能评分</span><span class="title-back"><a
						href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
				</div>
			</div>
		</div>
		<br />

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

		<br /> <br />

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
				<span class="spanwidth" align="right">是否需要乘数：</span> <input
					id="multiplier" name="multiplier" type="text"
					value="<%=prefs.getValue("multiplier", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">attribute：</span> <input
					id="attribute" name="attribute" type="text"
					value="<%=prefs.getValue("attribute", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">保留小数位数：</span> <select
					id="decimals" name="decimals" style="width: 43.5%">
					<option value="0.00">保留两位小数</option>
					<option value="0.0">保留一位小数</option>
					<option value="0">取整数</option>
				</select>
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaulttime" name="defaulttime" type="text"
					value="<%=prefs.getValue("defaulttime", "")%>">
			</div>
		</div>

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
	$("#importantenergytarget").form('submit', {
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
$("#decimals").val('<%=prefs.getValue("decimals","")%>');
$('#defaulttime').datebox(); //默认时间
</script>