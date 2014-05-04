<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 建筑用能账单-用水账单
 -->
<div class="detail report_detail" style="background-color:${tbinfo.bgColor}">
	<div>
		<h1 id="<portlet:namespace />">${tbinfo.chartTitle4}</h1>
		<p id="<portlet:namespace />description">${tbinfo.description4}</p>
	</div>
</div>
<div class="charts">
	<div class="chart">
		<div class="look_other">
			<div class="filter_widget" id="<portlet:namespace />choose_build4">
				<div class="filter_label has_border_radius_left">选择建筑</div>
				<select class="selectpicker">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>
			</div>
			<div class="filter_widget">
				<input id="<portlet:namespace />datetime4" type="hidden" />
				<div class="filter_label has_border_radius_left">选择年份</div>
				<input type="text" id="<portlet:namespace />from_date4"
					onclick="<portlet:namespace />selectdate4()" /> <input
					type="hidden" id="<portlet:namespace />to_date4" />
			</div>
			<div class="tool_groupt">
				<div class="has_border_radius_left search_btn"
					onclick="<portlet:namespace />confirm4()"></div>
				<div class="has_border_radius_right downLoad_btn"
					onclick="<portlet:namespace />expToExcel4()"></div>
			</div>
		</div>
		<div
			class="sub_content chart_content onlychart <portlet:namespace/>showContent4"
			id="<portlet:namespace />consumptionLeft4"></div>
		<div
			class="sub_content table_content <portlet:namespace/>showContent4"
			id="<portlet:namespace />form4"></div>
	</div>
</div>

