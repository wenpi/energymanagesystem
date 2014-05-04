<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2013-5-14 上午09:32:13
	LastModified Date:
	Description: 显示报表数据
 -->
 
<form id="<portlet:namespace />chartsearch" class="chartsearch">
	<div class="time_tool">
		<div class="time_tool" id="time_tool">
			<div class="select_button">
				<a class="previous" id="<portlet:namespace />timePrevious">&nbsp;</a>
				<a class="next" id="<portlet:namespace />timeNext">&nbsp;</a>
			</div> 
			<div class="day">
				<ul id="time_tool_quick_key"
					class="<portlet:namespace />time_tool_quick_key">
					<li id="today"><a>日报</a>
					</li>
					<li id="7days"><a>周报</a>
					</li>
					<li id="ago30days"><a>月报</a>
					</li>
					<li id="ago365days"><a>年报</a>
					</li>
					<li><input id="<portlet:namespace />from"
						name="<portlet:namespace />from" type="text" required="true"
						title="yyyy-MM-dd" placeholder="开始日期" class="datebox startDate" />至<input
						id="<portlet:namespace />to" name="<portlet:namespace />to"
						placeholder="结束日期" class="datebox endDate" type="text" /> <input
						type="hidden" id="<portlet:namespace />queryType" /> <input
						type="hidden" id="<portlet:namespace />dateTag" /></li>
					<li><input type="button" id="<portlet:namespace />submit"
						value="确定" />
					</li>
					<li>
  
					</li>
				</ul>
			</div>
			<a href="#" id="<portlet:namespace />export">导出Excel</a>
		</div>
	</div>
	<!-- 报表内容 -->
	<div id="<portlet:namespace />spinner" style="display:none;">
		数据载入中....
		<img id="img-spinner" src="<%=renderRequest.getContextPath() %>/styles/images/loading.gif" alt="Loading"/>
	 
		
		
	</div>
	
	<div id="<portlet:namespace />report" align="center"></div>
	
	
</form>



<script type="text/javascript">
//	var console = console || {"log":function(){}};

	var <portlet:namespace />reportType = [
	       {'code':'usage','name':"时间段数据报表",'format':'dd-H'},
	       {'code':'dayreport','name':"日报表",'format':'H'},
	       {'code':'weekreport','name':"周报表",'format':'dd'},
	       {'code':'monthreport','name':"月报表",'format':'dd'},
	       {'code':'yearreport','name':"年报表",'format':'MM'},
	       {'code':'query','name':"过程数据报表",'format':'dd-H'}
		];
	
	
	function <portlet:namespace />getReportName(code) {
		var name = "";
		$.each(<portlet:namespace />reportType,function(index,obj){
			if(obj.code==code) {
				name = obj.name;
				return false;
			}
		});
		return name;
	}
	
	function <portlet:namespace />getReportFormat(code) {
		var format = "H";
		$.each(<portlet:namespace />reportType,function(index,obj){
			if(obj.code==code) {
				format = obj.format;
				return false;
			}
		});
		return format;
	}
	
	
	var $<portlet:namespace />from = $("#<portlet:namespace />from"),
		$<portlet:namespace />to = $("#<portlet:namespace />to"),
		$<portlet:namespace />count = $("#<portlet:namespace />count"),
		$<portlet:namespace />queryType = $("#<portlet:namespace />queryType"),
	 	$<portlet:namespace />dateTag = $("#<portlet:namespace />dateTag");
	
/**
 * 
 递归的呈现数据
 */ 	
