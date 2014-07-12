<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-9-3 下午17点28分
	LastModified Date:
	Description: 共用的图表的渲染页面  
 -->

<div class="div-table">

	<div class="content450 center left20">
		<div class="analysis_2">
			<div class="single_chart build_ele_itemize">
				<div class="chart_describe"
					style="background-color:${commonchart.backgroundColor};">
					<h4 class="h4size">${commonchart.title}</h4>
					<div>${commonchart.description}</div>
				</div>

				<div class="timediv50">
					<input id="<portlet:namespace />datetime" type="hidden" />
					<div id="<portlet:namespace />day" style="color: red;"
						class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate('day')">日视图</div>
					<div id="<portlet:namespace />week" class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate('week')">周视图</div>
					<div id="<portlet:namespace />month" class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate('month')">月视图</div>
					<div id="<portlet:namespace />year" class="inlinedivstyle tdatt"
						onclick="<portlet:namespace />selectdate('year')">年视图</div>

					<div class="inlinedivstyle selectdivstyle">
						&nbsp;与&nbsp; <input name="<portlet:namespace />comparetime"
							id="<portlet:namespace />comparetime" class="inputstyle"
							onclick="<portlet:namespace />comparetime()" /> &nbsp;对比&nbsp;
					</div>

					<div id="<portlet:namespace />output"
						onclick="<portlet:namespace />outputToExcel()"
						class="tdatt output">输出</div>
				</div>

				<iframe name="<portlet:namespace />tmpFrame"
					id="<portlet:namespace />tmpFrame" width="1" height="1"
					style="visibility: hidden; position: absolute; display: none"></iframe>

				<div id="<portlet:namespace />commonchart" class="chartdivstyle"></div>

				<div class="bottom_link">
					<i><a href="${commonchart.linkUrl_1}">${commonchart.linkName_1}</a></i>
					<i><a href="${commonchart.linkUrl_2}">${commonchart.linkName_2}</a></i>
					<i><a href="${commonchart.linkUrl_3}">${commonchart.linkName_3}</a></i>
				</div>
			</div>
		</div>
	</div>

</div>


<script type="text/javascript">
var <portlet:namespace />timeArr = ["<portlet:namespace />day", "<portlet:namespace />week", "<portlet:namespace />month", "<portlet:namespace />year"];    
function <portlet:namespace />changeColor(type){
	//设置其它td标签的字体颜色
	$.each(<portlet:namespace />timeArr,function(i,obj) {
		document.getElementById(this).style.color='#666666';
	});
	
	// 设置当前点击的标签的字体颜色
	document.getElementById("<portlet:namespace />"+type+"").style.color='red';
}


