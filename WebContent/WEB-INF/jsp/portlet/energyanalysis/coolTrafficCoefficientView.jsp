<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午8点22分
	LastModified Date:
	Description: 能效分析-冷却水输运系数
 -->

<div class="div-table">

	<div class="content450 center left20">
		<div class="analysis_3">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${cooltrafficcoefficient.backgroundColor};">
					<h4 class="h4size">冷却水输运系数</h4>
					<div>${cooltrafficcoefficient.description}</div>
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

				<div id="<portlet:namespace />cooltrafficcoefficient"
					class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${cooltrafficcoefficient.linkUrl_1}">${cooltrafficcoefficient.linkName_1}</a></i>
					<i><a href="${cooltrafficcoefficient.linkUrl_2}">${cooltrafficcoefficient.linkName_2}</a></i>
				</div>

			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	//为 冷却水输运系数  报表填充数据 
	//rendToChartMoreSeries('<portlet:namespace />cooltrafficcoefficient', 'column', 'WTFchw', '#D4DEFF', '5', '', '实测值', 'line', '参考值', '#FF0000', '', '', '', '');

	rendToChartMoreSeries('<portlet:namespace />cooltrafficcoefficient',
			"${cooltrafficcoefficient.chartType_1}",
			"${cooltrafficcoefficient.yLeftTitle}",
			"${cooltrafficcoefficient.lineColor_1}",
			"${cooltrafficcoefficient.xStep}",
			"${cooltrafficcoefficient.fillColor_1}",
			"${cooltrafficcoefficient.dataName_1}",
			"${cooltrafficcoefficient.chartType_2}",
			"${cooltrafficcoefficient.dataName_2}",
			"${cooltrafficcoefficient.fillColor_2}", 
			"${cooltrafficcoefficient.lineWidth}", 
			"${cooltrafficcoefficient.symbol}", 
			'', 
			"${cooltrafficcoefficient.ySymbol}");
</script>