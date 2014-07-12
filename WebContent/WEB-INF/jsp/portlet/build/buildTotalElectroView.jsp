<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午2点43分
	LastModified Date:
	Description: 建筑总用电趋势
 -->

<div class="div-table">

	<div class="parameter_1 build_electric"
		style="background-color:${coreinfo.backgroundColor_4};">
		<div class="page_header">
			<h1>建筑总用电趋势</h1>
		</div>
		<h5>${coreinfo.description_4}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td><span id="<portlet:namespace />datavalue4_1">800</span><sup>kWh</sup></td>
				<td><span id="<portlet:namespace />datavalue4_2">5</span><sup>%</sup><span
					id="<portlet:namespace />upOrDown4"></span></td>
			</tr>
			<tr>
				<td><span id="<portlet:namespace />datavalue4_3">当日用电量</span></td>
				<td><span id="<portlet:namespace />datavalue4_4">与昨日相比</span></td>
			</tr>
		</table>
	</div>

	<div class="timediv">
		<input id="<portlet:namespace />datetime4" type="hidden" />
		<div id="<portlet:namespace />day4" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('day')">日视图</div>
		<div id="<portlet:namespace />week4" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('week')">周视图</div>
		<div id="<portlet:namespace />month4" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('month')">月视图</div>
		<div id="<portlet:namespace />year4" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('year')">年视图</div>

		<div class="inlinedivstyle selectdivstyle">
			&nbsp;与&nbsp; <input name="<portlet:namespace />comparetime4"
				id="<portlet:namespace />comparetime4" class="inputstyle"
				onclick="<portlet:namespace />comparetime4()" /> &nbsp;对比&nbsp;
		</div>

		<div id="<portlet:namespace />output4"
			onclick="<portlet:namespace />outputToExcel4()" class="tdatt output">输出</div>

		<iframe name="<portlet:namespace />tmpFrame4"
			id="<portlet:namespace />tmpFrame4" width="1" height="1"
			style="visibility: hidden; position: absolute; display: none"></iframe>

		<div id="<portlet:namespace />buildtotalelectro" class="basicchartdiv"></div>
	</div>

</div>

<script type="text/javascript">
var <portlet:namespace />timeArr4 = ["<portlet:namespace />day4", "<portlet:namespace />week4", "<portlet:namespace />month4", "<portlet:namespace />year4"];    
function <portlet:namespace />changeColor4(type){
	//设置其它td标签的字体颜色
	$.each(<portlet:namespace />timeArr4,function(i,obj) {
		document.getElementById(this).style.color='#666666';
	});
	
	// 设置当前点击的标签的字体颜色
	document.getElementById("<portlet:namespace />"+type+"4").style.color='red';
}

