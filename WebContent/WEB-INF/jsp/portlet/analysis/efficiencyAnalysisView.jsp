<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午6点22分
	LastModified Date:
	Description: 能效分析
 -->


<div class="div-table m_top">

	<div class="span445 row-fluid">
		<div id="runMonitor">

			<div class="bgpicdiv">
				<div>
					<b
						style="color: #FFFFFF; font-size: 20px; font-family: 宋体; position: absolute; left: 10px; top: 10px;">能效分析</b>
				</div>
				<div class="gradepic gradepictop gradepicdiv" id="gradepicPostion">
					<div class="arrow"></div>
					<h3 class="gradepic-title gradepicpos">
						当前评分：<span id="<portlet:namespace />gradepic">B+</span>
					</h3>
				</div>
			</div>

		</div>

		<div class="chart_title charttitletop"
			style="background-color: #FBEACF;">
			<div>
				<span style="color: #EF9709;">单位面积能耗</span>
			</div>
			<div>
				<span style="color: #EF9709;">冷机COP</span>
			</div>
		</div>
		<div class="eff_para" style="background-color: #FBEACF;">
			<div>
				<p class="onoff_state">
					<span id="<portlet:namespace />datavalue1" style="color: #EF9709;">142</span><sup
						style="color: #A5A3AE;">Wh/m²·天</sup>
				</p>
			</div>

			<div class="eff_line"></div>

			<div>
				<p class="onoff_state">
					<span id="<portlet:namespace />datavalue2" style="color: #EF9709;">5.8</span>
				</p>
			</div>
		</div>
	</div>

</div>


<script type="text/javascript">
	//默认显示当前时间
	var <portlet:namespace />start_date = ''; // 开始时间
	var <portlet:namespace />choose_type = "day";
	if ("${efficiencyanalysis.defaulttime}" == "") {
		var nowdate = new Date();
		<portlet:namespace />start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1)
				+ "-" + nowdate.getDate();
	} else {
		<portlet:namespace />start_date = "${efficiencyanalysis.defaulttime}";
	}

	$
			.post(
					'<portlet:resourceURL id="getValueByNameAndId"></portlet:resourceURL>',
					{
						from : <portlet:namespace />start_date,
						name : '${efficiencyanalysis.choose_name}',
						id : '${efficiencyanalysis.choose_id}',
						ispd : '${efficiencyanalysis.ispd}',
						decimals : '${efficiencyanalysis.decimals}',
						att : 'average',
						type : <portlet:namespace />choose_type
					},
					function(data) {
						// 为相应的位置赋值
						var valueList = data.data;
						var value = parseFloat(valueList[0]);

						var temp = 3;
						if (value >= parseFloat(0.4)) { // 评分为E
							temp = 0;
						}

						if (parseFloat(0.2) <= value
								&& value <= parseFloat(0.4)) { // 评分为D
							temp = 1;
						}

						if (parseFloat(0) <= value && value <= parseFloat(0.2)) { // 评分为C
							temp = 2;
						}

						if (parseFloat(-0.2) <= value && value <= parseFloat(0)) { // 评分为B
							temp = 3;
						}

						if (parseFloat(value) <= parseFloat(-0.2)) { // 评分为A
							temp = 4;
						}

						var gradeList = [ 'E', 'D', 'C', 'B', 'A' ];
						var postList = [ 35, 88, 153, 218, 277 ];
						$("#gradepicPostion").css("left", postList[temp]);
						$("#<portlet:namespace />gradepic").text(
								gradeList[temp]);
					}, 'json');

	// 获取页面下方的数据信息
	function <portlet:namespace />getButtomData() {
		$
				.post(
						'<portlet:resourceURL id="getValueListByNamesAndAtts"></portlet:resourceURL>',
						{
							from : <portlet:namespace />start_date,
							name : '${efficiencyanalysis.valuename}',
							id : '${efficiencyanalysis.valueid}',
							ispd : '${efficiencyanalysis.valueispd}',
							att : '${efficiencyanalysis.attribute}',
							multiplier : '${efficiencyanalysis.multiplier}',
							type : <portlet:namespace />choose_type
						},
						function(data) {
							var dataList = data.data;

							try {
								var shu = parseFloat("${efficiencyanalysis.multiplier}");
								$('#<portlet:namespace />datavalue1')
										.text(
												returnPositiveVal(dataList[0],
														'${efficiencyanalysis.decimals}'));
								$('#<portlet:namespace />datavalue2')
										.text(
												returnPositiveVal(
														(Math.round(dataList[1]
																* 100 / shu) / 100),
														'${efficiencyanalysis.decimals}'));
							} catch (e) {
							}
						}, 'json');
	}

	<portlet:namespace />getButtomData();
	// 五分钟定时执行
	window.setInterval("<portlet:namespace />getButtomData()", 300000);
</script>