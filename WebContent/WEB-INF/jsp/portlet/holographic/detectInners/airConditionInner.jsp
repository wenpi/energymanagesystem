<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:forEach items="${floorMap}" var="dvd">
	<c:set var="entryFC" value="${dvd}" scope="request"></c:set>
	<c:set var="regionid" value="${entryFC.value.regionId}" scope="request"></c:set>
	
	<c:if test="${regionid =='0000010700010001' || regionid =='0000010700010002' || regionid =='0000010700010003' || regionid =='0000010700010004' || regionid =='0000010700010005'}">
	
		<div class="unit_stlye cold_classify">
			<div onclick="airConditionPageInit()" class="classfiy_title air_title">
				<ul class="device_title" style="list-style-type: none;">
					<li onclick="clickRegion('${entryFC.value.regionId}')">${entryFC.value.regionName}</li>
					<li id="a1CoolerOn"></li>
					<li></li>
				</ul>
			</div>
			<div class="classify_data air_data">
				<table class="device_para">
					<tbody class="tbod">
						<tr>
							<td id=""><c:if test="${entryFC.value.count.ahu<=0}">0</c:if>
								<c:if test="${entryFC.value.count.ahu>0}">${entryFC.value.count.ahu-1 }</c:if>
								<sup>台</sup></td>
	
							<td id=" "><c:if
									test="${entryFC.value.regionId=='0000010700010001'}">${opened.ahu_0}</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010002'}">${opened.ahu_5}</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010003'}">${opened.ahu_33}</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010004'}">${opened.ahu_41}</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010005'}">${opened.ahu_49}</c:if>
								<sup>台</sup></td>
	
							<td id=" "><c:if test="${entryFC.value.count.fau<=0}">0</c:if>
								<c:if test="${entryFC.value.count.fau>0}">${entryFC.value.count.fau-1 }</c:if>
								<c:if test="${entryFC.value.count.fau==null}">0</c:if> <sup>台</sup></td>
	
							<td id=" "><c:if
									test="${entryFC.value.regionId=='0000010700010001'}">${opened.fau_0}</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010002'}">${opened.fau_5}</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010003'}">0</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010004'}">0</c:if>
								<c:if test="${entryFC.value.regionId=='0000010700010005'}">${opened.fau_49}</c:if></td>
						</tr>
						<tr>
							<td>总数</td>
							<td>开启</td>
							<td>总数</td>
							<td>开启</td>
						</tr>
						<tr>
							<td></td>
							<td style="font-size: 14px;" id="test_region">空调箱</td>
							<td style="font-size: 14px;">新风箱</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
</c:forEach>