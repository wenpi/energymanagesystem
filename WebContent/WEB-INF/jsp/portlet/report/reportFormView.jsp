<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-8下午7点02分
	LastModified Date:
	Description: 报表整理-大页面
 -->

<div class="div-table">

	<div id="msg"></div>

	<div class="reportcontent center">
		<div class="form_list span12 report_m_left">

			<div class="span12 module ">
				<div class="span4">

					<div class="form_title"
						style="background-color:${reportform.backgroundColor};">
						<p>${reportform.title}</p>
					</div>
					<div class="form_content"
						style="background-color:${reportform.backgroundColor_1};">
						<span style="font-size: 12px;"><h5>${reportform.description}</h5></span>
						<div class="choice_date">
							<input id="<portlet:namespace />datetime" type="hidden" /> <select
								class="format_select" name="<portlet:namespace />format_select"
								id="<portlet:namespace />format_select">
								<option selected="selected" value="day">日报</option>
								<option value="week">周报</option>
								<option value="month">月报</option>
								<option value="year">年报</option>
							</select>
							<div class="date_mark">
								<input id="<portlet:namespace />tfrom" type="hidden" /> <input
									id="<portlet:namespace />tto" type="hidden" /> <input
									type="text" class="date_pick"
									id="<portlet:namespace />from_date"
									onclick="<portlet:namespace />selectdate()" /> <label>至</label>
								<input type="text" class="date_pick"
									id="<portlet:namespace />to_date" readonly="readonly" /> <label>√</label>
							</div>
						</div>
						<div class="division1"></div>
						<div class="button_group">
							<div class="preview" id="<portlet:namespace />reportbrowse">
								<a class="report_href"
									href="javascript:<portlet:namespace />query();">查 询 </a>
							</div>
						</div>
						<iframe name="<portlet:namespace />tmpFrame"
							id="<portlet:namespace />tmpFrame" width="1" height="1"
							style="visibility: hidden; position: absolute; display: none"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	//设置顶部的皮肤背景颜色 
	try{
		$('#nav_bg_div').css("background-color", "#6699CC");
		$('.nav_gat_bar>li').css("background-color", "#4885C1");
	}catch(e){}

	var $<portlet:namespace />choose_type = ""; // 存储对应的选择类型
	
	// 监听select标签的改变事件
	$('#<portlet:namespace />format_select').change(function() {
		$<portlet:namespace />choose_type = $('#<portlet:namespace />format_select')
				.val();
	});

	// 选择时间（日、周、月、年）
	// id1表示当前页面上显示的时间 
	function <portlet:namespace />selectdate() {
		var type = $<portlet:namespace />choose_type;
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
			el : '<portlet:namespace />datetime',
			dateFmt : dformt,
			onpicked : function(dp) {
				var showtime = dp.cal.getDateStr(dformt);
				var hidetime = dp.cal.getDateStr('yyyy-MM-dd');
				// 周报的开始时间和结束时间需要做特殊处理 
				if (type == "week") {
					$('#<portlet:namespace />from_date').val(showWeekFirstDay(showtime));
					$('#<portlet:namespace />to_date').val(showWeekLastDay(showtime));
					$('#<portlet:namespace />tfrom').val(showWeekFirstDay(showtime));
					$('#<portlet:namespace />tto').val(showWeekLastDay(showtime));
				} else {
					$('#<portlet:namespace />from_date').val(showtime);
					$('#<portlet:namespace />to_date').val(showtime);
					$('#<portlet:namespace />tfrom').val(hidetime);
					$('#<portlet:namespace />tto').val(hidetime);
				}				
			}
		});
	}

	// 预览报表数据
	function <portlet:namespace />query() {
		// 获取开始时间和结束时间在页面上的值
		var fdate = $('#<portlet:namespace />tfrom').val();
		var tdate = $('#<portlet:namespace />tto').val();
		// 判断开始时间是否为空
		if (fdate == "") {
			alert("请输入开始时间!");return false;
		}
		// 判断结束时间是否为空
		if (tdate == "") {
			alert("请输入结束时间!");return false;
		}

		// 拼接URL并传递参数到后台
		var url = '<portlet:renderURL portletMode="view" windowState="maximized"><portlet:param name="action" value="printReportInfo"></portlet:param><portlet:param name="time_type" value="printReportInfo"></portlet:param></portlet:renderURL>';
		url += "&type=" + $<portlet:namespace />choose_type;
		url += "&show_tfrom=" + $('#<portlet:namespace />from_date').val() + "&show_tto=" + $('#<portlet:namespace />to_date').val()
			+ "&from=" + fdate + "&to=" + tdate + "&decimals="
			+ '${reportform.decimals}';
		// 跳转到对应到url上
		window.location.href = url;
	}

	// 为选择的类型赋值 
	$<portlet:namespace />choose_type = $('#<portlet:namespace />format_select')
			.val();
</script>
