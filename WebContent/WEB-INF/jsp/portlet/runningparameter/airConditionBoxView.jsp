<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 运行参数-空调箱
 -->
<div class="detail report_detail" style="background-color:${tbinfo.bgColor}">
	<div >
		<h1 id="<portlet:namespace />">${tbinfo.title6}</h1>
		<p id="<portlet:namespace />description">${tbinfo.description6}</p>
	</div>
</div>
<div class="charts">
	<div class="chart">
		<div class="look_other">
			<div class="filter_widget" id="<portlet:namespace />choose_build6">
				<div class="filter_label has_border_radius_left">选择冷机</div>
				<select class="selectpicker">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>
			</div>
			<div class="filter_widget">
				<input id="<portlet:namespace />datetime6" type="hidden" />
				<div class="filter_label has_border_radius_left">选择类型</div>
				<select class="selectpicker"
					name="<portlet:namespace />format_select6"
					id="<portlet:namespace />format_select6">
					<option selected="selected" value="day">日报</option>
					<option value="week">周报</option>
					<option value="month">月报</option>
					<option value="year">年报</option>
				</select>
			</div>
			<div class="filter_widget">
				<div class="filter_label has_border_radius_left">选择日期</div>
				<input type="text" id="<portlet:namespace />from_date6"
					onclick="<portlet:namespace />selectdate6()" /> <span class="to">至</span>
				<input type="text" id="<portlet:namespace />to_date6"
					readonly="readonly" />
			</div>
			<div class="tool_groupt">
				<div class="has_border_radius_left search_btn"
					onclick="<portlet:namespace />confirm6()"></div>
				<div class="has_border_radius_right downLoad_btn" onclick="<portlet:namespace />expToExcel6()"></div>
			</div>
		</div>
		<div class="sub_content chart_content onlychart <portlet:namespace/>showContent6" id="<portlet:namespace />consumption6"></div>
		<div class="sub_content table_content <portlet:namespace/>showContent6" id="<portlet:namespace />form6"></div>
	</div>
</div>

<script type="text/javascript">
	var <portlet:namespace />start_date6 = ''; // 开始时间
	var <portlet:namespace />choose_type6 = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />step6 = "${tbinfo.xStep}"; //存储X轴的显示间隔
