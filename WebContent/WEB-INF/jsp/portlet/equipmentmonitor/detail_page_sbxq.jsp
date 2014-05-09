<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<div class="title_block sub_title_block">
	<p>设备详情</p>
	<p class="today"></p>
	<div>
		<div class="download"></div>
		<div class="btn_group">
			<input id="select_date_sbxq" type="hidden">
			<div class="btn_press"
				onclick="selectdate_sbxq('day','select_date_sbxq',this)">日视图</div>
			<div onclick="selectdate_sbxq('week','select_date_sbxq',this)">周视图</div>
			<div onclick="selectdate_sbxq('month','select_date_sbxq',this)">月视图</div>
		</div>
		<div class="filter_widget">
			<div class="filter_label has_border_radius_left">选择设备</div>
			<select id="chooseDevice">
			</select>
		</div>
	</div>
</div>
<div class="d_w_m_switch" style="display: none;">
	<div class="cur">
		<div class="fault_content yxsj">
			<div class="fault_title">
				<h3>运行时间</h3>
				<div class="legend">
					<div class="time_line">
						<div class="chart_dot"></div>
						<div class="chart_line 0_2"></div>
						<div class="chart_dot"></div>
					</div>
					<span>开</span>
				</div>
			</div>
			<div class="chart_content">
				<div class="left_para">
					<span class="left_text">日累计运行时间 <strong>5<sup>h</sup></strong></span>
				</div>
				<div class="right_para">
					<div class="chart_yxsj" id="<portlet:namespace/>chart_yxsj"
						style="width: 100%; height: 70%;"></div>
					<div class="time_roll" style="height: 30%;">
						<div>0:00</div>
						<div>4:00</div>
						<div>8:00</div>
						<div>12:00</div>
						<div>16:00</div>
						<div>20:00</div>
						<div>24:00</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="fault_content  yxsj_zhou">
			<div class="fault_title">
				<h3>运行时间</h3>
			</div>
			<div class="chart_content">
				<div class="left_para">
					<table border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td>周最大值</td>
								<td>5<sup>h</sup></td>
								<td><i>09-01&nbsp;&nbsp;周一</i></td>

							</tr>
							<tr>
								<td>周最小值</td>
								<td>2<sup>h</sup></td>
								<td><i>09-07&nbsp;&nbsp;周日</i></td>
							</tr>
							<tr>
								<td>周累计运行时间</td>
								<td>20<sup>h</sup></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="chart" id="chart_week"></div>
			</div>
		</div>
	</div>
	<div>
		<div class="fault_content yxsj_yue">
			<div class="fault_title">
				<h3>运行时间</h3>
			</div>
			<div class="chart_content">
				<div class="left_para">
					<table border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td>月最大值</td>
								<td>6<sup>h</sup></td>
								<td><i>09-28</i></td>

							</tr>
							<tr>
								<td>月最小值</td>
								<td>2<sup>h</sup></td>
								<td><i>09-07</i></td>
							</tr>
							<tr>
								<td>月累计运行时间</td>
								<td>105<sup>h</sup></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="chart" id="chart_month"></div>
			</div>
		</div>
	</div>
</div>

<!-- 冷站 | 常规制冷系统 | 冷水机组 -->
<div class="detail_chart none_div coldSiteDiv">
	<div class="fault_content">
		<div class="fault_title">
			<h3>冷冻水参数</h3>
			<span>冷冻水额定供回水温度为<i> 7/12 </i>℃
			</span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="coldSiteColdParam_table">
						<tr>
							<td>供水温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>供水温度最小值</td>
							<td>15</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回水温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回水温度最小值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<!-- <tr>
							<td>蒸发温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>蒸发温度最小值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="chart" id="coldSiteColdParam_chart"></div>
		</div>
	</div>
	<div class="fault_content">
		<div class="fault_title">
			<h3>冷却水参数</h3>
			<span>冷却水额定供回水温度为<i> 37/32 </i>℃
			</span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="coldSiteCoolParam_table">
						<tr>
							<td>供水温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>供水温度最小值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回水温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回水温度最小值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<!-- <tr>
							<td>冷凝温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>冷凝温度最小值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="chart" id="coldSiteCoolParam_chart"></div>
		</div>
	</div>
</div>

