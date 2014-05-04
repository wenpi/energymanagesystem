<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="display: none;" class="span12"
	id="<portlet:namespace />detect_sealm_pump">
	<div>
		<div class="span9 sealm_pump_right_data">
			<div class="text-right">
				<ul class="date_select" style="list-style-type: none;">
					<li onclick="changeSealmPumpDate('month')" class="month_color">月</li>
					<li onclick="changeSealmPumpDate('week')" class="week_color">周</li>
					<li onclick="changeSealmPumpDate('day')" class="day_color">日</li>
				</ul>
			</div>
		</div>
		<div>
			<div class="span12" style="margin-left: 30px;">
				<hr>
			</div>
			<div class="span12">&nbsp;</div>
			<div class="span12" id="sealPumpOnOffGraphic">

				<div class="span5 cold_chart_title sealm_pump_margin"
					id="aui_3_2_0_13521">
					<div class="span7 text-left describe" id="aui_3_2_0_13453">
						<span id="<portlet:namespace />cold_water_pump_status"></span>
					</div>
					<%-- 
<div class="span3"> 
<ul class="derail" style="list-style-type:none;"> <li>
<img src="/energymanagesystem/public/images/legend1.png"></li> <li>开启</li> <li><img src="/energymanagesystem/public/images/stops.png">
</li> <li>关闭</li> </ul> </div>
 --%>
					<div class="span12 reikenli">
						<div class="current" style="display: inline;">
							<div>
								<table border="0px;"
									style="border-color: white; line-height: 36px; border-collapse: 3px;">
									<tbody>
										<tr class="newAddedTr">
											<td width="50px;">&nbsp;</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;" style="background-color: #E8FCFD">&nbsp;
											</td>
											<td width="43px;" style="background-color: #E8FCFD">&nbsp;
											</td>
											<td width="43px;" style="background-color: #E8FCFD">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
											<td width="43px;"
												style="background-color: #33CCCC; border-color: white;">&nbsp;
											</td>
										</tr>
										<tr class="newAddedTr">
											<td width="50px;">&nbsp;</td>
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
											<td>6</td>
											<td>7</td>
											<td>8</td>
											<td>9</td>
											<td>10</td>
											<td>11</td>
											<td>12</td>
											<td>13</td>
											<td>14</td>
											<td>15</td>
											<td>16</td>
										</tr>
										<tr id="coolMachineStateTr" style="visibility: false"
											class="big_tr"></tr>
									</tbody>
								</table>
							</div>
							<div id="coolingMachineOnOffGraphic"></div>
							<div id="coolingWaterParamGraphic" data-highcharts-chart="40">
								<div class="highcharts-container" id="highcharts-160"
									style="position: relative; overflow: hidden; width: 800px; height: 228px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helvetica, sans-serif; font-size: 12px;">
									<svg xmlns="http://www.w3.org/2000/svg" version="1.1"
										width="800" height="228">
										<desc>Created with Highcharts 3.0.2</desc>
										<defs>
										<clipPath id="highcharts-161">
										<rect fill="none" x="0" y="0" width="730" height="127"></rect></clipPath></defs>
										<rect rx="5" ry="5" fill="#FFFFFF" x="0" y="0" width="800"
											height="228"></rect>
										<g class="highcharts-button" style="cursor:default;"
											title="Chart context menu" stroke-linecap="round"
											transform="translate(766,10)">
										<title>Chart context menu</title>
										<rect rx="2" ry="2" fill="white" x="0.5" y="0.5" width="24"
											height="22" stroke="none" stroke-width="1"></rect>
										<path fill="#E0E0E0"
											d="M 6 6.5 L 20 6.5 M 6 11.5 L 20 11.5 M 6 16.5 L 20 16.5"
											stroke="#666" stroke-width="3" zIndex="1"></path>
										<text x="0" y="13"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:12px;color:black;fill:black;"
											zIndex="1"></text></g>
										<g class="highcharts-grid" zIndex="1"></g>
										<g class="highcharts-grid" zIndex="1">
										<path fill="none" d="M 60 125.5 L 790 125.5" stroke="#C0C0C0"
											stroke-width="1" zIndex="1" opacity="1"></path>
										<path fill="none" d="M 60 83.5 L 790 83.5" stroke="#C0C0C0"
											stroke-width="1" zIndex="1" opacity="1"></path>
										<path fill="none" d="M 60 40.5 L 790 40.5" stroke="#C0C0C0"
											stroke-width="1" zIndex="1" opacity="1"></path>
										<path fill="none" d="M 60 167.5 L 790 167.5" stroke="#C0C0C0"
											stroke-width="1" zIndex="1" opacity="1"></path></g>
										<g class="highcharts-axis" zIndex="2">
										<path fill="none" d="M 150.5 168 L 150.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 196.5 168 L 196.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 242.5 168 L 242.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 287.5 168 L 287.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 333.5 168 L 333.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 378.5 168 L 378.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 424.5 168 L 424.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 470.5 168 L 470.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 515.5 168 L 515.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 561.5 168 L 561.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 607.5 168 L 607.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 652.5 168 L 652.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 698.5 168 L 698.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 743.5 168 L 743.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 789.5 168 L 789.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 105.5 168 L 105.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 60.5 168 L 60.5 173" stroke="#C0D0E0"
											stroke-width="1"></path>
										<path fill="none" d="M 60 167.5 L 790 167.5" stroke="#C0D0E0"
											stroke-width="1" zIndex="7" visibility="visible"></path></g>
										<g class="highcharts-axis" zIndex="2">
										<text x="26" y="104"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:12px;color:#4d759e;font-weight:bold;fill:#4d759e;"
											zIndex="7" text-anchor="middle"
											transform="translate(0,0) rotate(270 26 104)"
											visibility="visible">
										<tspan x="26">温度 (℃)</tspan></text></g>
										<g class="highcharts-series-group" zIndex="3">
										<g class="highcharts-series" visibility="visible" zIndex="0.1"
											transform="translate(60,40) scale(1 1)"
											clip-path="url(#highcharts-161)">
										<path fill="none"
											d="M 22.8125 30.9 C 22.8125 30.9 50.1875 8.6 68.4375 8.6 C 86.6875 8.6 95.8125 17.080000000000005 114.0625 28.1 C 132.3125 39.120000000000005 141.4375 63.7 159.6875 63.7 C 177.9375 63.7 187.0625 32.4 205.3125 32.4 C 223.5625 32.4 232.6875 63.7 250.9375 63.7 C 269.1875 63.7 278.3125 49.1 296.5625 49.1 C 314.8125 49.1 323.9375 52.9 342.1875 52.9 C 360.4375 52.9 369.5625 46.400000000000006 387.8125 36.6 C 406.0625 26.8 415.1875 3.9 433.4375 3.9 C 451.6875 3.9 460.8125 81.6 479.0625 81.6 C 497.3125 81.6 506.4375 69.72 524.6875 65.6 C 542.9375 61.47999999999999 552.0625 65.6 570.3125 61 C 588.5625 56.400000000000006 597.6875 20.299999999999997 615.9375 14.6 C 634.1875 8.9 643.3125 8.9 661.5625 8.9 C 679.8125 8.9 707.1875 30.4 707.1875 30.4"
											stroke="#52B103" stroke-width="4" zIndex="1"></path></g>
										<g class="highcharts-markers" visibility="visible"
											zIndex="0.1" transform="translate(60,40) scale(1 1)"
											clip-path="none">
										<path fill="none"
											d="M 12.8125 30.9 L 22.8125 30.9 C 22.8125 30.9 50.1875 8.6 68.4375 8.6 C 86.6875 8.6 95.8125 17.080000000000005 114.0625 28.1 C 132.3125 39.120000000000005 141.4375 63.7 159.6875 63.7 C 177.9375 63.7 187.0625 32.4 205.3125 32.4 C 223.5625 32.4 232.6875 63.7 250.9375 63.7 C 269.1875 63.7 278.3125 49.1 296.5625 49.1 C 314.8125 49.1 323.9375 52.9 342.1875 52.9 C 360.4375 52.9 369.5625 46.400000000000006 387.8125 36.6 C 406.0625 26.8 415.1875 3.9 433.4375 3.9 C 451.6875 3.9 460.8125 81.6 479.0625 81.6 C 497.3125 81.6 506.4375 69.72 524.6875 65.6 C 542.9375 61.47999999999999 552.0625 65.6 570.3125 61 C 588.5625 56.400000000000006 597.6875 20.299999999999997 615.9375 14.6 C 634.1875 8.9 643.3125 8.9 661.5625 8.9 C 679.8125 8.9 707.1875 30.4 707.1875 30.4 L 717.1875 30.4"
											class="highcharts-tracker highcharts-tracker"
											stroke-linejoin="round" visibility="visible"
											stroke-opacity="0.0001" stroke="rgb(192,192,192)"
											stroke-width="24" zIndex="2" style=""></path></g>
										<g class="highcharts-series" visibility="visible" zIndex="0.1"
											transform="translate(60,40) scale(1 1)"
											clip-path="url(#highcharts-161)">
										<path fill="none"
											d="M 22.8125 30.9 C 22.8125 30.9 50.1875 8.6 68.4375 8.6 C 86.6875 8.6 95.8125 17.080000000000005 114.0625 28.1 C 132.3125 39.120000000000005 141.4375 63.7 159.6875 63.7 C 177.9375 63.7 187.0625 32.4 205.3125 32.4 C 223.5625 32.4 232.6875 63.7 250.9375 63.7 C 269.1875 63.7 278.3125 49.1 296.5625 49.1 C 314.8125 49.1 323.9375 52.9 342.1875 52.9 C 360.4375 52.9 369.5625 46.400000000000006 387.8125 36.6 C 406.0625 26.8 415.1875 3.9 433.4375 3.9 C 451.6875 3.9 460.8125 81.6 479.0625 81.6 C 497.3125 81.6 506.4375 69.72 524.6875 65.6 C 542.9375 61.47999999999999 552.0625 65.6 570.3125 61 C 588.5625 56.400000000000006 597.6875 20.299999999999997 615.9375 14.6 C 634.1875 8.9 643.3125 8.9 661.5625 8.9 C 679.8125 8.9 707.1875 30.4 707.1875 30.4"
											stroke="#2f7ed8" stroke-width="4" zIndex="1"></path></g>
										<g class="highcharts-markers" visibility="visible"
											zIndex="0.1" transform="translate(60,40) scale(1 1)"
											clip-path="none">
										<path fill="none"
											d="M 12.8125 30.9 L 22.8125 30.9 C 22.8125 30.9 50.1875 8.6 68.4375 8.6 C 86.6875 8.6 95.8125 17.080000000000005 114.0625 28.1 C 132.3125 39.120000000000005 141.4375 63.7 159.6875 63.7 C 177.9375 63.7 187.0625 32.4 205.3125 32.4 C 223.5625 32.4 232.6875 63.7 250.9375 63.7 C 269.1875 63.7 278.3125 49.1 296.5625 49.1 C 314.8125 49.1 323.9375 52.9 342.1875 52.9 C 360.4375 52.9 369.5625 46.400000000000006 387.8125 36.6 C 406.0625 26.8 415.1875 3.9 433.4375 3.9 C 451.6875 3.9 460.8125 81.6 479.0625 81.6 C 497.3125 81.6 506.4375 69.72 524.6875 65.6 C 542.9375 61.47999999999999 552.0625 65.6 570.3125 61 C 588.5625 56.400000000000006 597.6875 20.299999999999997 615.9375 14.6 C 634.1875 8.9 643.3125 8.9 661.5625 8.9 C 679.8125 8.9 707.1875 30.4 707.1875 30.4 L 717.1875 30.4"
											class="highcharts-tracker highcharts-tracker"
											stroke-linejoin="round" visibility="visible"
											stroke-opacity="0.0001" stroke="rgb(192,192,192)"
											stroke-width="24" zIndex="2" style=""></path></g></g>
										<text x="90" y="25"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:16px;color:#274b6d;fill:#274b6d;"
											text-anchor="start" class="highcharts-title" zIndex="4">
										<tspan x="90">冷却水参数</tspan></text>
										<g class="highcharts-legend" zIndex="7"
											transform="translate(537,194)">
										<g zIndex="1">
										<g>
										<g class="highcharts-legend-item" zIndex="1"
											transform="translate(8,3)">
										<path fill="none" d="M 0 11 L 16 11" stroke="#52B103"
											stroke-width="4"></path>
										<text x="21" y="15"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:12px;cursor:pointer;color:#274b6d;fill:#274b6d;"
											text-anchor="start" zIndex="2">
										<tspan x="21">冷却水供水温度</tspan></text></g>
										<g class="highcharts-legend-item" zIndex="1"
											transform="translate(121,3)">
										<path fill="none" d="M 0 11 L 16 11" stroke="#2f7ed8"
											stroke-width="4"></path>
										<text x="21" y="15"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:12px;cursor:pointer;color:#274b6d;fill:#274b6d;"
											text-anchor="start" zIndex="2">
										<tspan x="21">冷却水回水温度</tspan></text></g></g></g></g>
										<g class="highcharts-axis-labels" zIndex="7">
										<text x="82.8125" y="182"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle" opacity="1">
										<tspan x="82.8125">1</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">2</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">3</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">4</tspan></text>
										<text x="265.3125" y="182"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle" opacity="1">
										<tspan x="265.3125">5</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">6</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">7</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">8</tspan></text>
										<text x="447.8125" y="182"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle" opacity="1">
										<tspan x="447.8125">9</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">10</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">11</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">12</tspan></text>
										<text x="630.3125" y="182"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle" opacity="1">
										<tspan x="630.3125">13</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">14</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">15</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">16</tspan></text></g>
										<g class="highcharts-axis-labels" zIndex="7">
										<text x="52" y="129.92552083333334"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;width:345px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="end" opacity="1">
										<tspan x="52">0</tspan></text>
										<text x="52" y="87.25885416666668"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;width:345px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="end" opacity="1">
										<tspan x="52">5</tspan></text>
										<text x="52" y="44.5921875"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;width:345px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="end" opacity="1">
										<tspan x="52">10</tspan></text>
										<text x="52" y="172.5921875"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;width:345px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="end" opacity="1">
										<tspan x="52">-5</tspan></text></g>
										<g class="highcharts-tooltip" zIndex="8"
											style="cursor:default;padding:0;white-space:nowrap;"
											visibility="hidden" transform="translate(0,0)">
										<rect rx="3" ry="3" fill="none" x="0.5" y="0.5" width="16"
											height="16" fill-opacity="0.85" isShadow="true"
											stroke="black" stroke-opacity="0.049999999999999996"
											stroke-width="5" transform="translate(1, 1)"></rect>
										<rect rx="3" ry="3" fill="none" x="0.5" y="0.5" width="16"
											height="16" fill-opacity="0.85" isShadow="true"
											stroke="black" stroke-opacity="0.09999999999999999"
											stroke-width="3" transform="translate(1, 1)"></rect>
										<rect rx="3" ry="3" fill="none" x="0.5" y="0.5" width="16"
											height="16" fill-opacity="0.85" isShadow="true"
											stroke="black" stroke-opacity="0.15" stroke-width="1"
											transform="translate(1, 1)"></rect>
										<rect rx="3" ry="3" fill="rgb(255,255,255)" x="0.5" y="0.5"
											width="16" height="16" fill-opacity="0.85"></rect>
										<text x="8" y="21"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:12px;color:#333333;fill:#333333;"
											zIndex="1"></text></g></svg>
								</div>
							</div>
							<div id="sealWaterParamGraphic" data-highcharts-chart="41">
								<div class="highcharts-container" id="highcharts-164"
									style="position: relative; overflow: hidden; width: 800px; height: 228px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helvetica, sans-serif; font-size: 12px;">
									<svg xmlns="http://www.w3.org/2000/svg" version="1.1"
										width="800" height="228">
										<desc>Created with Highcharts 3.0.2</desc>
										<defs>
										<clipPath id="highcharts-165">
										<rect fill="none" x="0" y="0" width="730" height="127"></rect></clipPath></defs>
										<rect rx="5" ry="5" fill="#FFFFFF" x="0" y="0" width="800"
											height="228"></rect>
										<g class="highcharts-button" style="cursor:default;"
											title="Chart context menu" stroke-linecap="round"
											transform="translate(766,10)">
										<title>Chart context menu</title>
										<rect rx="2" ry="2" fill="white" x="0.5" y="0.5" width="24"
											height="22" stroke="none" stroke-width="1"></rect>
										<path fill="#E0E0E0"
											d="M 6 6.5 L 20 6.5 M 6 11.5 L 20 11.5 M 6 16.5 L 20 16.5"
											stroke="#666" stroke-width="3" zIndex="1"></path>
										<text x="0" y="13"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:12px;color:black;fill:black;"
											zIndex="1"></text></g>
										<g class="highcharts-grid" zIndex="1"></g>
										<g class="highcharts-grid" zIndex="1">
										<path fill="none" d="M 60 125.5 L 790 125.5" stroke="#C0C0C0"
											stroke-width="1" zIndex="1" opacity="1"></path>
										<path fill="none" d="M 60 83.5 L 790 83.5" stroke="#C0C0C0"
											stroke-width="1" zIndex="1" opacity="1"></path>
										<path fill="none" d="M 60 40.5 L 790 40.5" stroke="#C0C0C0"
											stroke-width="1" zIndex="1" opacity="1"></path>
										<path fill="none" d="M 60 167.5 L 790 167.5" stroke="#C0C0C0"
											stroke-width="1" zIndex="1" opacity="1"></path></g>
										<g class="highcharts-axis" zIndex="2">
										<path fill="none" d="M 150.5 168 L 150.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 196.5 168 L 196.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 242.5 168 L 242.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 287.5 168 L 287.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 333.5 168 L 333.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 378.5 168 L 378.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 424.5 168 L 424.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 470.5 168 L 470.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 515.5 168 L 515.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 561.5 168 L 561.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 607.5 168 L 607.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 652.5 168 L 652.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 698.5 168 L 698.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 743.5 168 L 743.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 789.5 168 L 789.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 105.5 168 L 105.5 173" stroke="#C0D0E0"
											stroke-width="1" opacity="1"></path>
										<path fill="none" d="M 60.5 168 L 60.5 173" stroke="#C0D0E0"
											stroke-width="1"></path>
										<path fill="none" d="M 60 167.5 L 790 167.5" stroke="#C0D0E0"
											stroke-width="1" zIndex="7" visibility="visible"></path></g>
										<g class="highcharts-axis" zIndex="2">
										<text x="26" y="104"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:12px;color:#4d759e;font-weight:bold;fill:#4d759e;"
											zIndex="7" text-anchor="middle"
											transform="translate(0,0) rotate(270 26 104)"
											visibility="visible">
										<tspan x="26">温度 (℃)</tspan></text></g>
										<g class="highcharts-series-group" zIndex="3">
										<g class="highcharts-series" visibility="visible" zIndex="0.1"
											transform="translate(60,40) scale(1 1)"
											clip-path="url(#highcharts-165)">
										<path fill="none"
											d="M 22.8125 30.9 C 22.8125 30.9 50.1875 8.6 68.4375 8.6 C 86.6875 8.6 95.8125 17.080000000000005 114.0625 28.1 C 132.3125 39.120000000000005 141.4375 63.7 159.6875 63.7 C 177.9375 63.7 187.0625 32.4 205.3125 32.4 C 223.5625 32.4 232.6875 63.7 250.9375 63.7 C 269.1875 63.7 278.3125 49.1 296.5625 49.1 C 314.8125 49.1 323.9375 52.9 342.1875 52.9 C 360.4375 52.9 369.5625 46.400000000000006 387.8125 36.6 C 406.0625 26.8 415.1875 3.9 433.4375 3.9 C 451.6875 3.9 460.8125 81.6 479.0625 81.6 C 497.3125 81.6 506.4375 69.72 524.6875 65.6 C 542.9375 61.47999999999999 552.0625 65.6 570.3125 61 C 588.5625 56.400000000000006 597.6875 20.299999999999997 615.9375 14.6 C 634.1875 8.9 643.3125 8.9 661.5625 8.9 C 679.8125 8.9 707.1875 30.4 707.1875 30.4"
											stroke="#61AF93" stroke-width="4" zIndex="1"></path></g>
										<g class="highcharts-markers" visibility="visible"
											zIndex="0.1" transform="translate(60,40) scale(1 1)"
											clip-path="none">
										<path fill="none"
											d="M 12.8125 30.9 L 22.8125 30.9 C 22.8125 30.9 50.1875 8.6 68.4375 8.6 C 86.6875 8.6 95.8125 17.080000000000005 114.0625 28.1 C 132.3125 39.120000000000005 141.4375 63.7 159.6875 63.7 C 177.9375 63.7 187.0625 32.4 205.3125 32.4 C 223.5625 32.4 232.6875 63.7 250.9375 63.7 C 269.1875 63.7 278.3125 49.1 296.5625 49.1 C 314.8125 49.1 323.9375 52.9 342.1875 52.9 C 360.4375 52.9 369.5625 46.400000000000006 387.8125 36.6 C 406.0625 26.8 415.1875 3.9 433.4375 3.9 C 451.6875 3.9 460.8125 81.6 479.0625 81.6 C 497.3125 81.6 506.4375 69.72 524.6875 65.6 C 542.9375 61.47999999999999 552.0625 65.6 570.3125 61 C 588.5625 56.400000000000006 597.6875 20.299999999999997 615.9375 14.6 C 634.1875 8.9 643.3125 8.9 661.5625 8.9 C 679.8125 8.9 707.1875 30.4 707.1875 30.4 L 717.1875 30.4"
											class="highcharts-tracker highcharts-tracker"
											stroke-linejoin="round" visibility="visible"
											stroke-opacity="0.0001" stroke="rgb(192,192,192)"
											stroke-width="24" zIndex="2" style=""></path></g>
										<g class="highcharts-series" visibility="visible" zIndex="0.1"
											transform="translate(60,40) scale(1 1)"
											clip-path="url(#highcharts-165)">
										<path fill="none"
											d="M 22.8125 30.9 C 22.8125 30.9 50.1875 8.6 68.4375 8.6 C 86.6875 8.6 95.8125 17.080000000000005 114.0625 28.1 C 132.3125 39.120000000000005 141.4375 63.7 159.6875 63.7 C 177.9375 63.7 187.0625 32.4 205.3125 32.4 C 223.5625 32.4 232.6875 63.7 250.9375 63.7 C 269.1875 63.7 278.3125 49.1 296.5625 49.1 C 314.8125 49.1 323.9375 52.9 342.1875 52.9 C 360.4375 52.9 369.5625 46.400000000000006 387.8125 36.6 C 406.0625 26.8 415.1875 3.9 433.4375 3.9 C 451.6875 3.9 460.8125 81.6 479.0625 81.6 C 497.3125 81.6 506.4375 69.72 524.6875 65.6 C 542.9375 61.47999999999999 552.0625 65.6 570.3125 61 C 588.5625 56.400000000000006 597.6875 20.299999999999997 615.9375 14.6 C 634.1875 8.9 643.3125 8.9 661.5625 8.9 C 679.8125 8.9 707.1875 30.4 707.1875 30.4"
											stroke="#FBCDA7" stroke-width="4" zIndex="1"></path></g>
										<g class="highcharts-markers" visibility="visible"
											zIndex="0.1" transform="translate(60,40) scale(1 1)"
											clip-path="none">
										<path fill="none"
											d="M 12.8125 30.9 L 22.8125 30.9 C 22.8125 30.9 50.1875 8.6 68.4375 8.6 C 86.6875 8.6 95.8125 17.080000000000005 114.0625 28.1 C 132.3125 39.120000000000005 141.4375 63.7 159.6875 63.7 C 177.9375 63.7 187.0625 32.4 205.3125 32.4 C 223.5625 32.4 232.6875 63.7 250.9375 63.7 C 269.1875 63.7 278.3125 49.1 296.5625 49.1 C 314.8125 49.1 323.9375 52.9 342.1875 52.9 C 360.4375 52.9 369.5625 46.400000000000006 387.8125 36.6 C 406.0625 26.8 415.1875 3.9 433.4375 3.9 C 451.6875 3.9 460.8125 81.6 479.0625 81.6 C 497.3125 81.6 506.4375 69.72 524.6875 65.6 C 542.9375 61.47999999999999 552.0625 65.6 570.3125 61 C 588.5625 56.400000000000006 597.6875 20.299999999999997 615.9375 14.6 C 634.1875 8.9 643.3125 8.9 661.5625 8.9 C 679.8125 8.9 707.1875 30.4 707.1875 30.4 L 717.1875 30.4"
											class="highcharts-tracker highcharts-tracker"
											stroke-linejoin="round" visibility="visible"
											stroke-opacity="0.0001" stroke="rgb(192,192,192)"
											stroke-width="24" zIndex="2" style=""></path></g></g>
										<text x="90" y="25"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:16px;color:#274b6d;fill:#274b6d;"
											text-anchor="start" class="highcharts-title" zIndex="4">
										<tspan x="90">冷冻水参数</tspan></text>
										<g class="highcharts-legend" zIndex="7"
											transform="translate(537,194)">
										<g zIndex="1">
										<g>
										<g class="highcharts-legend-item" zIndex="1"
											transform="translate(8,3)">
										<path fill="none" d="M 0 11 L 16 11" stroke="#61AF93"
											stroke-width="4"></path>
										<text x="21" y="15"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:12px;cursor:pointer;color:#274b6d;fill:#274b6d;"
											text-anchor="start" zIndex="2">
										<tspan x="21">冷冻水供水温度</tspan></text></g>
										<g class="highcharts-legend-item" zIndex="1"
											transform="translate(121,3)">
										<path fill="none" d="M 0 11 L 16 11" stroke="#FBCDA7"
											stroke-width="4"></path>
										<text x="21" y="15"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:12px;cursor:pointer;color:#274b6d;fill:#274b6d;"
											text-anchor="start" zIndex="2">
										<tspan x="21">冷冻水回水温度</tspan></text></g></g></g></g>
										<g class="highcharts-axis-labels" zIndex="7">
										<text x="82.8125" y="182"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle" opacity="1">
										<tspan x="82.8125">1</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">2</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">3</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">4</tspan></text>
										<text x="265.3125" y="182"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle" opacity="1">
										<tspan x="265.3125">5</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">6</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">7</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">8</tspan></text>
										<text x="447.8125" y="182"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle" opacity="1">
										<tspan x="447.8125">9</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">10</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">11</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">12</tspan></text>
										<text x="630.3125" y="182"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle" opacity="1">
										<tspan x="630.3125">13</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">14</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">15</tspan></text>
										<text x="0" y="-9999"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="middle">
										<tspan x="0">16</tspan></text></g>
										<g class="highcharts-axis-labels" zIndex="7">
										<text x="52" y="129.92552083333334"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;width:345px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="end" opacity="1">
										<tspan x="52">0</tspan></text>
										<text x="52" y="87.25885416666668"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;width:345px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="end" opacity="1">
										<tspan x="52">5</tspan></text>
										<text x="52" y="44.5921875"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;width:345px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="end" opacity="1">
										<tspan x="52">10</tspan></text>
										<text x="52" y="172.5921875"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:11px;width:345px;color:#666;cursor:default;line-height:14px;fill:#666;"
											text-anchor="end" opacity="1">
										<tspan x="52">-5</tspan></text></g>
										<g class="highcharts-tooltip" zIndex="8"
											style="cursor:default;padding:0;white-space:nowrap;"
											visibility="hidden" transform="translate(0,0)">
										<rect rx="3" ry="3" fill="none" x="0.5" y="0.5" width="16"
											height="16" fill-opacity="0.85" isShadow="true"
											stroke="black" stroke-opacity="0.049999999999999996"
											stroke-width="5" transform="translate(1, 1)"></rect>
										<rect rx="3" ry="3" fill="none" x="0.5" y="0.5" width="16"
											height="16" fill-opacity="0.85" isShadow="true"
											stroke="black" stroke-opacity="0.09999999999999999"
											stroke-width="3" transform="translate(1, 1)"></rect>
										<rect rx="3" ry="3" fill="none" x="0.5" y="0.5" width="16"
											height="16" fill-opacity="0.85" isShadow="true"
											stroke="black" stroke-opacity="0.15" stroke-width="1"
											transform="translate(1, 1)"></rect>
										<rect rx="3" ry="3" fill="rgb(255,255,255)" x="0.5" y="0.5"
											width="16" height="16" fill-opacity="0.85"></rect>
										<text x="8" y="21"
											style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Verdana, Arial, Helvetica, sans-serif;font-size:12px;color:#333333;fill:#333333;"
											zIndex="1"></text></g></svg>
								</div>
							</div>
						</div>
						<div style="display: none;">12321321</div>
						<div style="display: none;">3</div>
						<div style="display: none;">4</div>
					</div>
				</div>


				<div class="span12">
					<table border="0px;"
						style="border-color: white; line-height: 36px; border-collapse: 3px;">
						<tr id="sealPumpStateTr" style="visibility: false"></tr>
					</table>
				</div>
				<div id="sPumpOnOffBlock" class="span12">&nbsp;</div>
			</div>

			<div id="sealPumpRateGraphic"></div>
		</div>
	</div>
