<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午8点33分
	LastModified Date:
	Description: 能效分析-空调末端能效比
 -->

<div class="div-table">

	<div class="content450 center left20">
		<div class="analysis_4">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${airconditionendeer.backgroundColor};">
					<h4 class="h4size">空调末端能效比</h4>
					<div>${airconditionendeer.description}</div>
				</div>


				<div class="timediv50">
					<div id="<portlet:namespace />thisday" style="color: red;"
						class="inlinedivstyle tdatt"
						onclick="selectValue('<portlet:namespace />thisday')">日视图</div>
					<div id="<portlet:namespace />thisweek"
						class="inlinedivstyle tdatt"
						onclick="selectValue('<portlet:namespace />thisweek')">周视图</div>
					<div id="<portlet:namespace />thismonth"
						class="inlinedivstyle tdatt"
						onclick="selectValue('<portlet:namespace />thismonth')">月视图</div>
					<div id="<portlet:namespace />thisyear"
						class="inlinedivstyle tdatt"
						onclick="selectValue('<portlet:namespace />thisyear')">年视图</div>
					<div class="inlinedivstyle selectdivstyle">
						&nbsp;与&nbsp; <select name="<portlet:namespace />timeselect"
							id="<portlet:namespace />timeselect" class="selectstyle">
							<option selected="selected"></option>
						</select> &nbsp;对比&nbsp;
					</div>
					<div id="<portlet:namespace />thisyearddd" class="tdatt output"
						onclick="selectValue('<portlet:namespace />thisyear')">输出</div>
				</div>

				<div id="<portlet:namespace />airconditionendeer"
					class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${airconditionendeer.linkUrl_1}">${airconditionendeer.linkName_1}</a></i>
					<i><a href="${airconditionendeer.linkUrl_2}">${airconditionendeer.linkName_2}</a></i>
					<i><a href="${airconditionendeer.linkUrl_3}">${airconditionendeer.linkName_3}</a></i>
				</div>

			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	//为  空调末端能效比  报表填充数据 
	//rendToChartMoreSeries('<portlet:namespace />airconditionendeer', 'line', 'EERt', '#4BACC6', '5', 'white', '实测值', 'line','参考值', '#D668BE','','','','');

	rendToChartMoreSeries('<portlet:namespace />airconditionendeer',
			"${airconditionendeer.chartType_1}",
			"${airconditionendeer.yLeftTitle}",
			"${airconditionendeer.lineColor_1}", "${airconditionendeer.xStep}",
			"${airconditionendeer.fillColor_1}",
			"${airconditionendeer.dataName_1}",
			"${airconditionendeer.chartType_2}",
			"${airconditionendeer.dataName_2}",
			"${airconditionendeer.fillColor_2}",
			"${airconditionendeer.lineWidth}", 
			"${airconditionendeer.symbol}", 
			'', 
			"${airconditionendeer.ySymbol}");
</script>