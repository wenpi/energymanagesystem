<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<%--  空调组 --%>
	<div class="span12">
		<div class="span3">
			<div id="u1269" class="u1269_container" data-label="恒温恒湿空调箱">
				<div id="u1269_img" class="u1269_selected"></div>
				<div id="u1270" class="u1270" style="top: 6px;">
					<div id="u1270_rtf">
						<p style="text-align: left;" id="cache14">
							<span
								style="font-family: 微软雅黑; font-size: 18px; font-weight: normal; font-style: normal; text-decoration: none; color: rgb(255, 0, 0);"
								id="cache15">恒温恒湿空调箱 &gt;</span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="span6">
			<%-- 区域选择 --%>
			<select onchange="airEndLevelSelect()" id="airEndLevelSelect">
				<c:forEach items="${region}" var="level">
					<option value="${level.regionId}">${level.regionName}</option>
				</c:forEach>
			</select>
		</div>

	</div>
	<%-- 设备选择   日期选择 --%>
	<div class="span12">
		<div class="span4">
			<select onchange="fcuEquipSelect()" id="fcuEquipSelect">

				<c:forEach items="${fcus}" var="fcu">
					<option selected="selected" value="${fcu.id}">${fcu.id}</option>
				</c:forEach>
			</select>
		</div>
		<div class="span6 ">
			<div class="text-right">
				<ul class="date_select" style="list-style-type: none;">
					<li onclick="changeFcuDate('month')" class="month_color">月</li>
					<li onclick="changeFcuDate('week')" class="week_color">周</li>
					<li onclick="changeFcuDate('day')" class="day_color">日</li>
				</ul>
			</div>
		</div>

	</div>
	<%-- end设备选择   日期选择 --%>

	<div class="span10">
		<hr>
	</div>
	<span class="span12">&nbsp;</span>

	<div id="fcuOnOffGraphic" class="span12"></div>
	<span class="span12">&nbsp;</span>
	<div id="fcuSupplyRtnWindTempGraphic" class="span12"></div>

	<%--  end空调组 --%>

	<span class="span12"> <br>
	<br>
	<br>
	</span>



	<%--WAV组 设备选择   日期选择 --%>
	<div class="span12">
		<div class="span4">
			<select onchange="vavEquipSelect()" id="vavEquipSelect">

				<c:forEach items="${vavs}" var="vav">
					<option selected="selected" value="${vav.id}">${vav.id}</option>
				</c:forEach>
			</select>
		</div>

		<span class="span6"> <span class="text-right">
				<ul class="date_select" style="list-style-type: none;">
					<li onclick="changeVavDate('month')" class="month_color">月</li>
					<li onclick="changeVavDate('week')" class="week_color">周</li>
					<li onclick="changeVavDate('day')" class="day_color">日</li>
				</ul>
		</span>
		</span>

	</div>
	<%-- end设备选择   日期选择 --%>
	<div class="span10">
		<hr>
	</div>
	<%--  vAV开启状态 --%>
	<span class="span12">&nbsp;</span>
	<div id="vavOnOffGraphic" class="span12"></div>
	<span class="span12">&nbsp;</span>
	<div id="vavOnOffGraphic" class="span12"></div>
	<span class="span12">&nbsp;</span>
	<%--  end  WAV开启状态 --%>
</div>
<%-- 变更区域 --%>
<script type="text/javascript">
	var airCdtEndRegion = "0m";
	function airEndLevelSelect() {
		airCdtEndRegion = $("#airCdtEndRegion").val();
		airCdtEndPageInit();

	}
</script>

<%--FCU开关状态 --%>
<script type="text/javascript">
	function initFCUOnOffGraphic(data) {
		$('#fcuOnOffGraphic').highcharts({
			chart : {
				height : 150,
				width : 800,
				type : 'area',
				spacingBottom : 30
			},
			title : {
				align : 'left',
				x : 80,
				text : 'FCU开启状态'
			},
			subtitle : {
				text : '',
				floating : true,
				align : 'right',
				verticalAlign : 'bottom',
				y : 15
			},
			legend : {
				layout : 'vertical',
				align : 'left',
				verticalAlign : 'top',
				borderWidth : 1,
				backgroundColor : '#FFFFFF'
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
					text : ''
				},
				labels : {
					formatter : function() {
						return this.name;
					}
				}
			},
			tooltip : {
				formatter : function() {
					return '<b>' + this.series.name + '</b>';
				}
			},
			plotOptions : {
				area : {
					fillOpacity : 1
				}
			},
			credits : {
				enabled : false
			},
			series : [ {
				type : 'column',
				pointWidth : (800 / data.opens.length),
				name : '开',
				data : data.opens
			}, {
				name : '关',
				color : '#FFFFFF',
				data : []
			} ]
		});
	}
</script>

<%--FCU送、回风温度（℃） --%>
<script type="text/javascript">
	function initFCUSupplyRtnWindTempGraphic(data) {
		$('#fcuSupplyRtnWindTempGraphic').highcharts({
			chart : {
				type : 'spline',
				width : 800,
				height : 228
			},
			credits : {
				enabled : false
			},
			title : {
				align : 'left',
				x : 80,
				text : '送、回风温度（℃）'
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
					text : '温度 (℃)'
				}

			},
			tooltip : {
				valueSuffix : '℃'
			},
			plotOptions : {
				spline : {
					lineWidth : 4,
					states : {
						hover : {
							lineWidth : 5
						}
					},
					marker : {
						enabled : false
					}

				}
			},
			series : [ {
				color : '#52B103',
				name : '送风温度',
				data : data.t_supply_fcu

			}, {
				name : '回风温度',
				data : data.t_return_fcu
			} ]

		});
	};
