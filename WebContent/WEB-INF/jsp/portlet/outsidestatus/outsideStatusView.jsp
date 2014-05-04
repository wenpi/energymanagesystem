<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG	
	Created Date: 2013-8-7 下午2点20分
	LastModified Date:
	Description: 室外状态页面
 -->

<div class="div-table" id="outsidestatus">

	<div class="parameter_1 outdoor"
		style="background-color:${coreinfo.backgroundColor_1};">
		<div class="page_header">
			<h1>室外状态</h1>
		</div>
		<h5>${coreinfo.description_1}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td><span id="<portlet:namespace />temperature0">25</span><sup>&#176;C</sup>
				</td>
				<td><span id="<portlet:namespace />temperature1">25</span><sup>&#176;C</sup>
				</td>
			</tr>
			<tr>
				<td><span id="<portlet:namespace />text1_1">当日</span>最高气温</td>
				<td><span id="<portlet:namespace />text1_2">当日</span>平均气温</td>
			</tr>
			<tr>
				<td><span id="<portlet:namespace />humidity0">80</span><sup>%</sup></td>
				<td><span id="<portlet:namespace />humidity1">60</span><sup>%</sup></td>
			</tr>
			<tr>
				<td><span id="<portlet:namespace />text1_3">当日</span>最高湿度</td>
				<td><span id="<portlet:namespace />text1_4">当日</span>平均湿度</td>
			</tr>
		</table>
	</div>

	<div class="timediv">
		<input id="<portlet:namespace />datetime1" type="hidden" />
		<div id="<portlet:namespace />day1" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate1('day')">日视图</div>
		<div id="<portlet:namespace />week1" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate1('week')">周视图</div>
		<div id="<portlet:namespace />month1" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate1('month')">月视图</div>
		<div id="<portlet:namespace />year1" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate1('year')">年视图</div>

		<div class="inlinedivstyle selectdivstyle">
			&nbsp;与&nbsp; <input name="<portlet:namespace />comparetime1"
				id="<portlet:namespace />comparetime1" class="inputstyle"
				onclick="<portlet:namespace />comparetime1()" /> &nbsp;对比&nbsp;
		</div>

		<div id="<portlet:namespace />output1"
			onclick="<portlet:namespace />outputToExcel1()" class="tdatt output">输出</div>

		<iframe name="<portlet:namespace />tmpFrame1"
			id="<portlet:namespace />tmpFrame1" width="1" height="1"
			style="visibility: hidden; position: absolute; display: none"></iframe>

		<div id="<portlet:namespace />outsidestatus" class="basicchartdiv"></div>
	</div>

</div>

