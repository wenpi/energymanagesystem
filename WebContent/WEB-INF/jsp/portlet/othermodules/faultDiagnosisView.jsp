<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 故障诊断/节能评估展示页面
 -->
<div class="div-table">
	<div class="chart_group_1 otherframe">
		<div class="left_chart">
			<div class="state_list" id="<portlet:namespace />faultDiagnosis">
				<div class="state_list_title" id="<portlet:namespace />faultDiagnosis_title"></div>
				<div class="state_list_detail" id="<portlet:namespace />faultDiagnosis_detail">
					<p></p>
					<h1>
						 <span><sup></sup></span>
					</h1>
				</div>
				<div class="err_list">
					<span class="what_device">冷机</span> <span class="what_err">1号冷机回水温度超过最高值</span>
					<span class="when">13:21:33</span>
				</div>
				<div class="err_list">
					<span class="what_device">冷机</span> <span class="what_err">1号冷机回水温度超过最高值</span>
					<span class="when">13:21:33</span>
				</div>
				<div class="err_list has_border_radius_bottom">
					<span class="what_device">冷机</span> <span class="what_err">1号冷机回水温度超过最高值</span>
					<span class="when">13:21:33</span>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//根据首选项获取图表数据查询时间，默认显示当前时间
	var <portlet:namespace />start_date = "";
	var <portlet:namespace />todaytimes = "";
	//初始化页面
	function <portlet:namespace/>initpage(){
		//保存星期信息的数组
		var weekday= [];
		weekday[0]="星期日";
		weekday[1]="星期一";
		weekday[2]="星期二";
		weekday[3]="星期三";
		weekday[4]="星期四";
		weekday[5]="星期五";
		weekday[6]="星期六";
		
		if(publicTime != ""){
			<portlet:namespace />start_date = publicTime;
			var dates = new Date(<portlet:namespace />start_date.substring(0,4),(parseInt(<portlet:namespace />start_date.substring(5,7)) - 1),<portlet:namespace />start_date.substring(8,10));
			<portlet:namespace />todaytimes = <portlet:namespace />start_date.substring(5, 7) + "月" + <portlet:namespace />start_date.substring(8, 10) + "日 " + weekday[dates.getDay()];//获取格式为MM月DD日 星期的日期
		} else {
			var nowdate = new Date();
			if ("${tbinfo.defaulttime}" == "") {
				<portlet:namespace />start_date = nowdate.getFullYear() + "-"
						+ (nowdate.getMonth() + 1) + "-" + nowdate.getDate();
				<portlet:namespace />todaytimes = (nowdate.getMonth() + 1) + "月" + nowdate.getDate() + "日 " + weekday[nowdate.getDay()];//获取格式为MM月DD日 星期的日期
			} else {
				var dates = new Date(<portlet:namespace />start_date.substring(0,4),(parseInt(<portlet:namespace />start_date.substring(5,7)) - 1),<portlet:namespace />start_date.substring(8,10));
				<portlet:namespace />start_date = "${tbinfo.defaulttime}";
				<portlet:namespace />todaytimes = <portlet:namespace />start_date.substring(5, 7) + "月" + <portlet:namespace />start_date.substring(8, 10) + "日 " + weekday[dates.getDay()];//获取格式为MM月DD日 星期的日期
			}
		}
		
		$("#<portlet:namespace />faultDiagnosis_detail p").text(<portlet:namespace />todaytimes);
		
		var <portlet:namespace />frametype = "${tbinfo.chartType}";
		
		if (<portlet:namespace />frametype == "faultdiagnosis") {
			$("#<portlet:namespace />faultDiagnosis").removeClass("finance").addClass("err_diagnosis");
			$("#<portlet:namespace />faultDiagnosis_title").text("故障诊断");
			$("#<portlet:namespace />faultDiagnosis_detail h1").html("当日累计发生故障 <span>15<sup>次</sup></span>");
		} else {
			$("#<portlet:namespace />faultDiagnosis").removeClass("err_diagnosis").addClass("finance");
			$("#<portlet:namespace />faultDiagnosis_title").text("财务分析");
			$("#<portlet:namespace />faultDiagnosis_detail h1").html("本月能源费用 <span class='finance_count'>53,526<sup>元</sup></span>");
		}
	}
	//调用初始化页面方法
	<portlet:namespace />initpage();
</script>