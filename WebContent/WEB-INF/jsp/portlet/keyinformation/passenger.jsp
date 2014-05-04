<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 客流量
 -->

<div class="date_select">
	<input id="<portlet:namespace />datetime2" type="hidden" />
	<div id="<portlet:namespace />day2" class="pressive"
		onclick="<portlet:namespace />selectdate2('day')">日视图</div>
	<div id="<portlet:namespace />week2"
		onclick="<portlet:namespace />selectdate2('week')">周视图</div>
	<div id="<portlet:namespace />month2"
		onclick="<portlet:namespace />selectdate2('month')">月视图</div>
	<div id="<portlet:namespace />year2" class="radius"
		onclick="<portlet:namespace />selectdate2('year')">年视图</div>
</div>
<div class="charts chart_width">
	<div class="look_other">
		<label class="now_data tb_now cursor_style"
			id="<portlet:namespace />fromDate2"></label>
		<div class="date_comparer">
			<input type="text" class="comp_data tbcmp"
				id="<portlet:namespace />comparetime2"
				onclick="<portlet:namespace />comparetime2()" /><span
				class="comp_btn tb_btn cursor_style">加入对比</span>
		</div>
		<div class="download" onclick="<portlet:namespace />outputToExcel2()"></div>
	</div>
	<iframe name="<portlet:namespace />tmpFrame2"
		id="<portlet:namespace />tmpFrame2" width="1" height="1"
		style="visibility: hidden; position: absolute; display: none"></iframe>
	<div class="chart tbchart" id="<portlet:namespace />buildpassenger"></div>
</div>
<div class="detail">
	<div>
		<table class = "passenger_total">
			<caption>客流量</caption>
			<tbody>
				<tr>
					<td><span>日</span>最大值</td>
					<td>250</td>
					<td class="tdClass"><sup>人</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>最小值</td>
					<td>100</td>
					<td class="tdClass"><sup>人</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>累计值</td>
					<td>1200</td>
					<td class="tdClass"><sup>人</sup></td>
					<td></td>
				</tr>
				<tr>
					<td>同比昨日</td>
					<td>↓10</td>
					<td class="tdClass"><sup>%</sup></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
