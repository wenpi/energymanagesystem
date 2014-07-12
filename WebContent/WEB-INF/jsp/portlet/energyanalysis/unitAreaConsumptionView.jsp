<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午7点55分
	LastModified Date:
	Description: 能效分析-单位面积单位面积总能耗
 -->

<div class="div-table">

	<div class="timediv">
		<input id="<portlet:namespace />datetime1" type="hidden" />
		<div id="<portlet:namespace />day" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate1('day')">日视图</div>
		<div id="<portlet:namespace />week" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate1('week')">周视图</div>
		<div id="<portlet:namespace />month" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate1('month')">月视图</div>
		<div id="<portlet:namespace />year" class="inlinediv tdatt"
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

		<div id="<portlet:namespace />unitareaconsumption" class="chartdiv250"></div>

		<div class="bottom_link">
			<i><a href="${importantenergytarget.linkUrl_1_1}">${importantenergytarget.linkName_1_1}</a></i>
		</div>
	</div>

	<div class="parameter per_total_energy"
		style="background-color:${importantenergytarget.backgroundColor_1};">
		<div class="page_header">
			<h1>${importantenergytarget.title1}</h1>
		</div>
		<h5>${importantenergytarget.description_1}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td><span id="<portlet:namespace />datavalue1">0.8</span><sup>Wh/m²·<span
						id="<portlet:namespace />font1">天</span>
				</sup></td>
			</tr>
			<tr>
				<td><span id="<portlet:namespace />datavalue2">今日平均单位面积单位面积总能耗</span></td>
			</tr>
		</table>
	</div>

</div>