<script type="text/javascript">
	// 点击日周月年，切换文字变红的效果 
	var <portlet:namespace />timeArr1 = ["<portlet:namespace />day1", "<portlet:namespace />week1", "<portlet:namespace />month1", "<portlet:namespace />year1"];    
	function <portlet:namespace />changeColor1(type){
		//设置其它td标签的字体颜色
		$.each(<portlet:namespace />timeArr1,function(i,obj) {
			document.getElementById(this).style.color='#666666';
		});
		
		// 设置当前点击的标签的字体颜色
		document.getElementById("<portlet:namespace />"+type+"1").style.color='red';
	}
	
	//文本框选择时间对比
	function <portlet:namespace />comparetime1() {
		var dformt = 'yyyy-MM-dd';
		if (<portlet:namespace />choose_type1 == "day"){
			dformt = 'yyyy-MM-dd';
		} else if (<portlet:namespace />choose_type1 == "week") {
			dformt = 'yyyy-MM-dd';
		} else if (<portlet:namespace />choose_type1 == "month") {
			dformt = 'MM';
		} else if (<portlet:namespace />choose_type1 == "year") {
			dformt = 'yyyy';
		}
		
		WdatePicker({
			el : '<portlet:namespace />datetime1',
			dateFmt : dformt,
			onpicked : function(dp) {
				// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
				var paretime= dp.cal.getDateStr('yyyy-MM-dd');
				
				// 显示在页面上的时间
				var showtime= dp.cal.getDateStr(dformt);
				$('#<portlet:namespace />comparetime1').val(showtime);
				
				<portlet:namespace />centerTitle1 = <portlet:namespace />start_date1 + "," + paretime; //居中标题
				<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1 + "," + paretime;// 导出到excel中的时间 
				
				<portlet:namespace />showLegend1 = true;
				
				var times = [],legendList = [];
				// 根据name的个数，来为att添加对应个数的值
				var chartLegendList = [${coreinfo.chartLegendList}];
				for(var i=0;i<chartLegendList.length;i++){
					times.push(<portlet:namespace />start_date1);
				}
				for(var i=0;i<chartLegendList.length;i++){
					times.push(paretime);
				}
				
				<portlet:namespace />choose_name1 = '${coreinfo.choose_name1},${coreinfo.choose_name1}'; // 对应的name
				<portlet:namespace />choose_id1 = '${coreinfo.choose_id1},${coreinfo.choose_id1}'; // 对应的id
				<portlet:namespace />ispd1 = '${coreinfo.ispd1},${coreinfo.ispd1}'; // 对应的ispd
				
				// 渲染图表
				<portlet:namespace />compareCharts1(times.join(),<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,legendList,<portlet:namespace />showLegend1);
			}
		});
	}
	
	
	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />compareCharts1(tfrom,name,id,ispd,legendList,showLegend1) {
		$
		.post(
				'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
				{
					from : tfrom,
					name : name,
					id : id,
					ispd : ispd,
					type : <portlet:namespace />choose_type1,
					decimals : '${coreinfo.decimals1}',
					mult : '' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
				}, function(data) {
					var cataList = data.cataList;
					var dataList = data.dataList;
	
					var newLegendList = []; // 存储图例列表信息 
					var chartLegendList = [${coreinfo.chartLegendList}]; // 取配置中的配置内容
					if (<portlet:namespace />choose_type1 == "day"){
						<portlet:namespace />legendList1 = "";
						<portlet:namespace />centerTitle1 = "";
						var tfroms = tfrom.split(",");
						<portlet:namespace />centerTitle1 += tfroms[0] + "与" + tfroms[tfroms.length-1];
						try{
							newLegendList.push(tfroms[0] + chartLegendList[0]);
							newLegendList.push(tfroms[0] + chartLegendList[1]);
							newLegendList.push(tfroms[tfroms.length-1] + chartLegendList[0]);
							newLegendList.push(tfroms[tfroms.length-1] + chartLegendList[1]);
						}catch(e){}
					} else if (<portlet:namespace />choose_type1 == "week") {
						var _legendList = data.legendList;
						<portlet:namespace />centerTitle1 = "";
						<portlet:namespace />legendList1 = "";
						// 个性需求：重新为图表的一级标题和图例赋值 
						<portlet:namespace />centerTitle1 += _legendList[0][0] + "~" + _legendList[0][1] + "与" 
														  + _legendList[_legendList.length-1][0] + "~" + _legendList[_legendList.length-1][1];
						newLegendList.push(_legendList[0][0] + "~" + _legendList[0][1] + chartLegendList[0]);
						newLegendList.push(_legendList[0][0] + "~" + _legendList[0][1] + chartLegendList[1]);
						newLegendList.push(_legendList[_legendList.length-1][0] + "~" + _legendList[_legendList.length-1][1] + chartLegendList[0]);
						newLegendList.push(_legendList[_legendList.length-1][0] + "~" + _legendList[_legendList.length-1][1] + chartLegendList[1]);
						// 个性需求：重新为图表的X轴赋值
						cataList = ["周一","周二","周三","周四","周五","周六","周日"];
					} else if (<portlet:namespace />choose_type1 == "month") {
						<portlet:namespace />centerTitle1 = "";
						<portlet:namespace />legendList1 = "";
						// 个性需求：重新为图表的一级标题和图例赋值
						var tfroms = tfrom.split(",");
						<portlet:namespace />centerTitle1 += tfroms[0].substring(0,7) + "与" + tfroms[tfroms.length-1].substring(0,7);
						newLegendList.push(tfroms[0].substring(0,7) + chartLegendList[0]);
						newLegendList.push(tfroms[0].substring(0,7) + chartLegendList[1]);
						newLegendList.push(tfroms[tfroms.length-1].substring(0,7) + chartLegendList[0]);
						newLegendList.push(tfroms[tfroms.length-1].substring(0,7) + chartLegendList[1]);
						
						// 个性需求：重新为图表的X轴赋值
						cataList = [];
						for(var k=1;k<=data.cataList.length;k++){
							cataList.push(k); 					
						}
					} else if (<portlet:namespace />choose_type1 == "year") {
						var tfroms = tfrom.split(",");
						var compareyear = tfroms[tfroms.length-1].substring(0,4);
						// 个性需求：重新为图表的一级标题和图例赋值
						<portlet:namespace />centerTitle1 = <portlet:namespace />c_title1 + "与" + compareyear;
						newLegendList.push(<portlet:namespace />c_title1 + chartLegendList[0]);
						newLegendList.push(<portlet:namespace />c_title1 + chartLegendList[1]);
						newLegendList.push(compareyear + chartLegendList[0]);
						newLegendList.push(compareyear + chartLegendList[1]);
						
						// 个性需求：重新为图表的X轴赋值
						var _yearList = data.yearList;
						if(_yearList[0].length>=_yearList[_yearList.length-1].length){
							cataList = _yearList[0];
						} else if(_yearList[0].length<_yearList[_yearList.length-1].length){
							cataList = _yearList[_yearList.length-1];
						}
					}
					
					// 为 室外状态，报表填充
					var chartColorList = [${coreinfo.chartColorList}];
					var chartFillColorList = [${coreinfo.chartFillColorList}];
					var chartRadiusList = [${coreinfo.chartRadiusList}];
					var chartSymbolList = [${coreinfo.chartSymbolList}];
					var chartYAxisList = [${coreinfo.chartYAxisList}];
					
					renderToTwoChart("<portlet:namespace />outsidestatus", 
							"${coreinfo.chartType_1}",
							<portlet:namespace />step1,
							<portlet:namespace />centerTitle1,
							"${coreinfo.gridLineDashStyle}",
							"${coreinfo.lineWidth}",
							"${coreinfo.yLeftTitle}",
							"${coreinfo.yRightTitle}",
							"${coreinfo.chartToolTipColor}",
							"${coreinfo.chartToolTipTitle}",
							"${coreinfo.chartTipUnit}",
							newLegendList,
							chartColorList, 
							dataList,
							chartFillColorList,
							chartRadiusList,
							chartSymbolList, 
							chartYAxisList,
							cataList);
				}, 'json');
	}
	
		
	var <portlet:namespace />start_date1 = ''; // 开始时间
	var <portlet:namespace />choose_type1 = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />step1 = "${coreinfo.xStep_1}"; //存储X轴的显示间隔
	var <portlet:namespace />outsideStr = '当日';
	var <portlet:namespace />centerTitle1 = ""; //居中标题
	var <portlet:namespace />c_title1 = ''; // 存储居中标题对应的年份
	var <portlet:namespace />choose_name1 = '${coreinfo.choose_name1}'; // 对应的name
	var <portlet:namespace />choose_id1 = '${coreinfo.choose_id1}'; // 对应的id
	var <portlet:namespace />ispd1 = '${coreinfo.ispd1}'; // 对应的ispd
	var <portlet:namespace />legendList1 = "";// 图例列表
	var <portlet:namespace />showLegend1 = true; // 默认不显示图例
	var <portlet:namespace />exp_start_date1 = '';// 导出到excel中的时间 
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate1(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor1(type);
		
		var dformt = 'yyyy-MM-dd',titleFormat='yyyy-MM-dd';
		if (type == "day"){
			dformt = 'yyyy-MM-dd';
		} else if (type == "week"){
			dformt = 'yyyy-MM-dd';
		} else if (type == "month"){
			dformt = 'MM';
			titleFormat='yyyy-MM';
		} else if (type == "year"){
			dformt = 'yyyy';
			titleFormat = 'yyyy';
		}
		
		WdatePicker({
			el : '<portlet:namespace />datetime1',
			dateFmt : dformt,
			onpicked : function(dp) {
				$('#<portlet:namespace />comparetime1').val(''); // 清空对比框的值
				var _time = dp.cal;
				<portlet:namespace />c_title1 = _time.getDateStr('yyyy');
				<portlet:namespace />start_date1 = _time.getDateStr('yyyy-MM-dd');
				<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1;// 导出到excel中的时间 
				<portlet:namespace />choose_type1 = type;
				<portlet:namespace />centerTitle1 = dp.cal.getDateStr(titleFormat);
				
				if (type == "day"){
					<portlet:namespace />outsideStr =  _time.getDateStr('MM')+"月"+ _time.getDateStr('dd') + "日";
					<portlet:namespace />step1 = "${coreinfo.xStep_1}";
				} else if (type == "week") {
					<portlet:namespace />step1 = "1";
					<portlet:namespace />outsideStr = "该周";
				} else if (type == "month") {
					<portlet:namespace />outsideStr = _time.getDateStr('yyyy') + "年" + _time.getDateStr('MM') + "月";
					<portlet:namespace />step1 = "${coreinfo.xStep_1}";
				} else if (type == "year"){
					<portlet:namespace />outsideStr = _time.getDateStr('yyyy') + "年";
					<portlet:namespace />step1 = "1";
				}
				<portlet:namespace />choose_name1 = '${coreinfo.choose_name1}'; // 对应的name
				<portlet:namespace />choose_id1 = '${coreinfo.choose_id1}'; // 对应的id
				<portlet:namespace />ispd1 = '${coreinfo.ispd1}'; // 对应的ispd
				// 获取图表
				<portlet:namespace />getChart1(<portlet:namespace />start_date1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,<portlet:namespace />legendList1,<portlet:namespace />showLegend1,'no');
				//获取温度和湿度的数据
				<portlet:namespace />getValueFunction();
			}
		});
	}
	
	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getChart1(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		$
				.post(
						'<portlet:resourceURL id="getMoreChartsByNames"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							decimals : '${coreinfo.decimals1}',
							mult : '', // 是否需要在获取的数据的基础上乘数，此处传空即可
							type : <portlet:namespace />choose_type1
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							if (<portlet:namespace />choose_type1 == "week") {
								// 居中标题的值
								<portlet:namespace />centerTitle1 = <portlet:namespace />c_title1 + "/" + data.cataList[0] + "~~" + <portlet:namespace />c_title1 + "/" + data.cataList[data.cataList.length-1];
								
								// 往后台返回的X轴列表中添加周一~周日
								var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
								for(var i=0;i<cataList.length;i++){
									finalCataList.push(cataList[i]+cList[i]);
								}
								
								cataList = finalCataList;
							}
							
							// 为 室外状态，报表填充
							var chartLegendList = [${coreinfo.chartLegendList}];
							var chartColorList = [${coreinfo.chartColorList}];
							var chartFillColorList = [${coreinfo.chartFillColorList}];
							var chartRadiusList = [${coreinfo.chartRadiusList}];
							var chartSymbolList = [${coreinfo.chartSymbolList}];
							var chartYAxisList = [${coreinfo.chartYAxisList}];
							
							renderToTwoChart("<portlet:namespace />outsidestatus", 
									"${coreinfo.chartType_1}",
									<portlet:namespace />step1,
									<portlet:namespace />centerTitle1,
									"${coreinfo.gridLineDashStyle}",
									"${coreinfo.lineWidth}",
									"${coreinfo.yLeftTitle}",
									"${coreinfo.yRightTitle}",
									"${coreinfo.chartToolTipColor}",
									"${coreinfo.chartToolTipTitle}",
									"${coreinfo.chartTipUnit}",
									chartLegendList,
									chartColorList, 
									dataList,
									chartFillColorList,
									chartRadiusList,
									chartSymbolList, 
									chartYAxisList,
									cataList);
	
						}, 'json');
	}
	
	// 获取温度和湿度的信息
	function <portlet:namespace />getHumidityAndTemperature(name,id,ispd,span1,span2){
		$
		.post(
				'<portlet:resourceURL id="getValueByNameAndId"></portlet:resourceURL>',
				{
					from : <portlet:namespace />start_date1,
					name : name,
					id : id,
	 				ispd : ispd,
					att : 'max,average',
					type : <portlet:namespace />choose_type1
				}, function(data) {
					// 为相应的位置赋值
					var valueList = data.data;
					$('#<portlet:namespace />' + span1).text(returnPositiveVal(valueList[0],"${coreinfo.decimals1}"));
					$('#<portlet:namespace />' + span2).text(returnPositiveVal(valueList[1],"${coreinfo.decimals1}"));
	
					$('#<portlet:namespace />text1_1').text(<portlet:namespace />outsideStr);
					$('#<portlet:namespace />text1_2').text(<portlet:namespace />outsideStr);
					$('#<portlet:namespace />text1_3').text(<portlet:namespace />outsideStr);
					$('#<portlet:namespace />text1_4').text(<portlet:namespace />outsideStr);
				}, 'json');
	}
	
	//获取对应的湿度和温度的值
	function <portlet:namespace />getValueFunction(){
		 <portlet:namespace />getHumidityAndTemperature('S7_temp_display_OUTDOOR_TEMP','chiller','3','temperature0','temperature1');
		 <portlet:namespace />getHumidityAndTemperature('S7_temp_display_OUTDOOR_HUMIDITY','chiller','3','humidity0','humidity1');
	}
	
	if("${coreinfo.defaulttime1}" == ""){// 默认显示当前时间 
		var nowdate = new Date();
		<portlet:namespace />start_date1 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	} else {
		<portlet:namespace />start_date1 = "${coreinfo.defaulttime1}";
	}

	<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1;// 导出到excel中的时间 
	<portlet:namespace />choose_type1 = "day";
	<portlet:namespace />step1 = "${coreinfo.xStep_1}";
	<portlet:namespace />centerTitle1 = <portlet:namespace />start_date1; //居中标题
	// 获取页面报表数据
	<portlet:namespace />getChart1(<portlet:namespace />start_date1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,<portlet:namespace />legendList1,<portlet:namespace />showLegend1,'no');
	//获取温度和湿度的数据
	<portlet:namespace />getValueFunction();
	
	// 导出数据到excel
	function <portlet:namespace />outputToExcel1(){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date1;
		var sdateList = sdate.split(",");
		if(sdateList.length>1){
			isNotCompare = "yes"; // yes表示是对比图表
		}
		
		// 根据配置的图例个数，匹配时间个数和图例个数一致 
		var startdate = [];
		var chartLegendList = [${coreinfo.chartLegendList}];
		for(var i=0;i<sdateList.length;i++){
			for(var k=0;k<chartLegendList.length;k++){
				startdate.push(sdateList[i]);
			}
		}
		sdate = startdate.join();
		var expColumnName1 = "${coreinfo.expColumnName1}";
		// 导出excel的Url
		var expUrl = "<portlet:resourceURL id='expOutSideChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${coreinfo.title1}"
				+ "&from="
				+ sdate
				+ "&name="
				+ <portlet:namespace />choose_name1
				+ "&id="
				+ <portlet:namespace />choose_id1
				+ "&ispd="
				+ <portlet:namespace />ispd1
				+ "&type="
				+ <portlet:namespace />choose_type1
				+ "&isNotCompare="
				+ isNotCompare
				+ "&decimals="
				+ '${coreinfo.decimals1}'
				+ "&expColumnName="
				+ (expColumnName1==""?"${coreinfo.title1}":expColumnName1);
		var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${coreinfo.title1}" /></portlet:resourceURL>';
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${coreinfo.title1}"
				+ ".xls";
		$.ajax({
			type : "POST",
			url : expUrl,
			async : false,
			contentType : 'application/x-msdownload;charset=UTF-8',
			success : function(result) {
				$("#<portlet:namespace />tmpFrame1").attr('src', hSrc);

				// AJAX请求删除临时文件
				//$.post(removeUrl, function(result) {
				//	if (result.success) {
				//	} else {
				//		$.messager.alert('Error', result.msg, 'error');
				//	}
				//});
			},
			error : function(result) {
				alert('error');
			}
		});
	}
</script>