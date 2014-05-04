<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午8点48分
	LastModified Date:
	Description: 能效分析-空调系统能效比
 -->

<div class="div-table">

	<div class="content450 center left20">
		<div class="analysis_2">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${airconditionsystemeer.backgroundColor};">
					<h4 class="h4size">空调系统能效比</h4>
					<div>${airconditionsystemeer.description}</div>
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

				<div id="<portlet:namespace />airconditionsystemeer"
					class="chartdivstyle"></div>

				<div class="link_style">
					<i><a href="#">&nbsp;</a></i>
				</div>
			</div>
		</div>
	</div>

</div>


<script type="text/javascript">
	//为 空调系统能效比  报表填充数据 
	//rendToChartMoreSeries('<portlet:namespace />airconditionsystemeer', 'column', 'EERs', '#00B0F0', '5', 'white', '实测值', 'column', '参考值', '#F79646', '', '', '', '');

	rendToChartMoreSeries('<portlet:namespace />airconditionsystemeer',
			"${airconditionsystemeer.chartType_1}",
			"${airconditionsystemeer.yLeftTitle}",
			"${airconditionsystemeer.lineColor_1}",
			"${airconditionsystemeer.xStep}",
			"${airconditionsystemeer.fillColor_1}",
			"${airconditionsystemeer.dataName_1}",
			"${airconditionsystemeer.chartType_2}",
			"${airconditionsystemeer.dataName_2}",
			"${airconditionsystemeer.fillColor_2}", 
			"${airconditionsystemeer.lineWidth}", 
			"${airconditionsystemeer.symbol}", 
			'', 
			"${airconditionsystemeer.ySymbol}");
</script>