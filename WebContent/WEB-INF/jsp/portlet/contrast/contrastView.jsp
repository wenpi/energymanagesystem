<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-11 上午10:31:55
	LastModified Date:
	Description:
 -->
<div id="energycontrast">
	<table style="width: 100%;" cellspacing="0" cellpadding="6">
		<tr style="vertical-align: top;">
			<td width="20%"><section class="portlet"> <header
					class="portlet-topper">
				<h1 class="portlet-title">
					<span class="portlet-title-text">能耗分类分项</span>
				</h1>
				</header>
				<div class="portlet-content">
					<div class=" portlet-content-container" style="">
						<div class="portlet-body">
							<ul id="<portlet:namespace />energyitemdict" class="easyui-tree"></ul>
						</div>
					</div>
				</div>
				</section></td>
			<td width="20%" style="padding: 0 10px;"><section
					class="portlet"> <header class="portlet-topper">
				<h1 class="portlet-title">
					<span class="portlet-title-text">对比建筑</span>
				</h1>
				</header>
				<div class="portlet-content">
					<div class=" portlet-content-container" style="">
						<div class="portlet-body">
							<ul id="contrastbuildinfos"></ul>
							<div class="toolbar">
								<button onclick="<portlet:namespace/>addContrastBuild()">+ 添加比较建筑</button>
								<button onclick="<portlet:namespace/>energyContrast()"> 用能比较</button>
								<input type="hidden" name="contrastbuilds" id="contrastbuilds" />
								<input type="hidden" name="energyitemcode" id="energyitemcode" />
							</div>
						</div>
					</div>
				</div>
				</section>
				<div id="<portlet:namespace/>buildinfoDlg" class="easyui-dialog"
					title="选择比较建筑" style="width: 480px; height: 380px; padding: 10px"
					closed="true" buttons="#<portlet:namespace/>dlg-buttons">
					<table id="<portlet:namespace/>buildinfostb"
						class="easyui-datagrid" style="width: 430px; height: 280px"
						url="<portlet:resourceURL id="getBuildinfos"></portlet:resourceURL>"
						rownumbers="true" pagination="true" idField="buildId">
						<thead>
							<tr>
								<th field="buildId" width="120">建筑编号</th>
								<th field="buildName" width="120">建筑名称</th>
							</tr>
						</thead>
					</table>
				</div>
				<div id="<portlet:namespace/>dlg-buttons" align="center">
					<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
						onclick="<portlet:namespace/>setSelectBuildinfos()">保存</a> <a
						href="#" class="easyui-linkbutton" iconCls="icon-cancel"
						onclick="javascript:$('#<portlet:namespace/>buildinfoDlg').dialog('close')">取消</a>
				</div></td>
			<td width="60%">
				<fieldset>
					<legend>查询条件</legend>
					<div class="condition">
						<ul class="ulreporttype">
							<li class="datesel"><a
								href="javascript:<portlet:namespace/>prevday()" id="previous" title="前一天"
								class="datesel_iconbg">&laquo;</a> <input name="currentdate"
								type="text" value="" id="currentdate" size="10" /> <a
								href="javascript:<portlet:namespace/>nextday()" id="next" title="后一天"
								class="datesel_iconbg">&raquo;</a></li>
							<li id="<portlet:namespace/>reporttype" class="reporttype"><a href="#" class="active" title="日报" id="dayreport">日</a>
							<a href="#" title="周报" id="weekreport">周</a>
							<a href="#" title="月报" id="monthreport">月</a>
							<a href="#" title="年报" id="yearreport">年</a>
						</li>
						</ul>
						<ul class="datezone">
							<li class="timerang_text">时间段选择</li>
							<li class="timerang_sel"><input type="text" size="10"
								name="startdate" id="startdate">- <input type="text"
								size="10" name="enddate" id="enddate"></li>
						</ul>
						<ul class="contrastzone">
							<li class="histday" id="histday"><span>历史今日</span></li>
							<li class="lastmonth" id="lastmonth"><span>上月今日</span></li>
							<li class="histweek" id="histweek"><span>历史本周</span></li>
						</ul>
						<input type="hidden" id="queryType" name="queryType"
						value="dayreport" />
					</div>
				</fieldset>
				<div id="tab-container" class="easyui-tabs" style="width: 700px;">
					<div title="柱形图" style="padding: 5px 5px;">
						<div id="<portlet:namespace />columnchartdiv"
							style="background: #f1f1f1;"></div>
					</div>
					<div title="折线图" style="padding: 5px 5px;">
					<div id="<portlet:namespace />linechartdiv"
							style="background: #f1f1f1;"></div>
					</div>
					<div title="分析数据" style="padding: 5px 5px;">
						<div id="energyreportdata"></div>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>


