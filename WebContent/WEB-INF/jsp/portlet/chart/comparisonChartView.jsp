<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-16 上午10:23:49
	LastModified Date:
	Description:
 -->

<style type="text/css">
<!--
	.chartsearch {
		margin:4px;
	}
	.chartsearch input {
		padding:0px;
		margin:0px;
		height:20px;
	}
	.tabtitle {
		background: none;
		font-weight: bold; 
		float: left; 
		font-size: 14px; 
		text-align: left; 
		color: #000000;}
	
	#Tab<portlet:namespace /> {
		padding-right: 0px;
		padding-left: 0px;
		padding-bottom: 0px;
		margin: 0px 0px 0px;
		
		padding-top: 0px
}
-->
</style>

<c:if test="${empty chartsetting}">
	<div class="portlet-msg-success">请设置模块首选项</div>
</c:if>

<c:if
	test="${!empty chartsetting.showQuery and chartsetting.showQuery eq true}">
	<form id="<portlet:namespace />chartsearch" class="chartsearch">
		<c:choose>
			<c:when test="${chartsetting.queryType=='usage'}">
				<!-- 任意时间 -->
 		 从<input id="<portlet:namespace />from"
					name="<portlet:namespace />from" type="text" required="true" value="${from}" />至<input
					id="<portlet:namespace />to" value="${to}"
					name="<portlet:namespace />to" type="text"
					class="easyui-datetimebox" />
				<a href="#" class="easyui-linkbutton" plain="true"
					iconCls="icon-search" onclick="<portlet:namespace />search();">确定</a>
			</c:when>
			<c:when
				test="${chartsetting.queryType=='dayreport' or chartsetting.queryType=='weekreport' or chartsetting.queryType=='monthreport' or chartsetting.queryType=='yearreport'}">
				<!-- 日报、周报、月报、年报 -->
				<input id="<portlet:namespace />from"
					name="<portlet:namespace />from" type="text" required="true" value="${from}" />
				<a href="#" class="easyui-linkbutton" plain="true"
					iconCls="icon-search" onclick="<portlet:namespace />search();">确定</a>
			</c:when>
			<c:otherwise>
				<!-- 原始抄表 -->
				起始时间 <input id="<portlet:namespace />from" value="${from}"
					name="<portlet:namespace />from" type="text" required="true" />
				显示条数 <input id="<portlet:namespace />count" value="${count}"
					name="<portlet:namespace />count" size="4" maxLength="4"
					class="easyui-numberbox" type="text">
				<a href="#" class="easyui-linkbutton" plain="true"
					iconCls="icon-search" onclick="<portlet:namespace />search();">确定</a>
			</c:otherwise>
		</c:choose>
	</form>
	<script language="javascript">
		 function <portlet:namespace />setDate() {
			var defStarttime = '<c:out value="${chartsetting.defStarttime}" />';
			if(defStarttime=='currenttime') {
				$("#<portlet:namespace />from").value('2012');
			}
		}
		 <portlet:namespace />setDate();
	</script>
</c:if>