</div>

<%-- 冷冻泵 --%>
<portlet:resourceURL id="detectSealmPump" var="detectSealmPumpURL">
</portlet:resourceURL>
<script type="text/javascript">
	var cold_water_pump_step = 12 * 1; // 图表X轴显示的间隔 
	function sealPumpClick() {

		setActiveFunction("sp");
		//UI
		$(".cold_module").siblings().hide();
		$(".cold_module").show();
		//
		$(".switch_device>div").hide();
		var switchDom = $($(".switch_device>div")[3]);
		switchDom.show();
		//
		$("#tabSp").siblings().removeClass("highlight");
		$("#tabSp").addClass("highlight");

		//alert("点击冷冻泵");

		$.post('${detectSealmPumpURL}', {
			tfrom : csTFrom,
			tto : csTTo,
			type : csType,
			defaultRegionId : '' // 默认显示的区域
		}, function(data) {
			//initSealPumpRateGraphic(data);
			initSealPumpOnOffGraphic(data);

		});

		highlightDate(csType);
	}
</script>


<%--冷冻泵频率状态 --%>
<script type="text/javascript">
	function initSealPumpRateGraphic(data) {
		option = {
			chart : {
				type : 'spline',
				renderTo : 'sealPumpRateGraphic',
				width : 800,
				height : 228
			},
			title : {
				text : '冷冻水泵频率',
				align : 'left',
				x : 80
			},
			legend : {
				align : 'center',
				borderWidth : 1
			},
			subtitle : {
				text : ''
			},
			xAxis : {
				categories : data.cate,
				labels : {
					x : 10,
					step : parseInt(data.cate.length / 24)
				}
			},
			yAxis : {
				title : {
					text : '水泵频率HZ'
				},
				gridLineDashStyle : 'LongDash'

			},
			tooltip : {
				valueSuffix : '℃'
			},
			plotOptions : {
				spline : {
					lineWidth : 1,
					states : {
						hover : {
							lineWidth : 2
						}
					},
					marker : {
						enabled : false
					}

				}
			},
			credits : {
				enabled : false
			},
			series : []

		};
		//
		option.series = new Array();
		$.each(data.series, function(i, value) {
			//alert(data.series[i].color);

			option.series[i] = new Object();
			option.series[i].data = value.data[0];
			option.series[i].name = value.name;
			option.series[i].color = value.color;
		});
		sealPumpRateChart = new Highcharts.Chart(option);

	};
