<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-2 下午05:11:56
	LastModified Date:
	Description:
 -->


<c:if test="${mark==true}">
	<div class="layout-sidebar" style="width: 20%;">
		<div class="title">
			<h4>建筑列表</h4>
		</div>
		<ul>
			<c:forEach var="list" items="${buildinfoList}" begin='0'
				varStatus="status">
				<li><a title="${list.buildName}"
					href="<portlet:renderURL portletMode='view'><portlet:param name='action' value='gets' /><portlet:param name='buildId' value='${list.buildId}' /></portlet:renderURL>">${list.buildName}</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</c:if>
<div class="layout-body" style="width: 78%;">
	<div class="title">
		<h4>能源公示</h4>
	</div>
	<div> <img src="${addfilePath}" id="<portlet:namespace/>buildimg" ></div>
	<form:form commandName="buildinfo" method="post" class="editform"
		action="#">
		<div class="div-table">
			<div class="div-table-row">
				<div class="div-table-3col">
					<div class="fitem">
						<label>数据中心：</label>${buildinfo.datacenterinfo.datacenterName}
					</div>
				</div>


				<div class="div-table-3col">
					<div class="fitem">
						<label>行政区：</label>${buildDistrictName}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>检测状态：</label>
						<c:if test="${buildinfo.buildState==1}">
							启用检测
						</c:if>

						<c:if test="${buildinfo.buildState==0}">
							停用检测
						</c:if>
					</div>
				</div>
			</div>

			<div class="div-table-row">

				<div class="div-table-3col">
					<div class="fitem">
						<label>标杆建筑：</label>
						<c:if test="${buildinfo.buildStandard==true}">
							是
						</c:if>

						<c:if test="${buildinfo.buildStandard==false}">
							否
						</c:if>

					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>开始监测：</label>
						<fmt:formatDate value="${buildinfo.buildMonitordate}" type="date" />
					</div>
				</div>
			</div>
			<p>
			<div class="div-table-row">
				<div class="div-table-3col">
					<div class="fitem">
						<label>建筑名称：</label>${buildinfo.buildName}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>气候区：</label>${buildClimaticregion}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>建筑功能：</label>${buildFunction}
					</div>
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-3col">
					<div class="fitem">
						<label>建筑年代：</label>${buildinfo.buildYear}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>地上建筑层数：</label>${buildinfo.buildUpfloor}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>地下建筑层数：</label>${buildinfo.buildDownfloor}
					</div>
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-3col">
					<div class="fitem">
						<label>建筑总面积：</label>${buildinfo.buildTotalarea}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>空调面积：</label>${buildinfo.buildAirarea}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>采暖面积：</label>${buildinfo.buildHeatarea}
					</div>
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-3col">
					<div class="fitem">
						<label>空调系统形式：</label>${buildAirtype}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>采暖系统形式：</label>${buildHeattype}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>建筑体系系数：</label>${buildinfo.buildBodycoef}
					</div>
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-3col">
					<div class="fitem">
						<label>建筑结构型式：</label>${buildStrutype}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>外墙材料形式：</label>${buildWallmattype}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>外墙保温形式：</label>${buildWallwarmtype}
					</div>
				</div>
			</div>

			<div class="div-table-row">
				<div class="div-table-3col">
					<div class="fitem">
						<label>建筑外窗类型：</label>${buildWallwintype}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>建筑玻璃类型：</label>${buildGlasstype}
					</div>
				</div>

				<div class="div-table-3col">
					<div class="fitem">
						<label>窗框材料类型：</label>${buildWinframetype}
					</div>
				</div>
			</div>

		</div>
	</form:form>
</div>
<div style="clear: both"></div>
<script type="text/javascript">
	$(function() {
		getDictitemsByGroupcode('buildinfo\\.buildWinframetype',
				'build_winframetype');
	});
</script>

