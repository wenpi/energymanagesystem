<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午8点53分
	LastModified Date:
	Description: 能效分析-制冷系统能效比
 -->

<div class="div-table">

	<div class="content450 center left20">
		<div class="analysis_2">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${coolsystemeer.backgroundColor};">
					<h4 class="h4size">制冷系统能效比</h4>
					<div>${coolsystemeer.description}</div>
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

				<div id="<portlet:namespace />coolsystemeer" class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${coolsystemeer.linkUrl_1}">${coolsystemeer.linkName_1}</a></i>
				</div>

			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	//为 制冷系统能效比  报表填充数据 
	//rendToChartMoreSeries('<portlet:namespace />coolsystemeer', 'line', 'EERr', '#F79748', '5', 'white', '实测值', 'area', '参考值', '#89C4FF', '0', '', '', '');

	rendToChartMoreSeries('<portlet:namespace />coolsystemeer',
			"${coolsystemeer.chartType_1}", "${coolsystemeer.yLeftTitle}",
			"${coolsystemeer.lineColor_1}", "${coolsystemeer.xStep}",
			"${coolsystemeer.fillColor_1}", "${coolsystemeer.dataName_1}",
			"${coolsystemeer.chartType_2}", "${coolsystemeer.dataName_2}",
			"${coolsystemeer.fillColor_2}", "${coolsystemeer.lineWidth}", 
			"${cooltrafficcoefficient.symbol}", 
			'', 
			"${cooltrafficcoefficient.ySymbol}");
</script>