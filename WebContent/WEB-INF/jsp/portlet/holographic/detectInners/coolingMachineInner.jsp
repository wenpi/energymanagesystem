<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="cool_refrigerator">
	<%-- 冷机 --%>
	<div class="unit_stlye cold_classify">
		<div class="classfiy_title cold_title">
			<ul class="device_title" style="list-style-type: none;">
				<li>冷机</li>
				<li id="a1CoolerOn"></li>
				<li style="font-size:14px;">开启台数${opened.chiller} <c:if test="${opened.chiller==null}">0</c:if>
				</li>
			</ul>
		</div>
		<div class="classify_data cold_data">
			<table class="device_para">
				<tbody class="tbod">
					<tr>
						<td id="a1CoolerCount">8<sup>台</sup></td>
						<td id="a1SupplyWaterTemp">${coolStaFans.chillerSplWatTemp}<sup>&#176;C</sup></td>
						<td id="a1ReturnWaterTemp">${coolStaFans.chillerRtnWatTemp}<sup>&#176;C</sup></td>
					</tr>
					<tr>
						<td>总台数</td>
						<td>供水温度</td>
						<td>回水温度</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%--  end冷机 --%>
	<%--  水系统 --%>
	<div class="unit_stlye cold_classify">
		<div class="classfiy_title cold_title">
			<ul class="device_title" style="list-style-type: none;">
				<li>水系统</li>
				<li id="a1CoolerOn"></li>
			</ul>
		</div>
		<div class="classify_data cold_data">
			<table class="device_para">
				<tbody class="tbod">
					<tr>
						<td id=" ">${coolStaFans.chillerSplWatTemp}<sup>℃</sup></td>
						<td id=" ">${coolStaFans.chillerRtnWatTemp}<sup>℃</sup></td>
						<td id=" ">${coolStaFans.wsVolumn}<sup>m³/s</sup></td>
					</tr>
					<tr>
						<td>冷水供水温度</td>
						<td>冷水回水温度</td>
						<td>冷水流量</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%-- end 水系统 --%>
	<%--  冷却泵 --%>
	<div class="unit_stlye cold_classify">
		<div class="classfiy_title cold_title">
			<ul class="device_title" style="list-style-type: none;">
				<li>冷却泵</li>
				<li id="a1CoolerOn"></li>
			</ul>
		</div>
		<div class="classify_data cold_data">
			<table class="device_para">
				<tbody class="tbod">
					<tr>
						<td id=" ">${coolStaFans.cwpC}<sup>台</sup></td>
						<td id=" ">${coolStaFans.cwpOpen}<sup>台</sup></td>
					</tr>
					<tr>
						<td>总台数</td>
						<td>开启台数</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%-- end 冷却泵 --%>
	<%--  冷冻泵 --%>
	<div class="unit_stlye cold_classify">
		<div class="classfiy_title cold_title">
			<ul class="device_title" style="list-style-type: none;">
				<li>冷冻泵</li>
				<li id="a1CoolerOn"></li>
			</ul>
		</div>
		<div class="classify_data cold_data">
			<table class="device_para">
				<tbody class="tbod">
					<tr>
						<td id=" ">${coolStaFans.chwpC}<sup>台</sup></td>
						<td id=" ">${coolStaFans.chwpOpen}<sup>台</sup></td>
					</tr>
					<tr>
						<td>总台数</td>
						<td>开启台数</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%-- end 冷冻泵 --%>

	<%--  冷却塔 --%>
	<div class="unit_stlye cold_classify">
		<div class="classfiy_title cold_title">
			<ul class="device_title" style="list-style-type: none;">
				<li>冷却塔</li>
				<li id="a1CoolerOn"></li>
			</ul>
		</div>
		<div class="classify_data cold_data">
			<table class="device_para">
				<tbody class="tbod">
					<tr>
						<td id=" ">${coolStaFans.ctC}<sup>台</sup></td>
						<td id=" ">${coolStaFans.ctOpen}<sup>台</sup></td>
					</tr>
					<tr>
						<td>总台数</td>
						<td>开启台数</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<br /> <br />
	<%-- end 冷却塔 --%>
</div>