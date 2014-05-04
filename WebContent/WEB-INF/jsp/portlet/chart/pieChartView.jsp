<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<%@ taglib uri="http://www.managementsystem.com/jsp/core" prefix="fc"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-2 下午01:47:12
	LastModified Date:
	Description:
 -->
 <div class="chartbox">
<c:if test="${empty chartsetting}">
	<div class="portlet-msg-success">请设置模块首选项</div>
</c:if>

<c:if
	test="${!empty chartsetting.showQuery and chartsetting.showQuery eq true}">	
	<form id="<portlet:namespace />chartsearch" class="chartsearch">
		<div class="time_tool">
			<div class="time_tool" id="time_tool">
				<div class="select_button">
					<a class="previous" id="<portlet:namespace />timePrevious">&nbsp;</a> 
					<a class="next" id="<portlet:namespace />timeNext">&nbsp;</a>
				</div>
				<div class="day">
					<ul id="time_tool_quick_key" class="<portlet:namespace />time_tool_quick_key">
						<li id="today"><a>今日</a></li>
						<li id="yesterday"><a>昨日</a></li>
						<li id="7days"><a>最近7日</a></li>
						<li id="ago30days"><a>最近30日</a></li>
						<li id="ago365days"><a>最近一年</a></li>
						<li>
					<input id="<portlet:namespace />from"
					name="<portlet:namespace />from" type="text" required="true"
					title="yyyy-MM-dd" placeholder="开始日期" class="datebox" />至<input
					id="<portlet:namespace />to" name="<portlet:namespace />to"
					placeholder="结束日期"  class="datebox" type="text" /><input type="hidden" id="<portlet:namespace />queryType" />
						</li>
						<li><input type="button" id="<portlet:namespace />submit" value="确定" /></li>
					</ul>
				</div>

			</div>
		</div>
	</form>
</c:if>
<div id="<portlet:namespace />chartdiv" align="center"></div>
<c:if test="${chartsetting.displayReport}">
	<div id="<portlet:namespace />report" align="center"></div>
</c:if>
</div>
<portlet:resourceURL id="getChartData" var="getChartDataURL">
</portlet:resourceURL>

