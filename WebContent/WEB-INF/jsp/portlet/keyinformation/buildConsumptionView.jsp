<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 建筑总能耗
 -->

<div class="date_select">
	<input id="<portlet:namespace />datetime3" type="hidden" />
	<div id="<portlet:namespace />day3" class="pressive"
		onclick="<portlet:namespace />selectdate3('day')">日视图</div>
	<div id="<portlet:namespace />week3"
		onclick="<portlet:namespace />selectdate3('week')">周视图</div>
	<div id="<portlet:namespace />month3"
		onclick="<portlet:namespace />selectdate3('month')">月视图</div>
	<div id="<portlet:namespace />year3" class="radius"
		onclick="<portlet:namespace />selectdate3('year')">年视图</div>
</div>
<div class="charts chart_width">
	<div class="look_other">
		<label class="now_data tb_now cursor_style"
			id="<portlet:namespace />fromDate3"></label>
		<div class="date_comparer">
			<input type="text" class="comp_data tbcmp"
				id="<portlet:namespace />comparetime3"
				onclick="<portlet:namespace />comparetime3()" /><span
				class="comp_btn tb_btn cursor_style">加入对比</span>
		</div>
		<div class="download" onclick="<portlet:namespace />outputToExcel3()"></div>
	</div>
	<iframe name="<portlet:namespace />tmpFrame3"
		id="<portlet:namespace />tmpFrame3" width="1" height="1"
		style="visibility: hidden; position: absolute; display: none"></iframe>
	<div class="chart tbchart" id="<portlet:namespace />buildconsumption"></div>