<script type="text/javascript">
	var <portlet:namespace />start_date4 = ''; // 开始时间
	var <portlet:namespace />choose_type4 = 'year'; // 点击类型（日、周、月、年）
	var <portlet:namespace />step4 = "${tbinfo.xStep}"; //存储X轴的显示间隔
	var <portlet:namespace />chartLegends4 = "${tbinfo.chartLegends4}";// 图表图例列表
	var <portlet:namespace />showLegend4 = false; // 图表默认不显示图例
	var <portlet:namespace />chart_name4 = '${tbinfo.chart_name4}'; // 图表对应的name
	var <portlet:namespace />chart_id4 = '${tbinfo.chart_id4}'; // 图表对应的id
	var <portlet:namespace />chart_ispd4 = '${tbinfo.chart_ispd4}'; // 图表对应的ispd
	var <portlet:namespace />times4 =  [];//根据所选name的个数来保存相应时间
	var <portlet:namespace />series_count4 = '${tbinfo.chart_name4}';
	var <portlet:namespace />series_total4 = <portlet:namespace />series_count4.split(",");//保存每组图表的数据列
	var <portlet:namespace />legend_count4 = <portlet:namespace />chartLegends4.split(",").length;//保存图例说明已配置的个数 
	var <portlet:namespace />end_date4 = ''; //结束时间  
	var <portlet:namespace />loadChart4 = 0; //记录图表视图加载次数 
	var <portlet:namespace />loadTable4 = 0; //记录表格视图加载次数
	

	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate4(){
		var type = <portlet:namespace />choose_type4;
		var dformt = 'yyyy';
		<portlet:namespace />step4 = "1";
		WdatePicker({
			el : '<portlet:namespace />datetime4',
			dateFmt : dformt,
			onpicked : function(dp) {
				var showtime = dp.cal.getDateStr(dformt);
				var hidetime = dp.cal.getDateStr('yyyy-MM-dd');
				$('#<portlet:namespace />from_date4').val(showtime);
				$('#<portlet:namespace />to_date4').val(showtime);
				<portlet:namespace />start_date4 = hidetime; // 设置开始时间
				<portlet:namespace />end_date4 = $('#<portlet:namespace />to_date4').val(); // 设置结束时间 
				<portlet:namespace />times4.length = 0; //清空<portlet:namespace />times4
				// 根据name的个数，来为att添加对应个数的值
				for(var i=0;i<<portlet:namespace />series_total4.length;i++){
					<portlet:namespace />times4.push(<portlet:namespace />start_date4);
				}
				//获取图表name,id,ispd信息
				<portlet:namespace />chart_name4 = '${tbinfo.chart_name4}';
				<portlet:namespace />chart_id4 = '${tbinfo.chart_id4}';
				<portlet:namespace />chart_ispd4 = '${tbinfo.chart_ispd4}';	
			}
		});
	}

	
	/**
	 * 异步获取图表数据
	 */
	function <portlet:namespace />getLeftChart4(tfrom,name,id,ispd,legendList) {
		$
			.post(
					'<portlet:resourceURL id="getCommonChartData"></portlet:resourceURL>',
					{
						from : tfrom,
						name : name,
						id : id,
						ispd : ispd,
						decimals : '${tbinfo.decimals}',
						type : <portlet:namespace />choose_type4
					}, function(data) {
						var newLegendList = [];//用来存储图例说明数据
						var chartLegends = "${tbinfo.chartLegends4}";//配置项中的图例名称信息
						var chartLegendList = chartLegends.split(",");//配置项中的图例名称信息
						var cataList = data.cataList;
						var dataList = data.dataList;
						
						//为每个选定name的图表添加对应图例说明名称
						for(var i=0;i<parseInt(<portlet:namespace />series_total4.length);i++){
							//根据已配置的图例名称对被比较图进行赋值,未定义图例名称则默认给定series[n]样式名称
							if(parseInt(<portlet:namespace />legend_count4)>i){
								newLegendList.push(chartLegendList[i]);
							}else{
								newLegendList.push( "series" + (i+1));
							}
						}
						
						
						// 渲染图表			
						var chartLegendList = newLegendList//保存图例说明信息
						var chartColor_4 = "${tbinfo.chartColors4}";//颜色列表
						var chartColorList = chartColor_4.split(",");
						var chartFillColor_4 = "${tbinfo.c_fillColors}"; // 填充颜色列表
						var chartFillColorList = chartFillColor_4.split(",");
						var chartRadius_4 = "${tbinfo.radiusList}"; // 曲线点半径列表,默认为1
						var chartRadiusList = chartRadius_4.split(",");
						var chartSymbolList = "${tbinfo.ySymbol4}"; // Y轴单位
						var chartYAxisList = [${tbinfo.yAxisList}];//Y轴数据列表
						if(<portlet:namespace />series_total4.length>1){
							<portlet:namespace />showLegend4 = true;
						}
						//该方法写在\tomcat-6.0.29\webapps\ROOT\html\company\scripts目录下的autoRenderToCharts.js中，用来生成图表
						autoRenderToMoreCharts("<portlet:namespace />consumptionLeft4",// 对应的渲染位置 
								"${tbinfo.chartType1},${tbinfo.chartType2}",//图表类型
								"${tbinfo.c_bgColor}",//图表绘图区域背景颜色
								<portlet:namespace />series_total4.length,//获取选取name的个数
								<portlet:namespace />step4,//X轴间隔
								"${tbinfo.chartTitle4}",// 居中标题
								"${tbinfo.gridLineStyle}",//图表中线的样式
								"${tbinfo.symbol4}", // 曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
								"${tbinfo.lineWidth}", // 线宽，此为具体曲线点的点线宽
								"${tbinfo.connLineWidth}", // 连接线线宽，为空则默认为2，为0则不显示连接线										
								"${tbinfo.yLeftTitle4}",//Y轴左侧标题
								"${tbinfo.yRightTitle4}",//Y轴右侧标题
								<portlet:namespace />showLegend4,//是否显示图例说明
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
		function <portlet:namespace />getForm4(){
			$.post(
					'<portlet:resourceURL id="getReportDataList"></portlet:resourceURL>',
					{
						from:<portlet:namespace />start_date4, // 设置开始时间
						to:<portlet:namespace />end_date4,	// 设置结束时间
						type:<portlet:namespace />choose_type4, // 设置选择类型
						decimals:'${tbinfo.decimals}',	// 设置小数位数
						name:'${tbinfo.form_name4}', // 设置name
						id:'${tbinfo.form_id4}', // 设置id						
						ispd:'${tbinfo.form_ispd4}', // 设置ispd
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
						commonColumnList.push(${tbinfo.commonColumn4});
			
						var times = '';
						if(commonColumnList.length>=5){
							times = 5;
						}else{
							times = commonColumnList.length;
						}
						//循环添加内容数据
						for(var i = 0 ;i<showCataList[0].length;i++){
							content +="<tr><td>" + showCataList[0][i] + "</td>";
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
						html += '</table><div class="zoom_mask" onclick = "<portlet:namespace />zoomax(\'${tbinfo.form_name4}\',\'${tbinfo.form_id4}\',\'${tbinfo.form_ispd4}\',\''
							+<portlet:namespace />start_date4+'\',\''+$('#<portlet:namespace />from_date4').val()+'\',\''
							+$('#<portlet:namespace />to_date4').val()+'\',\''+<portlet:namespace />choose_type4+'\',\'${tbinfo.decimals}\',\''
							+commonColumnList+'\',\'${tbinfo.form_mul}\',this)"><div class="magnify"></div></div>';
						$('#<portlet:namespace />form4').html("");
						$('#<portlet:namespace />form4').html(html);
					},'json');
		}

		/**
		* 获取图表数据
		*/
		function <portlet:namespace />confirm4(){
			// 渲染左侧图表
			<portlet:namespace />getLeftChart4(<portlet:namespace />times4.join(),<portlet:namespace />chart_name4,
					<portlet:namespace />chart_id4,<portlet:namespace />chart_ispd4,<portlet:namespace />chartLegends4);
			// 获取网格数据
			<portlet:namespace />getForm4();
		}
		
		// 导出数据到excel
		function <portlet:namespace />expToExcel4(){
			if($("#<portlet:namespace />table_chart_switch div:eq(0)").hasClass("btn_press")){
				console.log("dddddd");
			}else{
				// 导出excel的Url
				var expUrl = "<portlet:resourceURL id='expDataToExcel'></portlet:resourceURL>"
						+ "&name="
						+ '${tbinfo.form_name4}'
						+ "&id="
						+ '${tbinfo.form_id4}'
						+ "&ispd="
						+ '${tbinfo.form_ispd4}'
						+ "&from="
						+ <portlet:namespace />start_date4
						+ "&to="
						+ <portlet:namespace />end_date4
						+ "&type="
						+ <portlet:namespace />choose_type4
						+ "&decimals="
						+ '${tbinfo.decimals}'
						+ "&multip="
						+ '${tbinfo.form_mul}'
						+ "&dayColumn="
						+ ''
						+ "&commonColumn="
						+ "${tbinfo.commonColumn4}"
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
		if(publicTime != ""){
			<portlet:namespace />start_date4 = publicTime;
		} else {
			if("${tbinfo.defaultTime}" == ""){
				var nowdate = new Date();
				<portlet:namespace />start_date4 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
						+ nowdate.getDate();
			} else {
				<portlet:namespace />start_date4 = "${tbinfo.defaultTime}";
			}
		}
		// 设置日期输入框的默认值 
		$('#<portlet:namespace />from_date4').val(<portlet:namespace />start_date4.substring(0,4));
		$('#<portlet:namespace />to_date4').val(<portlet:namespace />start_date4.substring(0,4));
		<portlet:namespace />end_date4 = <portlet:namespace />start_date4; //设置结束时间的默认值 
		// 根据name的个数，来为att添加对应个数的值
		 for(var i=0;i<<portlet:namespace />series_total4.length;i++){
			<portlet:namespace />times4.push(<portlet:namespace />start_date4);
		}
		
		//加载相应视图数据
		function <portlet:namespace />loadData4(){
			//根据所选视图类型加载相应视图内容
			if($("#<portlet:namespace />table_chart_switch div:eq(0)").hasClass("btn_press")){
				if(<portlet:namespace />loadChart4 == 0){
					// 得到报表数据
					<portlet:namespace />getLeftChart4(<portlet:namespace />times4.join(),<portlet:namespace />chart_name4,
							<portlet:namespace />chart_id4,<portlet:namespace />chart_ispd4,<portlet:namespace />chartLegends4);
					<portlet:namespace />loadChart4 = 1;
				}
			}else{
				if(<portlet:namespace />loadTable4 == 0){
					// 渲染网格视图
					<portlet:namespace />getForm4();
					<portlet:namespace />loadTable4 = 1;
				}
			}
		}
		
		$(function(){
			//调用图表加载方法，加载相应图表数据
			<portlet:namespace />loadData4();
		})
				
		//根据配置显示相应视图内容
		$(".<portlet:namespace/>showContent4:eq("+ ${tbinfo.chooseView} +")").show();
</script>
