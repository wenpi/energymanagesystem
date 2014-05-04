<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="date_select">
	<input id="<portlet:namespace />datetime4" type="hidden" />
	<div class="pressive" id="<portlet:namespace/>day" onclick="">日视图</div>
	<div id="<portlet:namespace/>week" onclick="">周视图</div>
	<div id="<portlet:namespace/>month" onclick="">月视图</div>
	<div class="radius" id="<portlet:namespace/>year" onclick="">年视图</div>
</div>
<div class="charts">
	<div class="look_other">
		<label class="now_data labels" id="<portlet:namespace/>now_data4"></label>
		<div class="date_comparer">
			<input id="<portlet:namespace/>comparing4" type="text"
				class="comp_data" value="" onclick="" /> <span class="comp_btn"
				onclick="">加入对比</span>
			<div class="download" onclick=""></div>
		</div>
	</div>
	<div class="chart chart4" id="<portlet:namespace/>chartArea4">
		<div class="chart_top levelpadding">
			<table>
				<tbody>
					<tr>
						<td>耗能低</td>
						<td><div class="lowest"></div></td>
					</tr>
					<tr>
						<td></td>
						<td><div class="low"></div></td>
					</tr>
					<tr>
						<td>中等</td>
						<td><div class="midest"></div></td>
					</tr>
					<tr>
						<td></td>
						<td><div class="mid"></div></td>
					</tr>
					<tr>
						<td>耗能高</td>
						<td><div class="high"></div></td>
					</tr>
				</tbody>
			</table>
			<div class="level">
				<img
					src="${pageContext.request.contextPath}/styles/second/images/level1.png" />
			</div>
		</div>
		
		<!-- <table style="position: relative; left: 92px; top: 92px;">
			<tbody>
				<tr>
					<td><span
						style="font-family: 微软雅黑; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: #000000;">耗能低&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
					<td><div class="lowest">
							<span
								style="font-family: 微软雅黑; font-size: 20px; font-weight: bold; font-style: normal; text-decoration: none; color: #000000; position: relative; top: 10px; right: -85px;">1</span>
						</div></td>
				</tr>
				<tr>
					<td><span
						style="font-family: 微软雅黑; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: #000000;">中等&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
					<td><div class="midest">
							<span
								style="font-family: 微软雅黑; font-size: 20px; font-weight: bold; font-style: normal; text-decoration: none; color: #000000; position: relative; top: 10px; right: -116px;">2</span>
						</div></td>
				</tr>
				<tr>
					<td><span
						style="font-family: 微软雅黑; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: #000000;">耗能高&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
					<td><div class="high">
							<span
								style="font-family: 微软雅黑; font-size: 20px; font-weight: bold; font-style: normal; text-decoration: none; color: #000000; position: relative; top: 10px; right: -152px;">3</span>
						</div></td>
				</tr>
			</tbody>
		</table>
		<table
			style="position: relative; right: -370px; bottom: 95px; text-align: center;">
			<tr>
				<td><div class="lowest">
						<span
							style="font-family: 微软雅黑; font-size: 20px; font-weight: bold; font-style: normal; text-decoration: none; color: #000000; position: relative; top: 10px;">1</span>
					</div></td>
			</tr>
			<tr>
				<td><span
					style="font-family: 微软雅黑; font-size: 14px; font-weight: normal; font-style: normal; text-decoration: none; color: #000000;">当前</span></td>
			</tr>
		</table> -->

	</div>
</div>
<div class="detail">
	<div>
		<table>
			<caption>建筑能效等级</caption>
			<tbody>
				<tr>
					<td><span>日</span>最大值</td>
					<td>240<sup>kgce</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>最小值</td>
					<td>100<sup>kgce</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>累计值</td>
					<td>1200<sup>kgce</sup></td>
					<td></td>
				</tr>
				<tr>
					<td>同比昨日</td>
					<td><span>↓ </span><sup>%</sup></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
	var <portlet:namespace />time1 = '';
	if(publicTime != ""){
		<portlet:namespace />time1 = publicTime;
	} else {
		var date = new Date();
		<portlet:namespace />time1 = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
	}
	$("#<portlet:namespace/>now_data4").html(<portlet:namespace />time1);
</script>