<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="detectView" class="span12 row-fluid" style="margin-left: 75px;">

	<!-- 冷站 -->
	<div class="span3 cold_site">
		<div class="cold_site_title">冷站</div>
		<%@include file="detectInners/coolingMachineInner.jsp"%>
	</div>
	<!-- 冷站end -->

	<!--  空调机组 -->
	<div class="span3 air_condition" id="air_group_list">
		<div class="cold_site_title">空调机组</div>
		<div id="air_group_value_list">
			<%@include file="detectInners/airConditionInner.jsp"%>
		</div>
	</div>
	<!-- end空调机组 -->

	<!-- 空调末端 、恒温空调 -->
	<div class="span3 terminal" id="cold_site_list">
		<div class="cold_site_title">恒温恒湿空调箱</div>
		<div id="cold_site_value_list">
			<%@include file="detectInners/stableAirCdtInner.jsp"%>
		</div>
	</div>
	<!-- end空调末端 、恒温空调 -->

	<!-- 送排风机 -->
	<div class="span3 blowers" id="songpaifeng">
		<div class="cold_site_title">送排风机</div>
		<%@include file="detectInners/SplExhFans.jsp"%>
	</div>
	<!-- 送排风机end,中国馆去掉 -->

</div>