<!-- 常规制冷系统 | 冷水机组、水系统 -->
<div class="detail_chart none_div coolSystemDiv">
	<div class="fault_content">
		<div class="fault_title">
			<h3>水流量</h3>
			<span>冷冻水额定供回水温度为<i> 7/12 </i>℃
			</span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="waterFlow_table">
						<tr>
							<td><span>日</span>最大值</td>
							<td>400</td>
							<td class="tdClass"><sup>m³/h</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>最小值</td>
							<td>12</td>
							<td class="tdClass"><sup>m³/h</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>平均值</td>
							<td>200</td>
							<td class="tdClass"><sup>m³/h</sup></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="chart" id="waterFlow_chart"></div>
		</div>
	</div>
	<div class="fault_content">
		<div class="fault_title">
			<h3>压力</h3>
			<span>冷冻水额定供回水温度为<i> 7/12 </i>℃
			</span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="waterPressure_table">
						<tr>
							<td><span>日</span>最大值</td>
							<td>400</td>
							<td class="tdClass"><sup>Pa</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>最小值</td>
							<td>0</td>
							<td class="tdClass"><sup>Pa</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>平均值</td>
							<td>200</td>
							<td class="tdClass"><sup>Pa</sup></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="chart" id="waterPressure_chart"></div>
		</div>
	</div>
	<div class="fault_content">
		<div class="fault_title">
			<h3>冷冻水参数</h3>
			<span>冷冻水额定供回水温度为<i> 7/12 </i>℃
			</span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="waterColdParam_table">
						<tr>
							<td>供水温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>供水温度最小值</td>
							<td>15</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回水温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回水温度最小值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<!-- <tr>
							<td>蒸发温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>蒸发温度最小值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="chart" id="waterColdParam_chart"></div>
		</div>
	</div>
	<div class="fault_content">
		<div class="fault_title">
			<h3>冷却水参数</h3>
			<span>冷却水额定供回水温度为<i> 37/32 </i>℃
			</span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="waterCoolParam_table">
						<tr>
							<td>供水温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>供水温度最小值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回水温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回水温度最小值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<!-- <tr>
							<td>冷凝温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>冷凝温度最小值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="chart" id="waterCoolParam_chart"></div>
		</div>
	</div>
</div>

<!-- 冷站 - 常规制冷系统 | 冷却塔-->
<div class="detail_chart none_div coolTowerDiv">
	<div class="fault_content">
		<div class="fault_title">
			<h3>风机频率</h3>
			<span>额定频率：<i> 35 </i>HZ
			</span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="towerWindFrequency_table">
						<tr>
							<td><span>日</span>最大值</td>
							<td>15</td>
							<td class="tdClass"><sup>HZ</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>最小值</td>
							<td>7</td>
							<td class="tdClass"><sup>HZ</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>平均值</td>
							<td>17</td>
							<td class="tdClass"><sup>HZ</sup></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="chart" id="towerWindFrequency_chart"></div>
		</div>
	</div>
	<div class="fault_content">
		<div class="fault_title">
			<h3>冷却水参数</h3>
			<span>额定供水温度：<i> 32 </i>℃ 额定回水温度： <i>37</i> ℃
			</span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="towerCoolParam_table">
						<tr>
							<td><span>日</span>供水温度最大值</td>
							<td>31</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>供水温度最小值</td>
							<td>25</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>供水温度平均值</td>
							<td>27</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<!-- <tr>
							<td><span>日</span>回水温度最大值</td>
							<td>35</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>回水温度最小值</td>
							<td>22</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>回水温度平均值</td>
							<td>28</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="chart" id="towerCoolParam_chart"></div>
		</div>
	</div>
</div>

<!-- 空调箱设备详情 -->
<div class="detail_chart ahu_detail none_div">
	<div class="fault_content">
		<div class="fault_title">
			<h3>送回风温度参数</h3>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="windTempParam_table">
						<tr>
							<td>送风温度最大值</td>
							<td>15</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>送风温度最小值</td>
							<td>7</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回风温度最大值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回风温度最小值</td>
							<td>12</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<!-- <tr>
							<td>新风温度最大值</td>
							<td>14</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>新风温度最小值</td>
							<td>11</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="chart" style="height: 300px !important;"
				id="windTempParam_chart"></div>
		</div>
	</div>
	<div class="fault_content">
		<div class="fault_title">
			<h3>送回风湿度参数</h3>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="windHumpParam_table">
						<tr>
							<td>送风湿度最大值</td>
							<td>15</td>
							<td class="tdClass"><sup>%</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>送风湿度最小值</td>
							<td>7</td>
							<td class="tdClass"><sup>%</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>送风湿度平均值</td>
							<td>17</td>
							<td class="tdClass"><sup>%</sup></td>
							<td></td>
						</tr>
						<!-- <tr>
							<td>回风湿度最大值</td>
							<td>12</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回风湿度最小值</td>
							<td>14</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>回风湿度平均值</td>
							<td>11</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="chart" style="height: 300px !important;"
				id="windHumpParam_chart"></div>
		</div>
	</div>
	<!-- <div class="fault_content">
		<div class="fault_title">
			<h3>水阀开度</h3>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="waterOpen_table">
						<tr>
							<td><span>日</span>水阀开度最大值</td>
							<td>12</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>水阀开度最小值</td>
							<td>14</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>水阀开度平均值</td>
							<td>11</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="chart" style="height: 300px !important;"
				id="waterOpen_chart"></div>
		</div>
	</div>
	
	
	<div class="fault_content">
		<div class="fault_title">
			<h3>风机频率</h3>
			<span><i>送风机额定频率：50HZ;回风机额定频率：50HZ;</i></span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="fanFrequency_table">
						<tr>
							<td><span>日</span>送风机频率最大值</td>
							<td>15</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>送风机频率最小值</td>
							<td>7</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>送风机频率平均值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>回风机频率最大值</td>
							<td>12</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>回风机频率最小值</td>
							<td>14</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>回风机频率平均值</td>
							<td>11</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="height: 300px !important;" id="fanFrequency_chart"></div>
		</div>
	</div> -->