//文本框选择时间对比
function <portlet:namespace />comparetime() {
	var dformt = 'yyyy-MM-dd';
	if (<portlet:namespace />choose_type == "day"){
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type == "week") {
		dformt = 'yyyy-MM-dd';
	} else if (<portlet:namespace />choose_type == "month") {
		dformt = 'MM';
	} else if (<portlet:namespace />choose_type == "year") {
		dformt = 'yyyy';
	}
	
	WdatePicker({
		el : '<portlet:namespace />datetime',
		dateFmt : dformt,
		onpicked : function(dp) {
			// 具体的对比时间，格式为（yyyy-MM-dd），此时间会传递到后台
			var paretime= dp.cal.getDateStr('yyyy-MM-dd');
			
			// 显示在页面上的时间
			var showtime= dp.cal.getDateStr(dformt);
			$('#<portlet:namespace />comparetime').val(showtime);
			
			<portlet:namespace />legendList = <portlet:namespace />start_date + "," + paretime; 
			// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
			if("${commonchart.referencevalue}" != ""){
				<portlet:namespace />legendList += ","+"${commonchart.referenceLegend}"; 
			}

			<portlet:namespace />showLegend = true;
			
			<portlet:namespace />exp_start_date = <portlet:namespace />start_date + "," + paretime; // 对应的开始时间
			<portlet:namespace />choose_name = '${commonchart.choose_name},${commonchart.choose_name}'; // 对应的name
			<portlet:namespace />choose_id = '${commonchart.choose_id},${commonchart.choose_id}'; // 对应的id
			<portlet:namespace />ispd = '${commonchart.ispd},${commonchart.ispd}'; // 对应的ispd
			
			// 渲染图表
			<portlet:namespace />getChart(<portlet:namespace />exp_start_date,<portlet:namespace />choose_name,<portlet:namespace />choose_id,<portlet:namespace />ispd,<portlet:namespace />legendList,<portlet:namespace />showLegend,"yes");
		}
	});
}

	var <portlet:namespace />start_date = ''; // 开始时间
	var <portlet:namespace />choose_type = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />xstep = "${commonchart.xStep}"; // x轴的间距
	var <portlet:namespace />legendList = "${commonchart.chartLegendList}";// 图例列表
	var <portlet:namespace />showLegend = false; // 默认不显示图例
	var <portlet:namespace />centerTitle = "${commonchart.centerTitle}"; //居中标题
	var <portlet:namespace />c_title = ''; // 存储居中标题对应的年份
	var <portlet:namespace />choose_name = '${commonchart.choose_name}'; // 对应的name
	var <portlet:namespace />choose_id = '${commonchart.choose_id}'; // 对应的id
	var <portlet:namespace />ispd = '${commonchart.ispd}'; // 对应的ispd
	var <portlet:namespace />exp_start_date = ''; // 存储导出的时间 
	
	// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
	if("${commonchart.referencevalue}" != ""){
		<portlet:namespace />showLegend = true; 
	}
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate(type) {
		// 切换点击字体效果
		<portlet:namespace />changeColor(type);
		var dformt = 'yyyy-MM-dd',titleFormat='yyyy-MM-dd';
		if (type == "day"){
			<portlet:namespace />xstep = "${commonchart.xStep}"; // x轴的间距
			dformt = 'yyyy-MM-dd';
			titleFormat='yyyy-MM-dd';
		} else if (type == "week") {
			<portlet:namespace />xstep = "1"; // x轴的间距
			dformt = 'yyyy-MM-dd';
		} else if (type == "month") {
			dformt = 'MM';
			<portlet:namespace />xstep = "${commonchart.xStep}"; // x轴的间距
			titleFormat='yyyy-MM';
		} else if (type == "year") {
			<portlet:namespace />xstep = "1"; // x轴的间距
			dformt = 'yyyy';
			titleFormat = 'yyyy';
		}

		WdatePicker({
			el : '<portlet:namespace />datetime',
			dateFmt : dformt,
			onpicked : function(dp) {
				<portlet:namespace />start_date = dp.cal.getDateStr('yyyy-MM-dd');
				<portlet:namespace />exp_start_date = <portlet:namespace />start_date;
				<portlet:namespace />choose_type = type;
				
				<portlet:namespace />centerTitle = dp.cal.getDateStr(titleFormat);
				<portlet:namespace />c_title = dp.cal.getDateStr("yyyy");

				<portlet:namespace />showLegend = false; // 默认不显示图例
				// 判断是否设置了参考值，如果设置了参考值，则显示对应的图例
				if("${commonchart.referencevalue}" != ""){
					<portlet:namespace />showLegend = true; 
				}
				
				<portlet:namespace />choose_name = '${commonchart.choose_name}';
				<portlet:namespace />choose_id = '${commonchart.choose_id}';
				<portlet:namespace />ispd = '${commonchart.ispd}';
				// 获取图表
				<portlet:namespace />getChart(<portlet:namespace />start_date,<portlet:namespace />choose_name,<portlet:namespace />choose_id,<portlet:namespace />ispd,<portlet:namespace />legendList,<portlet:namespace />showLegend,"no");
			}
		});
	}

	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getChart(tfrom,name,id,ispd,legendList,showLegend,isNotCompare) {
		$
				.post(
						'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
						{
							from : tfrom,
							name : name,
							id : id,
							ispd : ispd, 
							type : <portlet:namespace />choose_type,
							decimals : '${commonchart.decimals}' // 保留小数位数 
						}, function(data) {
							var cataList = data.cataList;
							var dataList = data.dataList;
							
							if (<portlet:namespace />choose_type == "day"){
								if(isNotCompare == "yes"){ // 如果是对比的图
									<portlet:namespace />centerTitle = "";
									<portlet:namespace />legendList = "";
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle += tfroms[i] + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList += tfroms[i] + ((tfroms.length-1) == i ? "" : ",");
									}
								}
							} else if (<portlet:namespace />choose_type == "week") {
								if(isNotCompare == "yes"){ // 如果是对比的图 

									var _legendList = data.legendList;
									<portlet:namespace />centerTitle = "";
									<portlet:namespace />legendList = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									for(var i=0;i<_legendList.length;i++){
										for(var k=0;k<_legendList[i].length;k++){
											<portlet:namespace />centerTitle += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
											<portlet:namespace />legendList += _legendList[i][k] + ((_legendList[i].length-1) == k ? "" : "~");
										}
										
										<portlet:namespace />centerTitle += ((_legendList.length-1) == i ? "" : "与");
										<portlet:namespace />legendList += ((_legendList.length-1) == i ? "" : ",");
									}

									// 个性需求：重新为图表的X轴赋值
									cataList = ["周一","周二","周三","周四","周五","周六","周日"];
								} else {
									// 居中标题的值
									<portlet:namespace />centerTitle = <portlet:namespace />c_title + "/" + data.cataList[0] + "~~" + <portlet:namespace />c_title + "/" + data.cataList[data.cataList.length-1];
									
									// 往后台返回的X轴列表中添加周一~周日
									var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
									for(var i=0;i<cataList.length;i++){
										finalCataList.push(cataList[i]+cList[i]);
									}
									
									cataList = finalCataList;
								}
							} else if (<portlet:namespace />choose_type == "month") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									<portlet:namespace />centerTitle = "";
									<portlet:namespace />legendList = "";
									// 个性需求：重新为图表的一级标题和图例赋值
									var tfroms = tfrom.split(",");
									for(var i=0;i<tfroms.length;i++){
										<portlet:namespace />centerTitle += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : "与");
										<portlet:namespace />legendList += tfroms[i].substring(0,7) + ((tfroms.length-1) == i ? "" : ",");
									}
									
									// 个性需求：重新为图表的X轴赋值
									cataList = [];
									for(var k=1;k<=data.cataList.length;k++){
										cataList.push(k); 					
									}
								}
							} else if (<portlet:namespace />choose_type == "year") {
								if(isNotCompare == "yes"){ // 如果是对比的图 
									var compareyear = tfrom.substring(11,15);
									// 个性需求：重新为图表的一级标题和图例赋值
									<portlet:namespace />centerTitle = <portlet:namespace />c_title + "与" + compareyear;
									<portlet:namespace />legendList = <portlet:namespace />c_title + "," + compareyear;
									
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
							seriesList = returnSeriesList("${commonchart.chartType_1}",
														  "${commonchart.connectLineWidth}", // 连接线线宽，为空则默认为2，为0则不显示连接线
														  "${commonchart.lineWidth}", // 线宽，此为具体曲线点的点线宽  ，为空则默认为2
														  <portlet:namespace />legendList,
														  "${commonchart.chartColorList}", // 颜色列表
														  "${commonchart.chartFillColorList}", // 填充颜色列表
														  "${commonchart.chartRadiusList}", // 曲线点半径列表,默认为4
														  "${commonchart.symbol}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
														  "${commonchart.referencevalue}", // 参考值  
														  "${commonchart.chartType_2}", // 参考值的图表类型
														  "${commonchart.referenceLegend}", // 参考值对应的图例名称
														  "${commonchart.referenceColor}", // 参考值对应的颜色
														  dataList);
							
							// 将图表渲染到对应的位置上
							renderCompareChart("<portlet:namespace />commonchart", // 对应的渲染位置
											   <portlet:namespace />centerTitle, // 居中标题
											   <portlet:namespace />xstep, // X轴间隔
											   cataList, // X轴数据列表
											   '', // 列表中的线的样式，默认为虚线
											   '${commonchart.yLeftTitle}', //  Y轴标题
											   '${commonchart.ySymbol}', // Y轴的单位
											    <portlet:namespace />showLegend == '' ? false : <portlet:namespace />showLegend, // 是否显示图例
											   "${commonchart.referenceColor}", // 参考颜色
											   seriesList);
						}, 'json');
	}

	// 默认显示当前时间,如果配置了默认时间，则显示配置的时间 
	<portlet:namespace />choose_type = "day";
	if("${commonchart.defaulttime}" != "") {
		<portlet:namespace />start_date = "${commonchart.defaulttime}";
	} else if(publicTime != "") {
		<portlet:namespace />start_date = publicTime;
	} else {
		var nowdate = new Date();
		<portlet:namespace />start_date = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
				+ nowdate.getDate();
	}
	
	<portlet:namespace />exp_start_date = <portlet:namespace />start_date;
	<portlet:namespace />centerTitle = <portlet:namespace />start_date; //居中标题
	<portlet:namespace />getChart(<portlet:namespace />start_date,<portlet:namespace />choose_name,<portlet:namespace />choose_id,<portlet:namespace />ispd,<portlet:namespace />legendList,<portlet:namespace />showLegend,"no");
	
	// 导出数据到excel
	function <portlet:namespace />outputToExcel(){
		var isNotCompare = "no"; // 默认不是对比图表
		var sdate = <portlet:namespace />exp_start_date;
		var sdateList = sdate.split(",");
		if(sdateList.length>1){
			isNotCompare = "yes"; // yes表示是对比图表
		}
		var expColumnName = "${commonchart.expColumnName}";
		// 导出excel的Url
		var expUrl = "<portlet:resourceURL id='expCommonChartDataToExcel'></portlet:resourceURL>"
				+ "&excelName="
				+ "${commonchart.title}"
				+ "&from="
				+ sdate
				+ "&name="
				+ <portlet:namespace />choose_name
				+ "&id="
				+ <portlet:namespace />choose_id
				+ "&ispd="
				+ <portlet:namespace />ispd
				+ "&type="
				+ <portlet:namespace />choose_type
				+ "&isNotCompare="
				+ isNotCompare
				+ "&decimals="
				+ '${commonchart.decimals}'
				+ "&expColumnName="
				+ (expColumnName==""?"${commonchart.title}":expColumnName);
		var removeUrl = '<portlet:resourceURL id="deleteExcelDataTempFile"><portlet:param name="fileName" value="${commonchart.title}" /></portlet:resourceURL>';
		var hSrc = "http://" + document.location.host
				+ "/energymanagesystem/uploadfiles/" + "${commonchart.title}"
				+ ".xls";
		$.ajax({
			type : "POST",
			url : expUrl,
			async : false,
			contentType : 'application/x-msdownload;charset=UTF-8',
			success : function(result) {
				$("#<portlet:namespace />tmpFrame").attr('src', hSrc);

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