/* 	var <portlet:namespace />centerTitle6 = ""; //图表居中标题
	var <portlet:namespace />c_title6 = ''; // 存储居中标题对应的年份 */
	var <portlet:namespace />chartLegends6 = "${tbinfo.chartLegends6}";// 左图图例列表
	var <portlet:namespace />showLegend6 = false; // 左图默认不显示图例
	var <portlet:namespace />chart_name6 = '${tbinfo.chart_name6}'; // 左图对应的name
	var <portlet:namespace />chart_id6 = '${tbinfo.chart_id6}'; // 左图对应的id
	var <portlet:namespace />chart_ispd6 = '${tbinfo.chart_ispd6}'; // 左图对应的ispd
	var <portlet:namespace />times6 =  [];//根据所选name的个数来保存相应时间
	var <portlet:namespace />series_count6 = '${tbinfo.chart_name6}';
	var <portlet:namespace />series_total6 = <portlet:namespace />series_count6.split(",");//保存每组图表的数据列
	var <portlet:namespace />legend_count6 = <portlet:namespace />chartLegends6.split(",").length;//保存图例说明已配置的个数 
	var <portlet:namespace />end_date6 = ''; //结束时间  
	var <portlet:namespace />loadChart6 = 0; //记录图表视图加载次数 
	var <portlet:namespace />loadTable6 = 0; //记录表格视图加载次数
	
	// 监听select标签的改变事件
	$('#<portlet:namespace />format_select6').change(function() {
		<portlet:namespace />choose_type6 = $('#<portlet:namespace />format_select6').val();
	});
	
	
	
	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate6(){
		var type = <portlet:namespace />choose_type6;
		var dformt = 'yyyy-MM-dd',titleFormt = 'yyyy-MM-dd';
		if (type == "day") {
			dformt = 'yyyy-MM-dd';
			<portlet:namespace />step6 = "${tbinfo.xStep}";
		} else if (type == "week") {
			dformt = 'yyyy-MM-dd';
			<portlet:namespace />step6 = "1";
		} else if (type == "month") {
			dformt = 'MM';
			<portlet:namespace />step6 = "${tbinfo.xStep}";
			titleFormt = 'yyyy-MM';
		} else if (type == "year") {
			dformt = 'yyyy';
			<portlet:namespace />step6 = "1";
			titleFormt = 'yyyy';//标题格式
		}

		WdatePicker({
			el : '<portlet:namespace />datetime6',
			dateFmt : dformt,
			onpicked : function(dp) {
				var showtime = dp.cal.getDateStr(dformt);
				var hidetime = dp.cal.getDateStr('yyyy-MM-dd');
				/* <portlet:namespace />c_title6 = dp.cal.getDateStr('yyyy'); //获取年份信息
				<portlet:namespace />centerTitle6 = dp.cal.getDateStr(titleFormt);//保存居中标题 */
				// 周报的开始时间和结束时间需要做特殊处理 
				if (type == "week") {
					$('#<portlet:namespace />from_date6').val(showWeekFirstDay(showtime));
					$('#<portlet:namespace />to_date6').val(showWeekLastDay(showtime));
				} else {
					$('#<portlet:namespace />from_date6').val(showtime);
					$('#<portlet:namespace />to_date6').val(showtime);
				}
				<portlet:namespace />start_date6 = hidetime; // 设置开始时间
				<portlet:namespace />end_date6 = $('#<portlet:namespace />to_date6').val(); // 设置结束时间 
				<portlet:namespace />times6.length = 0; //清空<portlet:namespace />times6
				// 根据name的个数，来为att添加对应个数的值
				for(var i=0;i<<portlet:namespace />series_total6.length;i++){
					<portlet:namespace />times6.push(<portlet:namespace />start_date6);
				}
				//获取左图name,id,ispd信息
				<portlet:namespace />chart_name6 = '${tbinfo.chart_name6}';
				<portlet:namespace />chart_id6 = '${tbinfo.chart_id6}';
				<portlet:namespace />chart_ispd6 = '${tbinfo.chart_ispd6}';	
			}
		});
	}

	// 为选择的类型赋值 
	<portlet:namespace />choose_type6 = $('#<portlet:namespace />format_select6').val();
	
	/**
	 * 异步获取左图表数据
	 */
	function <portlet:namespace />getLeftChart6(tfrom,name,id,ispd,legendList) {
		$
			.post(
					'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
					{
						from : tfrom,
						name : name,
						id : id,
						ispd : ispd,
						decimals : '${tbinfo.decimals}',
						type : <portlet:namespace />choose_type6
					}, function(data) {
						var newLegendList = [];//用来存储图例说明数据
						var chartLegends = "${tbinfo.chartLegends6}";//配置项中的图例名称信息
						var chartLegendList = chartLegends.split(",");//配置项中的图例名称信息
						var cataList = data.cataList;
						var dataList = data.dataList;
						if (<portlet:namespace />choose_type6 == "day"){
							//为每个选定name的图表添加对应图例说明名称
							for(var i=0;i<parseInt(<portlet:namespace />series_total6.length);i++){
								//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
								if(<portlet:namespace />legend_count6>i){
									newLegendList.push(chartLegendList[i]);
								}else{
									newLegendList.push("series" + (i+1));
								}
							}
						} else if (<portlet:namespace />choose_type6 == "week") {
							var _legendList = data.legendList;
							var cataList = data.cataList;//获取x轴显示内容
							/* // 保存图表标题
							<portlet:namespace />centerTitle6 = <portlet:namespace />c_title6 + "/" + cataList[0] + "~~" + <portlet:namespace />c_title6 + "/" + cataList[cataList.length-1]//保存居中标题 */
							// 往后台返回的X轴列表中添加周一~周日
							var cList = ["<br/>周一","<br/>周二","<br/>周三","<br/>周四","<br/>周五","<br/>周六","<br/>周日"],finalCataList = [];
							for(var i=0;i<parseInt(<portlet:namespace />series_total6.length);i++){
								//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
								if(parseInt(<portlet:namespace />legend_count6)>i){
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
						} else if (<portlet:namespace />choose_type6 == "month") {
								//为每个选定name的图表添加对应图例说明名称
								for(var i=0;i<parseInt(<portlet:namespace />series_total6.length);i++){
									//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
									if(parseInt(<portlet:namespace />legend_count6)>i){
										newLegendList.push(chartLegendList[i]);
									}else{
										newLegendList.push("series" + (i+1));
									}	
								}
						} else if (<portlet:namespace />choose_type6 == "year") {
								//为每个选定name的图表添加对应图例说明名称
								for(var i=0;i<parseInt(<portlet:namespace />series_total6.length);i++){
								//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
								if(parseInt(<portlet:namespace />legend_count6)>i){
									newLegendList.push(chartLegendList[i]);
								}else{
									newLegendList.push( "series" + (i+1));
								}
							}
						}
						
						// 渲染图表			
						var chartLegendList = newLegendList//保存图例说明信息
						var chartColor_6 = "${tbinfo.chartColors6}";//颜色列表
						var chartColorList = chartColor_6.split(",");
						var chartFillColor_6 = "${tbinfo.c_fillColors}"; // 填充颜色列表
						var chartFillColorList = chartFillColor_6.split(",");
						var chartRadius_6 = "${tbinfo.radiusList}"; // 曲线点半径列表,默认为1
						var chartRadiusList = chartRadius_6.split(",");
						var chartSymbolList = "${tbinfo.ySymbol6}"; // Y轴单位
						var chartYAxisList = [${tbinfo.yAxisList}];//Y轴数据列表
						if(<portlet:namespace />series_total6.length>1){
							<portlet:namespace />showLegend6 = true;
						}
						//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToCharts.js中，用来生成图表
						autoRenderToMoreCharts("<portlet:namespace />consumption6",// 对应的渲染位置 
								"${tbinfo.chartType1},${tbinfo.chartType2}",//图表类型
								"${tbinfo.c_bgColor}",//图表绘图区域背景颜色
								<portlet:namespace />series_total6.length,//获取选取name的个数
								<portlet:namespace />step6,//X轴间隔
								"${tbinfo.chartTitle6}",// 居中标题
								"${tbinfo.gridLineStyle}",//图表中线的样式
								"${tbinfo.symbol6}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
								"${tbinfo.lineWidth}", // 线宽，此为具体曲线点的点线宽
								"${tbinfo.connLineWidth}", // 连接线线宽，为空则默认为2，为0则不显示连接线										
								"${tbinfo.yLeftTitle6}",//Y轴左侧标题
								"${tbinfo.yRightTitle6}",//Y轴右侧标题
								<portlet:namespace />showLegend6,//是否显示图例说明
								"${tbinfo.showXGridLine}",//是否显示X轴网格线
								"${tbinfo.showYGridLine}",//是否显示Y轴网格线
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
		
		// 获取报表视图数据
		function <portlet:namespace />getForm6(){
			$.post(
					'<portlet:resourceURL id="getReportDataList"></portlet:resourceURL>',
					{
						from:<portlet:namespace />start_date6, // 设置开始时间
						to:<portlet:namespace />end_date6,	// 设置结束时间
						type:<portlet:namespace />choose_type6, // 设置选择类型
						decimals:'${tbinfo.decimals}',	// 设置小数位数
						name:'${tbinfo.form_name6}',// 设置name
						id:'${tbinfo.form_id6}', // 设置id						
						ispd:'${tbinfo.form_ispd6}', // 设置ispd
						curPage:1,	// 当前页数
						size:7	// 每页显示条数
					},function(data){
						var showCataList = data.showCataList; // 保存表头信息
						var showDataList = data.showDataList; // 保存内容数据
						// 生成表格
						var html = "<table><thead>"; 
						var firstRow = "<tr><th>日期</th>"; // 表头信息部分
						var content = ""; // 表格内容部分
						
						var commonColumnList = [] ; // 公共列信息
						commonColumnList.push(${tbinfo.commonColumn6});
			
						if(<portlet:namespace />choose_type6 == "day"){
							firstRow += '<th>${tbinfo.dayColumn}</th>';
						}
						var times = 5;
						if(commonColumnList.length>=5){
							if(<portlet:namespace />choose_type6 == "day"){
								times = 4;
							}
						}else{
							times = commonColumnList.length;
						}
						//循环添加内容数据
						for(var i = 0 ;i<showCataList[0].length;i++){
							content +="<tr>" + (<portlet:namespace />choose_type6 == "day"?("<td>" + <portlet:namespace />start_date1 + "</td>"):"") + "<td>" + showCataList[0][i] + "</td>";
							for(var j = 0;j<times;j++){
								content += '<td>'+ (showDataList[j][i] != undefined ? showDataList[j][i] : '') 
									+'</td>';
							}
							content +="</tr>";
						}
						//添加表头信息
						for(var i = 0;i<times;i++){
							firstRow += '<th>'+(commonColumnList[i] != undefined ? commonColumnList[i] : '')+'</th>';					
						}
						firstRow += '</tr>';
						html = html + firstRow + "</thead>"+ content;
						html += '</table><div class="zoom_mask" onclick = "<portlet:namespace />zoomax(\'${tbinfo.form_name6}\',\'${tbinfo.form_id6}\',\'${tbinfo.form_ispd6}\',\''
							+<portlet:namespace />start_date6+'\',\''+$('#<portlet:namespace />from_date6').val()+'\',\''
							+$('#<portlet:namespace />to_date6').val()+'\',\''+<portlet:namespace />choose_type6+'\',\'${tbinfo.decimals}\',\''
							+commonColumnList+'\',\'${tbinfo.dayColumn}\',\'${tbinfo.form_mul}\',this)"><div class="magnify"></div></div>';
						$('#<portlet:namespace />form6').html("");
						$('#<portlet:namespace />form6').html(html);
					},'json');
		}
		
		$(function() {
			// 判断是否显示冷机下拉列表
			var showBuild = "${tbinfo.showLegendForm}";
			if(showBuild == "show"){
				$("#<portlet:namespace />choose_build6").show(); // 显示选择冷机项
			}else{ 
				$("#<portlet:namespace />choose_build6").hide(); // 隐藏选择冷机项
			}
			//调用图表加载方法，加载相应图表数据
			<portlet:namespace />loadData6();
		})
		
		//加载相应视图数据
		function <portlet:namespace />loadData6(){
			//根据所选视图类型加载相应视图内容
			if($("#<portlet:namespace />table_chart_switch div:eq(0)").hasClass("btn_press")){
				if(<portlet:namespace />loadChart6 == 0){
					// 得到报表数据
					<portlet:namespace />getLeftChart6(<portlet:namespace />times6.join(),<portlet:namespace />chart_name6,
							<portlet:namespace />chart_id6,<portlet:namespace />chart_ispd6,<portlet:namespace />chartLegends6);
 					<portlet:namespace />loadChart6 = 1;
				}
			}else{
				if(<portlet:namespace />loadTable6 == 0){
					// 渲染网格视图
					<portlet:namespace />getForm6();
					<portlet:namespace />loadTable6 = 1;
				}
			}
		}
		
		/**
		* 加入对比后，获取图表数据
		*/
		function <portlet:namespace />confirm6(){
			// 渲染左侧图表
			<portlet:namespace />getLeftChart6(<portlet:namespace />times6.join(),<portlet:namespace />chart_name6,<portlet:namespace />chart_id6,<portlet:namespace />chart_ispd6,<portlet:namespace />chartLegends6);
			// 获取网格数据
			<portlet:namespace />getForm6();
		}
		
		// 导出数据到excel
		function <portlet:namespace />expToExcel6(){
			if($("#<portlet:namespace />table_chart_switch div:eq(0)").hasClass("btn_press")){
				console.log("dddddd");
			}else{
				// 导出excel的Url
				var expUrl = "<portlet:resourceURL id='expDataToExcel'></portlet:resourceURL>"
						+ "&name="
						+ '${tbinfo.form_name6}'
						+ "&id="
						+ '${tbinfo.form_id6}'
						+ "&ispd="
						+ '${tbinfo.form_ispd6}'
						+ "&from="
						+ <portlet:namespace />start_date6
						+ "&to="
						+ <portlet:namespace />end_date6
						+ "&type="
						+ <portlet:namespace />choose_type6
						+ "&decimals="
						+ '${tbinfo.decimals}'
						+ "&multip="
						+ '${tbinfo.form_mul}'
						+ "&dayColumn="
						+ '${tbinfo.dayColumn}'
						+ "&commonColumn="
						+ "${tbinfo.commonColumn6}"
						;
				var hSrc = "http://" + document.location.host
						+ "/energymanagesystem/uploadfiles/" + "${tbinfo.formTitle}"
						+ ".xls";
				$.ajax({
					type : "POST",
					url : expUrl,
					async : false,
					contentType : 'application/x-msdownload;charset=UTF-8',
					success : function(result) {
						$("#<portlet:namespace />tmpFrame").attr('src', hSrc);
					},
					error : function(result) {
						alert('error');
					}
				});
			}
		}
		
		// 默认显示当前时间
		<portlet:namespace />choose_type6 = "day";
		if(publicTime != ""){
			<portlet:namespace />start_date6 = publicTime;
		} else {
			if("${tbinfo.defaultTime}" == ""){
				var nowdate = new Date();
				<portlet:namespace />start_date6 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
						+ nowdate.getDate();
			} else {
				<portlet:namespace />start_date6 = "${tbinfo.defaultTime}";
			}
		}
		// 设置日期输入框的默认值 
		$('#<portlet:namespace />from_date6').val(<portlet:namespace />start_date6);
		$('#<portlet:namespace />to_date6').val(<portlet:namespace />start_date6);
		<portlet:namespace />end_date6 = <portlet:namespace />start_date6; //设置结束时间的默认值 
		/* <portlet:namespace />centerTitle6 = <portlet:namespace />start_date6; // 初始化图表标题 */
		// 根据name的个数，来为att添加对应个数的值
		 for(var i=0;i<<portlet:namespace />series_total6.length;i++){
			<portlet:namespace />times6.push(<portlet:namespace />start_date6);
		} 
		
		//根据配置显示相应视图内容
		$(".<portlet:namespace/>showContent6:eq("+ ${tbinfo.chooseView} +")").show();
</script>