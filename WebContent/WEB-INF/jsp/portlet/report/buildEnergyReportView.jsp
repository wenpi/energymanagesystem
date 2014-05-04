<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-8下午7点11分
	LastModified Date:
	Description: 报表整理-建筑总用能报表
 -->

<portlet:actionURL var="printReportURL">
	<portlet:param name="action" value="printReportInfo" />
</portlet:actionURL>

<div class="div-table">

	<div class="form_title">
		<p>建筑总用能报表</p>
	</div>
	<div class="form_content">
		<h5>文字描述</h5>
		<div class="choice_date">
			<select class="format_select">
				<option selected="true">日报</option>
				<option>周报</option>
				<option>月报</option>
				<option>年报</option>
			</select>
			<div class="date_mark">
				<input type="text" class="date_pick" id="from_date" name="from_date" />
				<label for="to">至</label> <input type="text" class="date_pick"
					id="to" name="to" /> <label>√</label>
			</div>
		</div>
		<div class="division1"></div>
		<div class="button_group">
			<div class="print" id="reportprint">打印</div>
			<div class="outputreport" id="reportoutput">输出</div>
			<div class="preview" id="reportbrowse">预览</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	function output_report() {
		$.post('${printReportURL}', {
			type : 'test_type_1',
			build : 'build_1',
			floor : 'floor_1',
			tspan : 'tspan_1'
		}, function(data) {
			alert('success');
		});

	}

	// 打印报表
	$('#reportprint').click(function() {
		output_report();
	});

	$("#from_date").datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 1,
		dateFormat : "yy-m-d",
		onClose : function(selectedDate) {
			$(".to").datepicker("option", "minDate", selectedDate);
		}
	});
</script>

