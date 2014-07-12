<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:forEach items="${floorMap}" var="dvd">

	<c:set var="regionid" value="${dvd.value.regionId}" scope="request"></c:set>
	
	<c:if test="${regionid =='0000010700010001' || regionid =='0000010700010002' || regionid =='0000010700010003' || regionid =='0000010700010004' || regionid =='0000010700010005'}">
	
		<div class="unit_stlye cold_classify">
			<div class="classfiy_title terminal_title"
				onclick="airCdtEndPageInit()">
				<ul class="device_title" style="list-style-type: none;">
					<li onclick="clickAcusRegion('${dvd.value.regionId}')">${dvd.value.regionName}</li>
					<li id="a1CoolerOn"></li>
				</ul>
			</div>
			<div class="classify_data terminal_data">
				<table class="device_para">
					<tbody class="tbod">
						<tr>
							<td id=" "><c:if test="${dvd.value.count.acu==null}">0</c:if>
								<c:if test="${dvd.value.count.acu<46}">${dvd.value.count.acu-1}</c:if>
								<c:if test="${dvd.value.count.acu==46}">${dvd.value.count.acu}</c:if>
								<sup>台</sup></td>
							<td id=" "><c:if
									test="${entryFC.value.regionId=='0000010700010001'}">${opened.acu_0}</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010002'}">0</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010003'}">${opened.acu_33}</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010004'}">${opened.acu_41}</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010005'}">${opened.acu_49}</c:if>
								<sup>台</sup></td>
						</tr>
						<tr>
							<td>总数</td>
							<td>开启</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
	</c:if>
</c:forEach>