<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-30 下午03:27:26
	LastModified Date:
	Description:
 -->
  <div class="layout-sidebar" style="width: 15%;" >
  <div class="title">
 	<h4> 楼层平面图 </h4> 
  </div>
  <c:forEach var="buildregionParent" items="${buildregionParentList}" begin='0'
		varStatus="status">
		<ul class="buildregion-list">
			<li  class="buildregion-list1" style="margin-bottom: -35px"><a
					href="<portlet:renderURL portletMode='view'><portlet:param name='action' value='getbuildregion' /><portlet:param name='regionId' value='${buildregionParent.regionId}' /></portlet:renderURL>"><h4>${buildregionParent.regionName} </h4> </a>
				<ul class="">
					<c:forEach var="buildregionChild" items="${buildregionChildList}" begin='0'
						varStatus="status">
						<c:if test="${buildregionParent.regionId==buildregionChild._parentId}">
							<li><a
								href="<portlet:renderURL portletMode='view'><portlet:param name='action' value='getGrandsonbuildregion' /><portlet:param name='regionId' value='${buildregionChild.regionId}' /></portlet:renderURL>">${buildregionChild.regionName}</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
		    </li>
		</ul>
		
	</c:forEach>
 </div>
<c:if test="${imagefilePath != ''}">
<div class="layout-body" style="width: 80%;">	 
  <div class="title" >
		<div id="wrap"  style="position:relative;" >
		    <img  src="${imagefilePath}"  id="<portlet:namespace/>buildimg">
		</div>
		 <input type="hidden" id="tb" value="${tb}" />
  </div>
</div>
</c:if>
 <c:if test="${imageChildfilePath != ''}">
 <div class="layout-body" style="width: 50%; height: 600px">	 
  <div class="title" >
		<div id="wrap"  style="position:relative;" >
		   <div ><img src="${imageChildfilePath}" id="<portlet:namespace/>buildChildregionimg">  </div>
		   <c:if test="<%= permissionChecker.isOmniadmin() %>">
		    <a 
		     href="#" class="easyui-linkbutton" iconCls="icon-edit
				plain="true" onclick="<portlet:namespace/>edit()">配置</a>
			</c:if>
		   <input type="hidden" id="pid" value="${pid}" />
		   <input type="hidden" id="tb" value="${tb}" />
   </div>
  </div>
</div>
<div style="text-align: center; ">
			<fieldset class="energyquery_fieldset" style="height: 100px">
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
						</ul>
					<input type="hidden" id="queryType" name="queryType"
						value="dayreport" />
					<input type="hidden" id="comparisontype" name="comparisontype"
						value="" />
				</div>
			</fieldset>
			<div id="tab-container" class="easyui-tabs" style="width: 330px; height: 420px">
				<div title="柱形图" >
					<div id="<portlet:namespace />columnchartdiv"
						style="background: #f1f1f1;"></div>
				</div>
				<div title="折线图" >
					<div id="<portlet:namespace />linechartdiv"
						style="background: #f1f1f1;"></div>
				
				</div>
			</div>
   </div>
</c:if>
 <c:if test="${imageGrandsonfilePath != ''}">
 <div class="layout-body" style="width: 50%; height: 600px">
  <div class="title" >
		<div id="wrap"  style="position:relative;" >
		   <div ><img src="${imageGrandsonfilePath}"  id="<portlet:namespace/>buildGrandsonregionimg">  </div>
		    <c:if test="<%= permissionChecker.isOmniadmin() %>">
		    <a 
		     href="#" class="easyui-linkbutton" iconCls="icon-edit
				plain="true" onclick="<portlet:namespace/>editGrandson()">配置</a>
			</c:if>
		   <input type="hidden" id="pid" value="${pid}" />
		   <input type="hidden" id="tb" value="${tb}" />
   </div>
  </div>
</div> 
<div style="text-align: center;" >
			<fieldset class="energyquery_fieldset" style="height: 100px">
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
						</ul>
					<input type="hidden" id="queryType" name="queryType"
						value="dayreport" />
					<input type="hidden" id="comparisontype" name="comparisontype"
						value="" />
				</div>
			</fieldset>
			<div id="tab-container" class="easyui-tabs" style="width: 330px; height: 420px">
				<div title="柱形图" >
					<div id="<portlet:namespace />columnchartdiv"
						style="background: #f1f1f1;"></div>
				</div>
				<div title="折线图" >
					<div id="<portlet:namespace />linechartdiv"
						style="background: #f1f1f1;"></div>
				
				</div>
			</div>
   </div>
</c:if>
 <div id="change" style="clear: both"></div>
   <script type="text/javascript">
   function <portlet:namespace/>edit() {
		var regionId = $("#pid").val();
		var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editForm' /><portlet:param name='regionId' value='tempId' /></portlet:renderURL>";
		var url = editUrl.replace("tempId", regionId);
		window.location.href = url;
  }
   
   function <portlet:namespace/>editGrandson() {
		var regionId = $("#pid").val();
		var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editGrandsonForm' /><portlet:param name='regionId' value='tempId' /></portlet:renderURL>";
		var url = editUrl.replace("tempId", regionId);
		window.location.href = url;
   }
   
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
		formDate = $("#currentdate").val();
		var regionIds = $("#pid").val();
		var tbs = $("#tb").val();
		if(tbs!="0")
		$.post('<portlet:resourceURL id="getChartData"></portlet:resourceURL>', {
			regionId : regionIds,
			tb : tbs,
			starttimeValue : formDate,
			endtimeValue : toDate,
			cfrom:'',
			queryType:queryType,
			comparisontype:'',
			datasourcetype: $("#datasourcetype").val(),
			datasourceid: $("#datasourceid").val(),
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
		});
	}
	
	var width = '<%=prefs.getValue("width","") %>';
	var height = '<%=prefs.getValue("height","") %>';
	if(width!="") {
		$("#<portlet:namespace/>buildChildregionimg").attr("width",width);
	}
	if(height!="") {
		$("#<portlet:namespace/>buildChildregionimg").attr("height",height);
	}
	
	var widthcg = '<%=prefs.getValue("widthcg","") %>';
	var heightcg = '<%=prefs.getValue("heightcg","") %>';
	if(widthcg!="") {
		$("#<portlet:namespace/>buildGrandsonregionimg").attr("width",widthcg);
	}
	if(heightcg!="") {
		$("#<portlet:namespace/>buildGrandsonregionimg").attr("height",heightcg);
	}
	
	var buildWidth = '<%=prefs.getValue("buildWidth","") %>';
	var buildHeight = '<%=prefs.getValue("buildHeight","") %>';
	if(buildWidth!="") {
		$("#<portlet:namespace/>buildimg").attr("width",buildWidth);
	}
	if(buildHeight!="") {
		$("#<portlet:namespace/>buildimg").attr("height",buildHeight);
	}
   </script>
  