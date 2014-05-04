<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午5点27分
	LastModified Date:
	Description: 故障诊断
 -->


<div class="div-table m_top">

	<div class="span445 row-fluid">
		<div id="runMonitor">
			<div class="sub_chart" id="<portlet:namespace />bugdiagnosis">
			</div>
			<div class="chart_title">
				<span>空调箱故障</span> <span>&nbsp;&nbsp;冷机故障</span> <span>&nbsp;&nbsp;&nbsp;建筑总用电</span>
				<span>&nbsp;&nbsp;&nbsp;水泵故障</span>
			</div>
			<div class="detail_para">
				<div>
					<p class="onoff_state">
						2<sup>次</sup>
					</p>
				</div>
				<div class="vertical_line"></div>
				<div>
					<p class="onoff_state">
						3<sup>次</sup>
					</p>
				</div>
				<div class="vertical_line"></div>
				<div>
					<p class="onoff_state">
						2<sup>次</sup>
					</p>
				</div>
				<div class="vertical_line"></div>
				<div>
					<p class="onoff_state">
						1<sup>次</sup>
					</p>
				</div>
			</div>
		</div>

	</div>

</div>

<script type="text/javascript">
	//为  故障诊断  报表填充数据 
	var categories = [ [ '空调故障' ], [ '冷机故障' ], [ '建筑总用电' ], [ '水泵故障' ] ], colorsArr = [
			[ '#FFFFFF' ], [ '#DBB98A' ], [ '#FF8D8E' ], [ '#AF0100' ] ], datas = [
			[ 25 ], [ 25 ], [ 25 ], [ 25 ] ];
	renderToPieCharts('<portlet:namespace />bugdiagnosis', 'pie','故障诊断', categories,
			colorsArr, datas, true, '', '#E41401', '140%', '80%', '');
</script>