<script type="text/javascript">	$(function() {

	$('#contrastbuildinfos').append(
		$('<li class="title">').append("<span class='text'>建筑名称</span><span>选择</span>"));
	
		$('#<portlet:namespace />energyitemdict').tree({
			url : '<portlet:resourceURL id="getEnergyitemdicts"></portlet:resourceURL>',
			method : 'get',
			onClick : function(node) {
				$(this).tree('toggle', node.target);
					$("#energyitemcode").val(node.id);
				}
		});

		/**
		 * 设置当前日期
		 */
		<% if(!"".equals(prefs.getValue("startdate",""))){ %>
		$("#currentdate").val('<%=prefs.getValue("startdate","")%>');
	<% } else {%>
		$("#currentdate").val(Date.today().toString('yyyy-MM-dd'));
		<%}%>


		//设置开始日期
		$("#startdate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2,
			onSelect : function(selectedDate) {
				$("#enddate").datepicker("option", "minDate", selectedDate);
			}
		});
		
		//设置结果日期
		$("#enddate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2,
			onSelect : function(selectedDate) {
				$("#startdate").datepicker("option", "maxDate", selectedDate);
			}
		});


		/**
		* 设置报表类型
		*/
		$("#<portlet:namespace/>reporttype a").click(function(){
			var id = $(this).attr('id');
			$(this).siblings('a').removeClass('active');
			$(this).addClass('active'); 
			var value = $(this).attr('id');
			$("#queryType").val(value);
		
			<portlet:namespace />getChart();
		});
		
		
	});

	//设置前一天日期
	function <portlet:namespace/>prevday() {
		var currentdate = $("#currentdate").val();
		try {
			$("#currentdate").val(Date.parse(currentdate).add(-1).day().toString('yyyy-MM-dd'));
		}catch(ex) {
			alert('日期格式错误,转换失败! ' + ex.message);
		}
	}
	
	//设置后一天日期
	function <portlet:namespace/>nextday() {
		var currentdate = $("#currentdate").val();
		try {
			$("#currentdate").val(Date.parse(currentdate).add(1).day().toString('yyyy-MM-dd'));
		}catch(ex) {
			alert('日期格式错误,转换失败! ' + ex.message);
		}
	}

	
	/**
	 * 获取图表
	 */
	function <portlet:namespace />getChart() {
		var fromDate="";
		var toDate="";
		var queryType = $("#queryType").val();
		var startdate = $("#startdate").val();
		fromDate = $("#currentdate").val();
		var energyitemcode = $("#energyitemcode").val();
		var datasourceid = $("#contrastbuilds").val();
		if(startdate!='') {
			queryType = 'usage';
			fromDate =  startdate;
			toDate = $("#enddate").val();
		}
		
		if(datasourceid=='') {
			alert('请选择要比较的建筑');
			return false;
		}
		if(energyitemcode=='') {
			alert('请选择能耗项目');
			return false;
		}
		
		
		//发送请求数据
		$.post('<portlet:resourceURL id="getContrastChartData"></portlet:resourceURL>', {
			starttimeValue : fromDate,
			endtimeValue : toDate,
			queryType:queryType,
			datasourcetype: '0',
			datasourceid: datasourceid,
			energyitemcode:energyitemcode,
			caption:'建筑单位面积用能比较',
			subcaption:''
		}, function(data) {
			$("#<portlet:namespace />columnchartdiv").empty();
			$("#<portlet:namespace />linechartdiv").empty();
			
			if(FusionCharts("columnchartdiv"))  
				FusionCharts("columnchartdiv").dispose();
			
			var myChart = new FusionCharts(
					"/energymanagesystem/fusioncharts/MSColumn2D.swf",
					"columnchartdiv", "680", "450", "0", "1");
			myChart.setJSONData(data);
			myChart.render("<portlet:namespace />columnchartdiv");
			
			if(FusionCharts("linechartdiv"))  
				FusionCharts("linechartdiv").dispose();
			
			var myChart2 = new FusionCharts(
					"/energymanagesystem/fusioncharts/MSLine.swf",
					"linechartdiv", "680", "450", "0", "1");
			myChart2.setJSONData(data);
			myChart2.render("<portlet:namespace />linechartdiv");

			$.post('<portlet:resourceURL id="getReportData"></portlet:resourceURL>',function(data){	
				$('#energyreportdata').empty();
				 var $table = $('<table width="100%" />');
				var $headrow = $('<tr class="head" />');
				$('<th/>').text("统计时间").appendTo($headrow);
				$table.append($headrow); 
	
				var html = "";
				var index = 0;
				$.each(data,function(key,val){
					$('<th/>').text(key).appendTo($headrow);
					$.each(val,function(time,cell){
						var	$row = "";
						if(index==0) {
							$row = $('<tr id='+ time.replace(' ','T') +' />');
							$('<td />').text(time).appendTo($row);
							$('<td />').text(cell).appendTo($row);
						} else {
							//$("#energyreportdata table tr").append("<td>"+ cell +"</td>");
						}
						$table.append($row);
					});
					index++;
				});
				$('#energyreportdata').append($table);	 
				
				index = 0;
				$.each(data,function(key,val){
					$.each(val,function(time,cell){
						if(index>0) {
							var id = time.replace(' ','T');
							
							

							//$('<td />').text(cell).appendTo("#energyreportdata tr#"+id);
						}
					});
					index++;
				});
				
				
			});
		});
	}
	

	/**
	* 选择比较建筑按钮事件
	*/
	function <portlet:namespace/>addContrastBuild() {
		$('#<portlet:namespace/>buildinfoDlg').dialog('open').dialog('setTitle','选择比较建筑');
	}
	
	/**
	* 设置选择的比较建筑
	*/
	function <portlet:namespace/>setSelectBuildinfos() {
		var rows = $('#<portlet:namespace/>buildinfostb').datagrid('getSelections');
		for(var i=0; i<rows.length; i++){
			$('#contrastbuildinfos').append(
				$('<li class="item">').append("<span class='text'>"+ rows[i].buildName +"</span><input type='checkbox' checked='checked' name='buildId' value='"+ rows[i].buildId +"' />"));
		}
		$('#<portlet:namespace/>buildinfoDlg').dialog('close');
	}
	
	/**
	* 建筑能耗比较事件
	*/
	function <portlet:namespace/>energyContrast() {
		//保存选定的建筑到一个隐藏域中
		var selected = [];
		$("#contrastbuildinfos li.item input:checked").each(function(e){
			selected.push($(this).val());
		});
		$("#contrastbuilds").val(selected.join(','));
		
		<portlet:namespace />getChart();
	}
</script>