<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-7-23 下午1点14分
	LastModified Date:
	Description: 能耗统计-建筑总能耗趋势
 -->

<div class="div-table">

	<div class="parameter_1 consumption"
		style="background-color:${buildtotalconsumption.backgroundColor_1};">
		<div class="page_header">
			<h1>${buildtotalconsumption.title1}</h1>
		</div>
		<h5>${buildtotalconsumption.description_1}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td><span id="<portlet:namespace />datavalue1">2000</span><sup>kgce</sup></td>
				<td><span id="<portlet:namespace />datavalue2">10</span><sup>%</sup><span
					id="<portlet:namespace />upOrDown1"></span></td>
			</tr>
			<tr>
				<td><span id="<portlet:namespace />datavalue3">当日总能耗</span></td>
				<td><span id="<portlet:namespace />datavalue4">与昨日相比</span></td>
			</tr>
		</table>
	</div>

	<div class="timediv">
		<input id="<portlet:namespace />datetime1" type="hidden" />
		<div id="<portlet:namespace />day1" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate('day')">日视图</div>
		<div id="<portlet:namespace />week1" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate('week')">周视图</div>
		<div id="<portlet:namespace />month1" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate('month')">月视图</div>
		<div id="<portlet:namespace />year1" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate('year')">年视图</div>

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


		<div id="<portlet:namespace />totalenergy" class="basicchartdiv"></div>

		<div class="bottom_link">
			<i><a href="${buildtotalconsumption.linkUrl_1_1}">${buildtotalconsumption.linkName_1_1}</a></i><i><a
				href="${buildtotalconsumption.linkUrl_2_1}">${buildtotalconsumption.linkName_2_1}</a></i>
		</div>
	</div>

</div>

