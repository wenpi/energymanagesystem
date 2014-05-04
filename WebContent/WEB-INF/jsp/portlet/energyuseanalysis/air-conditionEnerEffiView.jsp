<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="date_select">
	<input id="<portlet:namespace />datetime5" type="hidden" />
	<div class="pressive" id="<portlet:namespace/>day" onclick="">日视图</div>
	<div id="<portlet:namespace/>week" onclick="">周视图</div>
	<div id="<portlet:namespace/>month" onclick="">月视图</div>
	<div class="radius" id="<portlet:namespace/>year" onclick="">年视图</div>
</div>
<div class="charts">
	<div class="look_other">
		<label class="now_data labels" id="<portlet:namespace/>now_data5"></label>
		<div class="date_comparer">
			<input id="<portlet:namespace/>comparing5" type="text"
				class="comp_data" value="" onclick="" /> <span class="comp_btn">加入对比</span>
			<div class="download" onclick=""></div>
		</div>
	</div>
	<div class="chart" id="<portlet:namespace/>chartArea5">
		<img
			src="${pageContext.request.contextPath }/public/energyStatic/public/images/air-conditionEEN.png" />
	</div>
</div>
<div class="detail">
	<div>
		<table>
			<caption>空调能效指标概览</caption>
			<tbody>
				<tr>
					<td>高效运行</td>
					<td>合理运行</td>
					<td>低效运行</td>
				</tr>
				<tr>
					<td>冷冻水泵</td>
					<td>空调系统</td>
					<td>制冷系统</td>
				</tr>
				<tr>
					<td>空调末端</td>
					<td>冷却水泵</td>
					<td>冷水机组</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
	var <portlet:namespace />time2 = '';
	if(publicTime != ""){
		<portlet:namespace />time2 = publicTime;
	} else {
		var date = new Date();
		<portlet:namespace />time2 = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
	}
	$("#<portlet:namespace/>now_data5").html(<portlet:namespace />time2);
</script>