</div>

<!-- 送风机设备详情 -->
<div class="detail_chart runningDiv none_div">
	<div class="fault_content">
		<div class="fault_title">
			<h3>运行频率</h3>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="runFrequency_table">
						<tr>
							<td><span>日</span>最大值</td>
							<td>12</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>最小值</td>
							<td>7</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>平均值</td>
							<td>11</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="chart" style="height: 300px !important;"
				id="runFrequency_chart"></div>
		</div>
	</div>
	<div class="fault_content">
		<div class="fault_title">
			<h3>运行风量、风压</h3>
			<span><i>额定风压：45kPa 额定风量：379m³/h</i></span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="runningWind_table">
						<tr>
							<td><span>日</span>风量最大值</td>
							<td>15</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>风量最小值</td>
							<td>7</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>风量平均值</td>
							<td>17</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<!-- <tr>
							<td><span>日</span>风压最大值</td>
							<td>12</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>风压最小值</td>
							<td>14</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td><span>日</span>风压平均值</td>
							<td>11</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="chart" style="height: 300px !important;"
				id="runningWind_chart"></div>
		</div>
	</div>
</div>

<!-- 热水参数 -->
<div class="detail_chart hotWaterParamDiv none_div">
	<div class="fault_content">
		<div class="fault_title">
			<h3>热水参数</h3>
			<span><i>额定供水温度：60℃  额定回水温度：50℃</i></span>
		</div>
		<div class="chart_content">
			<div class="left_para">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody class="hotWaterParam_table">
						<tr>
							<td>供水温度最大值</td>
							<td>61</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>供水温度最小值</td>
							<td>55</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
						<tr>
							<td>供水温度平均值</td>
							<td>58</td>
							<td class="tdClass"><sup>℃</sup></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="chart" style="height: 300px !important;" id="hotWaterParam_chart"></div>
		</div>
	</div>
</div>

<!-- 照明回路-开启台数 -->
<div class="detail_chart lightOpenNumDiv none_div">
	<div class="fault_content">
		<div class="fault_title">
			<h3>开启台数</h3>
			<span><i></i></span>
		</div>
		<div class="chart_content">
			<div class="chart" style="width: 940px; height: 300px !important;" id="lightOpenNum_chart"></div>
		</div>
	</div>
</div>

<!-- 照明回路-开启台数 -->
<div class="detail_chart fcuOpenNumDiv none_div">
	<div class="fault_content">
		<div class="fault_title">
			<h3>开启台数</h3>
			<span><i></i></span>
		</div>
		<div class="chart_content">
			<div class="chart" style="width: 940px; height: 300px !important;" id="fcuOpenNum_chart"></div>
		</div>
	</div>
</div>