var <portlet:namespace />start_date2 = ''; // 开始时间
var <portlet:namespace />choose_type2 = ''; // 点击类型（日、周、月、年）
var <portlet:namespace />step2 = "${tbinfo.xStep_2}"; //存储X轴的显示间隔
var <portlet:namespace />legendList2 = "${tbinfo.chartLegendList_2}";// 图例列表
var <portlet:namespace />showLegend2 = false; // 默认不显示图例
var <portlet:namespace />centerTitle2 = ""; //居中标题
var <portlet:namespace />c_title2 = ''; // 存储居中标题对应的年份
var <portlet:namespace />exp_start_date2 = ''; // 存储导出的时间 
var <portlet:namespace />choose_name2 = '${tbinfo.choose_name2}'; // 对应的name
var <portlet:namespace />choose_id2 = '${tbinfo.choose_id2}'; // 对应的id
var <portlet:namespace />ispd2 = '${tbinfo.ispd2}'; // 对应的ispd
var <portlet:namespace />times2 =  [];//根据所选name的个数来保存相应时间
var <portlet:namespace />series_count2 = '${tbinfo.choose_name2}';
var <portlet:namespace />series_total2 = <portlet:namespace />series_count2.split(",");//保存每组图表的数据列
var <portlet:namespace />legend_count2 = <portlet:namespace />legendList2.split(",").length;//保存图例说明已配置的个数 
	
	if(<portlet:namespace />series_total2.length>1){
		<portlet:namespace />showLegend2 = true;
	}
	//文本框选择时间对比
	function <portlet:namespace />comparetime2() {
		var dformt = 'yyyy-MM-dd';
		if (<portlet:namespace />choose_type2 == "day"){
			dformt = 'yyyy-MM-dd';
		} else if (<portlet:namespace />choose_type2 == "week") {
			dformt = 'yyyy-MM-dd';
		} else if (<portlet:namespace />choose_type2 == "month") {
			dformt = 'MM';
		} else if (<portlet:namespace />choose_type2 == "year") {
			dformt = 'yyyy';
		}
		
		WdatePicker({
			el : '<portlet:namespace />datetime2',
			dateFmt : dformt,
			onpicked : function(dp) {
				// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
				var paretime= dp.cal.getDateStr('yyyy-MM-dd');
				
				// 显示在页面上的时间
				var showtime= dp.cal.getDateStr(dformt);
				$('#<portlet:namespace />comparetime2').val(showtime);
				
				<portlet:namespace />legendList2 = <portlet:namespace />start_date2 + "," + paretime;
				<portlet:namespace />exp_start_date2 = <portlet:namespace />legendList2;
				console.log(<portlet:namespace />exp_start_date2);
				<portlet:namespace />choose_name2 = '${tbinfo.choose_name2},${tbinfo.choose_name2}'; // 对应的name
				<portlet:namespace />choose_id2 = '${tbinfo.choose_id2},${tbinfo.choose_id2}'; // 对应的id
				<portlet:namespace />ispd2 = '${tbinfo.ispd2},${tbinfo.ispd2}'; // 对应的ispd
				
				<portlet:namespace />times2.length = 0; //清空<portlet:namespace />times2
				// 根据name的个数，来为att添加对应个数的值
				for(var k=0;k<2;k++){
					for(var i=0;i<<portlet:namespace />series_total2.length;i++){
						if(k==0){
							<portlet:namespace />times2.push(<portlet:namespace />start_date2);
						}else{
							<portlet:namespace />times2.push(paretime);
						}
					}
				}
				<portlet:namespace />confirm2()
			}
		});
	}
   

	/**
	* 加入对比后，获取图表数据
	*/
	function <portlet:namespace />confirm2(){
		<portlet:namespace />showLegend2 = true;
		// 渲染图表
		<portlet:namespace />getChart2(<portlet:namespace />times2.join(),<portlet:namespace />choose_name2
				,<portlet:namespace />choose_id2,<portlet:namespace />ispd2,<portlet:namespace />legendList2,
				<portlet:namespace />showLegend2,'yes');
	}
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate2(type) {
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
			el : '<portlet:namespace />datetime2',
			dateFmt : dformt,
			onpicked : function(dp) {
				$('#<portlet:namespace />comparetime2').val(''); // 清空对比框的值
				var _time = dp.cal;
				<portlet:namespace />start_date2 = _time.getDateStr('yyyy-MM-dd');
				<portlet:namespace />exp_start_date2 = <portlet:namespace />start_date2; //导出excel的开始时间 
				<portlet:namespace />choose_type2 = type;
				// 为居中标题赋值 
				<portlet:namespace />centerTitle2 = dp.cal.getDateStr(titleFormat);
				<portlet:namespace />c_title2 = dp.cal.getDateStr("yyyy");

				if (type == "day"){
					<portlet:namespace />step2 = "${tbinfo.xStep_2}";
					$(".passenger_total > tbody > tr:eq(0) > td:eq(0)").text("日最大值"); // 文字
					$(".passenger_total > tbody > tr:eq(1) > td:eq(0)").text("日最小值"); // 文字
					$(".passenger_total > tbody > tr:eq(2) > td:eq(0)").text("日累计值"); // 文字
					$(".passenger_total > tbody > tr:eq(3) > td:eq(0)").text("同比昨日"); // 文字
				} else if (type == "week") {
					<portlet:namespace />step2 = "1";
					$(".passenger_total > tbody > tr:eq(0) > td:eq(0)").text("周最大值"); // 文字
					$(".passenger_total > tbody > tr:eq(1) > td:eq(0)").text("周最小值"); // 文字
					$(".passenger_total > tbody > tr:eq(2) > td:eq(0)").text("周累计值"); // 文字
					$(".passenger_total > tbody > tr:eq(3) > td:eq(0)").text("同比上周"); // 文字
				} else if (type == "month") {
					<portlet:namespace />step2 = "${tbinfo.xStep_2}";
					$(".passenger_total > tbody > tr:eq(0) > td:eq(0)").text("月最大值"); // 文字
					$(".passenger_total > tbody > tr:eq(1) > td:eq(0)").text("月最小值"); // 文字
					$(".passenger_total > tbody > tr:eq(2) > td:eq(0)").text("月累计值"); // 文字
					$(".passenger_total > tbody > tr:eq(3) > td:eq(0)").text("同比上月"); // 文字
				} else if (type == "year"){
					<portlet:namespace />step2 = "1";
					$(".passenger_total > tbody > tr:eq(0) > td:eq(0)").text("年最大值"); // 文字
					$(".passenger_total > tbody > tr:eq(1) > td:eq(0)").text("年最小值"); // 文字
					$(".passenger_total > tbody > tr:eq(2) > td:eq(0)").text("年累计值"); // 文字
					$(".passenger_total > tbody > tr:eq(3) > td:eq(0)").text("同比去年"); // 文字
				}
				
				<portlet:namespace />times2.length = 0; //清空<portlet:namespace />times2
				
				// 根据name的个数，来为att添加对应个数的值
				for(var i=0;i<<portlet:namespace />series_total2.length;i++){
					<portlet:namespace />times2.push(<portlet:namespace />start_date2);
				}

				<portlet:namespace />choose_name2 = '${tbinfo.choose_name2}';
				<portlet:namespace />choose_id2 = '${tbinfo.choose_id2}';
				<portlet:namespace />ispd2 = '${tbinfo.ispd2}';
				if(<portlet:namespace />series_total2.length>1){
					<portlet:namespace />showLegend2 = true;
				}else{
					<portlet:namespace />showLegend2 = false;
				}
				// 获取图表
				<portlet:namespace />getChart2(<portlet:namespace />times2.join(),<portlet:namespace />choose_name2,<portlet:namespace />choose_id2,<portlet:namespace />ispd2,<portlet:namespace />legendList2,<portlet:namespace />showLegend2,'no');
			}
		});
	}
	
	
	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getChart2(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		<portlet:namespace />getRightData2(); // 获取右侧数据
		$
				.post(
						'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							decimals : '${tbinfo.decimals2}',
							type : <portlet:namespace />choose_type2
						}, function(data) {
							var newLegendList = [];//用来存储图例说明数据
							var chartLegends = "${tbinfo.chartLegendList_2}";//配置项中的图例名称信息
							var chartLegendList = chartLegends.split(",");//配置项中的图例名称信息
							var cataList = data.expExcelCataList[0]; 
							var dataList = data.dataList;
							//获取x轴显示信息，取个数多的显示
							for(var i = 0 ;i<data.expExcelCataList.length;i++){
								if(cataList.length<data.expExcelCataList[i].length){
									cataList = data.expExcelCataList[i];
								}
							}
							if (<portlet:namespace />choose_type2 == "day"){
								if(isNotCompare == "yes"){ // 如果是对比的图
									<portlet:namespace />centerTitle2 = "";
									<portlet:namespace />legendList2 = "";
									var tfroms = tfrom.split(",");
										<portlet:namespace />centerTitle2 += tfroms[0] + "与" + tfroms[tfroms.length-1];//获取比较视图的居中标题
									try{
										for(var k=0;k<2;k++){
											//为每个选定name的图表添加对应图例说明名称
											for(var i=0;i<parseInt(<portlet:namespace />series_total2.length);i++){
												if(k==0){
													//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
													if(parseInt(<portlet:namespace />legend_count2)>i){
														newLegendList.push(tfroms[0] + chartLegendList[i]);
													}else{
														newLegendList.push(tfroms[0] + "series" + (i+1));
													}
												}else{
													//根据已配置的图例名称对比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
													if(<portlet:namespace />legend_count2>i){
														newLegendList.push(tfroms[tfroms.length-1] + chartLegendList[i]);
													}else{
														newLegendList.push(tfroms[tfroms.length-1] + "series" + (i+1));
													}
												}		
											}
										}
									}catch(e){}
								}else{
									//为每个选定name的图表添加对应图例说明名称
									for(var i=0;i<parseInt(<portlet:namespace />series_total2.length);i++){
										//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
										if(<portlet:namespace />legend_count2>i){
											newLegendList.push(chartLegendList[i]);
										}else{
											newLegendList.push("series" + (i+1));
										}
									}
								}
								
							} else if (<portlet:namespace />choose_type2 == "week") {
								var _legendList = data.legendList;
								if(isNotCompare == "yes"){ // 如果是对比的图 
									<portlet:namespace />centerTitle2 = "";
									<portlet:namespace />legendList2 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									<portlet:namespace />centerTitle2 += _legendList[0][0].substring(0,4) + "-" +  _legendList[0][0].substring(5,7) + "-" +  _legendList[0][0].substring(8) + "~"
									 + _legendList[0][_legendList[0].length-1].substring(5,7) + "-" +  _legendList[0][_legendList[0].length-1].substring(8) + "与"
									 + _legendList[_legendList.length-1][0].substring(0,4) + "-" +  _legendList[_legendList.length-1][0].substring(5,7) + "-" +  _legendList[_legendList.length-1][0].substring(8) + "~"
									 + _legendList[_legendList.length-1][_legendList[_legendList.length-1].length-1].substring(5,7) + "-" +  _legendList[_legendList.length-1][_legendList[_legendList.length-1].length-1].substring(8);
									for(var k=0;k<2;k++){
										//为每个选定name的图表添加对应图例说明名称
										for(var i=0;i<parseInt(<portlet:namespace />series_total2.length);i++){
											if(k==0){
												//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
												if(parseInt(<portlet:namespace />legend_count2)>i){
													newLegendList.push(_legendList[0][0] + "~" + _legendList[0][_legendList[0].length-1] + chartLegendList[i]);
												}else{
													newLegendList.push(_legendList[0][0] + "~" + _legendList[0][_legendList[0].length-1] + "series" + (i+1));
												}
											}else{
												//根据已配置的图例名称对比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
												if(parseInt(<portlet:namespace />legend_count2)>i){
													newLegendList.push(_legendList[_legendList.length-1][0] + "~" + _legendList[_legendList.length-1][_legendList[_legendList.length-1].length-1] + chartLegendList[i]);
												}else{
													newLegendList.push(_legendList[_legendList.length-1][0] + "~" + _legendList[_legendList.length-1][_legendList[_legendList.length-1].length-1] + "series" + (i+1));
												}
											}		
										}
									}
									// 个性需求：重新为图表的X轴赋值
									cataList = ["周一","周二","周三","周四","周五","周六","周日"];
								} else {
									var cataList = data.cataList;//获取x轴显示内容
									// 居中标题的值
									<portlet:namespace />centerTitle2 = <portlet:namespace />c_title2 + "-" + data.cataList[0].substring(0,2) + "-" + data.cataList[0].substring(2) + "~"
									  + <portlet:namespace />c_title2 + "-" + data.cataList[data.cataList.length-1].substring(0,2) + "-" + data.cataList[data.cataList.length-1].substring(2);
									// 往后台返回的X轴列表中添加周一~周日
									var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
									for(var i=0;i<parseInt(<portlet:namespace />series_total2.length);i++){
										//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
										if(parseInt(<portlet:namespace />legend_count2)>i){
											newLegendList.push(chartLegendList[i]);
										}else{
											newLegendList.push("series" + (i+1));
										}
									}
									//给每个 图例说明添加周信息
									for(var i=0;i<cataList.length;i++){
										finalCataList.push(cataList[i]+cList[i]);
									}
										cataList = finalCataList;
								}
							} else if (<portlet:namespace />choose_type2 == "month") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									<portlet:namespace />centerTitle2 = "";
									<portlet:namespace />legendList2 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									var tfroms = tfrom.split(",");
									<portlet:namespace />centerTitle2 += tfroms[0].substring(0,7) + "与" + tfroms[tfroms.length-1].substring(0,7);
									for(var k=0;k<2;k++){
										//为每个选定name的图表添加对应图例说明名称
										for(var i=0;i<parseInt(<portlet:namespace />series_total2.length);i++){
											if(k==0){
												//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
												if(parseInt(<portlet:namespace />legend_count2)>i){
													newLegendList.push(tfroms[0].substring(0,7) + chartLegendList[i]);
												}else{
													newLegendList.push(tfroms[0].substring(0,7) + "series" + (i+1));
												}
											}else{
												//根据已配置的图例名称对比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
												if(parseInt(<portlet:namespace />legend_count2)>i){
													newLegendList.push(tfroms[tfroms.length-1].substring(0,7) + chartLegendList[i]);
												}else{
													newLegendList.push(tfroms[tfroms.length-1].substring(0,7) + "series" + (i+1));
												}
											}		
										}
									}
									// 个性需求：重新为图表的X轴赋值
									var cataLen = cataList.length;
									cataList = [];
									for(var k=1;k<=cataLen;k++){
										cataList.push(k); 					
									}
								}else{
									//为每个选定name的图表添加对应图例说明名称
									for(var i=0;i<parseInt(<portlet:namespace />series_total2.length);i++){
										//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
										if(parseInt(<portlet:namespace />legend_count2)>i){
											newLegendList.push(chartLegendList[i]);
										}else{
											newLegendList.push("series" + (i+1));
										}	
									}
								}
							} else if (<portlet:namespace />choose_type2 == "year") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
								var compareyear = tfrom.split(",");//获取比较时间列表，并转换为数组类型
									// 个性需求：重新为图表的一级标题和图例赋值
									<portlet:namespace />centerTitle2 = <portlet:namespace />c_title2 + "与" + compareyear[compareyear.length-1].substring(0,4);
									for(var k=0;k<2;k++){
										//为每个选定name的图表添加对应图例说明名称
										for(var i=0;i<parseInt(<portlet:namespace />series_total2.length);i++){
											if(k==0){
												//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
												if(parseInt(<portlet:namespace />legend_count2)>i){
													newLegendList.push(<portlet:namespace />c_title2 + chartLegendList[i]);
												}else{
													newLegendList.push(<portlet:namespace />c_title2 + "series" + (i+1));
												}
											}else{
												//根据已配置的图例名称对比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
												if(parseInt(<portlet:namespace />legend_count2)>i){
													newLegendList.push(compareyear[compareyear.length-1].substring(0,4) + chartLegendList[i]);
												}else{
													newLegendList.push(compareyear[compareyear.length-1].substring(0,4) + chartLegendList[0] + "series" + (i+1));
												}
											}		
										}
									}
									
									// 个性需求：重新为图表的X轴赋值
									var _yearList = data.yearList;
									if(_yearList[0].length>=_yearList[1].length){
										cataList = _yearList[0];
									} else if(_yearList[0].length<_yearList[1].length){
										cataList = _yearList[1];
									}
								}else{
									//为每个选定name的图表添加对应图例说明名称
									for(var i=0;i<parseInt(<portlet:namespace />series_total2.length);i++){
										//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
										if(parseInt(<portlet:namespace />legend_count2)>i){
											newLegendList.push(chartLegendList[i]);
										}else{
											newLegendList.push( "series" + (i+1));
										}
									}
								}
							}
							// 显示时间到相应位置
							$("#<portlet:namespace />fromDate2").text(<portlet:namespace />centerTitle2);
							// 渲染图表
							var chartLegendList = newLegendList//保存图例说明信息
							var chartColor_2 = "${tbinfo.chartColorList_2}";//颜色列表
							var chartColorList = chartColor_2.split(",");
							var chartFillColor_2 = "${tbinfo.chartFillColorList_2}"; // 填充颜色列表
							var chartFillColorList = chartFillColor_2.split(",");
							var chartRadius_2 =  "${tbinfo.chartRadiusList_2}"; // 曲线点半径列表,默认为4
							var chartRadiusList = chartRadius_2.split(",");
							var chartSymbolList = "${tbinfo.ySymbol2}"; // Y轴单位
							var chartYAxisList = [${tbinfo.chartYAxisList_2}];//Y轴数据列表
							//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToCharts.js中，用来生成图表
							autoRenderToMoreCharts("<portlet:namespace />buildpassenger",// 对应的渲染位置 
									"${tbinfo.chartType_2_1},${tbinfo.chartType_2_2}",//图表类型
									"",//图表绘图区域背景颜色
									<portlet:namespace />series_total2.length,//获取选取name的个数
									<portlet:namespace />step2,//X轴间隔
									"",// 居中标题
									"${tbinfo.gridLineDashStyle2}",//图表中线的样式
									"${tbinfo.symbol2}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
									"${tbinfo.lineWidth_2}", // 线宽，此为具体曲线点的点线宽
									"${tbinfo.connectLineWidth_2}", // 连接线线宽，为空则默认为2，为0则不显示连接线										
									"${tbinfo.yLeftTitle_2}",//Y轴左侧标题
									"${tbinfo.yRightTitle_2}",//Y轴右侧标题
									<portlet:namespace />showLegend2,//是否显示图例说明
									"${tbinfo.showXGridLine2}",//是否显示X轴网格线
									"${tbinfo.showYGridLine2}",//是否显示Y轴网格线
									chartLegendList,//图例说明
									chartColorList, //颜色列表
									dataList,//数据列表
									chartFillColorList,//填充颜色列表
									chartRadiusList,//曲线点半径列表
									chartSymbolList, //Y轴单位
									chartYAxisList,//Y轴数据列表
									cataList);//X轴数据信息
	
						}, 'json');
					}
	
	
							// 默认显示当前时间
							<portlet:namespace />choose_type2 = "day";
							if(publicTime != ""){
								<portlet:namespace />start_date2 = publicTime;
							} else {
								if("${tbinfo.defaulttime2}" == ""){
									var nowdate = new Date();
									<portlet:namespace />start_date2 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
											+ nowdate.getDate();
								} else {
									<portlet:namespace />start_date2 = "${tbinfo.defaulttime2}";
								}
							}
							
							
							<portlet:namespace />exp_start_date2 = <portlet:namespace />start_date2; // 导出excel的开始时间
							<portlet:namespace />centerTitle2 = <portlet:namespace />start_date2; //居中标题	
							// 根据name的个数，来为att添加对应个数的值
							 for(var i=0;i<<portlet:namespace />series_total2.length;i++){
								<portlet:namespace />times2.push(<portlet:namespace />start_date2);
							} 
							// 得到报表数据
							<portlet:namespace />getChart2(<portlet:namespace />times2.join(),<portlet:namespace />choose_name2,<portlet:namespace />choose_id2,<portlet:namespace />ispd2,<portlet:namespace />legendList2,<portlet:namespace />showLegend2,'no');
							// 导出数据到excel
							function <portlet:namespace />outputToExcel2(){
								var isNotCompare = "no"; // 默认不是对比图表
								var sdate = <portlet:namespace />exp_start_date2;//保存导出到excel中的时间 
								var sdateList = sdate.split(",");
								if(sdateList.length>1){
									isNotCompare = "yes"; // yes表示是对比图表
								}
								
								// 根据配置的图例个数，匹配时间个数和图例个数一致 
								var startdate = [];
								var chartLegendList = "${tbinfo.chartLegendList_2}".split(",");//根据配置项，获取图例列表 
								for(var i=0;i<sdateList.length;i++){
									for(var k=0;k<chartLegendList.length;k++){
										startdate.push(sdateList[i]);
									}
								}
								sdate = startdate.join();//将每个日期对应的数据列保存
								var expColumnName2 = "${tbinfo.expColumnName2}";
								var expUrl = '';// 导出excel的Url
								//根据数据个数调用相应导出方法
								if(<portlet:namespace />series_total2.length>1){
									expUrl = "<portlet:resourceURL id='expOutSideChartDataToExcel'></portlet:resourceURL>"
										+ "&excelName="
										+ "${tbinfo.title2}"
										+ "&from="
										+ sdate
										+ "&name="
							  			+ <portlet:namespace />choose_name2
										+ "&id="
										+ <portlet:namespace />choose_id2
										+ "&ispd="
										+ <portlet:namespace />ispd2
									    + "&type="
									    + <portlet:namespace />choose_type2
								    	+ "&isNotCompare="
								     	+ isNotCompare
									    + "&expColumnName="
									    + (expColumnName2==""?"${tbinfo.title2}":expColumnName2);
								}else{
									expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
										+ "&excelName="
										+ "${tbinfo.title2}"
										+ "&from="
										+ sdate
										+ "&name="
										+ <portlet:namespace />choose_name2
										+ "&id="
										+ <portlet:namespace />choose_id2
										+ "&ispd="
										+ <portlet:namespace />ispd2
										+ "&type="
										+ <portlet:namespace />choose_type2
										+ "&isNotCompare="
										+ isNotCompare
										+ "&expColumnName="
										+ (expColumnName2==""?"${tbinfo.title2}":expColumnName2);
								}
								//var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${tbinfo.title1}" /></portlet:resourceURL>';
								var hSrc = "http://" + document.location.host
										+ "/energymanagesystem/uploadfiles/" + "${tbinfo.title2}"
										+ ".xls";
								$.ajax({
									type : "POST",
									url : expUrl,
									async : false,
									contentType : 'application/x-msdownload;charset=UTF-8',
									success : function(result) {
										$("#<portlet:namespace />tmpFrame2").attr('src', hSrc);
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

//获取右侧数据
function <portlet:namespace />getRightData2(){
	$.ajax({
		type : "POST",
		url : "<portlet:resourceURL id='getDatasForAtts'></portlet:resourceURL>",
		data : {
			from : <portlet:namespace />start_date2,
			name : 'passenger_flow_main_enter_number_of_people',
			id : 'passenger_flow',
			ispd : '0',
			att : 'max,min,sum,change',
			decimals : '${tbinfo.decimals2}',//显示小数位数，首选项传
			type : <portlet:namespace />choose_type2
		},
		success : function(result) {
			var data = result.data;
			var maxtime = '', mintime = '';
			if(<portlet:namespace />choose_type2 == 'day'){
				maxtime = data[0][1].substring(11, 16);
				mintime = data[1][1].substring(11, 16);
			} else if(<portlet:namespace />choose_type2 == 'week'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			} else if(<portlet:namespace />choose_type2 == 'month'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			} else if(<portlet:namespace />choose_type2 == 'year'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			}
			
			$(".passenger_total > tbody > tr:eq(0) > td:eq(1)").text(parseFloat(data[0][0])); // max
			$(".passenger_total > tbody > tr:eq(0) > td:eq(3)").text(maxtime); // maxTime
			$(".passenger_total > tbody > tr:eq(1) > td:eq(1)").text(parseFloat(data[1][0]));// min
			$(".passenger_total > tbody > tr:eq(1) > td:eq(3)").text(mintime); // minTime
			$(".passenger_total > tbody > tr:eq(2) > td:eq(1)").text(parseFloat(data[2][0])); // sum
			$(".passenger_total > tbody > tr:eq(3) > td:eq(1)").text(returnUpOrDown(data[3][0]) + returnPositiveVal(data[3][0],"0"));// change
		},
		error : function(result) {
			console.log('getRightData2 + error');
		}
	});
};
</script>