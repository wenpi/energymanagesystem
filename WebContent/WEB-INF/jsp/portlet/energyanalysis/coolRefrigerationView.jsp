<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午7点55分
	LastModified Date:
	Description: 能效分析-冷机制冷量
 -->

<div class="div-table">

	<div class="content450 center left20">
		<div class="analysis_3">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${coolrefrigeration.backgroundColor};">
					<h4 class="h4size">冷机制冷量</h4>
					<div>${coolrefrigeration.description}</div>
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

				<div id="<portlet:namespace />coolrefrigeration"
					class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${coolrefrigeration.linkUrl_1}">${coolrefrigeration.linkName_1}</a></i><i><a
						href="${coolrefrigeration.linkUrl_2}">${coolrefrigeration.linkName_2}</a></i><i><a
						href="${coolrefrigeration.linkUrl_3}">${coolrefrigeration.linkName_3}</a></i>
				</div>

			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	//为  冷机制冷量  报表填充数据 
	//renderToColumnAndLineCharts('<portlet:namespace />coolrefrigeration', 'area', '制冷量(KW)', '#ECC9AC', '5', 'white');
	renderToColumnAndLineCharts('<portlet:namespace />coolrefrigeration',
			"${coolrefrigeration.chartType}",
			"${coolrefrigeration.yLeftTitle}",
			"${coolrefrigeration.lineColor}", "${coolrefrigeration.xStep}",
			"${coolrefrigeration.fillColor}");
</script>