//文本框选择时间对比
function <portlet:namespace />comparetime4() {
	var dformt = 'yyyy-MM-dd';
	if (<portlet:namespace />choose_type4 == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type4 == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type4 == "month") {
		dformt = 'MM';
	} else if (<portlet:namespace />choose_type4 == "year") {
		dformt = 'yyyy';
	}
	
	WdatePicker({
		el : '<portlet:namespace />datetime4',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			
			// 显示在页面上的时间
			var showtime= dp.cal.getDateStr(dformt);
			$('#<portlet:namespace />comparetime4').val(showtime);
			
			<portlet:namespace />legendList4 = <portlet:namespace />start_date4 + "," + paretime;
			<portlet:namespace />exp_start_date4 = <portlet:namespace />legendList4;
			<portlet:namespace />choose_name4 = '${coreinfo.choose_name4},${coreinfo.choose_name4}'; // 对应的name
			<portlet:namespace />choose_id4 = '${coreinfo.choose_id4},${coreinfo.choose_id4}'; // 对应的id
			<portlet:namespace />ispd4 = '${coreinfo.ispd4},${coreinfo.ispd4}'; // 对应的ispd
			<portlet:namespace />showLegend4 = true;
			
			// 渲染图表
			<portlet:namespace />getChart4(<portlet:namespace />exp_start_date4,<portlet:namespace />choose_name4,<portlet:namespace />choose_id4,<portlet:namespace />ispd4,<portlet:namespace />legendList4,<portlet:namespace />showLegend4,'yes');
		}
	});
}

	var <portlet:namespace />start_date4 = ''; // 开始时间
	var <portlet:namespace />choose_type4 = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />str1_4 = '当日用电量'; // 存储选择日历后的返回的文字描述
	var <portlet:namespace />str2_4 = '与昨日相比'; // 存储选择日历后的对应的文字描述
	var <portlet:namespace />step4 = "${coreinfo.xStep_4}"; //存储X轴的显示间隔
	var <portlet:namespace />legendList4 = "${coreinfo.chartLegendList_4}";// 图例列表
	var <portlet:namespace />showLegend4 = false; // 默认不显示图例
	var <portlet:namespace />centerTitle4 = ""; //居中标题
	var <portlet:namespace />c_title4 = ''; // 存储居中标题对应的年份
	var <portlet:namespace />exp_start_date4 = ''; // 存储导出的时间 
	var <portlet:namespace />choose_name4 = '${coreinfo.choose_name4}'; // 对应的name
	var <portlet:namespace />choose_id4 = '${coreinfo.choose_id4}'; // 对应的id
	var <portlet:namespace />ispd4 = '${coreinfo.ispd4}'; // 对应的ispd
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate4(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor4(type);
		
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
			el : '<portlet:namespace />datetime4',
			dateFmt : dformt,
			onpicked : function(dp) {
				$('#<portlet:namespace />comparetime4').val(''); // 清空对比框的值
				var _time = dp.cal;
				<portlet:namespace />start_date4 = _time.getDateStr('yyyy-MM-dd');
				<portlet:namespace />exp_start_date4 = <portlet:namespace />start_date4; // 导出excel的开始时间 
				<portlet:namespace />choose_type4 = type;
				// 为居中标题赋值 
				<portlet:namespace />centerTitle4 = dp.cal.getDateStr(titleFormat);
				<portlet:namespace />c_title4 = dp.cal.getDateStr("yyyy");

				if (type == "day"){
					<portlet:namespace />str1_4 =  _time.getDateStr('MM')+"月"+ _time.getDateStr('dd') + "日用电量";
					<portlet:namespace />str2_4 = "与昨日相比";
					<portlet:namespace />step4 = "${coreinfo.xStep_4}";
				} else if (type == "week") {
					<portlet:namespace />step4 = "1";
					<portlet:namespace />str1_4 = "该周用电量";
					<portlet:namespace />str2_4 = "与上周相比";
				} else if (type == "month") {
					<portlet:namespace />str1_4 = _time.getDateStr('yyyy') + "年" + _time.getDateStr('MM') + "月用电量";
					<portlet:namespace />str2_4 = "与上月相比";
					<portlet:namespace />step4 = "${coreinfo.xStep_4}";
				} else if (type == "year"){
					<portlet:namespace />str1_4 = _time.getDateStr('yyyy') + "年用电量";
					<portlet:namespace />str2_4 = "与上年相比";
					<portlet:namespace />step4 = "1";
				}

				// 获取页面数据的值
				<portlet:namespace />setTextAndValue4(<portlet:namespace />start_date4,<portlet:namespace />str1_4,<portlet:namespace />str2_4);
				// 获取图表
				<portlet:namespace />choose_name4 = '${coreinfo.choose_name4}';
				<portlet:namespace />choose_id4 = '${coreinfo.choose_id4}';
				<portlet:namespace />ispd4 = '${coreinfo.ispd4}';
				<portlet:namespace />getChart4(<portlet:namespace />start_date4,<portlet:namespace />choose_name4,<portlet:namespace />choose_id4,<portlet:namespace />ispd4,<portlet:namespace />legendList4,<portlet:namespace />showLegend4,'no');
			}
		});
	}

	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getChart4(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		$
				.post(
						'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							decimals : '${coreinfo.decimals4}', // 保留小数位数 
							type : <portlet:namespace />choose_type4
						}, function(data) {
							
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							if (<portlet:namespace />choose_type4 == "day"){
								if(isNotCompare == "yes"){ // 如果是对比的图
									<portlet:namespace />centerTitle4 = "";
									<portlet:namespace />legendList4 = "";
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle4 += tfroms[i] + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList4 += tfroms[i] + ((tfroms.length-1) == i ? "" : ",");
									}
								}
							} else if (<portlet:namespace />choose_type4 == "week") {
								if(isNotCompare == "yes"){ // 如果是对比的图 

									var _legendList = data.legendList;
									<portlet:namespace />centerTitle4 = "";
									<portlet:namespace />legendList4 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									for(var i=0;i<_legendList.length;i++){
										for(var k=0;k<_legendList[i].length;k++){
											<portlet:namespace />centerTitle4 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
											<portlet:namespace />legendList4 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
										}
										
										<portlet:namespace />centerTitle4 += ((_legendList.length-1) == i ? "" : "与");
										<portlet:namespace />legendList4 += ((_legendList.length-1) == i ? "" : ",");
									}

									// 个性需求：重新为图表的X轴赋值
									cataList = ["周一","周二","周三","周四","周五","周六","周日"];
								} else {
									// 居中标题的值
									<portlet:namespace />centerTitle4 = <portlet:namespace />c_title4 + "/" + data.cataList[0] + "~~" + <portlet:namespace />c_title4 + "/" + data.cataList[data.cataList.length-1];
									
									// 往后台返回的X轴列表中添加周一~周日
									var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
									for(var i=0;i<cataList.length;i++){
										finalCataList.push(cataList[i]+cList[i]);
									}
									
									cataList = finalCataList;
								}
							} else if (<portlet:namespace />choose_type4 == "month") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									<portlet:namespace />centerTitle4 = "";
									<portlet:namespace />legendList4 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle4 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList4 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
									}
									
									// 个性需求：重新为图表的X轴赋值
									cataList = [];
									for(var k=1;k<=data.cataList.length;k++){
										cataList.push(k); 					
									}
								}
							} else if (<portlet:namespace />choose_type4 == "year") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									var compareyear = tfrom.substring(11,15);
									// 个性需求：重新为图表的一级标题和图例赋值
									<portlet:namespace />centerTitle4 = <portlet:namespace />c_title4 + "与" + compareyear;
									<portlet:namespace />legendList4 = <portlet:namespace />c_title4 + "," + compareyear;
									
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
							seriesList = returnSeriesList("${coreinfo.chartType_4_1}",
														  "${coreinfo.connectLineWidth_4}", // 连接线线宽，为空则默认为2，为0则不显示连接线
														  "${coreinfo.lineWidth_4}", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
														  <portlet:namespace />legendList4,
														  "${coreinfo.chartColorList_4}", // 颜色列表
														  "${coreinfo.chartFillColorList_4}", // 填充颜色列表
														  "${coreinfo.chartRadiusList_4}", // 曲线点半径列表,默认为4
														  "${coreinfo.symbol4}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
														  "", // 参考值  
														  "${coreinfo.chartType_4_2}", // 参考值的图表类型
														  "${coreinfo.referenceLegend_4}", // 参考值对应的图例名称
														  "${coreinfo.referenceColor_4}", // 参考值对应的颜色
														  dataList);
							
							// 将图表渲染到对应的位置上
							renderCompareChart("<portlet:namespace />buildtotalelectro",// 对应的渲染位置
											   <portlet:namespace />centerTitle4,// 居中标题
											   <portlet:namespace />step4,// X轴间隔
											   cataList,// X轴数据列表
											   '', // 列表中的线的样式，默认为虚线
											   '${coreinfo.yLeftTitle_4}',//  Y轴标题
											   '${coreinfo.ySymbol4}',// Y轴的单位
											   showLegend == '' ? false : showLegend,// 是否显示图例
											   "${coreinfo.referenceColor_4}",// 参考颜色
											   seriesList);
						}, 'json');
	}
	
	// 取后台数据赋值到前台页面
	function <portlet:namespace />setTextAndValue4(fdate,str1_4,str2_4){
		$
		.post(
				'<portlet:resourceURL id="getValueByNameAndId"></portlet:resourceURL>',
				{
					from : fdate,
					name : '${coreinfo.choose_name4}',
					id : '${coreinfo.choose_id4}',
					ispd : '${coreinfo.ispd4}',
					att : 'sum,change',
					type : <portlet:namespace />choose_type4
				}, function(data) {
					// 为相应的位置赋值
					var valueList = data.data;
					
					// 设置上升↑、下降↓,注意：returnUpOrDown函数写在tomcat\ROOT\html\company\scripts目录下renderToCharts.js中
					$('#<portlet:namespace />upOrDown4').text(returnUpOrDown(valueList[1]));
					
					// 设置左侧对应位置的文字描述及数据
					$('#<portlet:namespace />datavalue4_1').text(returnPositiveVal(valueList[0],"${coreinfo.decimals4}"));
					$('#<portlet:namespace />datavalue4_2').text(returnPositiveVal(valueList[1],"${coreinfo.decimals4}"));
					$('#<portlet:namespace />datavalue4_3').text(str1_4);
					$('#<portlet:namespace />datavalue4_4').text(str2_4);
				}, 'json');
	}

	// 默认显示当前时间
	<portlet:namespace />choose_type4 = "day";
	if("${coreinfo.defaulttime4}" != "") {
		<portlet:namespace />start_date4 = "${coreinfo.defaulttime4}";
	} else if(publicTime != "") {
		<portlet:namespace />start_date4 = publicTime;
	} else {
		var nowdate = new Date();
		<portlet:namespace />start_date4 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	}
	
	<portlet:namespace />exp_start_date4 = <portlet:namespace />start_date4; // 导出excel的开始时间
	<portlet:namespace />centerTitle4 = <portlet:namespace />start_date4; //居中标题
	// 获取右侧显示数据
	<portlet:namespace />setTextAndValue4(<portlet:namespace />start_date4,<portlet:namespace />str1_4,<portlet:namespace />str2_4);
	
	// 得到报表数据
	<portlet:namespace />getChart4(<portlet:namespace />start_date4,<portlet:namespace />choose_name4,<portlet:namespace />choose_id4,<portlet:namespace />ispd4,<portlet:namespace />legendList4,<portlet:namespace />showLegend4,'no');
	// 导出数据到excel
	function <portlet:namespace />outputToExcel4(){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date4;
		var sdateList = sdate.split(",");
		if(sdateList.length>1){
			isNotCompare = "yes"; // yes表示是对比图表
		}
		
		var expColumnName4 = "${coreinfo.expColumnName4}";
		// 导出excel的Url
		var expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${coreinfo.title4}"
				+ "&from="
				+ sdate
				+ "&name="
				+ <portlet:namespace />choose_name4
				+ "&id="
				+ <portlet:namespace />choose_id4
				+ "&ispd="
				+ <portlet:namespace />ispd4
				+ "&type="
				+ <portlet:namespace />choose_type4
				+ "&isNotCompare="
				+ isNotCompare
				+ "&decimals="
				+ '${coreinfo.decimals4}'
				+ "&expColumnName="
				+ (expColumnName4==""?"${coreinfo.title4}":expColumnName4);
		var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${coreinfo.title4}" /></portlet:resourceURL>';
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${coreinfo.title4}"
				+ ".xls";
		$.ajax({
			type : "POST",
			url : expUrl,
			async : false,
			contentType : 'application/x-msdownload;charset=UTF-8',
			success : function(result) {
				$("#<portlet:namespace />tmpFrame4").attr('src', hSrc);

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