</script>

<%--冷冻泵开关状态 --%>
<script type="text/javascript">
	sPumpOnOffOption = {
		chart : {
			height : 200,
			width : 946,
			type : 'area',
			pointWidth : 0
		},
		title : {
			align : 'left',
			x : 80,
			text : ''
		},
		credits : {
			enabled : false
		},
		legend : {
			layout : 'vertical',
			align : 'left',
			verticalAlign : 'top',
			borderWidth : 1,
			backgroundColor : '#FFFFFF'
		},
		xAxis : {
			tickColor : '#FFFFFF',
			labels : {
				step : 30,
				rotation : -90,
				x : 10,
				y : 20
			},
			categories : []
		},
		yAxis : {
			title : {
				text : ''
			},
			labels : {
				formatter : function() {
					return this.name;
				}
			},
			gridLineDashStyle : 'LongDash'
		},
		tooltip : {
			formatter : function() {
				return '<b>' + this.series.name + '</b>';
			}
		},
		plotOptions : {
			area : {
				fillColor : {
					linearGradient : {
						x1 : 0,
						y1 : 0,
						x2 : 0,
						y2 : 1
					},
					stops : [
							[ 0, Highcharts.getOptions().colors[0] ],
							[
									1,
									Highcharts.Color(
											Highcharts.getOptions().colors[0])
											.setOpacity(0).get('rgba') ] ]
				},
				lineWidth : 2,
				marker : {
					enabled : false
				},
				shadow : false,
				states : {
					hover : {
						lineWidth : 2
					}
				},
				threshold : null
			}
		},
		credits : {
			enabled : false
		},
		series : [ {
			name : '开',
			color : '#CC33CC',
			data : [],
			pointStart : "",
			pointInterval : 0
		}, {
			name : '关',
			color : '#FFFFFF'
		} ]
	};

	// 刷新图表数据 
	function initSealPumpOnOffGraphic(data) {
		//alert("cpOnOfData"+data);

		$(".beforeOnOfBlock").remove();

		sPumpOnOffCount = 0;
		$
				.each(
						data.stateMap,
						function(key, value) {
							//alert(sPumpOnOffOption+"-"+key+"-"+value);

							sPumpOnOffCount++;
							$("#sPumpOnOffBlock")
									.before(
											"<div id="+sPumpOnOffCount+" class='beforeOnOfBlock'></div>");

							//
							sPumpOnOffOption.chart.renderTo = ''
									+ sPumpOnOffCount;

							sPumpOnOffOption.xAxis.categories = data.cate; // X轴显示
							sPumpOnOffOption.xAxis.labels.step = cold_water_pump_step; // X轴显示间隔 

							sPumpOnOffOption.series = new Array();
							sPumpOnOffOption.series[0] = new Object();
							sPumpOnOffOption.series[0].data = value;
							sPumpOnOffOption.series[0].name = '开启';
							sPumpOnOffOption.title.text = key;

							new Highcharts.Chart(sPumpOnOffOption);
						});

		// 设置高度，目的是为了完整的显示版权信息 
		$('#hrefFm').height(
				$('#<portlet:namespace />detect_sealm_pump').height() - 700);

	}
