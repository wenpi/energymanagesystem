<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午7点57分
	LastModified Date:
	Description: 能效分析-单位面积照明能耗
 -->

<div class="div-table">

	<div class="timediv">
		<input id="<portlet:namespace />datetime3" type="hidden" />
		<div id="<portlet:namespace />day3" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate3('day')">日视图</div>
		<div id="<portlet:namespace />week3" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate3('week')">周视图</div>
		<div id="<portlet:namespace />month3" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate3('month')">月视图</div>
		<div id="<portlet:namespace />year3" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate3('year')">年视图</div>

		<div class="inlinedivstyle selectdivstyle">
			&nbsp;与&nbsp; <input name="<portlet:namespace />comparetime3"
				id="<portlet:namespace />comparetime3" class="inputstyle"
				onclick="<portlet:namespace />comparetime3()" /> &nbsp;对比&nbsp;
		</div>

		<div id="<portlet:namespace />output3"
			onclick="<portlet:namespace />outputToExcel3()" class="tdatt output">输出</div>

		<iframe name="<portlet:namespace />tmpFrame3"
			id="<portlet:namespace />tmpFrame3" width="1" height="1"
			style="visibility: hidden; position: absolute; display: none"></iframe>


		<div id="<portlet:namespace />unitarealightconsumptionview"
			class="chartdiv250"></div>

		<div class="bottom_link">
			<i><a href="${importantenergytarget.linkUrl_1_3}">${importantenergytarget.linkName_1_3}</a></i>
		</div>
	</div>

	<div class="parameter per_light_energy"
		style="background-color:${importantenergytarget.backgroundColor_3};">
		<div class="page_header">
			<h1>${importantenergytarget.title3}</h1>
		</div>
		<h5>${importantenergytarget.description_3}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td><span id="<portlet:namespace />datavalue3_1">0.8</span><sup>Wh/m²·<span
						id="<portlet:namespace />font3">天</span>
				</sup></td>
			</tr>
			<tr>
				<td><span id="<portlet:namespace />datavalue3_2">今日平均单位面积照明能耗</span></td>
			</tr>
		</table>
	</div>

</div>

