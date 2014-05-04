<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 关键信息切换页面
 -->
<div class="div-table home_model_width" >
	<div class="content home_keyinformantion">
		<div id="main" class="home_keyinformantion">
			<div class="key_information">
				<div class="tab home_model_width">
					<div class="tab_menu">
						<ul class="index_ul_margin">
							<li class="cur_tab">
								<div>
									<img src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
									<p>建筑总能耗</p>
								</div>

							</li>
							<!-- <li>
								<div>
									<img src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
									<p>室外状态</p>
								</div>
							</li>
							<li>
								<div>
									<img src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
									<p>客流量</p>
								</div>
							</li> -->
							<li>
								<div>
									<img src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
									<p>建筑总用电量</p>
								</div>
							</li>
							<li>
								<div>
									<img src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
									<p>建筑用电分项</p>
								</div>
							</li>
							<li>
								<div>
									<img src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
									<p>建筑基本信息</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="tab_content current">
						<%@include file="../keyinformation/buildConsumptionView.jsp"%>
					</div>
					<!-- <div class="tab_content">
						<@include file="../keyinformation/outsideStatusView.jsp"%>
					</div>
					<div class="tab_content">
						<@include file="../keyinformation/passenger.jsp"%>
					</div> -->
					<div class="tab_content">
						<%@include file="../keyinformation/buildTotalElectricityView.jsp"%>
					</div>
					<div class="tab_content">
						<%@include file="../keyinformation/buildElectricitySubentryView.jsp"%>
					</div>
					<div class="tab_content">
						<div class="build_pic"></div>
						<%@include file="../keyinformation/buildView.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="mask"></div>