<script type="text/javascript">
	var console = console || {"log":function(){}};

	var  <portlet:namespace />reportType = [
	       {code:'usage',name:"时间段数据报表"},
	       {code:'dayreport',name:"日报表"},
	       {code:'weekreport',name:"周报表"},
	       {code:'monthreport',name:"月报表"},
	       {code:'yearreport',name:"年报表"},
	       {code:'query',name:"过程数据报表"}
		];
	
	
	function  <portlet:namespace />getReportName(code) {
		var name = "";
		$.each( <portlet:namespace />reportType,function(index,obj){
			if(obj.code==code) {
				name = obj.name;
				return false;
			}
		});
		return name;
	}

	
	var $<portlet:namespace />from = $("#<portlet:namespace />from"),
		$<portlet:namespace />to = $("#<portlet:namespace />to"),
		$<portlet:namespace />count = $("#<portlet:namespace />count"),
		$<portlet:namespace />queryType = $("#<portlet:namespace />queryType");
	
	/**
	* 异步获取图表数据
	*/
	function <portlet:namespace />getChart() { 
		var toVal = "",fromVal="",countVal="",queryTypeVal = "";

		if($<portlet:namespace />from.length) {
			fromVal = $<portlet:namespace />from.val();
		}
		if($<portlet:namespace />to.length) {
			toVal = $<portlet:namespace />to.val();
		}
		if($<portlet:namespace />count.length) {
			countVal = $<portlet:namespace />count.val();
		}
		if($<portlet:namespace />queryType.length) {
			queryTypeVal = $<portlet:namespace />queryType.val();
		}
			
			console.log("GetPieChart fromVal:" + fromVal + ",toVal" + toVal + ",count:"+ countVal);

			var url = "<%=renderResponse.encodeURL(getChartDataURL)%>";
			console.log(url);
			$.post(url,{from:fromVal,to:toVal,count:countVal,queryType:queryTypeVal},
					function(data){
				$("#<portlet:namespace />chartdiv").empty();
				
				var chartId =  "<portlet:namespace />";
				if ( FusionCharts( chartId ) ) FusionCharts( chartId ).dispose();
				
				$("#<portlet:namespace />chartdiv").insertFusionCharts({
			        swfUrl: "<%=renderRequest.getContextPath() %>/fusioncharts/${chartsetting.chartType}", 
			        dataSource: data, 
			        dataFormat: "json", 
			        width: "${chartsetting.width}",
			        height: "${chartsetting.height}", 
			        <c:if test="${chartsetting.debugMode}">
			      	debugMode:1,
			        </c:if>
			        id: chartId
			       
			 	 });	 	

				if(data!=null) {
					<c:if test="${chartsetting.displayReport}">	
					$.post("<portlet:resourceURL id="getChartReport"></portlet:resourceURL>",function(result){
						var html = "";
						html += "<table width=\"850\" class=\"reporttb\" cellpadding=\"2\" cellspacing=\"2\">";   
						html += "<caption>";
						
						if(fromVal!="") {
							html += fromVal;
						} else {
							html += "<c:out value="${chartsetting.starttimeValue}" />";
						}
						if(toVal!="") {
							html += "至" + toVal;
						}
						var reportName =  <portlet:namespace />getReportName("<c:out value="${chartsetting.queryType}" />");
						//console.log(reportName);
						html += reportName;
						html += "</caption>";
						html +="<tr>";
						html +="<th width='160'>日期</th>";
						
						var cols = new Array();
						var times = new Array();
						//把结果写入数组
						var index = 0;
						$.each(result,function(i,obj) {
			
							cols[i] = new Array();
							times[i] = new Array();
							$.each(obj.data,function(j,entry) {
								cols[i][j] = entry.val;
								if(index==0) {
									times[i][j] =  entry.time;
								}
							});
							index++;
						});
						
						//设置表格标题
						$.each(result,function(i,obj) {
							html += "<th>"+ obj.label +"</th>";		
						});
						html += "</tr>";
						//设置表格行
						for(var i=0;i<times[0].length;i++) {
							html +="<tr>";
							html += "<td>"+ times[0][i] +"</td>";
							for(var j=0;j<cols.length;j++) {
								html +="<td>"+  <portlet:namespace />formatFloat(cols[j][i],2) +"</td>";
							}
							html +="</tr>";
						}
			
						html +"</table>";
						$('#<portlet:namespace />report').html("");
			            $('#<portlet:namespace />report').html(html);
			            
					},'json');
					</c:if>
				}
				
				
			},'json'); 		
	}

	
	function  <portlet:namespace />formatFloat(src, pos) {
		return Math.round(src * Math.pow(10, pos)) / Math.pow(10, pos);
	}
	
	function <portlet:namespace />formatDatetime(time) {
		var queryType = $<portlet:namespace />queryType.val();
		 if(queryType=="")
			 return time;
	     var d = new Date(time);
		 if(queryType == "dayreport") {
			 var ret = d.format('H:i');
			 var arrTime = ret.split(":");
			 if(arrTime.length>=2) {
			 	return ret+ "-"+ arrTime[0] + ":59";
			 } else {
				 return ret;
			 }
		 } else if(queryType == "weekreport" || queryType == "monthreport") {
			 return d.format('Y-m-d');
		 } else {
			 return time;
		 }
	}
	
	
	/**
	* 查询数据
	*/
	function <portlet:namespace />search() {
		<portlet:namespace />getChart();
	}
	
	/**
	* 初始加载数据
	*/
	$(function(){
		
		$<portlet:namespace />from.datepicker({
		      defaultDate: "+1w",
		      changeMonth: true,
		      numberOfMonths: 2,
		      onClose: function( selectedDate ) {
		        $<portlet:namespace />to.datepicker( "option", "minDate", selectedDate );
		      }
		    });
		 $<portlet:namespace />to.datepicker({
		      defaultDate: "+1w",
		      changeMonth: true,
		      numberOfMonths: 2,
		      onClose: function( selectedDate ) {
		        $<portlet:namespace />from.datepicker( "option", "maxDate", selectedDate );
		      }
		  });
		
		 
		 //设置默认开始时间
		 var $<portlet:namespace />defStartTime = "${chartsetting.starttimeValue}";
		 //设置默认结束时间
		 var $<portlet:namespace />defEndtime = "${chartsetting.endtimeValue}";
		 
		 //起始时间
			if("${chartsetting.defStarttime}"=="today" ) {
				$<portlet:namespace />defStartTime = Date.parse('today').toString("yyyy-MM-dd");
			}else if("${chartsetting.defStarttime}"=="yesterday" ) {
				$<portlet:namespace />defStartTime = Date.parse('yesterday').toString("yyyy-MM-dd");
			}else if("${chartsetting.defStarttime}"=="firstofweek" ) {
				$<portlet:namespace />defStartTime = Date.today().add({ days: -6 }).toString("yyyy-MM-dd");
			}else if("${chartsetting.defStarttime}"=="firstofmonth" ) {
				$<portlet:namespace />defStartTime = Date.today().moveToFirstDayOfMonth().toString("yyyy-MM-dd");
			}else if("${chartsetting.defStarttime}"=="firstofyear" ) {
				var $<portlet:namespace />x= Date.parse('today'); $<portlet:namespace />x.setMonth(0); $<portlet:namespace />x.setDate(1); 
				$<portlet:namespace />defStartTime = $<portlet:namespace />x.toString("yyyy-MM-dd");
			}else {
				//如果没有设置默认时间，设置为当前时间
				if($<portlet:namespace />defStartTime=="") {
					$<portlet:namespace />defStartTime = Date.parse('today').toString("yyyy-MM-dd");
				 }else {	 
					$<portlet:namespace />defStartTime = Date.parse($<portlet:namespace />defStartTime).toString("yyyy-MM-dd");
				 }
			}		
			$<portlet:namespace />from.datepicker("setDate",$<portlet:namespace />defStartTime);
			
			
			
			//结束时间
			if("${chartsetting.endtimeValue}"=="today" ) {
				$<portlet:namespace />defEndtime = Date.parse('today').toString("yyyy-MM-dd");
			}else if("${chartsetting.endtimeValue}"=="yesterday" ) {
				$<portlet:namespace />defEndtime = Date.parse('yesterday').toString("yyyy-MM-dd");
			}else if("${chartsetting.endtimeValue}"=="firstofweek" ) {
				$<portlet:namespace />defEndtime = Date.today().add({ days: -6 }).toString("yyyy-MM-dd");
			}else if("${chartsetting.endtimeValue}"=="firstofmonth" ) {
				$<portlet:namespace />defEndtime = Date.today().moveToFirstDayOfMonth().toString("yyyy-MM-dd");
			}else if("${chartsetting.endtimeValue}"=="firstofyear" ) {
				var $<portlet:namespace />x= Date.parse('today'); $<portlet:namespace />x.setMonth(0); $<portlet:namespace />x.setDate(1); 
				$<portlet:namespace />defEndtime = $<portlet:namespace />x.toString("yyyy-MM-dd");
			}else {
				//如果没有设置默认时间，设置为当前时间
				if($<portlet:namespace />defEndtime=="") {
					$<portlet:namespace />defEndtime = Date.parse('today').toString("yyyy-MM-dd");
				}else {	 
					$<portlet:namespace />defEndtime = Date.parse($<portlet:namespace />defEndtime).toString("yyyy-MM-dd");
				}
			}
			$<portlet:namespace />to.datepicker("setDate",$<portlet:namespace />defEndtime);
			console.log("end:"+ $<portlet:namespace />defEndtime);
		 
		 
		 
		 $(".<portlet:namespace />time_tool_quick_key li a").click(function(){
			 $(".<portlet:namespace />time_tool_quick_key li").removeClass("selected");
			 $(this).parent().addClass("selected");
			 
			 var dateTag = $(this).parent().attr("id");
			 
			 var startVal="",endVal="",curDate = $<portlet:namespace />from.val(),queryType="";
			 if(dateTag=="today") {
				 startVal = Date.parse('today');
				 endVal = startVal;
				 queryType = "dayreport";
			 } else if (dateTag=="yesterday") {
				 startVal = Date.parse('yesterday');
				 endVal = startVal;
				 queryType = "dayreport";
			 } else if (dateTag=="7days") {
				 startVal = Date.parse('today-7days');
				 endVal = Date.parse('today');
				 queryType = "weekreport";
			 }else if (dateTag=="ago30days") {
				 startVal = Date.parse('today').moveToFirstDayOfMonth();
				 endVal = Date.parse('today');
				 queryType = "monthreport";
			 } else if (dateTag=="ago365days") {
				 var x= Date.parse('today'); x.setMonth(0); x.setDate(1); 
				 startVal = x;
				 endVal = Date.parse('today');
				 queryType = "yearreport";
			 }

			 $<portlet:namespace />from.datepicker("setDate",startVal);
			 $<portlet:namespace />to.datepicker("setDate",endVal);
			 $<portlet:namespace />queryType.val(queryType);
			 
			 <portlet:namespace />getChart();
		 });
		 
		 
		 $("#<portlet:namespace />submit").click(function(){
			 <portlet:namespace />getChart();
		 });
		 
		 
		 $(".select_button a").hover(function () {
			 var id = $(this).attr("id");
			// console.log("id:"+ id);
			 if(id=="<portlet:namespace />timePrevious") {
				 $(this).addClass("previous_hover");
			 } else {
				 $(this).addClass("next_hover");
			 }
		  },
		  function () {
			  var id = $(this).attr("id");
				 if(id=="<portlet:namespace />timePrevious") {
					 $(this).removeClass("previous_hover");
				 } else {
					 $(this).removeClass("next_hover");
			  }
		  });
		 
		 
		 //设置上一时间段
		 $("#<portlet:namespace />timePrevious").click(function(){
			 var fromVal = $<portlet:namespace />from.val();
			 var toVal = $<portlet:namespace />to.val();
			 
			// console.log("queryType:"+ $<portlet:namespace />queryType.val());
			 
			 if($<portlet:namespace />queryType.val()=="dayreport") {
				 fromVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addDays(-1));
				 toVal = fromVal; 
			 } else if ($<portlet:namespace />queryType.val()=="weekreport") {
				 fromVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addWeeks(-1));
				 toVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addWeeks(1).addDays(-1));
			 }  else if ($<portlet:namespace />queryType.val()=="monthreport") {
				 fromVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addMonths(-1));
				 toVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addMonths(1).addDays(-1));
				
			 } else if ($<portlet:namespace />queryType.val()=="yearreport") {
				 fromVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addYears(-1));
				 toVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addYears(1).addDays(-1));
			 }
			 
			 $<portlet:namespace />from.val(fromVal);
			 $<portlet:namespace />to.val(toVal);
			 
		 });
		 //设置下一时间段
 		$("#<portlet:namespace />timeNext").click(function(){
 			 var fromVal = $<portlet:namespace />from.val();
			 var toVal = $<portlet:namespace />to.val();
			 
			 //console.log("queryType:"+ $<portlet:namespace />queryType.val());
			 
			 if($<portlet:namespace />queryType.val()=="dayreport") {
				 fromVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addDays(1));
				 toVal = fromVal; 
			 } else if ($<portlet:namespace />queryType.val()=="weekreport") {
				 fromVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addWeeks(1));
				 toVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addWeeks(1).addDays(-1));
			 }  else if ($<portlet:namespace />queryType.val()=="monthreport") {
				 fromVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addMonths(1));
				 toVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addMonths(1).addDays(-1));
				
			 } else if ($<portlet:namespace />queryType.val()=="yearreport") {
				 fromVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addYears(1));
				 toVal = jQuery.datepicker.formatDate("yy-mm-dd",Date.parse(fromVal).addYears(1).addDays(-1));
			 }
			 
			 $<portlet:namespace />from.val(fromVal);
			 $<portlet:namespace />to.val(toVal);
			 
		 });
		 
		 
		<portlet:namespace />getChart();
	});
	
</script>
