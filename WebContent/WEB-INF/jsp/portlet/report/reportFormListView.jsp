<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-17下午4点01分
	LastModified Date:
	Description: 报表输出页面
 -->

<div class="div-table" style="margin-left: 18px;" id="<portlet:namespace />formdiv">
	<input id="<portlet:namespace />datetime1" type="hidden" />
	<iframe name="<portlet:namespace />tmpFrame1"
		id="<portlet:namespace />tmpFrame1" width="1" height="1"
		style="visibility: hidden; position: absolute; display: none"></iframe>
	<div class="content center">
		<div class="form_style">
			<div class="form_func_title">
				<span class="list_title">${reportform.title}</span>
				<div class="block build_select" id="choose_build">
					<span class="select_name">选择建筑</span> <select>
						<option>整个园区</option>
						<option>1号楼</option>
						<option>2号楼</option>
					</select>
				</div>
				<div class="block date_select">
					<span class="select_name">选择类型</span> <select
						name="<portlet:namespace />select_type"
						id="<portlet:namespace />select_type">
						<option selected="selected" value="day">日报</option>
						<option value="week">周报</option>
						<option value="month">月报</option>
						<option value="year">年报</option>
					</select>
				</div>
				<div class="block">
					<span class="select_name">选择日期</span> <input type="text"
						id="<portlet:namespace />date1"
						onclick="<portlet:namespace />choosetime('date1','date2')">
					<span class="select_name select_name_2">至</span> <input type="text"
						id="<portlet:namespace />date2" readonly="readonly">
				</div>
				<div class="btn_group">
					<div style="cursor: pointer;"
						onclick="<portlet:namespace />query()">查询</div>
					<div style="cursor: pointer;"
						onclick="<portlet:namespace />expToExcel()">输出</div>
					<div style="cursor: pointer;"
						onclick="<portlet:namespace />returnPage()">返回</div>
				</div>
			</div>
		</div>

		<div id="<portlet:namespace />swap_info" class="table_style">
			<div class="span12 basic_imformation cur">
				<div id="<portlet:namespace />reportdiv"></div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
//设置顶部的皮肤背景颜色 
try{
	$(".portlet-borderless-bar").remove(); // 移除右上角的黑点
	$('#nav_bg_div').css("background-color", "#6699CC");
	$('.nav_gat_bar>li').css("background-color", "#4885C1");
}catch(e){}

var <portlet:namespace />choose_type = "${s_type}"; // 选择的时间类型（日报、周报、月报、年报）
var <portlet:namespace />dformt = 'yyyy-MM-dd'; // 选择的时间类型（日报、周报、月报、年报）
var <portlet:namespace />starttime = '${from_date}'; // 开始时间 
var <portlet:namespace />endtime = '${to_date}'; // 结束时间 

// 点击返回按钮，触发的事件
function <portlet:namespace />query(){
	// 拼接URL并传递参数到后台
	var url = '<portlet:renderURL portletMode="view" windowState="maximized"><portlet:param name="action" value="printReportInfo"></portlet:param><portlet:param name="time_type" value="printReportInfo"></portlet:param></portlet:renderURL>';
	url += "&type=" + <portlet:namespace />choose_type;
	url += "&show_tfrom=" + <portlet:namespace />starttime + "&show_tto=" + <portlet:namespace />endtime
		   + "&from=" + <portlet:namespace />starttime + 
		   "&to=" + <portlet:namespace />endtime +
		   "&decimals=" + '${reportform.decimals}';
	// 跳转到对应到url上
	window.location.href = url;
}

// 点击返回按钮，触发的事件 
function <portlet:namespace />returnPage(){
	window.location.href = '<portlet:renderURL portletMode="view"  windowState="normal"></portlet:renderURL>';
}

//输出到EXCEL
function <portlet:namespace />expToExcel() {
	// 导出excel的Url
	var expUrl = "<portlet:resourceURL id='expDataToExcel'></portlet:resourceURL>"
			+ "&from="
			+ <portlet:namespace />starttime
			+ "&type="
			+ <portlet:namespace />choose_type
			;
	var removeUrl = '<portlet:resourceURL id="deleteExcelTempFile"><portlet:param name="fileName" value="${reportform.title}" /></portlet:resourceURL>';
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${reportform.title}"
			+ ".xls";
	$.ajax({
		type : "POST",
		url : expUrl,
		async : false,
		contentType : 'application/x-msdownload;charset=UTF-8',
		success : function(result) {
			$("#<portlet:namespace />tmpFrame1").attr('src', hSrc);

			// AJAX请求删除临时文件
			//$.post(removeUrl, function(result) {
			//	if (result.success) {
			//	} else {
			//		$.messager.alert('Error', result.msg, 'error');
			//	}
			//});
		},
		error : function(result) {
			alert('error');
		}
	});
}

