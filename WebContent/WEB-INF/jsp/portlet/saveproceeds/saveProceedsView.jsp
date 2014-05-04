<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午5点31分
	LastModified Date:
	Description: 节能收益
 -->


<div class="div-table m_top">

	<div class="span445 row-fluid">
		<div id="runMonitor">
			<div class="sub_chart" id="<portlet:namespace />saveproceeds">
			</div>
			<div class="chart_title">
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总用水</span> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总用气</span>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总用电</span> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其它费用</span>
			</div>
			<div class="detail_para">
				<div>
					<p class="onoff_state">
						200<sup>￥</sup>
					</p>
				</div>
				<div class="vertical_line"></div>
				<div>
					<p class="onoff_state">
						3500<sup>￥</sup>
					</p>
				</div>
				<div class="vertical_line"></div>
				<div>
					<p class="onoff_state">
						1000<sup>￥</sup>
					</p>
				</div>
				<div class="vertical_line"></div>
				<div>
					<p class="onoff_state">
						3500<sup>￥</sup>
					</p>
				</div>
			</div>
		</div>

	</div>

</div>



<script type="text/javascript">
	//为  节能收益  报表填充
	var chartLegendList = [ '用水', '用气', '用电', '其它' ], chartColorList = [
			'#FFFFFF', '#C7EAF3', '#8AE2F5', '#5FC4E6' ], dataList = [
			[ 12.0, 6.9, 13.5, 7.0, 6.9, 16.5, 7.0, 6.9 ],
			[ 18.2, 11.8, 5.7, 3.9, 5.6, 3.1, 1.2, 11.8 ],
			[ 6.9, 9.6, 3.5, 1.9, 1.6, 3.5, 4.9, 6.6 ],
			[ 5.9, 6.2, 6.7, 1.9, 9.6, 3.5, 1.9, 9.6 ] ];

	renderToChartLine('<portlet:namespace />saveproceeds', 'line', 100,
			'#1CA0E2', 30, '节能收益', '#FFF', "23px", 'bold', '微软雅黑', -170, '',
			'#FFF', '', 'vertical', 'right', 'top', 0, -10, 30, 1, 1,
			chartLegendList, chartColorList, dataList);
</script>