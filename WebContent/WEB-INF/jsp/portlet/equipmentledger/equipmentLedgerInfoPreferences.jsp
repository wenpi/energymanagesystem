<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 设备台账首选项页面
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
	class="tb_space" action="#" style="background-color: white;">

	<br /><br />

	<div class="ftitle">
		<span class="spanwidth" align="right">增加小时数：</span> <input id="hours"
			name="hours" type="text" value="<%=prefs.getValue("hours", "")%>"><br>
		<span class="spanwidth" align="right">模块标题：</span> <input
			id="formTitle" name="formTitle" type="text"
			value="<%=prefs.getValue("formTitle", "")%>"><br> <span
			class="spanwidth" align="right">默认视图：</span> <select id="chooseView"
			name="chooseView" style="width: 14.7%; margin-bottom: 10px;">
			<option value="0">图形视图</option>
			<option value="1">表格视图</option>
		</select><br> <span class="spanwidth" align="right">小数位数：</span> <select
			id="decimals" name="decimals"
			style="width: 14.7%; margin-bottom: 10px;">
			<option value="0.00">保留两位小数</option>
			<option value="0.0">保留一位小数</option>
			<option value="0">取整数</option>
		</select>
	</div>
	
	<br /><br />

	<div class="div-table">
		<div class="div-table-row">
			<div class="ftitle">
				<span>空调系统</span><span class="title-back"><a
						href="<portlet:renderURL portletMode="view" windowState="normal"></portlet:renderURL>">«返回</a></span>
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
						onclick="<portlet:namespace/>setNameAndId('dgrid1','form_name1','form_id1','form_ispd1')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name1','form_id1','form_ispd1')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name1" name="form_name1" type="text"
					value="<%=prefs.getValue("form_name1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id1" name="form_id1" type="text"
					value="<%=prefs.getValue("form_id1", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd1" name="form_ispd1" type="text"
					value="<%=prefs.getValue("form_ispd1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn1" name="commonColumn1" type="text"
					value="<%=prefs.getValue("commonColumn1", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title1"
					name="title1" type="text" value="<%=prefs.getValue("title1", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description1" name="description1" type="text"
					value="<%=prefs.getValue("description1", "")%>">
			</div>
		</div>
		
		<br /><br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>给排水系统</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid2"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid2','form_name2','form_id2','form_ispd2')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name2','form_id2','form_ispd2')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name2" name="form_name2" type="text"
					value="<%=prefs.getValue("form_name2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id2" name="form_id2" type="text"
					value="<%=prefs.getValue("form_id2", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd2" name="form_ispd2" type="text"
					value="<%=prefs.getValue("form_ispd2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn2" name="commonColumn2" type="text"
					value="<%=prefs.getValue("commonColumn2", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title2"
					name="title2" type="text" value="<%=prefs.getValue("title2", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description2" name="description2" type="text"
					value="<%=prefs.getValue("description2", "")%>">
			</div>
		</div>
		
		<br /><br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>变配电系统</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid3"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid3','form_name3','form_id3','form_ispd3')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name3','form_id3','form_ispd3')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name3" name="form_name3" type="text"
					value="<%=prefs.getValue("form_name3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id3" name="form_id3" type="text"
					value="<%=prefs.getValue("form_id3", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd3" name="form_ispd3" type="text"
					value="<%=prefs.getValue("form_ispd3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn3" name="commonColumn3" type="text"
					value="<%=prefs.getValue("commonColumn3", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title3"
					name="title3" type="text" value="<%=prefs.getValue("title3", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description3" name="description3" type="text"
					value="<%=prefs.getValue("description3", "")%>">
			</div>
		</div>
		
		<br /><br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>采暖通风系统</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid4"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid4','form_name4','form_id4','form_ispd4')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name4','form_id4','form_ispd4')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name4" name="form_name4" type="text"
					value="<%=prefs.getValue("form_name4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id4" name="form_id4" type="text"
					value="<%=prefs.getValue("form_id4", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd4" name="form_ispd4" type="text"
					value="<%=prefs.getValue("form_ispd4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn4" name="commonColumn4" type="text"
					value="<%=prefs.getValue("commonColumn4", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title4"
					name="title4" type="text" value="<%=prefs.getValue("title4", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description4" name="description4" type="text"
					value="<%=prefs.getValue("description4", "")%>">
			</div>
		</div>
		
		<br /><br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>生活热水系统</span>
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
						onclick="<portlet:namespace/>setNameAndId('dgrid5','form_name5','form_id5','form_ispd5')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name5','form_id5','form_ispd5')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name5" name="form_name5" type="text"
					value="<%=prefs.getValue("form_name5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id5" name="form_id5" type="text"
					value="<%=prefs.getValue("form_id5", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd5" name="form_ispd5" type="text"
					value="<%=prefs.getValue("form_ispd5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn5" name="commonColumn5" type="text"
					value="<%=prefs.getValue("commonColumn5", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title5"
					name="title5" type="text" value="<%=prefs.getValue("title5", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description5" name="description5" type="text"
					value="<%=prefs.getValue("description5", "")%>">
			</div>
		</div>
		
		<br /><br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>消防系统</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid6"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid6','form_name6','form_id6','form_ispd6')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name6','form_id6','form_ispd6')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name6" name="form_name6" type="text"
					value="<%=prefs.getValue("form_name6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id6" name="form_id6" type="text"
					value="<%=prefs.getValue("form_id6", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd6" name="form_ispd6" type="text"
					value="<%=prefs.getValue("form_ispd6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn6" name="commonColumn6" type="text"
					value="<%=prefs.getValue("commonColumn6", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title6"
					name="title6" type="text" value="<%=prefs.getValue("title6", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description6" name="description6" type="text"
					value="<%=prefs.getValue("description6", "")%>">
			</div>
		</div>
		
		<br /><br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>办公设备</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-col"
				style="height: 250px; width: 900px; margin-left: 30px;">
				<div id="<portlet:namespace/>dgrid7"></div>
			</div>
		</div>

		<br />

		<div class="div-table-row">
			<div class="div-table-col">
				<div id="buttons" style="margin-left: 30px;">
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>setNameAndId('dgrid7','form_name7','form_id7','form_ispd7')">获取name和id</a>
					<a href="#" class="easyui-linkbutton"
						onclick="<portlet:namespace/>clear('form_name7','form_id7','form_ispd7')">清空name/id/ispd</a>
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>表格视图配置</span>
			</div>
		</div>
		
		<br />

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Name：</span> <input
					id="form_name7" name="form_name7" type="text"
					value="<%=prefs.getValue("form_name7", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">Id：</span> <input
					id="form_id7" name="form_id7" type="text"
					value="<%=prefs.getValue("form_id7", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">ispd：</span> <input
					id="form_ispd7" name="form_ispd7" type="text"
					value="<%=prefs.getValue("form_ispd7", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">共用的列：</span> <input
					id="commonColumn7" name="commonColumn7" type="text"
					value="<%=prefs.getValue("commonColumn7", "")%>">
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">标题：</span> <input id="title7"
					name="title7" type="text" value="<%=prefs.getValue("title7", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">描述：</span> <input
					id="description7" name="description7" type="text"
					value="<%=prefs.getValue("description7", "")%>">
			</div>
		</div>
		
		<br /> <br />
		
		<div class="div-table-row">
			<div class="ftitle">
				<span>共用配置</span>
			</div>
		</div>
		
		<br />
		
		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">默认时间：</span> <input
					id="defaultTime" name="defaultTime" type="text"
					value="<%=prefs.getValue("defaultTime", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">是否需要乘数：</span> <input
					id="form_mul" name="form_mul" type="text"
					value="<%=prefs.getValue("form_mul", "")%>">
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-2col">
				<span class="spanwidth" align="right">日报特有的列：</span> <input
					id="dayColumn" name="dayColumn" type="text"
					value="<%=prefs.getValue("dayColumn", "")%>">
			</div>
			<div class="div-table-2col">
				<span class="spanwidth" align="right">说明区背景：</span> <input
					id="bgColor" name="bgColor" type="text"
					value="<%=prefs.getValue("bgColor", "")%>">
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

$("#chooseView").val('<%=prefs.getValue("chooseView","")%>');
$("#decimals").val('<%=prefs.getValue("decimals","")%>');
//渲染空调系统的效果
renderDataGrid("dgrid1");
//渲染给排水系统的效果
renderDataGrid("dgrid2");
//渲染变配电系统的效果
renderDataGrid("dgrid3");
//渲染采暖通风系统的效果
renderDataGrid("dgrid4");
//渲染生活热水系统的效果
renderDataGrid("dgrid5");
//渲染消防系统的效果
renderDataGrid("dgrid6");
//渲染办公设备的效果
renderDataGrid("dgrid7");
</script>