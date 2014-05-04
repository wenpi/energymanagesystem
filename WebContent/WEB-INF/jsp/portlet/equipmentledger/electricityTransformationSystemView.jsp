<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 设备台账-变配电系统
 -->
<div class="detail report_detail" style="background-color:${tbinfo.bgColor}">
	<div >
		<h1 id="<portlet:namespace />">${tbinfo.title3}</h1>
		<p id="<portlet:namespace />description">${tbinfo.description3}</p>
	</div>
</div>
<div class="charts">
	<div class="chart">
		<div class="look_other">
			<div class="filter_widget" id="<portlet:namespace />choose_build3">
				<div class="filter_label has_border_radius_left">选择设备</div>
				<select class="selectpicker">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>
			</div>
			<div class="tool_groupt">
				<div class="has_border_radius_right downLoad_btn"
					onclick="<portlet:namespace />expToExcel3()"></div>
			</div>
		</div>
		<div class="sub_content chart_content onlychart <portlet:namespace/>showContent3" id="<portlet:namespace />consumptionLeft3"></div>
		<div class="sub_content table_content <portlet:namespace/>showContent3" id="<portlet:namespace />form3"></div>
	</div>
</div>

<script type="text/javascript">
	var <portlet:namespace />start_date3 = ''; // 开始时间
	var <portlet:namespace />choose_type3 = ''; // 点击类型（日、周、月、年）
	var <portlet:namespace />end_date3 = ''; //结束时间  
	var <portlet:namespace />loadTable3 = 0; //记录表格视图加载次数
	
		// 获取报表视图数据
		function <portlet:namespace />getForm3(){
			$.post(
					'<portlet:resourceURL id="getReportDataList"></portlet:resourceURL>',
					{
						from:<portlet:namespace />start_date3, // 设置开始时间
						to:<portlet:namespace />end_date3,	// 设置结束时间
						type:<portlet:namespace />choose_type3, // 设置选择类型
						decimals:'${tbinfo.decimals}',	// 设置小数位数
						name:'${tbinfo.form_name3}', // 设置name
						id:'${tbinfo.form_id3}', // 设置id						
						ispd:'${tbinfo.form_ispd3}', // 设置ispd
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
						commonColumnList.push(${tbinfo.commonColumn3});
			
						if(<portlet:namespace />choose_type3 == "day"){
							firstRow += '<th>${tbinfo.dayColumn}</th>';
						}
						var times = 5;
						if(commonColumnList.length>=5){
							if(<portlet:namespace />choose_type3 == "day"){
								times = 4;
							}
						}else{
							times = commonColumnList.length;
						}
						//循环添加内容数据
						for(var i = 0 ;i<showCataList[0].length;i++){
							content +="<tr>" + (<portlet:namespace />choose_type3 == "day"?("<td>" + <portlet:namespace />start_date3 + "</td>"):"") + "<td>" + showCataList[0][i] + "</td>";
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
						html += '</table><div class="zoom_mask" onclick = "<portlet:namespace />zoomax(\'${tbinfo.form_name3}\',\'${tbinfo.form_id3}\',\'${tbinfo.form_ispd3}\',\''
							+<portlet:namespace />start_date3+'\',\''+$('#<portlet:namespace />from_date3').val()+'\',\''
							+$('#<portlet:namespace />to_date3').val()+'\',\''+<portlet:namespace />choose_type3+'\',\'${tbinfo.decimals}\',\''
							+commonColumnList+'\',\'${tbinfo.dayColumn}\',\'${tbinfo.form_mul}\',this)"><div class="magnify"></div></div>';
						$('#<portlet:namespace />form3').html("");
						$('#<portlet:namespace />form3').html(html);
					},'json');
		}
		
		// 导出数据到excel
		function <portlet:namespace />expToExcel3(){
			if($("#<portlet:namespace />table_chart_switch div:eq(0)").hasClass("btn_press")){
				console.log("dddddd");
			}else{
				// 导出excel的Url
				var expUrl = "<portlet:resourceURL id='expDataToExcel'></portlet:resourceURL>"
						+ "&name="
						+ '${tbinfo.form_name3}'
						+ "&id="
						+ '${tbinfo.form_id3}'
						+ "&ispd="
						+ '${tbinfo.form_ispd3}'
						+ "&from="
						+ <portlet:namespace />start_date3
						+ "&to="
						+ <portlet:namespace />end_date3
						+ "&type="
						+ <portlet:namespace />choose_type3
						+ "&decimals="
						+ '${tbinfo.decimals}'
						+ "&multip="
						+ '${tbinfo.form_mul}'
						+ "&dayColumn="
						+ '${tbinfo.dayColumn}'
						+ "&commonColumn="
						+ "${tbinfo.commonColumn3}"
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
		<portlet:namespace />choose_type3 = "day";
		if(publicTime != ""){
			<portlet:namespace />start_date3 = publicTime;
		} else {
			if("${tbinfo.defaultTime}" == ""){
				var nowdate = new Date();
				<portlet:namespace />start_date3 = nowdate.getFullYear() + "-" + (nowdate.getMonth()+1) + "-"
						+ nowdate.getDate();
			} else {
				<portlet:namespace />start_date3 = "${tbinfo.defaultTime}";
			}
		}
		// 设置日期输入框的默认值 
		$('#<portlet:namespace />from_date3').val(<portlet:namespace />start_date3);
		$('#<portlet:namespace />to_date3').val(<portlet:namespace />start_date3);
		<portlet:namespace />end_date3 = <portlet:namespace />start_date3; //设置结束时间的默认值 
		
		//加载相应视图数据
		function <portlet:namespace />loadData3(){
			//根据所选视图类型加载相应视图内容
			if($("#<portlet:namespace />table_chart_switch div:eq(0)").hasClass("btn_press")){
				
			}else{
				if(<portlet:namespace />loadTable3 == 0){
					// 渲染网格视图
					<portlet:namespace />getForm3();
					<portlet:namespace />loadTable3 = 1;
				}
			}
		}
		
		$(function(){
			//调用图表加载方法，加载相应图表数据
			<portlet:namespace />loadData3();
		})
		
		//根据配置显示相应视图内容
		$(".<portlet:namespace/>showContent3:eq("+ ${tbinfo.chooseView} +")").show();
</script>