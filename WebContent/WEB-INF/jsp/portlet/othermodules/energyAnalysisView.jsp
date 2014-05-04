<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 能效分析展示页面
 -->
<div class="div-table">
	<div class="chart_group_1 <c:if test="${tbinfo.gridLineDashStyle6 != 'doubleColumn'}">otherframe</c:if><c:if test="${tbinfo.gridLineDashStyle6 == 'doubleColumn'}">doubleColumn</c:if>">
		<div class="right_chart nomargin">
			<div class="chart">
				<div class="chart_top">
					<div class="tb_lefttitle">能效分析</div>
					<table>
						<tbody>
							<tr>
								<td>耗能低</td>
								<td><div class="lowest"></div></td>
							</tr>
							<tr>
								<td></td>
								<td><div class="low"></div></td>
							</tr>
							<tr>
								<td>中等</td>
								<td><div class="midest"></div></td>
							</tr>
							<tr>
								<td></td>
								<td><div class="mid"></div></td>
							</tr>
							<tr>
								<td>耗能高</td>
								<td><div class="high"></div></td>
							</tr>
						</tbody>
					</table>
					<div class="level">
						<img
							src="${pageContext.request.contextPath}/styles/second/images/level1.png" />
					</div>
				</div>
				<div class="chart_bottom">
					<div class="energy_analysis_text">
						<div>
							<p class="device_list">日用电指标</p>
							<p class="unit">W/㎡</p>
							<p class="cosume_number">1,500</p>
						</div>
						<div>
							<p class="device_list">日制冷量</p>
							<p class="unit">kWh</p>
							<p class="cosume_number">1,600</p>
						</div>
						<div>
							<p class="device_list">日冷机COP</p>
							<p class="unit">&nbsp;</p>
							<p class="cosume_number">230</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var <portlet:namespace />start_date = '';
// 获取底部对应的值
function <portlet:namespace />getButtomValue(){
	$.post(
			'<portlet:resourceURL id="getDatasForNamesAndAtts"></portlet:resourceURL>',
			{
				from : <portlet:namespace />start_date,
				name : 'electricity,cooling_capacity,cop',
				id : 'total,chiller,chiller',
				ispd : '0,0,0',
				decimals : '${tbinfo.decimals}',
				att : 'sum',
				type : 'day'
			},
			function(data) {
				// 为相应的位置赋值
				var valueList = data.data;
				$(".energy_analysis_text > div:eq(0) > .cosume_number").text(valueList[0][0][0]);
				$(".energy_analysis_text > div:eq(1) > .cosume_number").text(valueList[1][0][0]);
				$(".energy_analysis_text > div:eq(2) > .cosume_number").text(valueList[2][0][0]);
			}, 'json');
}
//根据首选项获取图表数据查询时间，默认显示当前时间
if(publicTime != ""){
	<portlet:namespace />start_date = publicTime;
} else {
	if("${tbinfo.defaulttime}"==""){
		var nowdate = new Date();
		<portlet:namespace />start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1) + "-"
		+ nowdate.getDate();
	}else{
		<portlet:namespace />start_date = "${tbinfo.defaulttime}";
	}
}
<portlet:namespace />getButtomValue();
</script>