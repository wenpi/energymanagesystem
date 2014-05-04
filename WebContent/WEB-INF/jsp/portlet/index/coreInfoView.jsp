<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午2点15分
	LastModified Date:
	Description: 首页-关键信息切换页面
 -->

<style type="text/css">
.popover.top .arrow {
	bottom: -11px;
	left: 50%;
	margin-left: -11px;
	border-top-color: #999;
	border-top-color: rgba(0, 0, 0, 0.25);
	border-bottom-width: 0;
}

.popover .arrow {
	border-width: 11px;
}

.popover .arrow,.popover .arrow:after {
	position: absolute;
	display: block;
	width: 0;
	height: 0;
	border-color: transparent;
	border-style: solid;
}

user agent stylesheetdiv {
	display: block;
}

Pseudo ::after element
.popover.top .arrow:after {
	bottom: 1px;
	margin-left: -10px;
	border-top-color: #ffffff;
	border-bottom-width: 0;
}

.popover .arrow:after {
	border-width: 10px;
	content: "";
}

.popover .arrow,.popover .arrow:after {
	position: absolute;
	display: block;
	width: 0;
	height: 0;
	border-color: transparent;
	border-style: solid;
}

Inherited from div.popover.fade.top.in
.popover {
	text-align: left;
	white-space: normal;
}

Inherited from li
li {
	line-height: 20px;
}

sheetli {
	text-align: -webkit-match-parent;
}

.bs-docs-tooltip-examples
.bs-docs-tooltip-examples {
	text-align: center;
	list-style: none;
}

user agent stylesheetul,menu,dir {
	list-style-type: disc;
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 20px;
	color: #333333;
}

html {
	font-size: 100%;
}
</style>

<div class="div-table">

	<div class="content center">
		<div class="span5 page_title">关键信息 &nbsp;&gt;</div>
		<div class="span10 classify">
			<ul>
				<li class="highlight dddddd">建筑基本信息</li>
				<li>室外状态</li>
				<li>建筑客流量</li>
				<li>建筑总能耗趋势</li>
				<li>建筑总用电趋势</li>
				<li>建筑用电分项</li>
			</ul>
		</div>
		<div id="swap_info">
			<div class="span12 basic_imformation cur">

				<%@include file="../buildinfo/buildView.jsp"%>

			</div>
			<div class="span12 basic_imformation">

				<%@include file="../outsidestatus/outsideStatusView.jsp"%>

			</div>
			<div class="span12 basic_imformation">

				<%@include file="../build/passengerView.jsp"%>

			</div>
			<div class="span12 basic_imformation">

				<%@include file="../build/buildConsumptionView.jsp"%>

			</div>
			<div class="span12 basic_imformation">

				<%@include file="../build/buildTotalElectroView.jsp"%>

			</div>
			<div class="span12 basic_imformation">

				<%@include file="../build/buildElectroSubentryView.jsp"%>

			</div>
		</div>
	</div>

</div>