$(function() {
	$(".form_style").show(); // 显示对应的报表
	
	// 判断是否需要显示建筑下拉列表  
	var isnotShow = "${reportform.showLegend}";
	if(isnotShow === "show"){
		$("#choose_build").show(); // 显示选择建筑
	} else {
		$("#choose_build").hide(); // 隐藏选择建筑
	}
	
	$('#<portlet:namespace />select_type').change(function(){
		<portlet:namespace />choose_type = <portlet:namespace />select_type.value;
	})
	
	// 设置对应的下拉列表的值
	$("#<portlet:namespace />select_type").val("${s_type}");
	// 设置开始时间和结束时间
	$('#<portlet:namespace />date1').val("${show_tfrom}");
	//alert("${to_date}");
	$('#<portlet:namespace />date2').val("${show_tto}");
});

// 点击文本框弹出的日历控件 
function <portlet:namespace />choosetime(id1,id2){
	<portlet:namespace />choose_type = <portlet:namespace />select_type.value;
	var dformt = 'yyyy-MM-dd';
	if (<portlet:namespace />choose_type == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type == "month") {
		dformt = 'MM';
	} else if (<portlet:namespace />choose_type == "year") {
		dformt = 'yyyy';
	}
	
	// date
	WdatePicker({
		el : '<portlet:namespace />datetime1',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			<portlet:namespace />starttime = paretime;
			
			// 显示在页面文本框上的时间
			var showtime= dp.cal.getDateStr(dformt); // 选择对应的输出格式（日报、周报、月报、年报）
			var val2 = ""; // 结束时间的值
			if (<portlet:namespace />choose_type == "day"){
				val2 = showtime;
			} else if (<portlet:namespace />choose_type == "week") {
				showtime = showWeekFirstDay(paretime);
				val2 = showWeekLastDay(paretime);
			} else if (<portlet:namespace />choose_type == "month") {
				showtime = dp.cal.getDateStr('yyyy-MM-') + "01";
				val2 = showMonthLastDay(paretime); // showMonthLastDay行数在tomcat目录下的
			} else if (<portlet:namespace />choose_type == "year") {
				val2 = showtime;
			}
			
			$('#<portlet:namespace />'+id1).val(showtime);
			$('#<portlet:namespace />'+id2).val(val2);
			<portlet:namespace />starttime = paretime;
			<portlet:namespace />endtime = val2;
		}
	});
}

	$
			.post(
					'<portlet:resourceURL id="getReportDataList"></portlet:resourceURL>',
					{
						from : <portlet:namespace />starttime,
						to : <portlet:namespace />endtime,
						type : <portlet:namespace />choose_type,
						decimals : '${reportform.decimals}'
					}, function(data) {
						//移除报表页面的tr标签的big_tr样式
						//$("tr:even").addClass("big_tr");
						
						var dataList = data.dataList;
						var cataList = data.cataList;
						var showCataList = data.showCataList;
						var showDataList = data.showDataList;

						// 最后赋值的html变量
						var html = '<table align="center" class="form_detail" border="1">';
						var firstRow = '<tr><th style="width: 70px;">日期</th>'; // 第一行的数据
						var content = ''; // 中间的内容数据
						var lastRow = ''; // 最后一行的内容数据
						
						var commonColumnList = [];
						commonColumnList.push(${reportform.commonColumn});
						
						// 报表的时间类型（day/week/month/year）
						var s_type = "${s_type}";
						if(s_type=="day"){// 日报的处理方式
							
							firstRow += '<th>${reportform.dayColumn}</th>';
							
						}
						
						// 循环添加内容数据
						for(var i=0;i<showCataList[0].length;i++){
							content += "<tr align='center'>"+(s_type=="day"?("<td>"+"${from_date}"+"</td>"):"")+"<td>"+showCataList[0][i]+"</td>";
							for(var k=0;k<commonColumnList.length;k++){
								content += '<td>'+ (showDataList[k][i] != undefined ? showDataList[k][i] : '') +'</td>';
							}
							content += "</tr>";
						}
						
						// 处理报表列头信息
						for(var i=0;i<commonColumnList.length;i++){
							firstRow += '<th>'+commonColumnList[i]+'</th>';
						}
						firstRow += '</tr>';
						
						html = html + firstRow + content;// + lastRow;
						
						html += '</table><br/><br/><br/>';
						
						$('#<portlet:namespace />reportdiv').html("");
					    $('#<portlet:namespace />reportdiv').html(html);
					    
					    // 设置模块的高度，以适应版权的高度  
					   $('#<portlet:namespace />formdiv').height($('#<portlet:namespace />reportdiv').height()+50);
					}, 'json');
</script>