<c:choose>
	<c:when test="${chartsetting.comparisontype>0}">
		<div id="Tab<portlet:namespace />">
			<c:choose>
				<c:when test="${chartsetting.comparisontype==1}">
					<div class="menutabbox">
						<ul>
							<span class="tabtitle">时段分布</span>
							<li id="two2" onclick="setTab('two',2,2)" class="">环比</li>
							<li id="two1" onclick="setTab('two',1,2)" class="hover">时段分布</li>
						</ul>
					</div>
					<div class="contentbox">
						<div id="con_two_1"
							style="padding-bottom: 5px; text-align: center; display: block;">
							<div id="<portlet:namespace />chartdiv" align="center"></div>
						</div>
						<div id="con_two_2" style="padding-bottom: 5px; display: none;">
							<div id="<portlet:namespace />chartdiv2" align="center"></div>
							<div align="center">
								<label><input type="radio" value="yestoday" name="compareVal" checked="checked" />前一天</label>  
								<label><input type="radio" value="lastweek" name="compareVal" />上周环比</label>
								<label><input type="radio" value="lastmonth" name="compareVal" />上月环比</label>
								<label><input type="radio" value="custom" name="compareVal" />自定义</label>
								<input id="<portlet:namespace />cfrom" name="<portlet:namespace />cfrom" type="text" style="width:120px;display:none;" />
							</div>
						</div>
					</div>
				</c:when>
				<c:when test="${chartsetting.comparisontype==2}">
					<div class="menutabbox">
						<ul>
							<span class="tabtitle">时段分布</span>
							<li id="two2" onclick="setTab('two',2,2)" class="">同比</li>
							<li id="two1" onclick="setTab('two',1,2)" class="hover">时段分布</li>
						</ul>
					</div>
					<div class="contentbox">
						<div id="con_two_1"
							style="display: block;">
							<div id="<portlet:namespace />chartdiv" align="center"></div>
						</div>
						<div id="con_two_2" style="display: none;">
							<div id="<portlet:namespace />chartdiv2" align="center"></div>
							<div align="center">
							<label><input type="radio" value="yestoday" name="compareVal" checked="checked" />前一天</label>  
							<label><input type="radio" value="lastweek" name="compareVal" />上周同比</label>
							<label><input type="radio" value="lastmonth" name="compareVal" />上月同比</label>
							<label><input type="radio" value="custom" name="compareVal" />自定义</label>
							<input id="<portlet:namespace />cfrom" name="<portlet:namespace />cfrom" type="text" style="width:120px;display:none;" />
						</div>
					</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="menutabbox">
						<ul>
							<span class="tabtitle">时段分布</span>
							<li id="two3" onclick="setTab('two',3,3)" class="">同比</li>
							<li id="two2" onclick="setTab('two',2,3)" class="">环比</li>
							<li id="two1" onclick="setTab('two',1,3)" class="hover">时段分布</li>
						</ul>
					</div>
					<div class="contentbox">
						<div id="con_two_1"
							style="text-align: center; display: block;">
							<div id="<portlet:namespace />chartdiv" align="center"></div>
							<div align="center"></div>
						</div>
						<div id="con_two_2" style="padding-bottom: 5px; display: none;">
							<div id="<portlet:namespace />chartdiv2" align="center"></div>
						</div>
						<div id="con_two_3" style="padding-bottom: 5px; display: none;">
							<div id="<portlet:namespace />chartdiv3" align="center"></div>
							<div align="center">
								<label><input type="radio" value="yestoday" name="compareVal" checked="checked" />前一天</label>  
								<label><input type="radio" value="lastweek" name="compareVal" />上周同比</label>
								<label><input type="radio" value="lastmonth" name="compareVal" />上月同比</label>
								<label><input type="radio" value="custom" name="compareVal" />自定义</label>
								<input id="<portlet:namespace />cfrom" name="<portlet:namespace />cfrom" type="text" style="width:120px;display:none;" />
							</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</c:when>
	<c:otherwise>
		<div id="<portlet:namespace />chartdiv" align="center"></div>
	</c:otherwise>
</c:choose>
<c:if test="${chartsetting.displayReport}">
	<div id="<portlet:namespace />report" align="center" style="overflow-x:scroll;min-width:980px;"></div>
</c:if>
<portlet:resourceURL id="getChartData" var="getChartDataURL">
</portlet:resourceURL>

