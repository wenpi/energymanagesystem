<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午7点54分
	LastModified Date:
	Description: 能效分析-单位面积空调能耗
 -->

<div class="div-table">

	<div class="timediv">
		<input id="<portlet:namespace />datetime2" type="hidden" />
		<div id="<portlet:namespace />day2" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate2('day')">日视图</div>
		<div id="<portlet:namespace />week2" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate2('week')">周视图</div>
		<div id="<portlet:namespace />month2" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate2('month')">月视图</div>
		<div id="<portlet:namespace />year2" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate2('year')">年视图</div>

		<div class="inlinedivstyle selectdivstyle">
			&nbsp;与&nbsp; <input name="<portlet:namespace />comparetime2"
				id="<portlet:namespace />comparetime2" class="inputstyle"
				onclick="<portlet:namespace />comparetime2()" /> &nbsp;对比&nbsp;
		</div>

		<div id="<portlet:namespace />output2"
			onclick="<portlet:namespace />outputToExcel2()" class="tdatt output">输出</div>

		<iframe name="<portlet:namespace />tmpFrame2"
			id="<portlet:namespace />tmpFrame2" width="1" height="1"
			style="visibility: hidden; position: absolute; display: none"></iframe>


		<div id="<portlet:namespace />unitareaairconditionconsumption"
			class="chartdiv250"></div>

		<div class="bottom_link">
			<i><a href="${importantenergytarget.linkUrl_1_2}">${importantenergytarget.linkName_1_2}</a></i>
		</div>
	</div>

	<div class="parameter per_air_energy"
		style="background-color:${importantenergytarget.backgroundColor_2};">
		<div class="page_header">
			<h1>${importantenergytarget.title2}</h1>
		</div>
		<h5>${importantenergytarget.description_2}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td><span id="<portlet:namespace />datavalue2_1">0.8</span><sup>Wh/m²·<span
						id="<portlet:namespace />font2">天</span>
				</sup></td>
			</tr>
			<tr>
				<td><span id="<portlet:namespace />datavalue2_2">今日平均单位面积空调能耗</span></td>
			</tr>
		</table>
	</div>

</div>