<script type="text/javascript">
	//设置顶部的皮肤背景颜色 
	try{
		$('#nav_bg_div').css("background-color", "#6699FF");
		$('.nav_gat_bar>li').css("background-color", "#4280FF");
	}catch(e){}

	var <portlet:namespace />timeArr = ["<portlet:namespace />day", "<portlet:namespace />week", "<portlet:namespace />month", "<portlet:namespace />year"];    
	function <portlet:namespace />changeColor(type){
		//设置其它td标签的字体颜色
		$.each(<portlet:namespace />timeArr,function(i,obj) {
			document.getElementById(this).style.color='#666666';
		});
		
		// 设置当前点击的标签的字体颜色
		document.getElementById("<portlet:namespace />"+type).style.color='red';
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
				// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
				if("${importantenergytarget.referencevalue1}" != ""){
					<portlet:namespace />legendList1 += ","+"${importantenergytarget.referenceLegend_1}"; 
				}
				
				<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1 + "," + paretime;
				<portlet:namespace />choose_name1 = '${importantenergytarget.choose_name1},${importantenergytarget.choose_name1}'; // 对应的name
				<portlet:namespace />choose_id1 = '${importantenergytarget.choose_id1},${importantenergytarget.choose_id1}'; // 对应的id
				<portlet:namespace />ispd1 = '${importantenergytarget.ispd1},${importantenergytarget.ispd1}'; // 对应的ispd
				<portlet:namespace />showLegend1 = true;
				
				// 渲染图表
				<portlet:namespace />getChart1(<portlet:namespace />exp_start_date1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,<portlet:namespace />legendList1,<portlet:namespace />showLegend1,'yes');
			}
		});
	}

	var <portlet:namespace />font1 = "天"; // 根据选择的类型变幻文字
	var <portlet:namespace />start_date1 = ''; // 开始时间
	var <portlet:namespace />choose_type1 = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />str1 = '今日平均单位面积单位面积总能耗'; // 存储选择日历后的返回的文字描述
	var <portlet:namespace />str2 = ''; // 存储选择日历后的对应的文字描述
	var <portlet:namespace />step1 = "${importantenergytarget.xStep_1}"; //存储X轴的显示间隔
	var <portlet:namespace />legendList1 = "${importantenergytarget.chartLegendList_1}";// 图例列表
	var <portlet:namespace />centerTitle1 = ""; //居中标题
	var <portlet:namespace />c_title1 = ''; // 存储居中标题对应的年份
	var <portlet:namespace />exp_start_date1 = ''; // 存储导出的时间 
	var <portlet:namespace />choose_name1 = '${importantenergytarget.choose_name1}'; // 对应的name
	var <portlet:namespace />choose_id1 = '${importantenergytarget.choose_id1}'; // 对应的id
	var <portlet:namespace />ispd1 = '${importantenergytarget.ispd1}'; // 对应的ispd

	var <portlet:namespace />showLegend1 = false; // 默认不显示图例
	// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
	if("${importantenergytarget.referencevalue1}" != ""){
		<portlet:namespace />showLegend1 = true;
		<portlet:namespace />legendList1 += ","+"${importantenergytarget.referenceLegend_1}"; 
	}
	// 根据选择的日周月年，判断对应的参考值是多少
	var <portlet:namespace />referencevalue1List = [],<portlet:namespace />v_post=0;
	var <portlet:namespace />rvalue = '0'; // 用于存储根据选择确定的参考值
	try{
		<portlet:namespace />referencevalue1List = "${importantenergytarget.referencevalue1}".split(",");
	}catch(e){}
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate1(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor(type);
		
		var dformt = 'yyyy-MM-dd',titleFormat='yyyy-MM-dd';
		if (type == "day") {
			dformt = 'yyyy-MM-dd';
			<portlet:namespace />font1 = "天";
		} else if (type == "week") {
			dformt = 'yyyy-MM-dd';
			<portlet:namespace />font1 = "周";
		} else if (type == "month") {
			dformt = 'MM';
			titleFormat='yyyy-MM';
			<portlet:namespace />font1 = "月";
		} else if (type == "year") {
			dformt = 'yyyy';
			titleFormat = 'yyyy';
			<portlet:namespace />font1 = "年";
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
				// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
				if("${importantenergytarget.referencevalue1}" != ""){
					<portlet:namespace />showLegend1 = true;
					<portlet:namespace />legendList1 = <portlet:namespace />start_date1 + ","+"${importantenergytarget.referenceLegend_1}"; 
				}

				if (type == "day"){
					<portlet:namespace />str1 =  _time.getDateStr('MM')+"月"+ _time.getDateStr('dd') + "日单位面积总能耗";
					<portlet:namespace />step1 = "${importantenergytarget.xStep_1}";
				} else if (type == "week") {	
					<portlet:namespace />str1 = "该周单位面积总能耗";
					<portlet:namespace />step1 = "1";
				} else if (type == "month") {
					<portlet:namespace />str1 = _time.getDateStr('yyyy') + "年" + _time.getDateStr('MM') + "月单位面积总能耗";
					<portlet:namespace />step1 = "${importantenergytarget.xStep_1}";
				} else if (type == "year"){
					<portlet:namespace />str1 = _time.getDateStr('yyyy') + "年单位面积总能耗";
					<portlet:namespace />step1 = "1";
				}

				<portlet:namespace />choose_name1 = '${importantenergytarget.choose_name1}';
				<portlet:namespace />choose_id1 = '${importantenergytarget.choose_id1}';
				<portlet:namespace />ispd1 = '${importantenergytarget.ispd1}';
				// 获取页面数据的值
				<portlet:namespace />setTextAndValue1(<portlet:namespace />start_date1,<portlet:namespace />str1);
				
				// 获取图表
				<portlet:namespace />getChart1(<portlet:namespace />start_date1,<portlet:namespace />choose_name1,<portlet:namespace />choose_id1,<portlet:namespace />ispd1,<portlet:namespace />legendList1,<portlet:namespace />showLegend1,'no');
			}
		});
	}

	/**
	 * 异步获取图表数据
	 */
	 function <portlet:namespace />getChart1(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		// 修改相应的文字
		$('#<portlet:namespace />font1').text(<portlet:namespace />font1);
		$
				.post(
						'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							type : <portlet:namespace />choose_type1,
							mult : "${importantenergytarget.multiplier_1}",
							decimals : '${importantenergytarget.decimals1}' // 保留小数位数 
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							if (<portlet:namespace />choose_type1 == "day"){
								<portlet:namespace />v_post = 0 ;
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
								<portlet:namespace />v_post = 1 ;
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
									<portlet:namespace />legendList1 = <portlet:namespace />centerTitle1;
									
									// 往后台返回的X轴列表中添加周一~周日
									var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
									for(var i=0;i<cataList.length;i++){
										finalCataList.push(cataList[i]+cList[i]);
									}
									
									cataList = finalCataList;
								}
							} else if (<portlet:namespace />choose_type1 == "month") {
								<portlet:namespace />v_post = 2 ;
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
								} else { // 单个图表显示的时候显示的图例
									<portlet:namespace />legendList1 = tfrom.substring(0,7);
								}
							} else if (<portlet:namespace />choose_type1 == "year") {
								<portlet:namespace />v_post = 3 ;
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
								} else { // 单个图表显示的时候显示的图例
									<portlet:namespace />legendList1 = tfrom.substring(0,4);
								}
							}
							
							// 根据选择的日周月年效果设置相应的值渲染到报表页面
							try{
								<portlet:namespace />rvalue = <portlet:namespace />referencevalue1List[<portlet:namespace />v_post]; // 用于存储根据选择确定的参考值
							}catch(e){}
							
							// 渲染图表
							var seriesList = [];

							// 获取对应的数据列表，对应图表中的图形条数
							seriesList = returnSeriesList("${importantenergytarget.chartType_1_1}",
														  "${importantenergytarget.connectLineWidth_1}", // 连接线线宽，为空则默认为2，为0则不显示连接线
														  "${importantenergytarget.lineWidth_1}", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
														  <portlet:namespace />legendList1,
														  "${importantenergytarget.chartColorList_1}", // 颜色列表
														  "${importantenergytarget.chartFillColorList_1}", // 填充颜色列表
														  "${importantenergytarget.chartRadiusList_1}", // 曲线点半径列表,默认为4
														  "${importantenergytarget.symbol1}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
														  <portlet:namespace />rvalue, // 参考值  
														  "${importantenergytarget.chartType_1_2}", // 参考值的图表类型
														  "${importantenergytarget.referenceLegend_1}", // 参考值对应的图例名称
														  "${importantenergytarget.referenceColor_1}", // 参考值对应的颜色
														  dataList);
							
							// 将图表渲染到对应的位置上
							renderCompareChart("<portlet:namespace />unitareaconsumption", // 渲染图表的id
									           <portlet:namespace />centerTitle1,// 居中标题
							  	       		   <portlet:namespace />step1,// X轴间隔
											   cataList, // X轴列表数据
											   '', // 图表中曲线格式(虚线、实线、细线等)
											   '${importantenergytarget.yLeftTitle_1}', // Y轴的标题
											   '${importantenergytarget.ySymbol1}', // Y轴标题的单位
											   showLegend == '' ? false : showLegend, // 是否显示图例
											   "${importantenergytarget.referenceColor_1}", // 参考颜色，在多图标对比时有用
											   seriesList);
						}, 'json');
	}
	
	// 取后台数据赋值到前台页面
	function <portlet:namespace />setTextAndValue1(fdate,str){
		$
		.post(
				'<portlet:resourceURL id="getValueByNameAndId"></portlet:resourceURL>',
				{
					from : fdate,
					to : '',
					name : '${importantenergytarget.choose_name1}',
					id : '${importantenergytarget.choose_id1}',
					ispd : '${importantenergytarget.ispd1}',
					att : 'sum',
					type : <portlet:namespace />choose_type1
				}, function(data) {
					// 为相应的位置赋值
					var valueList = data.data;
	
					var val = returnPositiveVal(parseFloat(valueList[0])*1000,'${importantenergytarget.decimals1}');
					$('#<portlet:namespace />datavalue1').text(val);
					$('#<portlet:namespace />datavalue2').text(str);
				}, 'json');
	}

	// 默认显示当前时间
	<portlet:namespace />str2 = "与昨日相比";
	<portlet:namespace />choose_type1 = "day";
	if("${importantenergytarget.defaulttime1}" != "") {
		<portlet:namespace />start_date1 = "${importantenergytarget.defaulttime1}";
	} else if(publicTime != "") {
		<portlet:namespace />start_date1 = publicTime;
	} else {
		var nowdate = new Date();
		<portlet:namespace />start_date1 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	}
	
	<portlet:namespace />str1 = <portlet:namespace />start_date1+"日单位面积总能耗";
	
	<portlet:namespace />exp_start_date1 = <portlet:namespace />start_date1;
	<portlet:namespace />centerTitle1 = <portlet:namespace />start_date1; //居中标题
	// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
	if("${importantenergytarget.referencevalue1}" != ""){
		<portlet:namespace />showLegend1 = true;
		<portlet:namespace />legendList1 = <portlet:namespace />start_date1 + ","+"${importantenergytarget.referenceLegend_1}"; 
	}
	// 设置右侧的值
	<portlet:namespace />setTextAndValue1(<portlet:namespace />start_date1,<portlet:namespace />str1);
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
		
		var expColumnName1 = "${importantenergytarget.expColumnName1}";
		// 导出excel的Url
		var expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${importantenergytarget.title1}"
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
				+ '${importantenergytarget.decimals1}'
				+ "&mult="
				+ "${importantenergytarget.multiplier_1}"
				+ "&expColumnName="
				+ (expColumnName1==""?"${importantenergytarget.title1}":expColumnName1);
		var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${importantenergytarget.title1}" /></portlet:resourceURL>';
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${importantenergytarget.title1}"
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