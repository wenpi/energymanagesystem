<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date: zouzhixiang 2014-03-07
	Description: 室外状态
 -->

<div class="date_select">
	<input id="<portlet:namespace />datetime1" type="hidden" />
	<div id="<portlet:namespace />day1" class="pressive"
		onclick="<portlet:namespace />selectdate1('day')">日视图</div>
	<div id="<portlet:namespace />week1"
		onclick="<portlet:namespace />selectdate1('week')">周视图</div>
	<div id="<portlet:namespace />month1"
		onclick="<portlet:namespace />selectdate1('month')">月视图</div>
	<div id="<portlet:namespace />year1" class="radius"
		onclick="<portlet:namespace />selectdate1('year')">年视图</div>
</div>
<div class="charts chart_width">
	<div class="look_other">
		<label class="now_data tb_now cursor_style"
			id="<portlet:namespace />fromDate1"></label>
		<div class="date_comparer">
			<input type="text" class="comp_data tbcmp"
				id="<portlet:namespace />comparetime1"
				onclick="<portlet:namespace />comparetime1()" /><span
				class="comp_btn tb_btn cursor_style">加入对比</span>
		</div>
		<div class="download" onclick="<portlet:namespace />outputToExcel1()"></div>
	</div>
	<iframe name="<portlet:namespace />tmpFrame1"
		id="<portlet:namespace />tmpFrame1" width="1" height="1"
		style="visibility: hidden; position: absolute; display: none"></iframe>
	<div class="chart tbchart" id="<portlet:namespace />outsidestatus"></div>
</div>
<div class="detail">
	<div>
		<table class="tb">
			<caption>室外状态</caption>
			<tbody class="outside_status">
				<tr>
					<td><span>日</span>室外温度最大值</td>
					<td>10</td>
					<td class="tdClass"><sup>℃</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>室外温度最小值</td>
					<td>10</td>
					<td class="tdClass"><sup>℃</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>室外温度平均值</td>
					<td>10</td>
					<td class="tdClass"><sup>℃</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>室外湿度最大值</td>
					<td>10</td>
					<td class="tdClass"><sup>%</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>室外湿度最小值</td>
					<td>10</td>
					<td class="tdClass"><sup>%</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>室外湿度平均值</td>
					<td>10</td>
					<td class="tdClass"><sup>%</sup></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
