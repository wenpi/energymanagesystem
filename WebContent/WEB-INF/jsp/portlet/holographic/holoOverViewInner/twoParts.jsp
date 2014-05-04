<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="tb_build_list">
	<div class="span12" id="floor_list">
		<ul class="taobao_overView" style="list-style-type: none;">
			<li onclick="buildClickValue('')" class="highlight">建筑总体</li>
			<c:forEach items="${ovm}" var="taobao_floorlist">
				<li onclick="buildClickValue('${taobao_floorlist.value.regionId}')">${taobao_floorlist.value.regionName}</li>
			</c:forEach>
		</ul>
	</div>
	<hr class="span12" style="height: 10px; width: 920px;">
</div>

<div class="span12 row" style="padding: 10px 0 0 0;"
	id="topDoubleChart">
	<div>
		<div class="all_pic_chart_top">建筑耗电量</div>
		<div class="timediv50">
			<input id="<portlet:namespace />datetime" type="hidden" />
			<div id="<portlet:namespace />day" style="color: red;"
				class="inlinedivstyle tdatt"
				onclick="<portlet:namespace />selectdate('day','')">日视图</div>
			<div id="<portlet:namespace />week" class="inlinedivstyle tdatt"
				onclick="<portlet:namespace />selectdate('week','')">周视图</div>
			<div id="<portlet:namespace />month" class="inlinedivstyle tdatt"
				onclick="<portlet:namespace />selectdate('month','')">月视图</div>
			<!-- <div id="<portlet:namespace />year" class="inlinedivstyle tdatt"
				onclick="<portlet:namespace />selectdate('year','')">年视图</div> -->

			<div id="<portlet:namespace />output"
				onclick="<portlet:namespace />outputToExcel('建筑耗电量','0')"
				class="tdatt output">输出</div>
		</div>

		<div id="outdoorTemp" class="all_chart_css"></div>
	</div>
	<div style="margin-left: 35px;">
		<div class="all_pic_chart_top">建筑耗冷量</div>
		<div class="timediv50">
			<div id="<portlet:namespace />day1" style="color: red;"
				class="inlinedivstyle tdatt"
				onclick="<portlet:namespace />selectdate('day','1')">日视图</div>
			<div id="<portlet:namespace />week1" class="inlinedivstyle tdatt"
				onclick="<portlet:namespace />selectdate('week','1')">周视图</div>
			<div id="<portlet:namespace />month1" class="inlinedivstyle tdatt"
				onclick="<portlet:namespace />selectdate('month','1')">月视图</div>
			<!-- <div id="<portlet:namespace />year1" class="inlinedivstyle tdatt"
				onclick="<portlet:namespace />selectdate('year','1')">年视图</div> -->

			<div id="<portlet:namespace />output"
				onclick="<portlet:namespace />outputToExcel('建筑耗冷量','1')"
				class="tdatt output">输出</div>
		</div>
		<div id="refrigeratingCapacity" class="all_chart_css"></div>
	</div>

	<iframe name="<portlet:namespace />tmpFrame"
		id="<portlet:namespace />tmpFrame" width="1" height="1"
		style="visibility: hidden; position: absolute; display: none"></iframe>
</div>

