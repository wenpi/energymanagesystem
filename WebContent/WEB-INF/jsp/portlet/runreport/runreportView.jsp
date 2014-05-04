<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-20 上午09:57:42
	LastModified Date:
	Description: 建筑设备运行数据报表
 -->

<div class="fitem">
	<form method="get" action="#">
		<label>选择建筑:</label> <select id="buildId"></select>
	</form>
</div>
<div class="easyui-layout" style="width: 100%; height: 420px;z-index:0;">
	<div region="west" split="true" style="width: 220px; padding: 2px;">
		<div id="tab-container" class="easyui-tabs" style="width: 210px;">
			<div id="tab1" title="装表支路" style="padding: 10px;">
				<ul id="circuittree" class="easyui-tree"></ul>
				
			</div>
			<div id="tab2" title="建筑分区" style="padding: 10px;"
				href="<portlet:renderURL portletMode="view" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
		<portlet:param name="action" value="buildregionpage"></portlet:param>
	</portlet:renderURL>">
			</div>
			<input type="hidden" name="circuitId" id="circuitId" />
		</div>

	</div>
	<div region="center" title="设备列表" tools="#<portlet:namespace />ctt">
		<table id="<portlet:namespace/>Meteruseinfos" class="easyui-datagrid" 
		width="100%" idField="meterId" rownumbers="true">
			<thead>
				<tr>
					<th field="meterName" width="100">仪表名称</th>
					<th field="meterproinfo" width="100" formatter="formatMeterproinfo">产品名称</th>
				</tr>
			</thead>
		</table>

		
	</div>
	<div region="east" split="true" style="width: 500px;">
		<div id="report_tools" class="panel-header">
				开始日期<input id="<portlet:namespace />from" name="<portlet:namespace />from" type="text" title="开始日期(yyyy-MM-dd)" size="10" />
				<button onclick="<portlet:namespace/>getChart('dayreport')">日报</button>
				<button onclick="<portlet:namespace/>getChart('weekreport')">周报</button>
				<button onclick="<portlet:namespace/>getChart('monthreport')">月报</button>
				<button onclick="<portlet:namespace/>getChart('yearreport')">年报</button>
				<input type="hidden" name="meterId" id="meterId" />
		
			</div>
			<div id="<portlet:namespace />chartdiv" align="center"></div>	
			
	</div>
</div>

<div id="<portlet:namespace/>ctt">
	<a href="#" class="icon-detail"
				onclick="<portlet:namespace/>getSelectionsMeter()" title="多项对比"></a> 			
</div>
<script language="javascript">
	$(function() {
		/**
		* 设置支路
		*/
		$('#circuittree').tree({
			url : '<portlet:resourceURL id="getCircuitstree"></portlet:resourceURL>',
			method : 'get',
			onClick : function(node) {
				$.post('<portlet:resourceURL id="getMeteruseinfosByCircuitid"></portlet:resourceURL>',{circuitId:node.id},function(data){
					try {
						$('#<portlet:namespace/>Meteruseinfos').datagrid('loadData',data);
					}catch(e) {
						$('#<portlet:namespace/>Meteruseinfos').datagrid('loadData',{total:0,rows:[]});
					}		
				},'json');
				$("#circuitId").val(node.id);
			}
		});
		
		/**
		* 设置时间
		*/
		$("#<portlet:namespace />from").datepicker({
			format:'yyyy-mm-dd',
			defaultDate: "+1w",
			changeMonth: true,
			changeYear: true,
			numberOfMonths: 2,
			onSelect: function( selectedDate ) {
				$( "#<portlet:namespace />to" ).datepicker( "option", "minDate", selectedDate );
			}
		});
		$("#<portlet:namespace />to").datepicker({
			format:'yyyy-mm-dd',
			defaultDate: "+1w",
			changeMonth: true,
			changeYear: true,
			numberOfMonths: 2,
			onSelect: function( selectedDate ) {
				$( "#<portlet:namespace />from" ).datepicker( "option", "maxDate", selectedDate );
			}
		});
		
		<% if (prefs.getValue("startdate","").length()>0) {%>
		$("#<portlet:namespace />from").val('<%=prefs.getValue("startdate","")%>');
		<%} else {%>
		$("#<portlet:namespace />from").val(Date.today().toString('yyyy-MM-dd'));
		<%}%>
		/**
		 * 获取建筑信息列表
		 */
		$("#buildId").combogrid({
			panelWidth : 500,
			value : $("#buildId").val(),
			idField : 'buildId',
			textField : 'buildName',
			pagination : true,//是否分页  
			rownumbers : true,
			fit : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50 ],
			url : '<portlet:resourceURL id="getBuildinfos"></portlet:resourceURL>',
			columns : [ [ {
				field : 'buildId',
				title : '建筑编号',
				width : 100
			}, {
				field : 'buildName',
				title : '建筑名称',
				width : 100
			} ] ],
			keyHandler : {
				up : function() {
				},
				down : function() {
				},
				enter : function() {
				},
				query : function(q) {
					$('#buildId').combogrid("grid").datagrid("reload", {
						'keyword' : q
					});
					$('#buildId').combogrid("setValue", q);
				}
			}
		});
		
		<%if (prefs == null || prefs.getMap().size() > 0) {
			if (prefs.getValue("sourcetype", "").equals("2")) {%>
			$('#buildId').combogrid("setValue", '<%=prefs.getValue("buildId","")%>');
			$('#buildId').combogrid('disable');
	<%} 
		} %>
		
		
	});
	
	/**
	* 获取仪表产品名称
	*/
	function formatMeterproinfo(val,row) {
		return val.meterProductname;
	}
	
	/**
	* 获取图表
	*/
	function <portlet:namespace/>getChart(queryType) {
		var circuitId = $("#circuitId").val();
		var fromVal= $("#<portlet:namespace />from").val();
		var toVal = $("#<portlet:namespace />to").val();
		
		if(circuitId=="") {
			alert("请选择装表支路!");
			return false;
		}
		
		if(queryType=="")
			queryType = 'dayreport';


		$.post('<portlet:resourceURL id="getChartData"></portlet:resourceURL>',{
			starttimeValue:fromVal,
			endtimeValue:toVal,
			queryType:queryType,
			datasourcetype:'circuitinfo',
			datasourceid:circuitId,
			caption:'支路能耗对比',
			subcaption:''
		},function(data){
			$("#<portlet:namespace />chartdiv").empty();
			 	if(FusionCharts("chartid"))  
	  				FusionCharts("chartid").dispose();
				  var myChart = new FusionCharts(
							"/energymanagesystem/fusioncharts/MSLine.swf",
							"chartid", "480", "360", "0", "1");
	              myChart.setJSONData(data);
	              myChart.render("<portlet:namespace />chartdiv");		
			},'json');
	}
	
	
	/**
	* 获取点击行设备的运行数据
	*/
	$("#<portlet:namespace/>Meteruseinfos").datagrid({
		onSelect: function(data,row) {
			<portlet:namespace/>getSelectionsMeter();
		},
		onUnselect:function(data,row) {
			<portlet:namespace/>getSelectionsMeter();
		}
	});
	
	/**
	* 获取选择行对应设备的运行数据
	*/
	function <portlet:namespace/>getSelectionsMeter() {
		var ids = [];
		var rows = $('#<portlet:namespace/>Meteruseinfos').datagrid('getSelections');
		for(var i=0; i<rows.length; i++){
			ids.push(rows[i].meterId);
		}
		//alert(ids.join(','));
		$("#meterId").val(ids.join(','));
	}
	

	
</script>