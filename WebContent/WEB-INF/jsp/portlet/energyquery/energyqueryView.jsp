<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-4 上午11:14:15
	LastModified Date:
	Description: 平台能耗数据查询
 -->
<table style="width: 100%;" cellspacing="0" cellpadding="6">
	<tr style="vertical-align: top;">
		<td width="20%">
			<div id="tab-container" class="easyui-tabs"
				style="width: 240px; height: 300px;">
				<div title="气候区" style="padding: 0 10px;">
					<ul class="energyquery_districtlist">
						<c:if test="${!empty bigdistrictinfos}">
							<c:forEach items="${bigdistrictinfos}" var="bigdistrictinfo"
								varStatus="status">
								<li id="${bigdistrictinfo.bigdistrictId}">
									${bigdistrictinfo.bigdistrictName}</li>
							</c:forEach>
						</c:if>
					</ul>
					<input type="hidden" id="datasourcetype" name="datasourcetype">
					<input type="hidden" id="datasourceid" name="datasourceid"
						value="" />
				</div>
				<div title="单体建筑" style="padding: 0 10px;"></div>
			</div>
		</td>
		<td width="20%" style="padding: 0 10px;">
			<fieldset class="energyquery_fieldset">
				<legend>查询条件</legend>
				<div class="energyquery_condition">
					<ul>
						<li class="datesel"><a
							href="javascript:<portlet:namespace/>prevday()" id="previous"
							title="前一天" class="datesel_iconbg">&laquo;</a> <input
							name="currentdate" type="text" value="" id="currentdate"
							size="10" /> <a href="javascript:<portlet:namespace/>nextday()"
							id="next" title="后一天" class="datesel_iconbg">&raquo;</a></li>
						<li id="<portlet:namespace/>reporttype" class="reporttype"><a href="#" class="active" title="日报" id="dayreport">日</a>
							<a href="#" title="周报" id="weekreport">周</a>
							<a href="#" title="月报" id="monthreport">月</a>
							<a href="#" title="年报" id="yearreport">年</a>
						</li>
						<li class="timerang_text">时间段选择</li>
						<li class="timerang_sel"><input type="text" size="10"
							name="startdate" id="startdate">- <input type="text"
							size="10" name="enddate" id="enddate"></li>
						<li class="separator"></li>
						</ul>
						<ul id="comparetypeUL" class="comparetypeUL">
							<li class="histday" id="histday">历史今日</li>
							<li class="lastmonth" id="lastmonth">上月今日</li>
							<li class="histweek" id="histweek">历史本周</li>
						</ul>
					<input type="hidden" id="queryType" name="queryType"
						value="dayreport" />
					<input type="hidden" id="comparisontype" name="comparisontype"
						value="" />
				</div>
			</fieldset>
		</td>
		<td width="60%">
			<div id="tab-container" class="easyui-tabs" style="width: 700px;">
				<div title="柱形图" style="padding: 5px 5px;">
					<div id="<portlet:namespace />columnchartdiv"
						style="background: #f1f1f1;"></div>
				</div>
				<div title="折线图" style="padding: 5px 5px;">
					<div id="<portlet:namespace />linechartdiv"
						style="background: #f1f1f1;"></div>
				
				</div>
			</div>
		</td>
	</tr>
	<tr style="vertical-align: top;">
		<td colspan="3">
			<table width="100%">
				<tr valign="top">
					<td width="33%"><section class="portlet"> <header
							class="portlet-topper">
						<h1 class="portlet-title">
							<span class="portlet-title-text">电单位能耗统计</span>
						</h1>
						</header>
						<div class="portlet-content">
							<div class=" portlet-content-container" style="">
								<div class="portlet-body">
							<table id="<portlet:namespace/>Electricity" class="easyui-datagrid"
							style="height: 280px;width:380px;">
							<thead>
								<tr>
									<th field="buildName" width="100">建筑名称</th>
									<th field="energyVal" width="240">单位时间能耗</th>
								</tr>
							</thead>
						</table>
								</div>
							</div>
						</div>
						</section></td>
					<td width="33%"><section class="portlet"> <header
							class="portlet-topper">
						<h1 class="portlet-title">
							<span class="portlet-title-text">水单位能耗统计</span>
						</h1>
						</header>
						<div class="portlet-content">
							<div class=" portlet-content-container" style="">
								<div class="portlet-body">
								<table id="<portlet:namespace/>Wather" class="easyui-datagrid"
							style="height: 280px;width:380px;">
							<thead>
								<tr>
									<th field="buildName" width="100">建筑名称</th>
									<th field="energyVal" width="240">单位时间能耗</th>
								</tr>
							</thead>
						</table>
								
								</div>
							</div>
						</div>
						</section></td>
					<td><section class="portlet"> <header
							class="portlet-topper">
						<h1 class="portlet-title">
							<span class="portlet-title-text">气单位能耗统计</span>
						</h1>
						</header>
						<div class="portlet-content">
							<div class=" portlet-content-container" style="">
								<div class="portlet-body">
								<table id="<portlet:namespace/>Gas" class="easyui-datagrid"
							style="height: 280px;width:380px;">
							<thead>
								<tr>
									<th field="buildName" width="100">建筑名称</th>
									<th field="energyVal" width="240">单位时间能耗</th>
								</tr>
							</thead>
						</table>
								</div>
							</div>
						</div>
						</section></td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<script type="text/javascript">
	$(function() {

		/**
		 * 设置当前日期
		 */
		<% if(!"".equals(prefs.getValue("startdate",""))){ %>
		$("#currentdate").val('<%=prefs.getValue("startdate","")%>');
	<% } else {%>
		$("#currentdate").val(Date.today().toString('yyyy-MM-dd'));
		<%}%>
		
		

		/**
		 * 起始日期
		 */
		$("#startdate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2,
			onSelect : function(selectedDate) {
				$("#enddate").datepicker("option", "minDate", selectedDate);
				$("#queryType").val("usage");
			}
		});
		/**
		 * 结束日期
		 */
		$("#enddate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2,
			onSelect : function(selectedDate) {
				$("#startdate").datepicker("option", "maxDate", selectedDate);
			}
		});

		//设置默认气候区
		//var defBigdistrictId = ($(".energyquery_districtlist li:first").attr('id'));
		var defBigdistrictId = ($(".energyquery_districtlist li:eq(2)").attr('id'));
		$(".energyquery_districtlist li:eq(2)").addClass('active');
		$("#datasourceid").val(defBigdistrictId);
		$("#datasourcetype").val("bigdistrictrelainfo");
		
		/**
		 * 设置气候区ID
		 */
		$(".energyquery_districtlist li").click(function() {
			$(this).siblings('li').removeClass('active');
			$(this).addClass('active');
			var value = $(this).attr('id');
			$("#datasourceid").val(value);
			
			<portlet:namespace />getChart();
		});
		
		/**
		 * 设置比较类型
		 */
		$(".comparetypeUL li").click(function() {
			$(this).siblings('li').removeClass('active');
			$(this).addClass('active');
			//var value = $(this).attr('id');
			$("#comparisontype").val("2");
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
		
		<portlet:namespace />getChart();
		
	});

	/**
	 * 设置前一天
	 */
	function <portlet:namespace/>prevday() {
		var currentdate = $("#currentdate").val();
		try {
			$("#currentdate").val(
					Date.parse(currentdate).add(-1).day()
							.toString('yyyy-MM-dd'));
		} catch (ex) {
			alert('日期格式错误,转换失败! ' + ex.message);
		}

	}
	/**
	 * 设置后一天
	 */
	function <portlet:namespace/>nextday() {
		var currentdate = $("#currentdate").val();
		try {
			$("#currentdate").val(Date.parse(currentdate).add(1).day().toString('yyyy-MM-dd'));
		} catch (ex) {
			alert('日期格式错误,转换失败! ' + ex.message);
		}
	}

	/**
	 * 获取图表
	 */
	function <portlet:namespace />getChart() {
		var formDate="";
		var toDate="";
		var queryType = $("#queryType").val();
		var startdate = $("#startdate").val();
		formDate = $("#currentdate").val();
		
		if(startdate!='') {
			queryType = 'usage';
			formDate =  startdate;
			toDate = $("#enddate").val();
		}
		
		
		var districtname = $(".energyquery_districtlist li.active").text();
		
		$.post('<portlet:resourceURL id="getChartData"></portlet:resourceURL>', {
			starttimeValue : formDate,
			endtimeValue : toDate,
			cfrom:'',
			queryType:queryType,
			comparisontype:'',
			datasourcetype: $("#datasourcetype").val(),
			datasourceid: $("#datasourceid").val(),
			caption:districtname+'单位面积能耗',
			subcaption:''
		}, function(data) {
			if(FusionCharts("columnchartdiv"))  
				FusionCharts("columnchartdiv").dispose();
			
			var myChart = new FusionCharts(
					"/energymanagesystem/fusioncharts/MSColumn2D.swf",
					"columnchartdiv", "680", "300", "0", "1");
			myChart.setJSONData(data);
			myChart.render("<portlet:namespace />columnchartdiv");
			
			if(FusionCharts("linechartdiv"))  
				FusionCharts("linechartdiv").dispose();
			var myChart2 = new FusionCharts(
					"/energymanagesystem/fusioncharts/MSLine.swf",
					"linechartdiv", "680", "300", "0", "1");
			myChart2.setJSONData(data);
			myChart2.render("<portlet:namespace />linechartdiv");
			
			$.post('<portlet:resourceURL id="getEnergyDetailData"></portlet:resourceURL>',
					{energyItemname:'电'},function(data){
					$("#<portlet:namespace/>Electricity").datagrid('loadData',data);
				});
			$.post('<portlet:resourceURL id="getEnergyDetailData"></portlet:resourceURL>',
					{energyItemname:'水'},function(data){
					$("#<portlet:namespace/>Wather").datagrid('loadData',data);
				});
			$.post('<portlet:resourceURL id="getEnergyDetailData"></portlet:resourceURL>',
					{energyItemname:'气'},function(data){
					$("#<portlet:namespace/>Gas").datagrid('loadData',data);
				});
			
		});
	}
</script>