var <portlet:namespace />start_date1 = ''; // 开始时间
var <portlet:namespace />choose_type1 = ''; // 点击类型（日、周、月、年）
var <portlet:namespace />step1 = "${tbinfo.xStep_1}"; //存储X轴的显示间隔
var <portlet:namespace />centerTitle1 = ""; //居中标题
var <portlet:namespace />c_title1 = ''; // 存储居中标题对应的年份
var <portlet:namespace />choose_name1 = '${tbinfo.choose_name1}'; // 对应的name
var <portlet:namespace />choose_id1 = '${tbinfo.choose_id1}'; // 对应的id
var <portlet:namespace />ispd1 = '${tbinfo.ispd1}'; // 对应的ispd
var <portlet:namespace />legendList1 = "";// 图例列表
var <portlet:namespace />showLegend1 = false;//是否显示图例
var <portlet:namespace />time_join1 ="";//存放比较视图中的比较时间

 	if(<portlet:namespace />choose_name1.split(",").length>1){
 		<portlet:namespace />showLegend1 = true;
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
				// 显示在页面上比较处的时间
				var showtime= dp.cal.getDateStr(dformt);
				$('#<portlet:namespace />comparetime1').val(showtime);
				<portlet:namespace />centerTitle1 = <portlet:namespace />start_date1 + "," + paretime; //居中标题	
				<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1 + "," + paretime;// 导出到excel中的时间 
				var times = [];
				// 根据name的个数，来为att添加对应个数的值
				var chartLegendList = '${tbinfo.choose_name1}'.split(",");
				for(var i=0;i<chartLegendList.length;i++){
					times.push(<portlet:namespace />start_date1);
				}
				for(var i=0;i<chartLegendList.length;i++){
					times.push(paretime);
				}
				<portlet:namespace />choose_name1 = '${tbinfo.choose_name1},${tbinfo.choose_name1}'; // 对应的name
				<portlet:namespace />choose_id1 = '${tbinfo.choose_id1},${tbinfo.choose_id1}'; // 对应的id
				<portlet:namespace />ispd1 = '${tbinfo.ispd1},${tbinfo.ispd1}'; // 对应的ispd	
				<portlet:namespace />time_join1 = times.join(); //对应的比较时间列表
				<portlet:namespace />confirm1();
			}
		});
	}
	
   /**
	* 加入对比后，获取图表数据
	*/
	function <portlet:namespace />confirm1(){
		var legendList = [];
		<portlet:namespace />showLegend1 = true; // 对比图显示图例
		if(<portlet:namespace />time_join1!=""){
			// 渲染图表
			<portlet:namespace />compareCharts1(<portlet:namespace />time_join1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,legendList,<portlet:namespace />showLegend1);
		}
	}
	
	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />compareCharts1(tfrom,name,id,ispd,legendList,showLegend1) {
		$
		.post(
				'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
				{
					from : tfrom,//时间列表
					name : name,
					id : id,
					ispd : ispd,
					type : <portlet:namespace />choose_type1,//查询类型
					decimals : '${tbinfo.decimals1}',//描述信息
					mult : '' // 是否需要在获取的数据的基础上乘数，饼图需乘100，在首选项中配置
				}, function(data) {
					var cataList = data.expExcelCataList[0]; //x轴上显示的数据
					var dataList = data.dataList;//图表中的数据
					var newLegendList = []; // 存储图例列表信息 
					var chartLegendList = [${tbinfo.chartLegendList}]; // 取配置中的配置内容
					//获取x轴显示信息，取个数多的显示
					for(var i = 0 ;i<data.expExcelCataList.length;i++){
						if(cataList.length<data.expExcelCataList[i].length){
							cataList = data.expExcelCataList[i];
						}
					}
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
						<portlet:namespace />centerTitle1 += _legendList[0][0] + "~" + _legendList[0][_legendList[0].length-1].substring(5) + "与" 
														  + _legendList[_legendList.length-1][0] + "~" + _legendList[_legendList.length-1][_legendList[_legendList.length-1].length-1].substring(5);
						newLegendList.push(_legendList[0][0] + "~" + _legendList[0][_legendList[0].length-1] + chartLegendList[0]);
						newLegendList.push(_legendList[0][0] + "~" + _legendList[0][_legendList[0].length-1] + chartLegendList[1]);
						newLegendList.push(_legendList[_legendList.length-1][0] + "~" + _legendList[_legendList.length-1][_legendList[_legendList.length-1].length-1] + chartLegendList[0]);
						newLegendList.push(_legendList[_legendList.length-1][0] + "~" + _legendList[_legendList.length-1][_legendList[_legendList.length-1].length-1] + chartLegendList[1]);
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
						var cataLen = cataList.length;
						cataList = [];
						for(var k=1;k<=cataLen;k++){
							cataList.push(k); 					
						}			
					} else if (<portlet:namespace />choose_type1 == "year") {
						var tfroms = tfrom.split(",");
						var compareyear = tfroms[tfroms.length-1].substring(0,4);
						//保存居中标题的年份
						<portlet:namespace />c_title1 = <portlet:namespace />start_date1.substring(0,4);
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
					$("#<portlet:namespace />fromDate1").text(<portlet:namespace />centerTitle1);
					// 为 室外状态，报表填充
					var chartColorList = [${tbinfo.chartColorList}];
					var chartFillColorList = [${tbinfo.chartFillColorList}];
					var chartRadiusList = [${tbinfo.chartRadiusList}];
					var chartSymbolList = [${tbinfo.chartSymbolList}];
					var chartYAxisList = [${tbinfo.chartYAxisList}];
					//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToTwoCharts.js中，用来生成图表
					autoRenderToTwoChart("<portlet:namespace />outsidestatus",  // 图表渲染位置 
							"${tbinfo.chartType_1}",	// 图表类型
							<portlet:namespace />step1,	// X轴标签显示间隔
							"",	// 图表标题
							"${tbinfo.gridLineDashStyle}",	// 网格线样式
							"${tbinfo.lineWidth}",	// 连接线线宽
							"${tbinfo.yLeftTitle}", // 左Y轴标题
							"${tbinfo.yRightTitle}",// 右Y轴标题
							<portlet:namespace />showLegend1,// 是否显示图表说明
							"${tbinfo.showXGridLine1}",	// 是否显示x轴上辅助线
							"${tbinfo.showYGridLine1}",	
							newLegendList,// 图例说明内容 
							chartColorList, // 图表颜色列表
							dataList,	// 图表数据
							chartFillColorList,	// 数据点填充颜色列表
							chartRadiusList,	// 数据点半径
							chartSymbolList, 	// 数据点样式
							chartYAxisList,		// Y轴数据列信息
							"${tbinfo.yStep_1}",
							cataList); // 分类信息
				}, 'json');
	}
	

	
	
	
	
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate1(type) {
		
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
			position:{left:80},
			el : '<portlet:namespace />datetime1',
			dateFmt : dformt,
			onpicked : function(dp) {
				$('#<portlet:namespace />comparetime1').val(''); // 清空对比框的值
				var _time = dp.cal;
				<portlet:namespace />c_title1 = _time.getDateStr('yyyy');
				<portlet:namespace />start_date1 = _time.getDateStr('yyyy-MM-dd');//开始日间 
				<portlet:namespace />choose_type1 = type;//视图类型
				<portlet:namespace />centerTitle1 = dp.cal.getDateStr(titleFormat);//保存居中标题
				<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1;// 导出到excel中的时间 
				if (type == "day"){
					<portlet:namespace />step1 = "${tbinfo.xStep_1}";
					$(".outside_status tr td > span").text("日"); // 文字
				} else if (type == "week") {
					<portlet:namespace />step1 = "1";
					$(".outside_status tr td > span").text("周"); // 文字
				} else if (type == "month") {
					<portlet:namespace />step1 = "${tbinfo.xStep_1}";
					$(".outside_status tr td > span").text("月"); // 文字
				} else if (type == "year"){
					<portlet:namespace />step1 = "1";
					$(".outside_status tr td > span").text("年"); // 文字
				}
				<portlet:namespace />choose_name1 = '${tbinfo.choose_name1}'; // 对应的name
				<portlet:namespace />choose_id1 = '${tbinfo.choose_id1}'; // 对应的id
				<portlet:namespace />ispd1 = '${tbinfo.ispd1}'; // 对应的ispd
				if(<portlet:namespace />choose_name1.split(",").length>1){
			 		<portlet:namespace />showLegend1 = true;
			 	}else{
			 		<portlet:namespace />showLegend1 = false;
			 	}
				// 获取图表
				<portlet:namespace />getChart1(<portlet:namespace />start_date1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,<portlet:namespace />legendList1,<portlet:namespace />showLegend1,'no');
			}
		});
	}
	
	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getChart1(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		<portlet:namespace />getRightData1(); // 获取右侧数据
		$
				.post(
						'<portlet:resourceURL id="getMoreChartsByNames"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							decimals : '${tbinfo.decimals1}',
							mult : '', // 是否需要在获取的数据的基础上乘数，此处传空即可
							type : <portlet:namespace />choose_type1
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							if (<portlet:namespace />choose_type1 == "week") {
								// 居中标题的值
								<portlet:namespace />centerTitle1 = <portlet:namespace />c_title1 + "-" + cataList[0].substring(0,2) + "-" + cataList[0].substring(1) + "~" + <portlet:namespace />c_title1 + "-" + cataList[data.cataList.length-1].substring(0,2) + "-" + cataList[data.cataList.length-1].substring(1);
								// 往后台返回的X轴列表中添加周一~周日
								var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
								for(var i=0;i<cataList.length;i++){
									finalCataList.push(cataList[i]+cList[i]);
								}
								
								cataList = finalCataList;
							}
							
							$("#<portlet:namespace />fromDate1").text(<portlet:namespace />centerTitle1);
							// 为 室外状态，报表填充
							var chartLegendList = [${tbinfo.chartLegendList}];
							var chartColorList = [${tbinfo.chartColorList}];
							var chartFillColorList = [${tbinfo.chartFillColorList}];
							var chartRadiusList = [${tbinfo.chartRadiusList}];
							var chartSymbolList = [${tbinfo.chartSymbolList}];
							var chartYAxisList = [${tbinfo.chartYAxisList}];
							autoRenderToTwoChart("<portlet:namespace />outsidestatus", 
									"${tbinfo.chartType_1}",
									<portlet:namespace />step1,
									"",
									"${tbinfo.gridLineDashStyle}",
									"${tbinfo.lineWidth}",
									"${tbinfo.yLeftTitle}",
									"${tbinfo.yRightTitle}",
									<portlet:namespace />showLegend1,
									"${tbinfo.showXGridLine1}",
									"${tbinfo.showYGridLine1}",
									chartLegendList,
									chartColorList, 
									dataList,
									chartFillColorList,
									chartRadiusList,
									chartSymbolList, 
									chartYAxisList,
									"${tbinfo.yStep_1}",
									cataList);
						}, 'json');
	}
	
	if(publicTime != ""){
		<portlet:namespace />start_date1 = publicTime;
	} else {
		if("${tbinfo.defaulttime1}" == ""){// 默认显示当前时间 
			var nowdate = new Date();
			<portlet:namespace />start_date1 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
					+ nowdate.getDate();
		} else {
			<portlet:namespace />start_date1 = "${tbinfo.defaulttime1}";
		}
	}
	
	$("#<portlet:namespace />fromDate1").text(<portlet:namespace />start_date1);// 保存当前时间
	<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1;// 加载时设置导出到excel中的时间的默认值  
	<portlet:namespace />choose_type1 = "day";//加载时设置视图类型的默认值  
	<portlet:namespace />step1 = "${tbinfo.xStep_1}";//读取配置项中的x轴显示间隔，设置默认值 
	<portlet:namespace />centerTitle1 = <portlet:namespace />start_date1; //居中标题
	// 加载时获取页面报表数据
	<portlet:namespace />getChart1(<portlet:namespace />start_date1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,<portlet:namespace />legendList1,<portlet:namespace />showLegend1,'no');

	// 导出数据到excel
	function <portlet:namespace />outputToExcel1(){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date1;//保存导出到excel中的时间 
		var sdateList = sdate.split(",");
		if(sdateList.length>1){
			isNotCompare = "yes"; // yes表示是对比图表
		}
		
		// 根据配置的图例个数，匹配时间个数和图例个数一致 
		var startdate = [];
		var chartLegendList = "${tbinfo.chartLegendList}".split(",");//根据配置项，获取图例列表 
		for(var i=0;i<sdateList.length;i++){
			for(var k=0;k<chartLegendList.length;k++){
				startdate.push(sdateList[i]);
			}
		}
		sdate = startdate.join();//将每个日期对应的数据列保存
		var expColumnName1 = "${tbinfo.expColumnName1}";
		var expUrl = '';// 导出excel的Url
		//根据数据个数调用相应导出方法
		if(<portlet:namespace />choose_name1.split(",").length>1){
			expUrl = "<portlet:resourceURL id='expOutSideChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${tbinfo.title1}"
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
			    + "&expColumnName="
			    + (expColumnName1==""?"${tbinfo.title1}":expColumnName1);
		}else{
			expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${tbinfo.title1}"
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
				+ "&expColumnName="
				+ (expColumnName1==""?"${tbinfo.title1}":expColumnName1);
		}
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${tbinfo.title1}"
				+ ".xls";
		$.ajax({
			type : "POST",
			url : expUrl,
			async : false,
			contentType : 'application/x-msdownload;charset=UTF-8',
			success : function(result) {
				$("#<portlet:namespace />tmpFrame1").attr('src', hSrc);
			},
			error : function(result) {
				alert('error');
			}
		});
	};
	
	// 获取右侧数据
	function <portlet:namespace />getRightData1(){
		$.ajax({
			type : "POST",
			url : "<portlet:resourceURL id='getDatasForNamesAndAtts'></portlet:resourceURL>",
			data : {
				from : <portlet:namespace />start_date1,
				name : <portlet:namespace />choose_name1,
				id : <portlet:namespace />choose_id1,
				ispd : <portlet:namespace />ispd1,
				att : 'max,min,average',
				decimals : '${tbinfo.decimals1}',//显示小数位数，首选项传
				type : <portlet:namespace />choose_type1
			},
			success : function(result) {
				var data = result.data;
				var maxtime1 = '', mintime1 = '', maxtime2 = '', mintime2 = '';
				if(<portlet:namespace />choose_type1 == 'day'){
					maxtime1 = data[0][0][1].substring(11, 16);
					mintime1 = data[0][1][1].substring(11, 16);
					maxtime2 = data[1][0][1].substring(11, 16);
					mintime2 = data[1][1][1].substring(11, 16);
				} else {
					maxtime1 = data[0][0][1].substring(5);
					mintime1 = data[0][1][1].substring(5);
					maxtime2 = data[1][0][1].substring(5);
					mintime2 = data[1][1][1].substring(5);
				}
				// 室外温度
				$(".outside_status > tr:eq(0) > td:eq(1)").text(parseFloat(data[0][0][0])); // max
				$(".outside_status > tr:eq(0) > td:eq(3)").text(maxtime1); // maxTime
				$(".outside_status > tr:eq(1) > td:eq(1)").text(parseFloat(data[0][1][0]));// min
				$(".outside_status > tr:eq(1) > td:eq(3)").text(mintime1); // minTime
				$(".outside_status > tr:eq(2) > td:eq(1)").text(parseFloat(data[0][2][0])); // average
				// 室外湿度
				$(".outside_status > tr:eq(3) > td:eq(1)").text(parseFloat(data[1][0][0])); // max
				$(".outside_status > tr:eq(3) > td:eq(3)").text(maxtime2); // maxTime
				$(".outside_status > tr:eq(4) > td:eq(1)").text(parseFloat(data[1][1][0]));// min
				$(".outside_status > tr:eq(4) > td:eq(3)").text(mintime2); // minTime
				$(".outside_status > tr:eq(5) > td:eq(1)").text(parseFloat(data[1][2][0])); // average
			},
			error : function(result) {
				console.log('getRightData1 + error');
			}
		});
	};
</script>