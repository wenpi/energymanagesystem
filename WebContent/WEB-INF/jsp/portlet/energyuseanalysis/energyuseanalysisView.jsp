<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	能效分析图表页面
	@Author:ZHANGTIANLE
	包含其他页面--静态
	 -->
<%@ include file="../../init.jsp"%>
<div class="div-table" style="margin-left: 0px;">
	<div class="content" style="height: 400px; width: 1000px;">
		<div id="main">
			<div class="key_information">
				<div class="title_block">
					<p id="_target">重要能效指标</p>
					<span><i>目标建筑物的重要能效指标</i></span>
				</div>
				<div class="tab">
					<div class="tab_menu">
						<ul class="titleList">
							<li class="cur_tab">
								<div>
									<img
										src="${pageContext.request.contextPath }/public/energyStatic/public/images/dot.png" />
									<p>单位面积总能耗</p>
								</div>
							</li>
							<li>
								<div>
									<img
										src="${pageContext.request.contextPath }/public/energyStatic/public/images/dot.png" />
									<p>单位面积耗冷量</p>
								</div>
							</li>
							<li>
								<div>
									<img
										src="${pageContext.request.contextPath }/public/energyStatic/public/images/dot.png" />
									<p>单位面积总用电量</p>
								</div>
							</li>
							<li>
								<div>
									<img
										src="${pageContext.request.contextPath }/public/energyStatic/public/images/dot.png" />
									<p>建筑能效等级</p>
								</div>
							</li>
							<li>
								<div>
									<img
										src="${pageContext.request.contextPath }/public/energyStatic/public/images/dot.png" />
									<p>空调能效指标概览</p>
								</div>
							</li>
							<li>
								<div>
									<img
										src="${pageContext.request.contextPath }/public/energyStatic/public/images/dot.png" />
									<p>冷机COP</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="tab_content di_1 current">
						<%@include file="eachUnitEnergyUse.jsp"%>
					</div>
					<div class="tab_content di_1">
						<%@include file="eachUnitColdUse.jsp"%>
					</div>
					<div class="tab_content di_1">
						<%@include file="eachUnitEleUse.jsp"%>
					</div>
					<div class="tab_content di_1">
						<%@include file="buildingEnerEffiLevel.jsp"%>
					</div>
					<div class="tab_content di_1">
						<%@include file="air-conditionEnerEffiView.jsp"%>
					</div>
					<div class="tab_content di_1">
						<%@include file="refrigeratorAndCOP.jsp"%>
					</div>
					<iframe name="<portlet:namespace/>tmpFrame"
						id="<portlet:namespace/>tmpFrame" width="1" height="1"
						style="visibility: hidden; position: absolute; display: none">
					</iframe>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {

	// 移除本页面中，id为column-6,column-7的div
	$("#column-6").remove();
	$("#column-7").remove();
	
	/*轮播*/
	$(".slides").slidesjs({
		width : 700,
		height : 104,
		play : {
			active : false,
			auto : false,
			interval : 4000,
			swap : true,
			pauseOnHover : true,
			restartDelay : 2500
		},
		navigation : {
			active : true,
			effect : "slide"
		},
		pagination : {
			active : false,
			effect : "slide"
		},
		effect : {
			slide : {
				speed : 1000
			},
			fade : {
				speed : 1800,
				crossfade : true
			}
		}
	});
});
</script>