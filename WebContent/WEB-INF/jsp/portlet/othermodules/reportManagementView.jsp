<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 报表管理展示页面
 -->
<div class="div-table">
	<div class="chart_group_1 <c:if test="${tbinfo.gridLineDashStyle6 != 'doubleColumn'}">otherframe1</c:if><c:if test="${tbinfo.gridLineDashStyle6 == 'doubleColumn'}">doubleColumn</c:if>">
		<div class="right_chart nomargin">
			<div class="state_list accounting_reporting">
				<div class="state_list_title"></div>
				<div class="state_list_detail"></div>
				<!-- <div class="err_list">
					<p>能耗报表</p>
					<p>能效指标</p>
					<p>运行参数</p>
				</div> -->
				<div class="err_list has_border_radius_bottom">
					<!-- <p>设备台账</p>
					<p>能源账单</p> -->
					<p onclick = "javascript:document.location.href='/web/guest/report#_energyreport'">能耗报表</p>
					<p onclick = "javascript:document.location.href='/web/guest/report#_energytarget'">能效指标</p>
					<p onclick = "javascript:document.location.href='/web/guest/report#_measurereport'">计量报表</p>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var <portlet:namespace />titlename = '${tbinfo.title}';
	if(<portlet:namespace />titlename == ''){
		$(".accounting_reporting .state_list_title").text("核算与报告");
	}else{
		$(".accounting_reporting .state_list_title").text(<portlet:namespace />titlename);
	}
</script>