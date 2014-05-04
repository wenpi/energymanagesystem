<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-7-23 下午1点14分
	LastModified Date:
	Description: 能耗统计-建筑总用气趋势 gastrend
 -->

<div class="div-table">

	<div class="parameter_1 gas"
		style="background-color:${buildtotalconsumption.backgroundColor_5};">
		<div class="page_header">
			<h1>${buildtotalconsumption.title5}</h1>
		</div>
		<h5>${buildtotalconsumption.description_5}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td><span id="<portlet:namespace />datavalue5_1">500</span><sup>m³</sup></td>
				<td><span id="<portlet:namespace />datavalue5_2">4</span><sup>%</sup><span id="<portlet:namespace />upOrDown5"></span></td>
			</tr>
			<tr>
				<td><span id="<portlet:namespace />datavalue5_3">当日用气量</span></td>
				<td><span id="<portlet:namespace />datavalue5_4">与昨日相比</span></td>
			</tr>
		</table>
	</div>

	<div class="timediv">
		<input id="<portlet:namespace />datetime5" type="hidden" />
		<div id="<portlet:namespace />day5" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('day')">日视图</div>
		<div id="<portlet:namespace />week5" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('week')">周视图</div>
		<div id="<portlet:namespace />month5" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('month')">月视图</div>
		<div id="<portlet:namespace />year5" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate5('year')">年视图</div>

		<div class="inlinedivstyle selectdivstyle">
			&nbsp;与&nbsp; <input name="<portlet:namespace />comparetime5"
				id="<portlet:namespace />comparetime5" class="inputstyle"
				onclick="<portlet:namespace />comparetime5()" /> &nbsp;对比&nbsp;
		</div>
		
		<div id="<portlet:namespace />yearddd5" onclick="<portlet:namespace />outputToExcel5()" class="tdatt output">输出</div>

		<iframe name="<portlet:namespace />tmpFrame5"
			id="<portlet:namespace />tmpFrame5" width="1" height="1"
			style="visibility: hidden; position: absolute; display: none"></iframe>
			
		<!-- class="basicchartdiv jzzyqqs" -->
		<div id="<portlet:namespace />gastrend" class="basicchartdiv"></div>
	</div>

</div>

<script type="text/javascript">
var <portlet:namespace />timeArr5 = ["<portlet:namespace />day5", "<portlet:namespace />week5", "<portlet:namespace />month5", "<portlet:namespace />year5"];    
function <portlet:namespace />changeColor5(type){
	//设置其它td标签的字体颜色
	$.each(<portlet:namespace />timeArr5,function(i,obj) {
		document.getElementById(this).style.color='#666666';
	});
	
	// 设置当前点击的标签的字体颜色
	document.getElementById("<portlet:namespace />"+type+"5").style.color='red';
}