<script type="text/javascript">
	var <portlet:namespace />timeArr3 = ["<portlet:namespace />day3", "<portlet:namespace />week3", "<portlet:namespace />month3", "<portlet:namespace />year3"];    
	function <portlet:namespace />changeColor3(type){
		//设置其它td标签的字体颜色
		$.each(<portlet:namespace />timeArr3,function(i,obj) {
			document.getElementById(this).style.color='#666666';
		});
		
		// 设置当前点击的标签的字体颜色
		document.getElementById("<portlet:namespace />"+type+"3").style.color='red';
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
				// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
				if("${importantenergytarget.referencevalue3}" != ""){
					<portlet:namespace />legendList3 += ","+"${importantenergytarget.referenceLegend_3}"; 
				}
				
				<portlet:namespace />exp_start_date3 = <portlet:namespace />start_date3 + "," + paretime;
				<portlet:namespace />choose_name3 = '${importantenergytarget.choose_name3},${importantenergytarget.choose_name3}'; // 对应的name
				<portlet:namespace />choose_id3 = '${importantenergytarget.choose_id3},${importantenergytarget.choose_id3}'; // 对应的id
				<portlet:namespace />ispd3 = '${importantenergytarget.ispd3},${importantenergytarget.ispd3}'; // 对应的ispd
				<portlet:namespace />showLegend3 = true;
				
				// 渲染图表
				<portlet:namespace />getChart3(<portlet:namespace />exp_start_date3,<portlet:namespace />choose_name3,<portlet:namespace />choose_id3,<portlet:namespace />ispd3,<portlet:namespace />legendList3,<portlet:namespace />showLegend3,'yes');
			}
		});
	}

	var <portlet:namespace />font3 = "天";// 修改相应的文字 
	var <portlet:namespace />start_date3 = ''; // 开始时间
	var <portlet:namespace />choose_type3 = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />str3_1 = '今日平均单位面积照明能耗'; // 存储选择日历后的返回的文字描述
	var <portlet:namespace />step3 = "${importantenergytarget.xStep_3}"; //存储X轴的显示间隔
	var <portlet:namespace />legendList3 = "${importantenergytarget.chartLegendList_3}";// 图例列表
	var <portlet:namespace />centerTitle3 = ""; //居中标题
	var <portlet:namespace />c_title3 = ''; // 存储居中标题对应的年份
	var <portlet:namespace />exp_start_date3 = ''; // 存储导出的时间 
	var <portlet:namespace />choose_name3 = '${importantenergytarget.choose_name3}'; // 对应的name
	var <portlet:namespace />choose_id3 = '${importantenergytarget.choose_id3}'; // 对应的id
	var <portlet:namespace />ispd3 = '${importantenergytarget.ispd3}'; // 对应的ispd

	var <portlet:namespace />showLegend3 = false; // 默认不显示图例
	// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
	if("${importantenergytarget.referencevalue3}" != ""){
		<portlet:namespace />showLegend3 = true;
	}
	
	// 根据选择的日周月年，判断对应的参考值是多少
	var <portlet:namespace />referencevalue3List = [],<portlet:namespace />v_post=0;
	var <portlet:namespace />rvalue = '0'; // 用于存储根据选择确定的参考值
	try{
		<portlet:namespace />referencevalue3List = "${importantenergytarget.referencevalue3}".split(",");
	}catch(e){}
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate3(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor3(type);
		
		var dformt = 'yyyy-MM-dd',titleFormat='yyyy-MM-dd';
		if (type == "day") {
			dformt = 'yyyy-MM-dd';
			<portlet:namespace />font3 = "天";// 修改相应的文字 
		} else if (type == "week") {
			dformt = 'yyyy-MM-dd';
			<portlet:namespace />font3 = "周";// 修改相应的文字 
		} else if (type == "month") {
			dformt = 'MM';
			titleFormat='yyyy-MM';
			<portlet:namespace />font3 = "月";// 修改相应的文字 
		} else if (type == "year") {
			dformt = 'yyyy';
			titleFormat = 'yyyy';
			<portlet:namespace />font3 = "年";// 修改相应的文字 
		}
	
		WdatePicker({
			el : '<portlet:namespace />datetime3',
			dateFmt : dformt,
			onpicked : function(dp) {
				$('#<portlet:namespace />comparetime3').val(''); // 清空对比框的值
				var _time = dp.cal;
				<portlet:namespace />centerTitle3 = dp.cal.getDateStr(titleFormat);
				<portlet:namespace />c_title3 = dp.cal.getDateStr("yyyy");
				<portlet:namespace />start_date3 = _time.getDateStr('yyyy-MM-dd');
				<portlet:namespace />exp_start_date3 = <portlet:namespace />start_date3; // 导出excel的开始时间 
				<portlet:namespace />choose_type3 = type;
				// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
				if("${importantenergytarget.referencevalue3}" != ""){
					<portlet:namespace />showLegend3 = true;
					<portlet:namespace />legendList3 = <portlet:namespace />start_date3 + ","+"${importantenergytarget.referenceLegend_3}"; 
				}
				
				if (type == "day"){
					<portlet:namespace />str3_1 =  _time.getDateStr('MM')+"月"+ _time.getDateStr('dd') + "日平均单位面积照明能耗";
					<portlet:namespace />step3 = "${importantenergytarget.xStep_3}";
				} else if (type == "week") {	
					<portlet:namespace />str3_1 = "该周平均单位面积照明能耗";
					<portlet:namespace />step3 = "1";
				} else if (type == "month") {
					<portlet:namespace />str3_1 = _time.getDateStr('yyyy') + "年" + _time.getDateStr('MM') + "月平均单位面积照明能耗";
					<portlet:namespace />step3 = "${importantenergytarget.xStep_3}";
				} else if (type == "year"){
					<portlet:namespace />str3_1 = _time.getDateStr('yyyy') + "年平均单位面积照明能耗";
					<portlet:namespace />step3 = "1";
				}

				<portlet:namespace />choose_name3 = '${importantenergytarget.choose_name3}';
				<portlet:namespace />choose_id3 = '${importantenergytarget.choose_id3}';
				<portlet:namespace />ispd3 = '${importantenergytarget.ispd3}';
				// 获取页面数据的值
				<portlet:namespace />setTextAndValue3(<portlet:namespace />start_date3,<portlet:namespace />str3_1);
				
				// 获取图表
				<portlet:namespace />getChart3(<portlet:namespace />start_date3,<portlet:namespace />choose_name3,<portlet:namespace />choose_id3,<portlet:namespace />ispd3,<portlet:namespace />legendList3,<portlet:namespace />showLegend3,'no');
			}
		});
	}

	/**
	 * 异步获取图表数据
	 */
	 function <portlet:namespace />getChart3(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		// 修改相应的文字
		$('#<portlet:namespace />font3').text(<portlet:namespace />font3);
		$
				.post(
						'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd,
							type : <portlet:namespace />choose_type3,
							mult : "${importantenergytarget.multiplier_3}",
							decimals : '${importantenergytarget.decimals3}' // 保留小数位数
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							if (<portlet:namespace />choose_type3 == "day"){
								<portlet:namespace />v_post = 0 ;
								if(isNotCompare == "yes"){ // 如果是对比的图
									<portlet:namespace />centerTitle3 = "";
									<portlet:namespace />legendList3 = "";
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle3 += tfroms[i] + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList3 += tfroms[i] + ((tfroms.length-1) == i ? "" : ",");
									}
								}
							} else if (<portlet:namespace />choose_type3 == "week") {
								<portlet:namespace />v_post = 1 ;
								if(isNotCompare == "yes"){ // 如果是对比的图 
									var _legendList = data.legendList;
									<portlet:namespace />centerTitle3 = "";
									<portlet:namespace />legendList3 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									for(var i=0;i<_legendList.length;i++){
										for(var k=0;k<_legendList[i].length;k++){
											<portlet:namespace />centerTitle3 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
											<portlet:namespace />legendList3 += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
										}
										
										<portlet:namespace />centerTitle3 += ((_legendList.length-1) == i ? "" : "与");
										<portlet:namespace />legendList3 += ((_legendList.length-1) == i ? "" : ",");
									}

									// 个性需求：重新为图表的X轴赋值
									cataList = ["周一","周二","周三","周四","周五","周六","周日"];
								} else {
									// 居中标题的值
									<portlet:namespace />centerTitle3 = <portlet:namespace />c_title3 + "/" + data.cataList[0] + "~~" + <portlet:namespace />c_title3 + "/" + data.cataList[data.cataList.length-1];
									<portlet:namespace />legendList3 = <portlet:namespace />centerTitle3;
									
									// 往后台返回的X轴列表中添加周一~周日
									var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
									for(var i=0;i<cataList.length;i++){
										finalCataList.push(cataList[i]+cList[i]);
									}
									
									cataList = finalCataList;
								}
							} else if (<portlet:namespace />choose_type3 == "month") {
								<portlet:namespace />v_post = 2 ;
								if(isNotCompare == "yes"){ // 如果是对比的图 
									<portlet:namespace />centerTitle3 = "";
									<portlet:namespace />legendList3 = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle3 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList3 += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
									}
									
									// 个性需求：重新为图表的X轴赋值
									cataList = [];
									for(var k=1;k<=data.cataList.length;k++){
										cataList.push(k); 					
									}
								} else { // 单个图表显示的时候显示的图例
									<portlet:namespace />legendList3 = tfrom.substring(0,7);
								}
							} else if (<portlet:namespace />choose_type3 == "year") {
								<portlet:namespace />v_post = 3 ;
								if(isNotCompare == "yes"){ // 如果是对比的图 
									var compareyear = tfrom.substring(11,15);
									// 个性需求：重新为图表的一级标题和图例赋值
									<portlet:namespace />centerTitle3 = <portlet:namespace />c_title3 + "与" + compareyear;
									<portlet:namespace />legendList3 = <portlet:namespace />c_title3 + "," + compareyear;
									
									// 个性需求：重新为图表的X轴赋值
									var _yearList = data.yearList;
									
									if(_yearList[0].length>=_yearList[1].length){
										cataList = _yearList[0];
									} else if(_yearList[0].length<_yearList[1].length){
										cataList = _yearList[1];
									}
								} else { // 单个图表显示的时候显示的图例
									<portlet:namespace />legendList3 = tfrom.substring(0,4);
								}
							}
							
							// 根据选择的日周月年效果设置相应的值渲染到报表页面
							try{
								<portlet:namespace />rvalue = <portlet:namespace />referencevalue3List[<portlet:namespace />v_post]; // 用于存储根据选择确定的参考值
							}catch(e){}
							
							// 渲染图表
							var seriesList = [];

							// 获取对应的数据列表，对应图表中的图形条数
							seriesList = returnSeriesList("${importantenergytarget.chartType_3_1}",
														  "${importantenergytarget.connectLineWidth_3}", // 连接线线宽，为空则默认为3，为0则不显示连接线
														  "${importantenergytarget.lineWidth_3}", // 线宽，此为具体曲线点的点线宽  ，为空则默认为3
														  <portlet:namespace />legendList3,
														  "${importantenergytarget.chartColorList_3}", // 颜色列表
														  "${importantenergytarget.chartFillColorList_3}", // 填充颜色列表
														  "${importantenergytarget.chartRadiusList_3}", // 曲线点半径列表,默认为4
														  "${importantenergytarget.symbol3}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
														  <portlet:namespace />rvalue, // 参考值  
														  "${importantenergytarget.chartType_3_2}", // 参考值的图表类型
														  "${importantenergytarget.referenceLegend_3}", // 参考值对应的图例名称
														  "${importantenergytarget.referenceColor_3}", // 参考值对应的颜色
														  dataList);
							
							// 将图表渲染到对应的位置上
							renderCompareChart("<portlet:namespace />unitarealightconsumptionview", // 渲染图表的id
									           <portlet:namespace />centerTitle3,// 居中标题
							  	       		   <portlet:namespace />step3,// X轴间隔
											   cataList, // X轴列表数据
											   '', // 图表中曲线格式(虚线、实线、细线等)
											   '${importantenergytarget.yLeftTitle_3}', // Y轴的标题
											   '${importantenergytarget.ySymbol3}', // Y轴标题的单位
											   showLegend == '' ? false : showLegend, // 是否显示图例
											   "${importantenergytarget.referenceColor_3}", // 参考颜色，在多图标对比时有用
											   seriesList);
						}, 'json');
	}
	
	// 取后台数据赋值到前台页面
	function <portlet:namespace />setTextAndValue3(fdate,str){
		$
		.post(
				'<portlet:resourceURL id="getValueByNameAndId"></portlet:resourceURL>',
				{
					from : fdate,
					to : '',
					name : '${importantenergytarget.choose_name3}',
					id : '${importantenergytarget.choose_id3}',
					ispd : '${importantenergytarget.ispd3}',
					att : 'sum',
					type : <portlet:namespace />choose_type3
				}, function(data) {
					// 为相应的位置赋值
					var valueList = data.data;

					var val = returnPositiveVal(parseFloat(valueList[0])*1000,'${importantenergytarget.decimals3}');
					$('#<portlet:namespace />datavalue3_1').text(val);
					$('#<portlet:namespace />datavalue3_2').text(str);
				}, 'json');
	}

	// 默认显示当前时间
	<portlet:namespace />str3 = "与昨日相比";
	<portlet:namespace />choose_type3 = "day";
	if("${importantenergytarget.defaulttime3}" == ""){
		var nowdate = new Date();
		<portlet:namespace />start_date3 = nowdate.getFullYear() + "-" +(nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
		<portlet:namespace />str3_1 = (nowdate.getMonth()+1) + "月" + nowdate.getDate()+"日平均单位面积照明能耗";
	} else {
		<portlet:namespace />start_date3 = "${importantenergytarget.defaulttime3}";
		<portlet:namespace />str3_1 = <portlet:namespace />start_date3+"日平均单位面积照明能耗";
	}
	
	<portlet:namespace />exp_start_date3 = <portlet:namespace />start_date3;
	<portlet:namespace />centerTitle3 = <portlet:namespace />start_date3; //居中标题
	// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
	if("${importantenergytarget.referencevalue3}" != ""){
		<portlet:namespace />showLegend3 = true;
		<portlet:namespace />legendList3 = <portlet:namespace />start_date3 + ","+"${importantenergytarget.referenceLegend_3}"; 
	}
	
	// 设置右侧的值
	<portlet:namespace />setTextAndValue3(<portlet:namespace />start_date3,<portlet:namespace />str3_1);
	// 得到报表数据
	<portlet:namespace />getChart3(<portlet:namespace />start_date3,<portlet:namespace />choose_name3,<portlet:namespace />choose_id3,<portlet:namespace />ispd3,<portlet:namespace />legendList3,<portlet:namespace />showLegend3,'no');
	
	// 导出数据到excel
	function <portlet:namespace />outputToExcel3(){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date3;
		var sdateList = sdate.split(",");
		if(sdateList.length>1){
			isNotCompare = "yes"; // yes表示是对比图表
		}
		
		var expColumnName3 = "${importantenergytarget.expColumnName3}";
		// 导出excel的Url
		var expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${importantenergytarget.title3}"
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
				+ "&decimals="
				+ '${importantenergytarget.decimals3}'
				+ "&mult="
				+ "${importantenergytarget.multiplier_3}"
				+ "&expColumnName="
				+ (expColumnName3==""?"${importantenergytarget.title3}":expColumnName3);
		var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${importantenergytarget.title3}" /></portlet:resourceURL>';
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${importantenergytarget.title3}"
				+ ".xls";
		$.ajax({
			type : "POST",
			url : expUrl,
			async : false,
			contentType : 'application/x-msdownload;charset=UTF-8',
			success : function(result) {
				$("#<portlet:namespace />tmpFrame3").attr('src', hSrc);

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