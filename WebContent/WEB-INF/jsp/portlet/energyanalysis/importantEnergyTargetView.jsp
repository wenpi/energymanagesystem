<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午7点32分
	LastModified Date:
	Description: 能效分析-重要能效指标切换页面
 -->

<div class="div-table">

	<div class="content center">
		<div class="span5 page_title">重要能效指标 &nbsp;&gt;</div>
		<div class="span10 classify">
			<ul>
				<li class="highlight">单位面积总能耗</li>
				<li>单位面积空调能耗</li>
				<li>单位面积照明能耗</li>
				<li>建筑用能评分</li>
				<li>空调系统能效指标概览</li>
				<li>冷机COP</li>
			</ul>
		</div>
		<div id="swap_info">
			<div class="span12 basic_imformation cur">

				<%@include file="../energyanalysis/unitAreaConsumptionView.jsp"%>

			</div>

			<div class="span12 basic_imformation">

				<%@include
					file="../energyanalysis/unitAreaAirConditionConsumptionView.jsp"%>

			</div>

			<div class="span12 basic_imformation">

				<%@include file="../energyanalysis/unitAreaLightConsumptionView.jsp"%>

			</div>

			<div class="span12 basic_imformation">

				<%@include file="../energyanalysis/buildEnergyGradeView.jsp"%>

			</div>

			<div class="span12 basic_imformation">

				<%@include file="../energyanalysis/airConditionTargetView.jsp"%>

			</div>

			<div class="span12 basic_imformation">

				<%@include file="../energyanalysis/coolCopView.jsp"%>

			</div>

		</div>

	</div>

</div>