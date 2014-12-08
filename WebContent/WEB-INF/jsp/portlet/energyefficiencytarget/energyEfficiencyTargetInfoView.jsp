<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 能效指标切换页面
 -->
<div class="div-table model_width">
	<div class="content home_reportmanager">
		<div id="main" class="home_reportmanager">
			<div>
				<div class="title_block report_form" id="_energytarget">
					<p class="block_title" id="<portlet:namespace />block_title">${tbinfo.formTitle}</p>
					<div class="table_chart_switch" id="<portlet:namespace />table_chart_switch">
						<div class="chart_switch_btn">
							<i class="icon_chart"></i>
							<p>图形视图</p>
						</div>
						<div class="chart_switch_btn">
							<i class="icon_table"></i>
							<p>表格视图</p>
						</div>
					</div>
				</div>
				<div class="tab report_page_tab nxzb">
					<div class="tab_menu">
						<ul>
							<li class="cur_tab">
								<div>
									<img
										src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
									<p>建筑碳足迹</p>
								</div>

							</li>
							<li>
								<div>
									<img
										src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
									<p>空调系统能效比</p>
								</div>
							</li>
							<li>
								<div>
									<img
										src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
									<p>制冷系统能效比</p>
								</div>
							</li>
						</ul>
					</div>

					<div class="tab_content current">
						<%@include file="../energyefficiencytarget/buildTargetView.jsp"%>
					</div>
					<div class="tab_content">
						<%@include file="../energyefficiencytarget/systemTargetView.jsp"%>
					</div>
					<div class="tab_content">
						<%@include file="../energyefficiencytarget/equipmentTargetView.jsp"%>
					</div>
					<div class="icon_bg"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="mask" class="<portlet:namespace />mask_table report_mask">
		<div class="dialog-popover dialog-zoomin-table dialog_position">
			<div class="dialog-header">
				<h3 class="tb_dialogh3"></h3>
				<div class="dialog-cancel_btn"></div>
			</div>
			<div class="dialog-body">
				<iframe name="<portlet:namespace />tmpFrame"
						id="<portlet:namespace />tmpFrame" width="1" height="1"
						style="visibility: hidden; position: absolute; display: none"></iframe>
				<input id="<portlet:namespace />datetime" type="hidden" />
				<div class="dialog-popover-btn-group">
					<div class="filter_widget tool_1">
						<div class="filter_label has_border_radius_left">选择建筑</div>
						<select class="selectpicker_2">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
						</select>
					</div>

					<div class="filter_widget tool_2">
						<div class="filter_label has_border_radius_left">选择冷机</div>
						<select class="selectpicker_2">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
						</select>
					</div>
					<div class="filter_widget tool_3">
						<div class="filter_label has_border_radius_left">选择类型</div>
						<select class="selectpicker_2"
							id="<portlet:namespace />choose_type">
							<option selected="selected" value="day">日报</option>
							<option value="week">周报</option>
							<option value="month">月报</option>
							<option value="year">年报</option>
						</select>
					</div>
					<div class="filter_widget tool_4">
						<div class="filter_label has_border_radius_left">选择日期</div>
						<input type="text" id="<portlet:namespace />from_date"
							onclick="<portlet:namespace />selectdate()" /> <span class="to">至</span>
						<input type="text" id="<portlet:namespace />to_date"
							readonly="readonly" />
					</div>
					<div class="filter_widget tool_5">
						<div class="filter_label has_border_radius_left">选择设备</div>
						<select class="selectpicker_2">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
						</select>
					</div>
					<div class="filter_widget tool_6">
						<div class="filter_label has_border_radius_left">选择年份</div>
						<input type="text" />
					</div>
					<div class="tool_groupt">
						<div class="has_border_radius_left search_btn"
							onclick="<portlet:namespace />confirm()"></div>
						<div class="has_border_radius_right downLoad_btn" onclick="<portlet:namespace />expToExcel()"></div>
					</div>
				</div>
				<!-- table -->
				<div id="<portlet:namespace />zoomax" style="width:940px;height:660px">2</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
// 设置全局变量，用来保存当前查看图表的相应首选项信息
var <portlet:namespace />decimalsForm = '';// 保留小数位数
var <portlet:namespace />commonColumn = '';// 公共列
var <portlet:namespace />dayColumn ='';//特殊列
var <portlet:namespace />start_date = '';//开始时间
//name、id、ispd,multiplier信息
var <portlet:namespace />name = '';
var <portlet:namespace />id = '';
var <portlet:namespace />ispd = '';
var <portlet:namespace />multiplier = '';
//当前页数、每页显示系数以及最大页数信息
var <portlet:namespace />curPage = 1;
var <portlet:namespace />size = report_pageSize;
var <portlet:namespace />maxPage = 0;
/*查找与模块标题内容相同模块中的层，并对其添加相应样式*/
if($("#<portlet:namespace />block_title").text() == '${tbinfo.formTitle}'){
	$("#<portlet:namespace />table_chart_switch div:eq("+ ${tbinfo.chooseView} +")").addClass("btn_press");
}

