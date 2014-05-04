<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午8点06分
	LastModified Date:
	Description: 能效分析-人均空调系统能耗
 -->

<div class="div-table">

	<div class="content450 center left20">
		<div class="analysis_1">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${avgairconditionconsumption.backgroundColor};">
					<h4 class="h4size">人均空调系统能耗</h4>
					<div>${avgairconditionconsumption.description}</div>
				</div>


				<div class="timediv50">
					<div id="<portlet:namespace />thisday" style="color: red;"
						class="inlinediv tdatt"
						onclick="selectValue('<portlet:namespace />thisday')">日视图</div>
					<div id="<portlet:namespace />thisweek" class="inlinediv tdatt"
						onclick="selectValue('<portlet:namespace />thisweek')">周视图</div>
					<div id="<portlet:namespace />thismonth" class="inlinediv tdatt"
						onclick="selectValue('<portlet:namespace />thismonth')">月视图</div>
					<div id="<portlet:namespace />thisyear" class="inlinediv tdatt"
						onclick="selectValue('<portlet:namespace />thisyear')">年视图</div>
					<div class="inlinediv selectdivstyle">
						&nbsp;与&nbsp; <select name="<portlet:namespace />timeselect"
							id="<portlet:namespace />timeselect" class="selectstyle">
							<option selected="selected"></option>
						</select> &nbsp;对比&nbsp;
					</div>
					<div id="<portlet:namespace />thisyearddd" class="tdatt output"
						onclick="selectValue('<portlet:namespace />thisyear')">输出</div>

				</div>

				<div id="<portlet:namespace />avgairconditionconsumption"
					class="chartdivstyle"></div>

				<div class="link_style">
					<i><a href="#">&nbsp;</a></i>
				</div>

			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	//为 人均空调系统能耗  报表填充数据 
	//renderToColumnAndLineCharts( '<portlet:namespace />avgairconditionconsumption', 'column', '人均空调能耗(kWh/人天)', '#F79646', '5', '');
	renderToColumnAndLineCharts(
			'<portlet:namespace />avgairconditionconsumption',
			"${avgairconditionconsumption.chartType}",
			"${avgairconditionconsumption.yLeftTitle}",
			"${avgairconditionconsumption.lineColor}",
			"${avgairconditionconsumption.xStep}",
			"${avgairconditionconsumption.fillColor}");
</script>