<script type="text/javascript">
	var <portlet:namespace />timeArr2 = ["<portlet:namespace />day2", "<portlet:namespace />week2", "<portlet:namespace />month2", "<portlet:namespace />year2"];    
	function <portlet:namespace />changeColor2(type){
		//设置其它td标签的字体颜色
		$.each(<portlet:namespace />timeArr2,function(i,obj) {
			document.getElementById(this).style.color='#666666';
		});
		
		// 设置当前点击的标签的字体颜色
		document.getElementById("<portlet:namespace />"+type+"2").style.color='red';
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
				// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
				if("${importantenergytarget.referencevalue2}" != ""){
					<portlet:namespace />legendList2 += ","+"${importantenergytarget.referenceLegend_2}"; 
				}
				
				<portlet:namespace />exp_start_date2 = <portlet:namespace />start_date2 + "," + paretime;
				<portlet:namespace />choose_name2 = '${importantenergytarget.choose_name2},${importantenergytarget.choose_name2}'; // 对应的name
				<portlet:namespace />choose_id2 = '${importantenergytarget.choose_id2},${importantenergytarget.choose_id2}'; // 对应的id
				<portlet:namespace />ispd2 = '${importantenergytarget.ispd2},${importantenergytarget.ispd2}'; // 对应的ispd
				<portlet:namespace />showLegend2 = true;
				
				// 渲染图表
				<portlet:namespace />getChart2(<portlet:namespace />exp_start_date2,<portlet:namespace />choose_name2,<portlet:namespace />choose_id2,<portlet:namespace />ispd2,<portlet:namespace />legendList2,<portlet:namespace />showLegend2,'yes');
			}
		});
	}

	var <portlet:namespace />font2 = "天";// 修改相应的文字 
	var <portlet:namespace />start_date2 = ''; // 开始时间
	var <portlet:namespace />choose_type2 = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />str2_1 = '今日平均单位面积空调能耗'; // 存储选择日历后的返回的文字描述
	var <portlet:namespace />step2 = "${importantenergytarget.xStep_2}"; //存储X轴的显示间隔
	var <portlet:namespace />legendList2 = "${importantenergytarget.chartLegendList_2}";// 图例列表
	var <portlet:namespace />centerTitle2 = ""; //居中标题
	var <portlet:namespace />c_title2 = ''; // 存储居中标题对应的年份
	var <portlet:namespace />exp_start_date2 = ''; // 存储导出的时间 
	var <portlet:namespace />choose_name2 = '${importantenergytarget.choose_name2}'; // 对应的name
	var <portlet:namespace />choose_id2 = '${importantenergytarget.choose_id2}'; // 对应的id
	var <portlet:namespace />ispd2 = '${importantenergytarget.ispd2}'; // 对应的ispd

	var <portlet:namespace />showLegend2 = false; // 默认不显示图例
	// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
	if("${importantenergytarget.referencevalue2}" != ""){
		<portlet:namespace />showLegend2 = true;
	}
	
	// 根据选择的日周月年，判断对应的参考值是多少
	var <portlet:namespace />referencevalue2List = [],<portlet:namespace />v_post=0;
	var <portlet:namespace />rvalue = '0'; // 用于存储根据选择确定的参考值
	try{
		<portlet:namespace />referencevalue2List = "${importantenergytarget.referencevalue2}".split(",");
	}catch(e){}
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate2(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor2(type);
		
		var dformt = 'yyyy-MM-dd',titleFormat='yyyy-MM-dd';
		if (type == "day") {
			dformt = 'yyyy-MM-dd';
			<portlet:namespace />font2 = "天";// 修改相应的文字 
		} else if (type == "week") {
			dformt = 'yyyy-MM-dd';
			<portlet:namespace />font2 = "周";// 修改相应的文字 
		} else if (type == "month") {
			dformt = 'MM';
			titleFormat='yyyy-MM';
			<portlet:namespace />font2 = "月";// 修改相应的文字 
		} else if (type == "year") {
			dformt = 'yyyy';
			titleFormat = 'yyyy';
			<portlet:namespace />font2 = "年";// 修改相应的文字 
		}
	
		WdatePicker({
			el : '<portlet:namespace />datetime2',
			dateFmt : dformt,
			onpicked : function(dp) {
				$('#<portlet:namespace />comparetime2').val(''); // 清空对比框的值
				var _time = dp.cal;
				<portlet:namespace />centerTitle2 = dp.cal.getDateStr(titleFormat);
				<portlet:namespace />c_title2 = dp.cal.getDateStr("yyyy");
				<portlet:namespace />start_date2 = _time.getDateStr('yyyy-MM-dd');
				<portlet:namespace />exp_start_date2 = <portlet:namespace />start_date2; // 导出excel的开始时间 
				<portlet:namespace />choose_type2 = type;
				// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
				if("${importantenergytarget.referencevalue2}" != ""){
					<portlet:namespace />showLegend2 = true;
					<portlet:namespace />legendList2 = <portlet:namespace />start_date2 + ","+"${importantenergytarget.referenceLegend_2}"; 
				}
				
				if (type == "day"){
					<portlet:namespace />str2_1 =  _time.getDateStr('MM')+"月"+ _time.getDateStr('dd') + "日平均单位面积空调能耗";
					<portlet:namespace />step2 = "${importantenergytarget.xStep_2}";
				} else if (type == "week") {	
					<portlet:namespace />str2_1 = "该周平均单位面积空调能耗";
					<portlet:namespace />step2 = "1";
				} else if (type == "month") {
					<portlet:namespace />str2_1 = _time.getDateStr('yyyy') + "年" + _time.getDateStr('MM') + "月平均单位面积空调能耗";
					<portlet:namespace />step2 = "${importantenergytarget.xStep_2}";
				} else if (type == "year"){
					<portlet:namespace />str2_1 = _time.getDateStr('yyyy') + "年平均单位面积空调能耗";
					<portlet:namespace />step2 = "1";
				}

				<portlet:namespace />choose_name2 = '${importantenergytarget.choose_name2}';
				<portlet:namespace />choose_id2 = '${importantenergytarget.choose_id2}';
				<portlet:namespace />ispd2 = '${importantenergytarget.ispd2}';
				// 获取页面数据的值
				<portlet:namespace />setTextAndValue2(<portlet:namespace />start_date2,<portlet:namespace />str2_1);
				
				// 获取图表
				<portlet:namespace />getChart2(<portlet:namespace />start_date2,<portlet:namespace />choose_name2,<portlet:namespace />choose_id2,<portlet:namespace />ispd2,<portlet:namespace />legendList2,<portlet:namespace />showLegend2,'no');
			}
		});
	}

	/**
	 * 异步获取图表数据
	 */
	 function <portlet:namespace />getChart2(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		// 修改相应的文字
		$('#<portlet:namespace />font2').text(<portlet:namespace />font2);
		$
				.post(
						'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							type : <portlet:namespace />choose_type2,
							mult : "${importantenergytarget.multiplier_2}",
							decimals : '${importantenergytarget.decimals2}' // 保留小数位数
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							if (<portlet:namespace />choose_type2 == "day"){
								<portlet:namespace />v_post = 0 ;
								if(isNotCompare == "yes"){ // 如果是对比的图
									<portlet:namespace />centerTitle2 = "";
									<portlet:namespace />legendList2 = "";
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle2 += tfroms[i] + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList2 += tfroms[i] + ((tfroms.length-1) == i ? "" : ",");
									}
								}
							} else if (<portlet:namespace />choose_type2 == "week") {
								<portlet:namespace />v_post = 1 ;
								if(isNotCompare == "yes"){ // 如果是对比的图 
									var _legendList = data.legendList;
									<portlet:namespace />centerTitle2 = "";
									<portlet:namespace />legendList2 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									for(var i=0;i<_legendList.length;i++){
										for(var k=0;k<_legendList[i].length;k++){
											<portlet:namespace />centerTitle2 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
											<portlet:namespace />legendList2 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
										}
										
										<portlet:namespace />centerTitle2 += ((_legendList.length-1) == i ? "" : "与");
										<portlet:namespace />legendList2 += ((_legendList.length-1) == i ? "" : ",");
									}

									// 个性需求：重新为图表的X轴赋值
									cataList = ["周一","周二","周三","周四","周五","周六","周日"];
								} else {
									// 居中标题的值
									<portlet:namespace />centerTitle2 = <portlet:namespace />c_title2 + "/" + data.cataList[0] + "~~" + <portlet:namespace />c_title2 + "/" + data.cataList[data.cataList.length-1];
									<portlet:namespace />legendList2 = <portlet:namespace />centerTitle2;
									
									// 往后台返回的X轴列表中添加周一~周日
									var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
									for(var i=0;i<cataList.length;i++){
										finalCataList.push(cataList[i]+cList[i]);
									}
									
									cataList = finalCataList;
								}
							} else if (<portlet:namespace />choose_type2 == "month") {
								<portlet:namespace />v_post = 2 ;
								if(isNotCompare == "yes"){ // 如果是对比的图 
									<portlet:namespace />centerTitle2 = "";
									<portlet:namespace />legendList2 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle2 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList2 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
									}
									
									// 个性需求：重新为图表的X轴赋值
									cataList = [];
									for(var k=1;k<=data.cataList.length;k++){
										cataList.push(k); 					
									}
								} else { // 单个图表显示的时候显示的图例
									<portlet:namespace />legendList2 = tfrom.substring(0,7);
								}
							} else if (<portlet:namespace />choose_type2 == "year") {
								<portlet:namespace />v_post = 3 ;
								if(isNotCompare == "yes"){ // 如果是对比的图 
									var compareyear = tfrom.substring(11,15);
									// 个性需求：重新为图表的一级标题和图例赋值
									<portlet:namespace />centerTitle2 = <portlet:namespace />c_title2 + "与" + compareyear;
									<portlet:namespace />legendList2 = <portlet:namespace />c_title2 + "," + compareyear;
									
									// 个性需求：重新为图表的X轴赋值
									var _yearList = data.yearList;
									
									if(_yearList[0].length>=_yearList[1].length){
										cataList = _yearList[0];
									} else if(_yearList[0].length<_yearList[1].length){
										cataList = _yearList[1];
									}
								} else { // 单个图表显示的时候显示的图例
									<portlet:namespace />legendList2 = tfrom.substring(0,4);
								}
							}
							
							// 根据选择的日周月年效果设置相应的值渲染到报表页面
							try{
								<portlet:namespace />rvalue = <portlet:namespace />referencevalue2List[<portlet:namespace />v_post]; // 用于存储根据选择确定的参考值
							}catch(e){}
							
							// 渲染图表
							var seriesList = [];

							// 获取对应的数据列表，对应图表中的图形条数
							seriesList = returnSeriesList("${importantenergytarget.chartType_2_1}",
														  "${importantenergytarget.connectLineWidth_2}", // 连接线线宽，为空则默认为2，为0则不显示连接线
														  "${importantenergytarget.lineWidth_2}", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
														  <portlet:namespace />legendList2,
														  "${importantenergytarget.chartColorList_2}", // 颜色列表
														  "${importantenergytarget.chartFillColorList_2}", // 填充颜色列表
														  "${importantenergytarget.chartRadiusList_2}", // 曲线点半径列表,默认为4
														  "${importantenergytarget.symbol2}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
														  <portlet:namespace />rvalue, // 参考值  
														  "${importantenergytarget.chartType_2_2}", // 参考值的图表类型
														  "${importantenergytarget.referenceLegend_2}", // 参考值对应的图例名称
														  "${importantenergytarget.referenceColor_2}", // 参考值对应的颜色
														  dataList);
							
							// 将图表渲染到对应的位置上
							renderCompareChart("<portlet:namespace />unitareaairconditionconsumption", // 渲染图表的id
									           <portlet:namespace />centerTitle2,// 居中标题
							  	       		   <portlet:namespace />step2,// X轴间隔
											   cataList, // X轴列表数据
											   '', // 图表中曲线格式(虚线、实线、细线等)
											   '${importantenergytarget.yLeftTitle_2}', // Y轴的标题
											   '${importantenergytarget.ySymbol2}', // Y轴标题的单位
											   showLegend == '' ? false : showLegend, // 是否显示图例
											   "${importantenergytarget.referenceColor_2}", // 参考颜色，在多图标对比时有用
											   seriesList);
						}, 'json');
	}
	
	// 取后台数据赋值到前台页面
	function <portlet:namespace />setTextAndValue2(fdate,str){
		$
		.post(
				'<portlet:resourceURL id="getValueByNameAndId"></portlet:resourceURL>',
				{
					from : fdate,
					to : '',
					name : '${importantenergytarget.choose_name2}',
					id : '${importantenergytarget.choose_id2}',
					ispd : '${importantenergytarget.ispd2}',
					att : 'sum',
					type : <portlet:namespace />choose_type2
				}, function(data) {
					// 为相应的位置赋值
					var valueList = data.data;
					
					var val = returnPositiveVal(parseFloat(valueList[0])*1000,'${importantenergytarget.decimals2}');
					$('#<portlet:namespace />datavalue2_1').text(val);
					$('#<portlet:namespace />datavalue2_2').text(str);
				}, 'json');
	}

	// 默认显示当前时间
	<portlet:namespace />str2 = "与昨日相比";
	<portlet:namespace />choose_type2 = "day";
	if("${importantenergytarget.defaulttime2}" != "") {
		<portlet:namespace />start_date2 = "${importantenergytarget.defaulttime2}";
	} else if(publicTime != "") {
		<portlet:namespace />start_date2 = publicTime;
	} else {
		var nowdate = new Date();
		<portlet:namespace />start_date2 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	}
	
	<portlet:namespace />str2_1 = <portlet:namespace />start_date2+"日平均单位面积空调能耗";
	<portlet:namespace />exp_start_date2 = <portlet:namespace />start_date2;
	<portlet:namespace />centerTitle2 = <portlet:namespace />start_date2; //居中标题
	// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
	if("${importantenergytarget.referencevalue2}" != ""){
		<portlet:namespace />showLegend2 = true;
		<portlet:namespace />legendList2 = <portlet:namespace />start_date2 + ","+"${importantenergytarget.referenceLegend_2}"; 
	}
	
	// 设置右侧的值
	<portlet:namespace />setTextAndValue2(<portlet:namespace />start_date2,<portlet:namespace />str2_1);
	// 得到报表数据
	<portlet:namespace />getChart2(<portlet:namespace />start_date2,<portlet:namespace />choose_name2,<portlet:namespace />choose_id2,<portlet:namespace />ispd2,<portlet:namespace />legendList2,<portlet:namespace />showLegend2,'no');
	
	// 导出数据到excel
	function <portlet:namespace />outputToExcel2(){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date2;
		var sdateList = sdate.split(",");
		if(sdateList.length>1){
			isNotCompare = "yes"; // yes表示是对比图表
		}
		
		var expColumnName2 = "${importantenergytarget.expColumnName2}";
		// 导出excel的Url
		var expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${importantenergytarget.title2}"
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
				+ "&decimals="
				+ '${importantenergytarget.decimals2}'
				+ "&mult="
				+ "${importantenergytarget.multiplier_2}"
				+ "&expColumnName="
				+ (expColumnName2==""?"${importantenergytarget.title2}":expColumnName2);
		var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${importantenergytarget.title2}" /></portlet:resourceURL>';
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${importantenergytarget.title2}"
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
</script>