<script type="text/javascript">
	/**
	* 异步获取图表数据
	*/
	function <portlet:namespace />getChart(chartId,cfromVal) { 
		var toVal = "",fromVal="",countVal="";
		
		var toVal = "",fromVal="",countVal="";
		
		var $form = $("#<portlet:namespace />from");
		var $to = $("#<portlet:namespace />to");
		var $count = $("#<portlet:namespace />count");
		if($form.length) {
			fromVal = $("#<portlet:namespace />from").val();
		}
		if($to.length) {
			toVal = $("#<portlet:namespace />to").val();
		}
		if($count.length) {
			countVal = $("#<portlet:namespace />count").val();
		}
		console.log("GetComparisonChart fromVal:" + fromVal + ",toVal" + toVal + ",count:"+ countVal);
		

		$.post("<%=renderResponse.encodeURL(getChartDataURL)%>",{from:fromVal,to:toVal,count:countVal,cfrom:cfromVal},
					function(data){	
			var chartType = "<%=renderRequest.getContextPath() %>/fusioncharts/${chartsetting.chartType}";
			if(cfromVal!='')
				chartType = "<%=renderRequest.getContextPath() %>/fusioncharts/${chartsetting.compareCharttype}";
			$("#"+ chartId +"").insertFusionCharts({
		        swfUrl: chartType, 
		        dataSource: data, 
		        dataFormat: "json", 
		        width: "${chartsetting.width}",
		        height: "${chartsetting.height}", 
		        <c:if test="${chartsetting.debugMode}">
		      	debugMode:1,
		        </c:if>
		        id: "<portlet:namespace />"+chartId
		       
		 	 });	 		
		},'json');


		<c:if test="${chartsetting.displayReport}">	
		$.post("<portlet:resourceURL id="getChartReport"></portlet:resourceURL>",{from:fromVal,to:toVal,count:countVal},
				function(data){
			var html = "";
			html += "<table width=\"850\" class=\"reporttb\" cellpadding=\"2\" cellspacing=\"2\">";   
			html +="<tr>";
			html +="<th>日期</th>";
			
			var cols = new Array();
			var times = new Array();
			//把结果写入数组
			var index = 0;
			$.each(data,function(i,obj) {
				cols[i] = new Array();
				times[i] = new Array();
				$.each(obj.data,function(j,entry) {
					cols[i][j] = entry.val;
					if(index==0) {
						times[i][j] = entry.time;
					}
				});
				index++;
			});
			
			//设置表格标题
			$.each(data,function(i,obj) {
				html += "<th>"+ obj.label +"</th>";		
			});
			html += "</tr>";
			//设置表格行
			for(var i=0;i<times[0].length;i++) {
				html +="<tr>";
				html += "<td>"+ times[0][i] +"</td>";
				for(var j=0;j<cols.length;j++) {
					html +="<td>"+ cols[j][i] +"</td>";
				}
				html +="</tr>";
			}

			html +"</table>";
			$('#<portlet:namespace />report').html("");
            $('#<portlet:namespace />report').html(html);
		},'json');
		</c:if>
	}

	/**
	* 查询数据
	*/
	function <portlet:namespace />search() {
		loadChart();
	}
	
	function loadChart() {
		<c:if test="${chartsetting.comparisontype==1 or chartsetting.comparisontype==2}">
			$("#<portlet:namespace />cfrom" ).datepicker({
				numberOfMonths: 2,
				showButtonPanel: true,
				onSelect: function(dateText, inst) {
					<portlet:namespace />getChart('<portlet:namespace />chartdiv2',dateText);
				}
			});
			var cfromVal = "yestoday";
			$("input[name='compareVal']").click(function(){
			     var item = $("input[name='compareVal']:checked").val();
			     if(item=="yestoday") {
			    	 $("#<portlet:namespace />cfrom" ).hide();
			    	 cfromVal = 'yestoday';
			    	 <portlet:namespace />getChart('<portlet:namespace />chartdiv2',cfromVal);
			     } else if(item=='lastweek') {
			    	 $("#<portlet:namespace />cfrom" ).hide();
			    	 cfromVal = 'lastweek';
			    	 <portlet:namespace />getChart('<portlet:namespace />chartdiv2',cfromVal);
			     } else if(item=='lastmonth') {
			    	 $("#<portlet:namespace />cfrom" ).hide();
			    	 cfromVal = 'lastmonth';
			    	 <portlet:namespace />getChart('<portlet:namespace />chartdiv2',cfromVal);
			     } else if(item=='custom') {
			    	 $("#<portlet:namespace />cfrom" ).show();
			    	 cfromVal = $("#<portlet:namespace />cfrom").val();
			    	 <portlet:namespace />getChart('<portlet:namespace />chartdiv2',cfromVal);
			     }
			});
			<portlet:namespace />getChart('<portlet:namespace />chartdiv','');
			<portlet:namespace />getChart('<portlet:namespace />chartdiv2',cfromVal);
		</c:if>
		
		<c:choose>
		<c:when test="${chartsetting.comparisontype==0}">
			<portlet:namespace />getChart('<portlet:namespace />chartdiv','');
		</c:when>
		<c:otherwise>
			$("#<portlet:namespace />cfrom" ).datepicker({
				numberOfMonths: 2,
				showButtonPanel: true,
				onSelect: function(dateText, inst) {
					<portlet:namespace />getChart('<portlet:namespace />chartdiv3',dateText);
				}
			});
			var cfromVal = "yestoday";
			$("input[name='compareVal']").click(function(){
			     var item = $("input[name='compareVal']:checked").val();
			     if(item=="yestoday") {
			    	 $("#<portlet:namespace />cfrom" ).hide();
			    	 cfromVal = 'yestoday';
			    	 <portlet:namespace />getChart('<portlet:namespace />chartdiv3',cfromVal);
			     } else if(item=='lastweek') {
			    	 $("#<portlet:namespace />cfrom" ).hide();
			    	 cfromVal = 'lastweek';
			    	 <portlet:namespace />getChart('<portlet:namespace />chartdiv3',cfromVal);
			     } else if(item=='lastmonth') {
			    	 $("#<portlet:namespace />cfrom" ).hide();
			    	 cfromVal = 'lastmonth';
			    	 <portlet:namespace />getChart('<portlet:namespace />chartdiv3',cfromVal);
			     } else if(item=='custom') {
			    	 $("#<portlet:namespace />cfrom" ).show();
			    	 cfromVal = $("#<portlet:namespace />cfrom").val();
			    	 <portlet:namespace />getChart('<portlet:namespace />chartdiv3',cfromVal);
			     }
			});
			<portlet:namespace />getChart('<portlet:namespace />chartdiv','');
			<portlet:namespace />getChart('<portlet:namespace />chartdiv2',cfromVal);
			<portlet:namespace />getChart('<portlet:namespace />chartdiv3',cfromVal);
		</c:otherwise>
	</c:choose>
	}
	
	
	/**
	* 初始加载数据
	*/
	$(function(){
		loadChart();	
		$("#<portlet:namespace />from").datepicker();
		$("#<portlet:namespace />to").datepicker();	
	});
	
	function setTab(name,cursel,n){
		for(i=1;i<=n;i++){
			var menu=document.getElementById(name+i);
			var con=document.getElementById("con_"+name+"_"+i);
			menu.className=i==cursel?"hover":"";
			con.style.display=i==cursel?"block":"none";
		}
	}
</script>