<script type="text/javascript">
	//设置顶部的皮肤背景颜色 
	try{
		$('#nav_bg_div').css("background-color", "#9966CC");
		$('.nav_gat_bar>li').css("background-color", "#8345C0");
	}catch(e){}
	
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
				
				<portlet:namespace />legendList1 = <portlet:namespace />start_date1 + "," + paretime;
				<portlet:namespace />exp_start_date1 = <portlet:namespace />legendList1;
				<portlet:namespace />choose_name1 = '${buildtotalconsumption.choose_name1},${buildtotalconsumption.choose_name1}'; // 对应的name
				<portlet:namespace />choose_id1 = '${buildtotalconsumption.choose_id1},${buildtotalconsumption.choose_id1}'; // 对应的id
				<portlet:namespace />ispd1 = '${buildtotalconsumption.ispd1},${buildtotalconsumption.ispd1}'; // 对应的ispd
				<portlet:namespace />showLegend1 = true;
				
				// 渲染图表
				<portlet:namespace />getChart1(<portlet:namespace />exp_start_date1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,<portlet:namespace />legendList1,<portlet:namespace />showLegend1,'yes');
			}
		});
	}

	var <portlet:namespace />start_date1 = ''; // 开始时间
	var <portlet:namespace />choose_type1 = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />str1 = '当日总能耗'; // 存储选择日历后的返回的文字描述
	var <portlet:namespace />str2 = '与昨日相比'; // 存储选择日历后的对应的文字描述
	var <portlet:namespace />step1 = "${buildtotalconsumption.xStep_1}"; //存储X轴的显示间隔
	var <portlet:namespace />legendList1 = "${buildtotalconsumption.chartLegendList_1}";// 图例列表
	var <portlet:namespace />showLegend1 = false; // 默认不显示图例
	var <portlet:namespace />centerTitle1 = ""; //居中标题
	var <portlet:namespace />c_title1 = ''; // 存储居中标题对应的年份
	var <portlet:namespace />exp_start_date1 = ''; // 存储导出的时间 
	var <portlet:namespace />choose_name1 = '${buildtotalconsumption.choose_name1}'; // 对应的name
	var <portlet:namespace />choose_id1 = '${buildtotalconsumption.choose_id1}'; // 对应的id
	var <portlet:namespace />ispd1 = '${buildtotalconsumption.ispd1}'; // 对应的ispd
	
	// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
	if("${buildtotalconsumption.referencevalue1}" != ""){
		var <portlet:namespace />showLegend1 = true;
	}
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor1(type);
		var dformt = 'yyyy-MM-dd',titleFormat='yyyy-MM-dd';
		if (type == "day") {
			dformt = 'yyyy-MM-dd';
		} else if (type == "week") {
			dformt = 'yyyy-MM-dd';
		} else if (type == "month") {
			dformt = 'MM';
			titleFormat='yyyy-MM';
		} else if (type == "year") {
			dformt = 'yyyy';
			titleFormat = 'yyyy';
		}
			
		WdatePicker({
			el : '<portlet:namespace />datetime1',
			dateFmt : dformt,
			onpicked : function(dp) {
				$('#<portlet:namespace />comparetime1').val(''); // 清空对比框的值
				var _time = dp.cal;
				<portlet:namespace />centerTitle1 = dp.cal.getDateStr(titleFormat);
				<portlet:namespace />c_title1 = dp.cal.getDateStr("yyyy");
				<portlet:namespace />start_date1 = _time.getDateStr('yyyy-MM-dd');
				<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1; // 导出excel的开始时间 
				<portlet:namespace />choose_type1 = type;

				if (type == "day"){
					<portlet:namespace />str1 =  _time.getDateStr('MM')+"月"+ _time.getDateStr('dd') + "日总能耗";
					<portlet:namespace />str2 = "与昨日相比";
					<portlet:namespace />step1 = "${buildtotalconsumption.xStep_1}";
				} else if (type == "week") {	
					<portlet:namespace />str1 = "该周总能耗";
					<portlet:namespace />str2 = "与上周相比";
					<portlet:namespace />step1 = "1";
				} else if (type == "month") {
					<portlet:namespace />str1 = _time.getDateStr('yyyy') + "年" + _time.getDateStr('MM') + "月总能耗";
					<portlet:namespace />str2 = "与上月相比";
					<portlet:namespace />step1 = "${buildtotalconsumption.xStep_1}";
				} else if (type == "year"){
					<portlet:namespace />str1 = _time.getDateStr('yyyy') + "年总能耗";
					<portlet:namespace />str2 = "与上年相比";
					<portlet:namespace />step1 = "1";
				}

				<portlet:namespace />choose_name1 = '${buildtotalconsumption.choose_name1}';
				<portlet:namespace />choose_id1 = '${buildtotalconsumption.choose_id1}';
				<portlet:namespace />ispd1 = '${buildtotalconsumption.ispd1}';
				<portlet:namespace />showLegend1 = false;
				// 获取页面数据的值
				<portlet:namespace />setTextAndValue1(<portlet:namespace />start_date1,<portlet:namespace />str1,<portlet:namespace />str2);
				
				// 获取图表
				<portlet:namespace />getChart1(<portlet:namespace />start_date1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,<portlet:namespace />legendList1,<portlet:namespace />showLegend1,'no');
			}
		});
	}

	/**
	 * 异步获取图表数据
	 */
	 function <portlet:namespace />getChart1(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		$
				.post(
						'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							decimals : '${buildtotalconsumption.decimals1}',
							type : <portlet:namespace />choose_type1
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							if (<portlet:namespace />choose_type1 == "day"){
								if(isNotCompare == "yes"){ // 如果是对比的图
									<portlet:namespace />centerTitle1 = "";
									<portlet:namespace />legendList1 = "";
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle1 += tfroms[i] + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList1 += tfroms[i] + ((tfroms.length-1) == i ? "" : ",");
									}
								}
							} else if (<portlet:namespace />choose_type1 == "week") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									var _legendList = data.legendList;
									<portlet:namespace />centerTitle1 = "";
									<portlet:namespace />legendList1 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									for(var i=0;i<_legendList.length;i++){
										for(var k=0;k<_legendList[i].length;k++){
											<portlet:namespace />centerTitle1 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
											<portlet:namespace />legendList1 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
										}
										
										<portlet:namespace />centerTitle1 += ((_legendList.length-1) == i ? "" : "与");
										<portlet:namespace />legendList1 += ((_legendList.length-1) == i ? "" : ",");
									}

									// 个性需求：重新为图表的X轴赋值
									cataList = ["周一","周二","周三","周四","周五","周六","周日"];
								} else {
									// 居中标题的值
									<portlet:namespace />centerTitle1 = <portlet:namespace />c_title1 + "/" + data.cataList[0] + "~~" + <portlet:namespace />c_title1 + "/" + data.cataList[data.cataList.length-1];
									
									// 往后台返回的X轴列表中添加周一~周日
									var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
									for(var i=0;i<cataList.length;i++){
										finalCataList.push(cataList[i]+cList[i]);
									}
									
									cataList = finalCataList;
								}
							} else if (<portlet:namespace />choose_type1 == "month") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									<portlet:namespace />centerTitle1 = "";
									<portlet:namespace />legendList1 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle1 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList1 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
									}
									
									// 个性需求：重新为图表的X轴赋值
									cataList = [];
									for(var k=1;k<=data.cataList.length;k++){
										cataList.push(k); 					
									}
								}
							} else if (<portlet:namespace />choose_type1 == "year") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									var compareyear = tfrom.substring(11,15);
									// 个性需求：重新为图表的一级标题和图例赋值
									<portlet:namespace />centerTitle1 = <portlet:namespace />c_title1 + "与" + compareyear;
									<portlet:namespace />legendList1 = <portlet:namespace />c_title1 + "," + compareyear;
									
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
							seriesList = returnSeriesList("${buildtotalconsumption.chartType_1_1}",
														  "${buildtotalconsumption.connectLineWidth_1}", // 连接线线宽，为空则默认为2，为0则不显示连接线
														  "${buildtotalconsumption.lineWidth_1}", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
														  <portlet:namespace />legendList1,
														  "${buildtotalconsumption.chartColorList_1}", // 颜色列表
														  "${buildtotalconsumption.chartFillColorList_1}", // 填充颜色列表
														  "${buildtotalconsumption.chartRadiusList_1}", // 曲线点半径列表,默认为4
														  "${buildtotalconsumption.symbol1}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
														  '', // 参考值  
														  "${buildtotalconsumption.chartType_1_2}", // 参考值的图表类型
														  "${buildtotalconsumption.referenceLegend_1}", // 参考值对应的图例名称
														  "${buildtotalconsumption.referenceColor_1}", // 参考值对应的颜色
														  dataList);
							
							// 将图表渲染到对应的位置上
							renderCompareChart("<portlet:namespace />totalenergy", // 渲染图表的id
										       <portlet:namespace />centerTitle1,// 居中标题
									  	       <portlet:namespace />step1,// X轴间隔
											   cataList, // X轴列表数据
											   '', // 图表中曲线格式(虚线、实线、细线等)
											   '${buildtotalconsumption.yLeftTitle_1}', // Y轴的标题
											   '${buildtotalconsumption.ySymbol1}', // Y轴标题的单位
											   showLegend == '' ? false : showLegend, // 是否显示图例
											   "${buildtotalconsumption.referenceColor_1}", // 参考颜色，在多图标对比时有用
											   seriesList);

						}, 'json');
	}
	
	// 取后台数据赋值到前台页面
	function <portlet:namespace />setTextAndValue1(fdate,str1,str2){
		$
		.post(
				'<portlet:resourceURL id="getValueByNameAndId"></portlet:resourceURL>',
				{
					from : fdate,
					name : '${buildtotalconsumption.choose_name1}',
					id : '${buildtotalconsumption.choose_id1}',
					ispd : '${buildtotalconsumption.ispd1}',
					decimals : '${buildtotalconsumption.decimals1}',
					att : 'sum,change',
					type : <portlet:namespace />choose_type1
				}, function(data) {
					// 为相应的位置赋值
					var valueList = data.data;
					
					// 设置上升↑、下降↓,注意：returnUpOrDown函数写在tomcat\ROOT\html\company\scripts目录下renderToCharts.js中
					$('#<portlet:namespace />upOrDown1').text(returnUpOrDown(valueList[1]));
					
					// 设置左侧对应位置的文字描述及数据
					$('#<portlet:namespace />datavalue1').text(returnPositiveVal(valueList[0],'${buildtotalconsumption.decimals1}'));
					$('#<portlet:namespace />datavalue2').text(returnPositiveVal(valueList[1],'${buildtotalconsumption.decimals1}'));
					$('#<portlet:namespace />datavalue3').text(str1);
					$('#<portlet:namespace />datavalue4').text(str2);
				}, 'json');
	}

	// 默认显示当前时间
	<portlet:namespace />str2 = "与昨日相比";
	<portlet:namespace />choose_type1 = "day";
	
	if("${buildtotalconsumption.defaulttime1}" != "") {
		<portlet:namespace />start_date1 = "${buildtotalconsumption.defaulttime1}";
	} else if(publicTime != "") {
		<portlet:namespace />start_date1 = publicTime;
	} else {
		var nowdate = new Date();
		<portlet:namespace />start_date1 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	}
	
	<portlet:namespace />str1 = <portlet:namespace />start_date1+"日总能耗";
	// 获取页面数据的值
	<portlet:namespace />setTextAndValue1(<portlet:namespace />start_date1,<portlet:namespace />str1,<portlet:namespace />str2);
	
	<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1; // 导出excel的开始时间 
	<portlet:namespace />centerTitle1 = <portlet:namespace />start_date1; //居中标题
	// 得到报表数据
	<portlet:namespace />getChart1(<portlet:namespace />start_date1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,<portlet:namespace />legendList1,<portlet:namespace />showLegend1,'no');
	
	// 导出数据到excel
	function <portlet:namespace />outputToExcel1(){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date1;
		var sdateList = sdate.split(",");
		if(sdateList.length>1){
			isNotCompare = "yes"; // yes表示是对比图表
		}
		
		var expColumnName1 = "${buildtotalconsumption.expColumnName1}";
		// 导出excel的Url
		var expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${buildtotalconsumption.title1}"
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
				+ '${buildtotalconsumption.decimals1}'
				+ "&expColumnName="
				+ (expColumnName1==""?"${buildtotalconsumption.title1}":expColumnName1);
		var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${buildtotalconsumption.title1}" /></portlet:resourceURL>';
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${buildtotalconsumption.title1}"
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