</div>
<div class="detail">
	<div>
		<table>
			<caption>建筑总能耗</caption>
			<tbody class="energy_total">
				<tr>
					<td><span>日</span>最大值</td>
					<td>250</td>
					<td class="tdClass"><sup>kgce</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>最小值</td>
					<td>100</td>
					<td class="tdClass"><sup>kgce</sup></td>
					<td></td>
				</tr>
				<tr>
					<td><span>日</span>累计值</td>
					<td>1200</td>
					<td class="tdClass"><sup>kgce</sup></td>
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
var <portlet:namespace />start_date3 = ''; // 开始时间
var <portlet:namespace />choose_type3 = ''; // 点击类型（日、周、月、年）
var <portlet:namespace />step3 = "${tbinfo.xStep_3}"; //存储X轴的显示间隔
var <portlet:namespace />legendList3 = "${tbinfo.chartLegendList_3}";// 图例列表
var <portlet:namespace />showLegend3 = false; // 默认不显示图例
var <portlet:namespace />centerTitle3 = ""; //居中标题
var <portlet:namespace />c_title3 = ''; // 存储居中标题对应的年份
var <portlet:namespace />exp_start_date3 = ''; // 存储导出的时间 
var <portlet:namespace />choose_name3 = '${tbinfo.choose_name3}'; // 对应的name
var <portlet:namespace />choose_id3 = '${tbinfo.choose_id3}'; // 对应的id
var <portlet:namespace />ispd3 = '${tbinfo.ispd3}'; // 对应的ispd
var <portlet:namespace />times3 =  [];//根据所选name的个数来保存相应时间
var <portlet:namespace />series_count3 = '${tbinfo.choose_name3}';
var <portlet:namespace />series_total3 = <portlet:namespace />series_count3.split(",");//保存每组图表的数据列
var <portlet:namespace />legend_count3 = <portlet:namespace />legendList3.split(",").length;//保存图例说明已配置的个数
	
	if(<portlet:namespace />series_total3.length>1){
		<portlet:namespace />showLegend3 = true;
	}
	//文本框选择时间对比
	function <portlet:namespace />comparetime3() {
		var dformt = 'yyyy-MM-dd';
		if (<portlet:namespace />choose_type3 == "day"){
			dformt = 'yyyy-MM-dd';
		} else if (<portlet:namespace />choose_type3 == "week") {
			dformt = 'yyyy-MM-dd';
		} else if (<portlet:namespace />choose_type3 == "month") {
			dformt = 'MM';
		} else if (<portlet:namespace />choose_type3 == "year") {
			dformt = 'yyyy';
		}
		
		WdatePicker({
			el : '<portlet:namespace />datetime3',
			dateFmt : dformt,
			onpicked : function(dp) {
				// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
				var paretime= dp.cal.getDateStr('yyyy-MM-dd');
				
				// 显示在页面上的时间
				var showtime= dp.cal.getDateStr(dformt);
				$('#<portlet:namespace />comparetime3').val(showtime);
				
				<portlet:namespace />legendList3 = <portlet:namespace />start_date3 + "," + paretime;
				<portlet:namespace />exp_start_date3 = <portlet:namespace />legendList3;
				<portlet:namespace />choose_name3 = '${tbinfo.choose_name3},${tbinfo.choose_name3}'; // 对应的name
				<portlet:namespace />choose_id3 = '${tbinfo.choose_id3},${tbinfo.choose_id3}'; // 对应的id
				<portlet:namespace />ispd3 = '${tbinfo.ispd3},${tbinfo.ispd3}'; // 对应的ispd
				
				<portlet:namespace />times3.length = 0; //清空<portlet:namespace />times3
				// 根据name的个数，来为att添加对应个数的值
				for(var k=0;k<2;k++){
					for(var i=0;i<<portlet:namespace />series_total3.length;i++){
						if(k==0){
							<portlet:namespace />times3.push(<portlet:namespace />start_date3);
						}else{
							<portlet:namespace />times3.push(paretime);
						}
					}
				}
				<portlet:namespace />confirm3()
			}
		});
	}
   

	/**
	* 加入对比后，获取图表数据
	*/
	function <portlet:namespace />confirm3(){
		<portlet:namespace />showLegend3 = true;
		// 渲染图表
		<portlet:namespace />getChart3(<portlet:namespace />times3.join(),<portlet:namespace />choose_name3
				,<portlet:namespace />choose_id3,<portlet:namespace />ispd3,<portlet:namespace />legendList3,
				<portlet:namespace />showLegend3,'yes');
	}
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate3(type) {
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
			el : '<portlet:namespace />datetime3',
			dateFmt : dformt,
			onpicked : function(dp) {
				$('#<portlet:namespace />comparetime3').val(''); // 清空对比框的值
				var _time = dp.cal;
				<portlet:namespace />start_date3 = _time.getDateStr('yyyy-MM-dd');
				<portlet:namespace />exp_start_date3 = <portlet:namespace />start_date3; //导出excel的开始时间 
				<portlet:namespace />choose_type3 = type;
				// 为居中标题赋值 
				<portlet:namespace />centerTitle3 = dp.cal.getDateStr(titleFormat);
				<portlet:namespace />c_title3 = dp.cal.getDateStr("yyyy");

				if (type == "day"){
					<portlet:namespace />step3 = "${tbinfo.xStep_3}";
					$(".energy_total tr td > span").text("日"); // 文字
					$(".energy_total > tr:eq(3) > td:eq(0)").text("同比昨日"); // 文字
				} else if (type == "week") {
					<portlet:namespace />step3 = "1";
					$(".energy_total tr td > span").text("周"); // 文字
					$(".energy_total > tr:eq(3) > td:eq(0)").text("同比上周"); // 文字
				} else if (type == "month") {
					<portlet:namespace />step3 = "${tbinfo.xStep_3}";
					$(".energy_total tr td > span").text("月"); // 文字
					$(".energy_total > tr:eq(3) > td:eq(0)").text("同比上月"); // 文字
				} else if (type == "year"){
					<portlet:namespace />step3 = "1";
					$(".energy_total tr td > span").text("年"); // 文字
					$(".energy_total > tr:eq(3) > td:eq(0)").text("同比去年"); // 文字
				}
				
				<portlet:namespace />times3.length = 0; //清空<portlet:namespace />times3
				
				// 根据name的个数，来为att添加对应个数的值
				for(var i=0;i<<portlet:namespace />series_total3.length;i++){
					<portlet:namespace />times3.push(<portlet:namespace />start_date3);
				}

				<portlet:namespace />choose_name3 = '${tbinfo.choose_name3}';
				<portlet:namespace />choose_id3 = '${tbinfo.choose_id3}';
				<portlet:namespace />ispd3 = '${tbinfo.ispd3}';
				if(<portlet:namespace />series_total3.length>1){
					<portlet:namespace />showLegend3 = true;
				}else{
					<portlet:namespace />showLegend3 = false;
				}
				// 获取图表
				<portlet:namespace />getChart3(<portlet:namespace />times3.join(),<portlet:namespace />choose_name3,<portlet:namespace />choose_id3,<portlet:namespace />ispd3,<portlet:namespace />legendList3,<portlet:namespace />showLegend3,'no');
			}
		});
	}
	
	
	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getChart3(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		<portlet:namespace />getRightData3(); // 获取右侧数据
		$
			.post(
					'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
					{
						from : tfrom,
						name : name,
						id : id,
						ispd : ispd,
						decimals : '${tbinfo.decimals3}',
						type : <portlet:namespace />choose_type3
					}, function(data) {
						var newLegendList = [];//用来存储图例说明数据
						var chartLegends = "${tbinfo.chartLegendList_3}";//配置项中的图例名称信息
						var chartLegendList = chartLegends.split(",");//配置项中的图例名称信息
						var cataList = data.expExcelCataList[0]; 
						var dataList = data.dataList;
						//获取x轴显示信息，取个数多的显示
						for(var i = 0 ;i<data.expExcelCataList.length;i++){
							if(cataList.length<data.expExcelCataList[i].length){
								cataList = data.expExcelCataList[i];
							}
						}
						if (<portlet:namespace />choose_type3 == "day"){
							if(isNotCompare == "yes"){ // 如果是对比的图
								<portlet:namespace />centerTitle3 = "";
								<portlet:namespace />legendList3 = "";
								var tfroms = tfrom.split(",");
									<portlet:namespace />centerTitle3 += tfroms[0] + "与" + tfroms[tfroms.length-1];//获取比较视图的居中标题
								try{
									for(var k=0;k<2;k++){
										//为每个选定name的图表添加对应图例说明名称
										for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
											if(k==0){
												//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
												if(parseInt(<portlet:namespace />legend_count3)>i){
													newLegendList.push(tfroms[0] + chartLegendList[i]);
												}else{
													newLegendList.push(tfroms[0] + "series" + (i+1));
												}
											}else{
												//根据已配置的图例名称对比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
												if(<portlet:namespace />legend_count3>i){
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
								for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
									//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
									if(<portlet:namespace />legend_count3>i){
										newLegendList.push(chartLegendList[i]);
									}else{
										newLegendList.push("series" + (i+1));
									}
								}
							}
							
						} else if (<portlet:namespace />choose_type3 == "week") {
							var _legendList = data.legendList;
							if(isNotCompare == "yes"){ // 如果是对比的图 
								<portlet:namespace />centerTitle3 = "";
								<portlet:namespace />legendList3 = "";
								// 个性需求：重新为图表的一级标题和图例赋值
								<portlet:namespace />centerTitle3 += _legendList[0][0].substring(0,4) + "-" +  _legendList[0][0].substring(5,7) + "-" +  _legendList[0][0].substring(8) + "~"
								 + _legendList[0][_legendList[0].length-1].substring(5,7) + "-" +  _legendList[0][_legendList[0].length-1].substring(8) + "与"
								 + _legendList[_legendList.length-1][0].substring(0,4) + "-" +  _legendList[_legendList.length-1][0].substring(5,7) + "-" +  _legendList[_legendList.length-1][0].substring(8) + "~"
								 + _legendList[_legendList.length-1][_legendList[_legendList.length-1].length-1].substring(5,7) + "-" +  _legendList[_legendList.length-1][_legendList[_legendList.length-1].length-1].substring(8);
								for(var k=0;k<2;k++){
									//为每个选定name的图表添加对应图例说明名称
									for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
										if(k==0){
											//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
											if(parseInt(<portlet:namespace />legend_count3)>i){
												newLegendList.push(_legendList[0][0] + "~" + _legendList[0][_legendList[0].length-1] + chartLegendList[i]);
											}else{
												newLegendList.push(_legendList[0][0] + "~" + _legendList[0][_legendList[0].length-1] + "series" + (i+1));
											}
										}else{
											//根据已配置的图例名称对比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
											if(parseInt(<portlet:namespace />legend_count3)>i){
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
								<portlet:namespace />centerTitle3 = <portlet:namespace />c_title3 + "-" + data.cataList[0].substring(0,2) + "-" + data.cataList[0].substring(3) + "~"
								  + <portlet:namespace />c_title3 + "-" + data.cataList[data.cataList.length-1].substring(0,2) + "-" + data.cataList[data.cataList.length-1].substring(3);
								// 往后台返回的X轴列表中添加周一~周日
								var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
								for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
									//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
									if(parseInt(<portlet:namespace />legend_count3)>i){
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
						} else if (<portlet:namespace />choose_type3 == "month") {
							if(isNotCompare == "yes"){ // 如果是对比的图 
								<portlet:namespace />centerTitle3 = "";
								<portlet:namespace />legendList3 = "";
								// 个性需求：重新为图表的一级标题和图例赋值
								var tfroms = tfrom.split(",");
								<portlet:namespace />centerTitle3 += tfroms[0].substring(0,7) + "与" + tfroms[tfroms.length-1].substring(0,7);
								for(var k=0;k<2;k++){
									//为每个选定name的图表添加对应图例说明名称
									for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
										if(k==0){
											//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
											if(parseInt(<portlet:namespace />legend_count3)>i){
												newLegendList.push(tfroms[0].substring(0,7) + chartLegendList[i]);
											}else{
												newLegendList.push(tfroms[0].substring(0,7) + "series" + (i+1));
											}
										}else{
											//根据已配置的图例名称对比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
											if(parseInt(<portlet:namespace />legend_count3)>i){
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
								for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
									//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
									if(parseInt(<portlet:namespace />legend_count3)>i){
										newLegendList.push(chartLegendList[i]);
									}else{
										newLegendList.push("series" + (i+1));
									}	
								}
							}
						} else if (<portlet:namespace />choose_type3 == "year") {
							if(isNotCompare == "yes"){ // 如果是对比的图 
							var compareyear = tfrom.split(",");//获取比较时间列表，并转换为数组类型
								// 个性需求：重新为图表的一级标题和图例赋值
								<portlet:namespace />centerTitle3 = <portlet:namespace />c_title3 + "与" + compareyear[compareyear.length-1].substring(0,4);
								for(var k=0;k<2;k++){
									//为每个选定name的图表添加对应图例说明名称
									for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
										if(k==0){
											//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
											if(parseInt(<portlet:namespace />legend_count3)>i){
												newLegendList.push(<portlet:namespace />c_title3 + chartLegendList[i]);
											}else{
												newLegendList.push(<portlet:namespace />c_title3 + "series" + (i+1));
											}
										}else{
											//根据已配置的图例名称对比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
											if(parseInt(<portlet:namespace />legend_count3)>i){
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
								for(var i=0;i<parseInt(<portlet:namespace />series_total3.length);i++){
									//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
									if(parseInt(<portlet:namespace />legend_count3)>i){
										newLegendList.push(chartLegendList[i]);
									}else{
										newLegendList.push( "series" + (i+1));
									}
								}
							}
						}
						// 显示时间到相应位置
						$("#<portlet:namespace />fromDate3").text(<portlet:namespace />centerTitle3);
						// 渲染图表
						var chartLegendList = newLegendList//保存图例说明信息
						var chartColor_3 = "${tbinfo.chartColorList_3}";//颜色列表
						var chartColorList = chartColor_3.split(",");
						var chartFillColor_3 = "${tbinfo.chartFillColorList_3}"; // 填充颜色列表
						var chartFillColorList = chartFillColor_3.split(",");
						var chartRadius_3 =  "${tbinfo.chartRadiusList_3}"; // 曲线点半径列表,默认为4
						var chartRadiusList = chartRadius_3.split(",");
						var chartSymbolList = "${tbinfo.ySymbol3}"; // Y轴单位
						var chartYAxisList = [${tbinfo.chartYAxisList_3}];//Y轴数据列表
						//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToCharts.js中，用来生成图表
						autoRenderToMoreCharts("<portlet:namespace />buildconsumption",// 对应的渲染位置 
								"${tbinfo.chartType_3_1},${tbinfo.chartType_3_2}",//图表类型
								"",//图表绘图区域背景颜色
								<portlet:namespace />series_total3.length,//获取选取name的个数
								<portlet:namespace />step3,//X轴间隔
								"",// 居中标题
								"${tbinfo.gridLineDashStyle3}",//图表中线的样式
								"${tbinfo.symbol3}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
								"${tbinfo.lineWidth_3}", // 线宽，此为具体曲线点的点线宽
								"${tbinfo.connectLineWidth_3}", // 连接线线宽，为空则默认为2，为0则不显示连接线										
								"${tbinfo.yLeftTitle_3}",//Y轴左侧标题
								"${tbinfo.yRightTitle_3}",//Y轴右侧标题
								<portlet:namespace />showLegend3,//是否显示图例说明
								"${tbinfo.showXGridLine3}",//是否显示X轴网格线
								"${tbinfo.showYGridLine3}",//是否显示Y轴网格线
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
<portlet:namespace />choose_type3 = "day";

if(publicTime != ""){
	<portlet:namespace />start_date3 = publicTime;
} else {
	if("${tbinfo.defaulttime3}" == ""){
		var nowdate = new Date();
		<portlet:namespace />start_date3 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	} else {
		<portlet:namespace />start_date3 = "${tbinfo.defaulttime3}";
	}
}


<portlet:namespace />exp_start_date3 = <portlet:namespace />start_date3; // 导出excel的开始时间
<portlet:namespace />centerTitle3 = <portlet:namespace />start_date3; //居中标题	
// 根据name的个数，来为att添加对应个数的值
 for(var i=0;i<<portlet:namespace />series_total3.length;i++){
	<portlet:namespace />times3.push(<portlet:namespace />start_date3);
} 
// 得到报表数据
<portlet:namespace />getChart3(<portlet:namespace />times3.join(),<portlet:namespace />choose_name3,<portlet:namespace />choose_id3,<portlet:namespace />ispd3,<portlet:namespace />legendList3,<portlet:namespace />showLegend3,'no');
// 导出数据到excel
function <portlet:namespace />outputToExcel3(){
	var isNotCompare = "no"; // 默认不是对比图表
	var sdate = <portlet:namespace />exp_start_date3;//保存导出到excel中的时间 
	var sdateList = sdate.split(",");
	if(sdateList.length>1){
		isNotCompare = "yes"; // yes表示是对比图表
	}
	
	// 根据配置的图例个数，匹配时间个数和图例个数一致 
	var startdate = [];
	var chartLegendList = "${tbinfo.chartLegendList_3}".split(",");//根据配置项，获取图例列表 
	
	for(var i=0;i<sdateList.length;i++){
		for(var k=0;k<chartLegendList.length;k++){
			startdate.push(sdateList[i]);
			console.log(sdateList[i]);
		}
	}
	sdate = startdate.join();//将每个日期对应的数据列保存
	var expColumnName3 = "${tbinfo.expColumnName3}";
	var expUrl = '';// 导出excel的Url
	//根据数据个数调用相应导出方法
	if(<portlet:namespace />series_total3.length>1){
		expUrl = "<portlet:resourceURL id='expOutSideChartDataToExcel'></portlet:resourceURL>";
	}else{
		expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>";
	}
	var hSrc = "http://" + document.location.host
			+ "/energymanagesystem/uploadfiles/" + "${tbinfo.title3}"
			+ ".xls";
	$.ajax({
		type : "POST",
		url : expUrl + "&excelName="
			+ "${tbinfo.title3}"
			+ "&from="
			+ sdate
			+ "&name="
			+ <portlet:namespace />choose_name3
			+ "&id="
			+ <portlet:namespace />choose_id3
			+ "&ispd="
			+ <portlet:namespace />ispd3
			+ "&type="
			+ <portlet:namespace />choose_type3
			+ "&isNotCompare="
			+ isNotCompare
			+ "&expColumnName="
			+ (expColumnName3==""?"${tbinfo.title3}":expColumnName3),
		async : false,
		contentType : 'application/x-msdownload;charset=UTF-8',
		success : function(result) {
			$("#<portlet:namespace />tmpFrame3").attr('src', hSrc);
		},
		error : function(result) {
			alert('error');
		}
	});
}

//获取右侧数据
function <portlet:namespace />getRightData3(){
	$.ajax({
		type : "POST",
		url : "<portlet:resourceURL id='getDatasForAtts'></portlet:resourceURL>",
		data : {
			from : <portlet:namespace />start_date3,
			name : 'energy',
			id : 'total',
			ispd : '0',
			att : 'max,min,sum,change',
			decimals : '${tbinfo.decimals3}',//显示小数位数，首选项传
			type : <portlet:namespace />choose_type3
		},
		success : function(result) {
			var data = result.data;
			var maxtime = '', mintime = '';
			if(<portlet:namespace />choose_type3 == 'day'){
				maxtime = data[0][1].substring(11, 16);
				mintime = data[1][1].substring(11, 16);
			} else if(<portlet:namespace />choose_type3 == 'week'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			} else if(<portlet:namespace />choose_type3 == 'month'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			} else if(<portlet:namespace />choose_type3 == 'year'){
				maxtime = data[0][1].substring(5);
				mintime = data[1][1].substring(5);
			}
			
			$(".energy_total > tr:eq(0) > td:eq(1)").text(parseFloat(data[0][0])); // max
			$(".energy_total > tr:eq(0) > td:eq(3)").text(maxtime); // maxTime
			$(".energy_total > tr:eq(1) > td:eq(1)").text(parseFloat(data[1][0]));// min
			$(".energy_total > tr:eq(1) > td:eq(3)").text(mintime); // minTime
			$(".energy_total > tr:eq(2) > td:eq(1)").text(parseFloat(data[2][0])); // sum
			$(".energy_total > tr:eq(3) > td:eq(1)").text(returnUpOrDown(data[3][0]) + returnPositiveVal(data[3][0],"0"));// change
		},
		error : function(result) {
			console.log('getRightData3 + error');
		}
	});
};
</script>