function <portlet:namespace />FillTable(  fromVal, toVal,  countVal, queryTypeVal,partIdVal,baseVal){
		
		//递归出口
		if(partIdVal > baseVal ){
			return ;
		}
		
		$.post('<portlet:resourceURL id="getReportData"></portlet:resourceURL>' ,
				{from:fromVal,to:toVal,count:countVal,queryType:queryTypeVal,partId:partIdVal,base:baseVal },
				function(data){
 
				var html = "";
				
				
				var format = <portlet:namespace />getReportFormat(queryTypeVal);
				var reportName = <portlet:namespace />getReportName(queryTypeVal);

				if(partIdVal == 1){//首次执行
					html += "<table id='<portlet:namespace />Table' class=\"reporttb\" cellpadding=\"2\" cellspacing=\"2\">";   
					html += "<caption>";
					html += "<tbody id='dataTbody'>";
					html += "<c:out value="${reportSetting.caption}" />"+  reportName;
					html += "</caption>";
					
					html +="<tr>";
					html +="<th width='160'>设备名称</th>";
				}
				var tagCount = 0;
				var index = 0;
				//列宽度
				var columns=0;
				//显示报表
				//判断数据是否为空
				if(data!=null) {

					//表头
					if(partIdVal == 1){//首次才执行
						$.each(data,function(key,val){
							if(index<1) {
								$.each(val,function(index,obj){//
							 		//判断表头是周报
							 		localDayOfWeak="";
							 		if(format=="dd"){
							 			localDay=Date.parse(obj.time).getDay();
							 			localWeek = ['日','一','二','三','四','五','六'];
							 			localDayOfWeak="(周"+localWeek[localDay]+")";
							 			
							 			//for debug
							 			//document.write(localDayOfWeak);
							 		}
							 		
							 		//out
									html += "<th>" +  Date.parse(obj.time).toString(format)
									+localDayOfWeak
									+"</th>";
									
									columns++;
								});
							}
							index++;
						});
						html += "<tr>";
					}
					
					$.each(data,function(key,val){
						html+="<tr>";
						html += "<td style='text-align:left;'>"+ key +"</td>"
						$.each(val,function(index,obj){
							var num = new Number(obj.val);
							html += "<td>"+ num.toFixed(0) +"</td>";
							
						});
						html+="</tr>";
					});
					
				}
				nowTrId="<portlet:namespace />MarkRow"+partIdVal;
				lastTrId="<portlet:namespace />MarkRow"+(partIdVal-1);
				html+="<tr  style='display: none;' id='"+nowTrId+"'>";
				for( i=0;i<columns+1;i++){
					html+="<td>&nbsp;</td>";
				}
				html+=" </tr> ";
				
				//alert(columns+"`"+index);
				if(partIdVal==1){//首次才执行

					$('#<portlet:namespace />report').html("");	
					$('#<portlet:namespace />report').html(html); 
					
				}
				else{
					//alert(nowTrId +" `"+lastTrId);
					$('#'+lastTrId).after(html);	
				}
				
  
				//alert("第"+partIdVal+"次/"+baseVal+"from:"+fromVal+"toVal:"+toVal+"queryTypeVal`"+queryTypeVal);
				//递归调用
				<portlet:namespace />FillTable(  fromVal, toVal,  countVal,queryTypeVal,partIdVal+1,baseVal);
			
   		 	 		
		},'json');
		
		
	}
	/**
	* 异步获取图表数据
	*/
	function <portlet:namespace />getChart() { 
		$('#<portlet:namespace />spinner').show();
		
		var toVal = "",fromVal="",countVal="",queryTypeVal = "";

		if($<portlet:namespace />from.length) {
			fromVal = $<portlet:namespace />from.val();
		}
		if($<portlet:namespace />to.length) {
			toVal = $<portlet:namespace />to.val();
			if(fromVal==toVal) {
				toVal+= "T23:59:59";
			}
		}
		if($<portlet:namespace />count.length) {
			countVal = $<portlet:namespace />count.val();
		}
		if($<portlet:namespace />queryType.length) {
			queryTypeVal = $<portlet:namespace />queryType.val();
		}
		
		console.log("<portlet:namespace />chartdiv fromVal:" + fromVal + ",toVal:" + toVal + ",count:"+ countVal);
 
		partId=1;
		//分n部分递归post展示
		<portlet:namespace />FillTable(  fromVal, toVal,  countVal,  queryTypeVal,partId,5);

	}

	function <portlet:namespace />formatFloat(src, pos) {
		return Math.round(src * Math.pow(10, pos)) / Math.pow(10, pos);
	}
	
	
	function <portlet:namespace />formatDatetime(time) {
		var queryType = $<portlet:namespace />queryType.val();
		 if(queryType=="")
			 return time;
		 if(queryType == "dayreport") {
			 var arrTime = time.split(":");
			 if(arrTime.length>=2) {
			 	return time+ "-"+ arrTime[0] + ":59";
			 } else {
				 return time;
			 }
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
		
		$(".startDate").datepicker({
		      defaultDate: "+1w",
		      changeMonth: true,
		      numberOfMonths: 2,
		      onClose: function( selectedDate ) {
		        $(".endDate").datepicker( "option", "minDate", selectedDate );
		      }
		    });
		 $(".endDate").datepicker({
		      defaultDate: "+1w",
		      changeMonth: true,
		      numberOfMonths: 2,
		      onClose: function( selectedDate ) {
		        $(".startDate").datepicker( "option", "maxDate", selectedDate );
		      }
		  });
		 
		 //查询类型
		 $<portlet:namespace />queryType.val("${reportSetting.queryType}");
		 
		 //设置默认开始时间
		 var $<portlet:namespace />defStartTime = "${reportSetting.starttimeValue}";
		 
		 console.log("defStartTime:"+ $<portlet:namespace />defStartTime);
		 
		//起始时间
		if("${reportSetting.defStarttime}"=="today" ) {
			$<portlet:namespace />defStartTime = Date.parse('today').toString("yyyy-MM-dd");
		}else if("${reportSetting.defStarttime}"=="yesterday" ) {
			$<portlet:namespace />defStartTime = Date.parse('yesterday').toString("yyyy-MM-dd");
		}else if("${reportSetting.defStarttime}"=="firstofweek" ) {
			$<portlet:namespace />defStartTime = Date.today().add({ days: -6 }).toString("yyyy-MM-dd");
		}else if("${reportSetting.defStarttime}"=="firstofmonth" ) {
			$<portlet:namespace />defStartTime = Date.today().moveToFirstDayOfMonth().toString("yyyy-MM-dd");
		}else if("${reportSetting.defStarttime}"=="firstofyear" ) {
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
		
		
		
		 //设置默认结束时间
		 var $<portlet:namespace />defEndtime = "${reportSetting.endtimeValue}";

		 	console.log("end:"+ $<portlet:namespace />defEndtime);
		 
		//结束时间
			if("${reportSetting.endtimeValue}"=="today" ) {
				$<portlet:namespace />defEndtime = Date.parse('today').toString("yyyy-MM-dd");
			}else if("${reportSetting.endtimeValue}"=="yesterday" ) {
				$<portlet:namespace />defEndtime = Date.parse('yesterday').toString("yyyy-MM-dd");
			}else if("${reportSetting.endtimeValue}"=="firstofweek" ) {
				$<portlet:namespace />defEndtime = Date.today().add({ days: -6 }).toString("yyyy-MM-dd");
			}else if("${reportSetting.endtimeValue}"=="firstofmonth" ) {
				$<portlet:namespace />defEndtime = Date.today().moveToFirstDayOfMonth().toString("yyyy-MM-dd");
			}else if("${reportSetting.endtimeValue}"=="firstofyear" ) {
				var $<portlet:namespace />x= Date.parse('today'); $<portlet:namespace />x.setMonth(0); $<portlet:namespace />x.setDate(1); 
				$<portlet:namespace />defEndtime = $<portlet:namespace />x.toString("yyyy-MM-dd");
			}else {
				//如果没有设置默认时间，设置为当前时间
				if($<portlet:namespace />defEndtime=="") {
					$<portlet:namespace />defEndtime = Date.parse($<portlet:namespace />defStartTime).toString("yyyy-MM-dd");
					
				 }else {	 
					$<portlet:namespace />defEndtime = Date.parse($<portlet:namespace />defEndtime).toString("yyyy-MM-dd");
				 }
			}
			$<portlet:namespace />to.datepicker("setDate",$<portlet:namespace />defEndtime);


		 $(".<portlet:namespace />time_tool_quick_key li a").click(function(){
			 $(".<portlet:namespace />time_tool_quick_key li").removeClass("selected");
			 $(this).parent().addClass("selected");
			 
			 var dateTag = $(this).parent().attr("id");
			 
			 var startVal,endVal,curDate = $<portlet:namespace />from.val(),queryType="";
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
			 $<portlet:namespace />dateTag.val(dateTag);
			 
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
			 
			 console.log("queryType:"+ $<portlet:namespace />queryType.val());
			 
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
		 //初始加载
		 <portlet:namespace />getChart();
		 
		 $("#<portlet:namespace />export").click(function(){
			 var toVal = "",fromVal="",countVal="",queryTypeVal = "";

				if($<portlet:namespace />from.length) {
					fromVal = $<portlet:namespace />from.val();
				}
				if($<portlet:namespace />to.length) {
					toVal = $<portlet:namespace />to.val();
					if(fromVal==toVal) {
						toVal+= "T23:59:59";
					}
				}
				if($<portlet:namespace />count.length) {
					countVal = $<portlet:namespace />count.val();
				}
				if($<portlet:namespace />queryType.length) {
					queryTypeVal = $<portlet:namespace />queryType.val();
				}
				var url = '<portlet:resourceURL id="exportExcel"></portlet:resourceURL>' + "&from="+ fromVal + "&to="+ toVal + "&queryType="+ queryTypeVal + "&count"+ countVal;
			    location.href = url;

		 });
		 
		 $("#<portlet:namespace />spinner").bind("ajaxSend", function() {
				$(this).show();
			}).bind("ajaxStop", function() {
				$(this).hide();
			}).bind("ajaxError", function() {
				$(this).hide();
			});
		
	});
	
	
	
</script>
<script type="text/javascript">
Date.prototype.format =function(format)
{
var o = {
"M+" : this.getMonth()+1, //month
"d+" : this.getDate(), //day
"h+" : this.getHours(), //hour
"m+" : this.getMinutes(), //minute
"s+" : this.getSeconds(), //second
"q+" : Math.floor((this.getMonth()+3)/3), //quarter
"S" : this.getMilliseconds() //millisecond
}
if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
(this.getFullYear()+"").substr(4- RegExp.$1.length));
for(var k in o)if(new RegExp("("+ k +")").test(format))
format = format.replace(RegExp.$1,
RegExp.$1.length==1? o[k] :
("00"+ o[k]).substr((""+ o[k]).length));
return format;
}
</script>
 <script type="text/javascript">
 $<portlet:namespace />from.datepicker({ onSelect: function(dateText, inst) {
 
	 reportType=$<portlet:namespace />queryType.val();
	 toDate=new Date(dateText);
	 
	 if(reportType=="dayreport"){ 
	 }
	 else
	 if(reportType=="weekreport"){
		 //周末 
		 ms=toDate.getTime()+6*24*3600*1000;
		 toDate.setTime(ms);
	 }
	 else
	 if(reportType=="monthreport"){
		 //月末,和数据输出保持一致，顺延30天
		 ms=toDate.getTime()+30*24*3600*1000;
		 toDate.setTime(ms); 
	 }
	 else
	 if(reportType=="yearreport"){
		 //年末 
		 toDate.setYear(1900+toDate.getYear()+1);
		 toDate.setMonth(0);
		 toDate.setDate(1); 
	 }
 	 
	 //格式化输出
	 val=toDate.format('yyyy-MM-dd') ;
	 $<portlet:namespace />to.val(val);  
 	}  
 });
 
 
	
 
</script>