$(function(){
	 $(".chart_switch_btn").on("click", function(){
			//调用各子页面加载方法
			<portlet:namespace />loadData1();
			<portlet:namespace />loadData2();
			<portlet:namespace />loadData3();
	 });
	 
	 // 关闭放大窗口时重置当前页数，并隐藏相应div
	 $(".dialog-popover .dialog-cancel_btn").on("click", function(){
		<portlet:namespace />curPage = 1;
		$('#<portlet:namespace />zoomax').html("");// 清空表格
		$(this).parent().parent().hide();
		$(this).parent().parent().find("input").val("");
		$(this).parentsUntil(".home_reportmanager").find("#mask").hide();
		//$(this).parent().parent().parent().hide();
		//$("#mask").hide();
	});
});

//选择时间（日、周、月、年）
function <portlet:namespace />selectdate(){
	var type = $("#<portlet:namespace />choose_type").val();
	var dformt = 'yyyy-MM-dd';
	if (type == "day") {
		dformt = 'yyyy-MM-dd';
	} else if (type == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (type == "month") {
		dformt = 'MM';
	} else if (type == "year") {
		dformt = 'yyyy';
	}

	WdatePicker({
		el : '<portlet:namespace />datetime1',
		dateFmt : dformt,
		onpicked : function(dp) {
			var showtime = dp.cal.getDateStr(dformt);
			var hidetime = dp.cal.getDateStr('yyyy-MM-dd');
			// 周报的开始时间和结束时间需要做特殊处理 
			if (type == "week") {
				$('#<portlet:namespace />from_date').val(showWeekFirstDay(showtime));
				$('#<portlet:namespace />to_date').val(showWeekLastDay(showtime));
			} else {
				$('#<portlet:namespace />from_date').val(showtime);
				$('#<portlet:namespace />to_date').val(showtime);
			}
			<portlet:namespace />start_date = hidetime;
		}
	});
}

// 确认查询表格视图数据
function <portlet:namespace />confirm(){
	<portlet:namespace />getForm(<portlet:namespace />name,<portlet:namespace />id,<portlet:namespace />ispd,<portlet:namespace />start_date,$('#<portlet:namespace />to_date').val(),$('#<portlet:namespace />choose_type').val(),<portlet:namespace />decimalsForm,<portlet:namespace />commonColumn,<portlet:namespace />dayColumn);
}

//获取表格视图数据方法
function <portlet:namespace />getForm(name,id,ispd,start_date,end_date,choose_type,decimalsForm,commonColumn,dayColumn){
	$.post(
			'<portlet:resourceURL id="getReportDataList"></portlet:resourceURL>',
			{
				from:start_date, // 设置开始时间
				to:end_date,	// 设置结束时间
				type:choose_type, // 设置选择类型
				decimals:decimalsForm,	// 设置小数位数
				name:name, // 设置name
				id:id,	// 设置id
				ispd:ispd,	// 设置ispd
				curPage:<portlet:namespace />curPage,	// 当前页数
				size:<portlet:namespace />size	// 每页显示条数
			},function(data){
				var showCataList = data.showCataList; // 保存表头信息
				var showDataList = data.showDataList; // 保存内容数据
				<portlet:namespace />maxPage = data.maxPage; //保存最大页数信息
				// 生成表格
				var html = "<div class='table_block'><table style='width:900px;'><thead>"; 
				var firstRow = "<tr><th style='width: 75px;'>日期</th>"; // 表头信息部分
				var content = ""; // 表格内容
				var commonColumnList = commonColumn.split(",") ; // 公共列信息
				//commonColumnList.push(commonColumn); 
				
				if(choose_type == "day"){
					firstRow += '<th>' + dayColumn + '</th>';
				}

				//循环添加内容数据
				for(var i = 0 ;i<showCataList[0].length;i++){
					content +="<tr>" + (choose_type == "day"?("<td>" + start_date + "</td>"):"") + "<td>" + showCataList[0][i] + "</td>";
					for(var j = 0;j<commonColumnList.length;j++){
						content += '<td>'+ (showDataList[j][i] != undefined ? showDataList[j][i] : '') 
						+'</td>';
					}
					content +="</tr>";
				}
				
				//添加表头信息
				for(var i = 0;i<commonColumnList.length;i++){
					firstRow += '<th>'+commonColumnList[i]+'</th>';
				}
				firstRow += '</tr>';
				html = html + firstRow + "</thead>"+ content;
				html += '</table></div><div class="page"><div class="control-btn page-prev" onclick = "<portlet:namespace />previousPage()">&lt;上一页</div><div class="control-btn page-prev" onclick = "<portlet:namespace />nextPage()">下一页&gt;</div></div>';
				$('#<portlet:namespace />zoomax').html("");
				$('#<portlet:namespace />zoomax').html(html);
			},'json');
}

//上翻页
function <portlet:namespace />previousPage(){
	// 当前页数大于1的时候可以有上一页
	if(<portlet:namespace />curPage>1){
		<portlet:namespace />curPage--;
		<portlet:namespace />getForm(<portlet:namespace />name,<portlet:namespace />id,<portlet:namespace />ispd,<portlet:namespace />start_date,$('#<portlet:namespace />to_date').val(),$('#<portlet:namespace />choose_type').val(),<portlet:namespace />decimalsForm,<portlet:namespace />commonColumn,<portlet:namespace />dayColumn);
	}

}

// 下翻页
function <portlet:namespace />nextPage(){
	if(<portlet:namespace />curPage<<portlet:namespace />maxPage){
		<portlet:namespace />curPage++;
		<portlet:namespace />getForm(<portlet:namespace />name,<portlet:namespace />id,<portlet:namespace />ispd,<portlet:namespace />start_date,$('#<portlet:namespace />to_date').val(),$('#<portlet:namespace />choose_type').val(),<portlet:namespace />decimalsForm,<portlet:namespace />commonColumn,<portlet:namespace />dayColumn);
	}
}
// 获取放大表格视图信息
function <portlet:namespace />zoomax(choose_name,choose_id,choose_ispd,start_date,input_start,input_end,choose_type,decimalsForm,commonColumn,dayColumn,multiplier,thisform){
	<portlet:namespace />getForm(choose_name,choose_id,choose_ispd,start_date,input_end,choose_type,decimalsForm,commonColumn,dayColumn);
	// 为选择日期的输入框填入与概览视图相同的日期
	$('#<portlet:namespace />from_date').val(input_start);
	$('#<portlet:namespace />to_date').val(input_end);
	//获取开始时间的默认值，以便在未选择日期时通过默认时间查询
	<portlet:namespace />start_date = start_date;
	// 将选择类型默认设置为与概览图相同 
	$('#<portlet:namespace />choose_type').val(choose_type);
	// 将当前查看的图表相应的首选项信息保存到全局变量中 
	<portlet:namespace />decimalsForm = decimalsForm;// 保留小数位数
	<portlet:namespace />commonColumn = commonColumn;// 公共列
	<portlet:namespace />dayColumn = dayColumn;//特殊列
	<portlet:namespace />multiplier = multiplier;//是否乘数
	// name、id、ispd信息
	<portlet:namespace />name = choose_name;
    <portlet:namespace />id = choose_id;
	<portlet:namespace />ispd = choose_ispd;
	//显示全部信息的层
	$(".<portlet:namespace />mask_table").show();
	var classArr = $(thisform).parentsUntil(".report_page_tab").parent().attr("class");
	var dialogTitle = $(thisform).parentsUntil(".report_page_tab").parent().prev().find(".block_title").text();
	$(".<portlet:namespace />mask_table .filter_widget").hide();
	showToolBar(classArr);
	$(".dialog-zoomin-table > .dialog-header h3").text(dialogTitle);
	$(".dialog-zoomin-table").show();
	var category = $(".tool_3 #<portlet:namespace />choose_type option:selected").text();
	$(".tool_3 .filter-option").text(category);
}

//导出数据到excel
function <portlet:namespace />expToExcel(){
	// 导出excel的Url
	var expUrl = "<portlet:resourceURL id='expDataToExcel'></portlet:resourceURL>"
		+ "&name="
		+ <portlet:namespace />name
		+ "&id="
		+ <portlet:namespace />id
		+ "&ispd="
		+ <portlet:namespace />ispd
		+ "&from="
		+ <portlet:namespace />start_date
		+ "&to="
		+ $('#<portlet:namespace />to_date').val()
		+ "&type="
		+ $('#<portlet:namespace />choose_type').val()
		+ "&decimals="
		+ <portlet:namespace />decimalsForm
		+ "&multip="
		+ <portlet:namespace />multiplier
		+ "&dayColumn="
		+ <portlet:namespace />dayColumn
		+ "&commonColumn="
		+ <portlet:namespace />commonColumn
		;
	var hSrc = "http://" + document.location.host
		+ "/energymanagesystem/uploadfiles/" + "${tbinfo.formTitle}"
		+ ".xls";
	$.ajax({
		type : "POST",
		url : expUrl,
		async : false,
		contentType : 'application/x-msdownload;charset=UTF-8',
		success : function(result) {
			$("#<portlet:namespace />tmpFrame").attr('src', hSrc);

		},
		error : function(result) {
			alert('error');
		}
	});
}
</script>