<portlet:resourceURL id="holoOverViewData" var="holoOverViewDataUrl">
</portlet:resourceURL>
<script type="text/javascript">
	// 改变点击标签的颜色
	var <portlet:namespace />timeArr = ["<portlet:namespace />day", "<portlet:namespace />week", "<portlet:namespace />month"];    
	var <portlet:namespace />timeArr1 = ["<portlet:namespace />day1", "<portlet:namespace />week1", "<portlet:namespace />month1"];    
	function <portlet:namespace />changeColor(type,num){
		var arr = <portlet:namespace />timeArr;
		if(num == '1'){ arr = <portlet:namespace />timeArr1; }  // 如果是“建筑耗冷量”，则换个数组切换
		//设置其它td标签的字体颜色
		$.each(arr,function(i,obj) {
			document.getElementById(this).style.color='#666666';
		});
		// 设置当前点击的标签的字体颜色
		document.getElementById("<portlet:namespace />"+type+num).style.color='red';
	}

	var <portlet:namespace />xstep = "4"; // x轴的间距
	var <portlet:namespace />start_date = prettyFrom; // 开始时间
	var <portlet:namespace />start_date1 = prettyFrom; // 开始时间
	var <portlet:namespace />choose_type = 'day'; // 点击类型（日、周、月、年）
	var <portlet:namespace />choose_type1 = 'day'; // 点击类型（日、周、月、年）
	var <portlet:namespace />centerTitle = prettyFrom; //居中标题
	var <portlet:namespace />exp_start_date = prettyFrom + "," + prettyFrom; // 存储导出的时间 
	var <portlet:namespace />exp_start_date1 = prettyFrom; // 存储导出的时间 
	var cool_name = 'cooling_capacity',cool_id = 'chiller',cool_ispd = '0'; //建筑耗冷量对应的name、id、ispd
	var ele_name = 'S7_temp_display_OUTDOOR_TEMP,electricity',ele_id = 'chiller,total',ele_ispd = '3,0'; //建筑耗电量对应的name、id、ispd
	var decimals = '0.0'; // 保留小数位数 
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate(type,num) {
		// 切换点击字体效果
		<portlet:namespace />changeColor(type,num);
		var dformt = 'yyyy-MM-dd';
		if (type == "day"){
			<portlet:namespace />xstep = "4"; // x轴的间距
			dformt = 'yyyy-MM-dd';
			titleFormat='yyyy-MM-dd';
		} else if (type == "week") {
			<portlet:namespace />xstep = "2"; // x轴的间距
			dformt = 'yyyy-MM-dd';
		} else if (type == "month") {
			dformt = 'MM';
			<portlet:namespace />xstep = "6"; // x轴的间距
			titleFormat='yyyy-MM';
		} else if (type == "year") {
			<portlet:namespace />xstep = "3"; // x轴的间距
			dformt = 'yyyy';
			titleFormat = 'yyyy';
		}
	
		WdatePicker({
			el : '<portlet:namespace />datetime',
			dateFmt : dformt,
			onpicked : function(dp) {
				var newtime = dp.cal.getDateStr('yyyy-MM-dd');
				// 获取图表
				if(num == '1'){// 如果是“ 建筑耗冷量”，则刷新“建筑制冷量”的相关图表 
					<portlet:namespace />start_date1 = newtime;
					<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1;
					<portlet:namespace />choose_type1 = type;
				} else {// 刷新“建筑耗电量”图表
					<portlet:namespace />start_date = newtime;
					<portlet:namespace />exp_start_date = <portlet:namespace />start_date + "," + <portlet:namespace />start_date;
					<portlet:namespace />choose_type = type;
				} 
				
				if (type == "day"){
					<portlet:namespace />centerTitle = newtime;
				} else if (type == "week") {
					<portlet:namespace />centerTitle = showWeekFirstDay(newtime) + "~" + showWeekLastDay(newtime);
				} else if (type == "month") {
					<portlet:namespace />centerTitle = dp.cal.getDateStr('yyyy-MM') + "-01 ~ " + showMonthLastDay(newtime);
				} else if (type == "year") {
					<portlet:namespace />centerTitle = dp.cal.getDateStr('yyyy');
				}
				
				// 获取图表
				if(num == '1'){// 如果是“ 建筑耗冷量”，则刷新“建筑制冷量”的相关图表 
					initRightGraphic(); 
				} else {// 刷新“建筑耗电量”图表
					initLeftGraphic();
				} 
			}
		});
	}
	
	// 建筑耗电量
	function initLeftGraphic() {
		$
				.post(
						'<portlet:resourceURL id="getMoreChartsByNames"></portlet:resourceURL>',
						{
							from : <portlet:namespace />start_date,
							name : ele_name,
							id : ele_id,
							ispd : ele_ispd,
							decimals : decimals,
							mult : '', // 是否需要在获取的数据的基础上乘数，此处传空即可
							type : <portlet:namespace />choose_type
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;

							// 为 室外状态，报表填充
							var chartLegendList = [ '室外温度', '耗电量' ];
							var chartColorList = ['#E56D0A','#A4B77D']; // [ '#E778BC', '#FF9900' ];
							var chartFillColorList = [ 'white', 'white' ];
							var chartRadiusList = [ 1, 1 ];
							var chartSymbolList = [ 'circle', 'diamond' ];
							var chartYAxisList = [ 0, 1 ];

							renderToTwoChart("outdoorTemp", "spline", <portlet:namespace />xstep,
									<portlet:namespace />centerTitle, "LongDash", 1, "室外温度（℃）",
									"耗电量(kWh)", "#FF9900", "时刻：", "°C",
									chartLegendList, chartColorList, dataList,
									chartFillColorList, chartRadiusList,
									chartSymbolList, chartYAxisList, cataList);
						}, 'json');

	};
	
	// 建筑耗冷量
	function initRightGraphic() {
		$
				.post(
						'<portlet:resourceURL id="getSingleChartData"></portlet:resourceURL>',
						{
							from : <portlet:namespace />start_date1,
							name : cool_name,
							id : cool_id,
							ispd : cool_ispd,
							decimals : decimals,
							type : <portlet:namespace />choose_type1
						}, function(data) {
							// 生成图表
							renderToColumnAndLineCharts(
									'refrigeratingCapacity', "area", <portlet:namespace />centerTitle, "制冷量(KW)", "#ECC9AC",
									<portlet:namespace />xstep, "#ECC9AC", "", data.cataList, data.dataList);
						}, 'json');
	};

	// 初始化顶部的两个图表 
	function initHoloOverViewTopChart() {
		try {
			initLeftGraphic();
		} catch (e) {
		}
		try {
			initRightGraphic();
		} catch (e) {
		}
	}
	

	// 全息图中的建筑切换 
	function buildClickValue(regionid){
		initHoloOverViewTopChart();
	}
	
	// 导出数据到excel,num决定是导出哪个excel
	function <portlet:namespace />outputToExcel(title,num){
		// 导出excel的Url
		var expUrl = '';
		if(num == '1'){ // 建筑耗冷量 
			expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>" + "&excelName=" + title + "&from=" + <portlet:namespace />exp_start_date1 + "&name=" 
			       + cool_name + "&id=" + cool_id + "&ispd=" + cool_ispd + "&type=" + <portlet:namespace />choose_type1 + "&isNotCompare=no&decimals=" + decimals + "&expColumnName=" + "建筑耗冷量(kW)";
		} else { // 建筑耗电量 
			expUrl = "<portlet:resourceURL id='expOutSideChartDataToExcel'></portlet:resourceURL>" + "&excelName=" + title + "&from=" + <portlet:namespace />exp_start_date + "&name=" + ele_name
				   + "&id=" + ele_id + "&ispd=" + ele_ispd + "&type=" + <portlet:namespace />choose_type + "&isNotCompare=no&decimals=" + decimals + "&expColumnName=" + ("室外温度(℃),耗电量(kWh)");
		}
		console.log("expUrl----"+expUrl);
		var hSrc = "http://" + document.location.host + "/energymanagesystem/uploadfiles/" + title + ".xls";
		$.ajax({
			type : "POST",
			url : expUrl,
			async : false,
			contentType : 'application/x-msdownload;charset=UTF-8',
			success : function(result) {
				console.log("hSrc--"+hSrc);
				$("#<portlet:namespace />tmpFrame").attr('src', hSrc);
			},
			error : function(result) {
				alert('error');
			}
		});
	}
</script>