</script>
<%-- 冷冻泵日期选择控件 --%>
<input id="coolSealmDatepickerMonth" type="hidden" />
<script type="text/javascript">
	//冷冻水泵开启状态的文字切换
	$('#<portlet:namespace />cold_water_pump_status').text(prettyFrom);
	/** 点击日、周、月触发的事件  */
	function changeSealmPumpDate(type) {
		highlightDate(type);
		//
		csType = type;

		var cool_text = ""; // 冷冻水泵开启状态的文字切换 
		WdatePicker({
			el : 'coolSealmDatepickerMonth',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				//日期修正
				switch (type) {
				case 'day':
					cold_water_pump_step = 12 * 1; // 图表X轴显示的间隔 
					cool_text = from; // 冷冻水泵开启状态的文字切换 
					to = dp.$DV(from, {
						d : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'week':
					cold_water_pump_step = 12 * 2; // 图表X轴显示的间隔 
					cool_text = showWeekFirstDay(from) + " ~ "
							+ showWeekLastDay(from); // 冷冻水泵开启状态的文字切换
					to = dp.$DV(from, {
						d : 7
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'month':
					cold_water_pump_step = 12 * 4; // 图表X轴显示的间隔 
					cool_text = dp.cal.getDateStr("yyyy-MM") + "-01 ~ "
							+ showMonthLastDay(from); // 冷冻水泵开启状态的文字切换
					to = dp.$DV(from, {
						M : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				}

				// 冷冻水泵开启状态的文字切换
				$('#<portlet:namespace />cold_water_pump_status').text(
						cool_text);
				//赋值
				csTFrom = from;
				csTTo = to;
				//刷新数据
				sealPumpClick();
			}
		});

	};
</script>