<script type="text/javascript">
	//获取数据--绘图--运行时间
	function getchart_yxsj() {
		getSBXQ_YXSJchart("<portlet:namespace/>chart_yxsj");
	}

	//获取数据--绘图--设备详情
	function getchart_sbxq(tfrom, legend, id, name, ispd, choose_type,
			decimals, yTitle, chartColor, charttype, step, showLegend) {
		$
				.post(
						"<portlet:resourceURL id='getMoreChartsByNames'></portlet:resourceURL>",
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							decimals : decimals,
							type : choose_type
						},
						function(data) {
							var dataList = data.dataList;
							var cateList = [];
							var centerTitle = tfrom;//图表标题
							for ( var i = 0; i < dataList[0].length; i++) {
								cateList[i] = i;
							}
							if (choose_type == "week") {
								centerTitle = "";
								cateList = data.cataList;
								centerTitle = tfrom.substring(0, 5)
										+ data.cataList[0].replace(/\//g, '-')
										+ "~"
										+ data.cataList[data.cataList.length - 1]
												.replace(/\//g, '-');
							} else if (choose_type == "month") {
								cateList = data.cataList;
								centerTitle = tfrom.substring(0, 5);
							}
							if (step != "") {
								xStep = step;
							}
							$(".today").html(centerTitle);
							for ( var i = 0; i < legend.length; i++) {
								//渲染图表--多线图表--数据处理
								var legendList = legend[i];
								getSBJCChart("sbxq_" + (i + 1), legendList,
										cateList, xStep,
										<portlet:namespace/>chartFillColorList,
										yTitle, '', chartColor, charttype,
										dataList[i], showLegend);
							}
						});
	}
	//日周月时间选择--设备详情
	function selectdate_sbxq(type, date_id, obj) {
		var dformt = 'yyyy-MM-dd';
		if (type == 'month') {
			dformt = 'MM';
			titleFormt = 'yyyy-MM';
		}
		WdatePicker({
			el : date_id,
			dateFmt : dformt,
			onpicked : function(dp) {
				// $(".d_w_m_switch>div:eq("+($(obj).index()-1)+")").addClass("cur").siblings().removeClass("cur");
				var _time = dp.cal;
				detail_wind_type = type;
				detail_wind_starttime = _time.getDateStr("yyyy-MM-dd");
				
				$(".today").html(detail_wind_starttime);
				//运行时间绘图			
				if (type == 'day') {
					//x轴间隔控制
					xStep = '4';
					$(".today").html(_time.getDateStr("yyyy-MM-dd"));
				} else if (type == 'week') {
					xStep = '1';
					var date = _time.getDateStr("yyyy-MM-dd");
					$(".today").html(
							showWeekFirstDay(date) + "~"
									+ showWeekLastDay(date));
					//var data_week = [ 4, 5, 3, 7, 3, 2, 5 ];
					//var cateList = [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ];
					// getYXSJ_zhouChart("chart_week",cateList,data_week);
				} else if (type == 'month') {
					xStep = '5';
					$(".today").html(_time.getDateStr("yyyy-MM"));
					var cateList = [];
					var data_month = [ 4, 5, 3, 7, 3, 2, 5, 4, 5, 3, 7, 3, 2,
							5, 4, 5, 3, 7, 3, 2, 5, 4, 5, 3, 7, 3, 2, 5, 2, 5 ];
					for ( var i = 1; i <= data_month.length; i++) {
						cateList[i - 1] = i;
					}
					// getYXSJ_zhouChart("chart_month",cateList,data_month);
				}
				//设备详情--绘图
				var curId = $(".detail_page").attr("tip"); // 当前所处模块id
				
				if (curId == 'coldSite_one' || curId == 'coldSite_two' || curId == 'coldSite_three') { // 冷站1,2,3 | 常规制冷系统
					
					var child = $(".cur_tab").find("span").text();
					if(child == '冷水机组'){ // 冷水机组
						opeaColdSite();
					} else if(child == '水系统'){ // 水系统
						opeaWaterSystem();
					} else if(child == '冷冻水泵'){ // 冷冻水泵
						opeateRunningParam();
					} else if(child == '冷却水泵'){ // 冷却水泵
						opeateRunningParam();
					} else if(child == '冷却塔'){ // 冷却塔
						opeaCoolTower();
					} 
				}
				
				if(curId == 'ahu') { // 空调箱
					opeaAhu(); // 处理空调箱的信息
				}
				
				if(curId == 'sendWind' || curId == 'exhaustWind') { // 送风机或者排风机
					opeaWindSite();
				}
				
				if(curId == 'light') { // 照明回路
					opeaLight();
				}
				
				if(curId == 'fcu') { // 风机盘管
					opeaFcu();
				}
			
				//getDevicesDetailChart('runFrequency'); // 送排风机运行频率 
				//if ("${equipmentMonitor.isShowWindPressure}" != "none")
				//	getDevicesDetailChart('runningWind'); // 送排风机运行风量、风压
				return false;
				getchart_sbxq(_time.getDateStr("yyyy-MM-dd"),
						detail_0_down_yTtile[0].split(','),
						detail_0_down_id[0], detail_0_down_name[0],
						detail_0_down_ispd[0], type,
						<portlet:namespace/>decimals,
						<portlet:namespace/>yLeftTitle[0],
						"${equipmentMonitor.chartColorList_1}", 'line', xStep,
						true);
				//choose_id、choose_name、ispd赋值

				//导出到Excel中的时间
			}
		});
	}
</script>