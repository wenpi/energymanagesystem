<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-12 上午10点47分
	LastModified Date:
	Description: 能耗统计-建筑总体能耗(tab)
 -->

<div class="div-table">

	<div class="content center">

		<div class="span5 page_title">建筑总体能耗 &nbsp;&gt;</div>
		<div class="span10 classify">
			<ul>
				<li class="highlight">建筑总能耗趋势</li>
				<li>建筑总能耗分项</li>
				<li>建筑总用电趋势</li>
				<li>建筑总用水趋势</li>
				<li>建筑总用气趋势</li>
				<li>建筑碳足迹</li>
			</ul>
		</div>
		<div id="swap_info">
			<div class="span12 basic_imformation cur">

				<%@include file="totalEnergyView.jsp"%>

			</div>
			<div class="span12 basic_imformation">

				<%@include file="energyBreakdownView.jsp"%>

			</div>
			<div class="span12 basic_imformation">

				<%@include file="electricityTrendView.jsp"%>

			</div>
			<div class="span12 basic_imformation">

				<%@include file="waterTrendView.jsp"%>

			</div>
			<div class="span12 basic_imformation">

				<%@include file="gasTrendView.jsp"%>

			</div>
			<div class="span12 basic_imformation">

				<%@include file="carbonFootprintView.jsp"%>

			</div>
		</div>

	</div>

</div>