</script>



<%--WAV开启状态 --%>
<script type="text/javascript">
	function initVavOnOffGraphic(data) {
		$('#vavOnOffGraphic').highcharts({
			chart : {
				height : 150,
				width : 800,
				type : 'area',
				spacingBottom : 30
			},
			title : {
				align : 'left',
				x : 80,
				text : 'VAV开启状态'
			},
			subtitle : {
				text : '',
				floating : true,
				align : 'right',
				verticalAlign : 'bottom',
				y : 15
			},
			legend : {
				layout : 'vertical',
				align : 'left',
				verticalAlign : 'top',
				borderWidth : 1,
				backgroundColor : '#FFFFFF'
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
					text : ''
				},
				labels : {
					formatter : function() {
						return this.name;
					}
				}
			},
			tooltip : {
				formatter : function() {
					return '<b>' + this.series.name + '</b>';
				}
			},
			plotOptions : {
				area : {
					fillOpacity : 1
				}
			},
			credits : {
				enabled : false
			},
			series : [ {
				type : 'column',
				pointWidth : (800 / data.opens.length),
				name : '开',
				data : data.opens
			}, {
				name : '关',
				color : '#FFFFFF',
				data : []
			} ]
		});
	}
</script>

<%--新风参数 --%>
<script type="text/javascript">
	function initVavTempGraphic(data) {
		$('#vavOnOffGraphic').highcharts({
			chart : {
				type : 'spline',
				width : 800,
				height : 228
			},
			credits : {
				enabled : false
			},
			title : {
				align : 'left',
				x : 80,
				text : '送、回风温度（℃）'
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
					text : '温度 (℃)'
				}

			},
			tooltip : {
				valueSuffix : '℃'
			},
			plotOptions : {
				spline : {
					lineWidth : 4,
					states : {
						hover : {
							lineWidth : 5
						}
					},
					marker : {
						enabled : false
					}

				}
			},
			series : [ {
				color : '#52B103',
				name : '送风温度',
				data : data.t_supply_vav

			}, {
				name : '送风温度',
				data : data.t_return_vav
			} ]

		});
	};
</script>

<script type="text/javascript">
	// 点击“恒温恒湿空调箱”模块中的一个区域出现的效果 
	function airCdtEndPageInit() {
		$(".cold_module").siblings().hide();
		$("#airConditionEndGroup").show();
		queryVAVData();
		queryFCUData();
	}
</script>
<script type="text/javascript">
	function vavEquipSelect() {
		vavMachineId = $("#vavEquipSelect").val();
		queryVAVData();
	}
</script>
<%-- FCU --%>
<script type="text/javascript">
	function fcuEquipSelect() {
		fcuMachineId = $("#fcuEquipSelect").val();
		queryFCUData();
	}
</script>
<portlet:resourceURL id="detectFCUData" var="detectFCUDataURL">
</portlet:resourceURL>
<script type="text/javascript">
	var fcuTFrom = prettyFrom;
	var fcuTTo;
	var fcuType = "day";
	var fcuMachineId;
	var fcuFlag = "0";
	function queryFCUData() {
		fcuMachineId = $("#fcuEquipSelect").val();

		//FCU
		$.post('${detectFCUDataURL}', {
			tfrom : fcuTFrom,
			tto : fcuTTo,
			type : fcuType,
			id : fcuMachineId,
			ispd : "1"
		}, function(data) {
			initFCUSupplyRtnWindTempGraphic(data);
			initFCUOnOffGraphic(data);
		});

	}
</script>
<%-- FCU日期选择控件 --%>
<input id="fcuDatepicker" type="hidden" />
<script type="text/javascript">
	function changeFcuDate(type) {
		fcuType = type;

		WdatePicker({
			el : 'fcuDatepicker',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				//日期修正
				switch (type) {
				case 'day':
					to = from;
					from = null;
					break;
				case 'week':

					to = dp.$DV(from, {
						d : 7
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'month':

					to = dp.$DV(from, {
						M : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				}

				//赋值
				fcuTFrom = from;
				fcuTTo = to;
				//刷新数据
				queryFCUData();
			}
		});

	};
</script>


<%-- VAV --%>
<portlet:resourceURL id="detectVAVData" var="detectVAVDataURL">
</portlet:resourceURL>
<script type="text/javascript">
	var vavTFrom;
	var vavTTo;
	var vavType = "month";
	var vavMachineId;

	function queryVAVData() {
		vavMachineId = $("#vavEquipSelect").val();

		//VAV
		$.post('${detectVAVDataURL}', {
			tfrom : vavTFrom,
			tto : vavTTo,
			type : vavType,
			ispd : "1",
			id : vavMachineId
		}, function(data) {
			initVavTempGraphic(data);
			initVavOnOffGraphic(data);
		});

	}
</script>
<%-- 日期选择控件 --%>
<input id="vavDatepicker" type="hidden" />
<script type="text/javascript">
	function changeVavDate(type) {
		vavType = type;

		WdatePicker({
			el : 'vavDatepicker',
			onpicked : function(dp) {
				from = dp.cal.getDateStr("yyyy-MM-dd");
				//日期修正
				switch (type) {
				case 'day':
					to = from;

					break;
				case 'week':

					to = dp.$DV(from, {
						d : 7
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				case 'month':

					to = dp.$DV(from, {
						M : 1
					});
					to = to.y + "-" + to.M + "-" + to.d;
					break;
				}

				//赋值
				vavTFrom = from;
				vavTTo = to;
				//刷新数据
				queryVAVData();
			}
		});

	};
</script>