//文本框选择时间对比
function <portlet:namespace />comparetime5() {
	var dformt = 'yyyy-MM-dd';
	if (<portlet:namespace />choose_type5 == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type5 == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type5 == "month") {
		dformt = 'MM';
	} else if (<portlet:namespace />choose_type5 == "year") {
		dformt = 'yyyy';
	}
	
	WdatePicker({
		el : '<portlet:namespace />datetime5',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			
			// 显示在页面上的时间
			var showtime= dp.cal.getDateStr(dformt);
			$('#<portlet:namespace />comparetime5').val(showtime);
			
			<portlet:namespace />legendList5 = <portlet:namespace />start_date5 + "," + paretime;
			<portlet:namespace />exp_start_date5 = <portlet:namespace />legendList5;
			<portlet:namespace />choose_name5 = '${buildtotalconsumption.choose_name5},${buildtotalconsumption.choose_name5}'; // 对应的name
			<portlet:namespace />choose_id5 = '${buildtotalconsumption.choose_id5},${buildtotalconsumption.choose_id5}'; // 对应的id
			<portlet:namespace />ispd5 = '${buildtotalconsumption.ispd5},${buildtotalconsumption.ispd5}'; // 对应的ispd
			<portlet:namespace />showLegend5 = true;
			
			// 渲染图表
			<portlet:namespace />getChart5(<portlet:namespace />exp_start_date5,<portlet:namespace />choose_name5,<portlet:namespace />choose_id5,<portlet:namespace />ispd5,<portlet:namespace />legendList5,<portlet:namespace />showLegend5,'yes');
		}
	});
}

	var <portlet:namespace />start_date5 = ''; // 开始时间
	var <portlet:namespace />choose_type5 = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />str1_5 = '当日用气量'; // 存储选择日历后的返回的文字描述
	var <portlet:namespace />str2_5 = '与昨日相比'; // 存储选择日历后的对应的文字描述
	var <portlet:namespace />step5 = "${buildtotalconsumption.xStep_5}"; //存储X轴的显示间隔
	var <portlet:namespace />legendList5 = "${buildtotalconsumption.chartLegendList_5}";// 图例列表
	var <portlet:namespace />showLegend5 = false; // 默认不显示图例
	var <portlet:namespace />centerTitle5 = ""; //居中标题
	var <portlet:namespace />c_title5 = ''; // 存储居中标题对应的年份
	var <portlet:namespace />exp_start_date5 = ''; // 存储导出的时间 
	var <portlet:namespace />choose_name5 = '${buildtotalconsumption.choose_name5}'; // 对应的name
	var <portlet:namespace />choose_id5 = '${buildtotalconsumption.choose_id5}'; // 对应的id
	var <portlet:namespace />ispd5 = '${buildtotalconsumption.ispd5}'; // 对应的ispd
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate5(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor5(type);
		
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
			el : '<portlet:namespace />datetime5',
			dateFmt : dformt,
			onpicked : function(dp) {
				$('#<portlet:namespace />comparetime5').val(''); // 清空对比框的值
				var _time = dp.cal;
				<portlet:namespace />start_date5 = _time.getDateStr('yyyy-MM-dd');
				<portlet:namespace />exp_start_date5 = <portlet:namespace />start_date5; // 导出excel的开始时间 
				<portlet:namespace />choose_type5 = type;
				// 为居中标题赋值 
				<portlet:namespace />centerTitle5 = dp.cal.getDateStr(titleFormat);
				<portlet:namespace />c_title5 = dp.cal.getDateStr("yyyy");

				if (type == "day"){
					<portlet:namespace />str1_5 =  _time.getDateStr('MM')+"月"+ _time.getDateStr('dd') + "日用气量";
					<portlet:namespace />str2_5 = "与昨日相比";
					<portlet:namespace />step5 = "${buildtotalconsumption.xStep_5}";
				} else if (type == "week") {
					<portlet:namespace />step5 = "1";
					<portlet:namespace />str1_5 = "该周用气量";
					<portlet:namespace />str2_5 = "与上周相比";
				} else if (type == "month") {
					<portlet:namespace />str1_5 = _time.getDateStr('yyyy') + "年" + _time.getDateStr('MM') + "月用气量";
					<portlet:namespace />str2_5 = "与上月相比";
					<portlet:namespace />step5 = "${buildtotalconsumption.xStep_5}";
				} else if (type == "year"){
					<portlet:namespace />str1_5 = _time.getDateStr('yyyy') + "年用气量";
					<portlet:namespace />str2_5 = "与上年相比";
					<portlet:namespace />step5 = "1";
				}

				// 获取页面数据的值
				<portlet:namespace />setTextAndValue5(<portlet:namespace />start_date5,<portlet:namespace />str1_5,<portlet:namespace />str2_5);
				// 获取图表
				<portlet:namespace />choose_name5 = '${buildtotalconsumption.choose_name5}';
				<portlet:namespace />choose_id5 = '${buildtotalconsumption.choose_id5}';
				<portlet:namespace />ispd5 = '${buildtotalconsumption.ispd5}';
				<portlet:namespace />getChart5(<portlet:namespace />start_date5,<portlet:namespace />choose_name5,<portlet:namespace />choose_id5,<portlet:namespace />ispd5,<portlet:namespace />legendList5,<portlet:namespace />showLegend5,'no');
			}
		});
	}

	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getChart5(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		$
				.post(
						'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							decimals : '${buildtotalconsumption.decimals5}',
							type : <portlet:namespace />choose_type5
						}, function(data) {
							
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							if (<portlet:namespace />choose_type5 == "day"){
								if(isNotCompare == "yes"){ // 如果是对比的图
									<portlet:namespace />centerTitle5 = "";
									<portlet:namespace />legendList5 = "";
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle5 += tfroms[i] + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList5 += tfroms[i] + ((tfroms.length-1) == i ? "" : ",");
									}
								}
							} else if (<portlet:namespace />choose_type5 == "week") {
								if(isNotCompare == "yes"){ // 如果是对比的图 

									var _legendList = data.legendList;
									<portlet:namespace />centerTitle5 = "";
									<portlet:namespace />legendList5 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									for(var i=0;i<_legendList.length;i++){
										for(var k=0;k<_legendList[i].length;k++){
											<portlet:namespace />centerTitle5 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
											<portlet:namespace />legendList5 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
										}
										
										<portlet:namespace />centerTitle5 += ((_legendList.length-1) == i ? "" : "与");
										<portlet:namespace />legendList5 += ((_legendList.length-1) == i ? "" : ",");
									}

									// 个性需求：重新为图表的X轴赋值
									cataList = ["周一","周二","周三","周四","周五","周六","周日"];
								} else {
									// 居中标题的值
									<portlet:namespace />centerTitle5 = <portlet:namespace />c_title5 + "/" + data.cataList[0] + "~~" + <portlet:namespace />c_title5 + "/" + data.cataList[data.cataList.length-1];
									
									// 往后台返回的X轴列表中添加周一~周日
									var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
									for(var i=0;i<cataList.length;i++){
										finalCataList.push(cataList[i]+cList[i]);
									}
									
									cataList = finalCataList;
								}
							} else if (<portlet:namespace />choose_type5 == "month") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									<portlet:namespace />centerTitle5 = "";
									<portlet:namespace />legendList5 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle5 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList5 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
									}
									
									// 个性需求：重新为图表的X轴赋值
									cataList = [];
									for(var k=1;k<=data.cataList.length;k++){
										cataList.push(k); 					
									}
								}
							} else if (<portlet:namespace />choose_type5 == "year") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									var compareyear = tfrom.substring(11,15);
									// 个性需求：重新为图表的一级标题和图例赋值
									<portlet:namespace />centerTitle5 = <portlet:namespace />c_title5 + "与" + compareyear;
									<portlet:namespace />legendList5 = <portlet:namespace />c_title5 + "," + compareyear;
									
									// 个性需求：重新为图表的X轴赋值
									var _yearList = data.yearList;
									
									if(_yearList[0].length>=_yearList[1].length){
										cataList = _yearList[0];
									} else if(_yearList[0].length<_yearList[1].length){
										cataList = _yearList[1];
									}
								}
							}
							
							// 渲染图表
							var seriesList = [];

							// 获取对应的数据列表，对应图表中的图形条数
							seriesList = returnSeriesList("${buildtotalconsumption.chartType_5_1}",
														  "${buildtotalconsumption.connectLineWidth_5}", // 连接线线宽，为空则默认为2，为0则不显示连接线
														  "${buildtotalconsumption.lineWidth_5}", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
														  <portlet:namespace />legendList5,
														  "${buildtotalconsumption.chartColorList_5}", // 颜色列表
														  "${buildtotalconsumption.chartFillColorList_5}", // 填充颜色列表
														  "${buildtotalconsumption.chartRadiusList_5}", // 曲线点半径列表,默认为5
														  "${buildtotalconsumption.symbol5}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
														  "", // 参考值  
														  "${buildtotalconsumption.chartType_5_2}", // 参考值的图表类型
														  "${buildtotalconsumption.referenceLegend_5}", // 参考值对应的图例名称
														  "${buildtotalconsumption.referenceColor_5}", // 参考值对应的颜色
														  dataList);
							
							// 将图表渲染到对应的位置上
							renderCompareChart("<portlet:namespace />gastrend",// 对应的渲染位置
											   <portlet:namespace />centerTitle5,// 居中标题
											   <portlet:namespace />step5,// X轴间隔
											   cataList,// X轴数据列表
											   '', // 列表中的线的样式，默认为虚线
											   '${buildtotalconsumption.yLeftTitle_5}',//  Y轴标题
											   '${buildtotalconsumption.ySymbol5}',// Y轴的单位
											   showLegend == '' ? false : showLegend,// 是否显示图例
											   "${buildtotalconsumption.referenceColor_5}",// 参考颜色
											   seriesList);
						}, 'json');
	}
	
	// 取后台数据赋值到前台页面
	function <portlet:namespace />setTextAndValue5(fdate,str1_5,str2_5){
		$
		.post(
				'<portlet:resourceURL id="getValueByNameAndId"></portlet:resourceURL>',
				{
					from : fdate,
					name : '${buildtotalconsumption.choose_name5}',
					id : '${buildtotalconsumption.choose_id5}',
					ispd : '${buildtotalconsumption.ispd5}',
					att : 'sum,change',
					type : <portlet:namespace />choose_type5
				}, function(data) {
					// 为相应的位置赋值
					var valueList = data.data;
					
					// 设置上升↑、下降↓,注意：returnUpOrDown函数写在tomcat\ROOT\html\company\scripts目录下renderToCharts.js中
					$('#<portlet:namespace />upOrDown5').text(returnUpOrDown(valueList[1]));
					
					// 设置左侧对应位置的文字描述及数据
					$('#<portlet:namespace />datavalue5_1').text(returnPositiveVal(valueList[0],'${buildtotalconsumption.decimals5}'));
					$('#<portlet:namespace />datavalue5_2').text(returnPositiveVal(valueList[1],'${buildtotalconsumption.decimals5}'));
					$('#<portlet:namespace />datavalue5_3').text(str1_5);
					$('#<portlet:namespace />datavalue5_4').text(str2_5);
				}, 'json');
	}

	// 默认显示当前时间
	<portlet:namespace />choose_type5 = "day";
	if("${buildtotalconsumption.defaulttime5}" == ""){
		var nowdate = new Date();
		<portlet:namespace />start_date5 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	} else {
		<portlet:namespace />start_date5 = "${buildtotalconsumption.defaulttime5}";
	}
	
	<portlet:namespace />exp_start_date5 = <portlet:namespace />start_date5; // 导出excel的开始时间
	<portlet:namespace />centerTitle5 = <portlet:namespace />start_date5; //居中标题
	// 获取右侧显示数据
	<portlet:namespace />setTextAndValue5(<portlet:namespace />start_date5,<portlet:namespace />str1_5,<portlet:namespace />str2_5);
	
	// 得到报表数据
	<portlet:namespace />getChart5(<portlet:namespace />start_date5,<portlet:namespace />choose_name5,<portlet:namespace />choose_id5,<portlet:namespace />ispd5,<portlet:namespace />legendList5,<portlet:namespace />showLegend5,'no');
	// 导出数据到excel
	function <portlet:namespace />outputToExcel5(){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date5;
		var sdateList = sdate.split(",");
		if(sdateList.length>1){
			isNotCompare = "yes"; // yes表示是对比图表
		}
		
		var expColumnName5 = "${buildtotalconsumption.expColumnName5}";
		// 导出excel的Url
		var expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${buildtotalconsumption.title5}"
				+ "&from="
				+ sdate
				+ "&name="
				+ <portlet:namespace />choose_name5
				+ "&id="
				+ <portlet:namespace />choose_id5
				+ "&ispd="
				+ <portlet:namespace />ispd5
				+ "&type="
				+ <portlet:namespace />choose_type5
				+ "&isNotCompare="
				+ isNotCompare
				+ "&decimals="
				+ '${buildtotalconsumption.decimals5}'
				+ "&expColumnName="
				+ (expColumnName5==""?"${buildtotalconsumption.title5}":expColumnName5);
		var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${buildtotalconsumption.title5}" /></portlet:resourceURL>';
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${buildtotalconsumption.title5}"
				+ ".xls";
		$.ajax({
			type : "POST",
			url : expUrl,
			async : false,
			contentType : 'application/x-msdownload;charset=UTF-8',
			success : function(result) {
				$("#<portlet:namespace />tmpFrame5").attr('src', hSrc);

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