<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-2 下午05:11:56
	LastModified Date:
	Description:
 -->
<style type="text/css">
select {
	width: 134px;
}
</style>
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>
<div id="msg"></div>
<form:form commandName="chartsetting" method="post" class="editform"
	action="#">
	<div class="ftitle">图表常规设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="chartType">图表类型</form:label>
					<form:select path="chartType">
						<optgroup label="单系列图表">
							<form:option value="Pie2D.swf">2D饼形图</form:option>
							<form:option value="Pie3D.swf">3D饼形图</form:option>
							<form:option value="Doughnut2D.swf">2D圆环图</form:option>
							<form:option value="Doughnut3D.swf">3D圆环图</form:option>
						</optgroup>
					</form:select>
					*
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="dataFormat">数据类型</form:label>
					<form:select path="dataFormat">
						<form:option value="json">JSON</form:option>
						<form:option value="jsonurl">JSONURL</form:option>
						<form:option value="xml">XML</form:option>
						<form:option value="xmlurl">XMLURL</form:option>
					</form:select>
					* <span id="datasrc" style="cursor: pointer;" title="点击自定义外部数据">设置外部数据</span>
					<div id="dlgDatasource" title="自定义数据"
						style="width: 500px; height: 320px;" closed="true">
						<form:textarea path="dataSource" style="width:480px;height:260px;" />
					</div>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="caption">图表标题</form:label>
					<form:input path="caption" cssClass="easyui-validatebox"
						required="true" title="显示在图表顶部的标题！" />
					*
				</div>
			</div>
			<div class="div-table-2col">
				<div class="div-table-col">
					<div class="fitem">
						<form:label path="width">图表宽度</form:label>
						<form:input path="width" class="easyui-numberbox" required="true" />
						*
					</div>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="subcaption">图表副标题</form:label>
					<form:input path="subcaption" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="height">图表高度</form:label>
					<form:input path="height" class="easyui-numberbox" required="true" />
					*
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="xaxisname">X轴标题</form:label>
					<form:input path="xaxisname" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="usePyaxisname">Y轴标题类型</form:label>
					<form:radiobutton path="usePyaxisname" value="true" />
					启用主次标题
					<form:radiobutton path="usePyaxisname" value="false" />
					禁用主次标题

				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="debugMode">启用调试</form:label>
					<form:radiobutton path="debugMode" value="true" />
					启用
					<form:radiobutton path="debugMode" value="false" />
					禁用

				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem" id="disUsePyaxisname">
					<form:label path="yaxisname">Y轴标题</form:label>
					<form:input path="yaxisname" />
				</div>
				<div class="fitem" id="enUsePyaxisname" style="display: none;">
					<form:label path="pyaxisname">Y轴主标题</form:label>
					<form:input path="pyaxisname" />
					<br />
					<form:label path="syaxisname">Y轴二级标题</form:label>
					<form:input path="syaxisname" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col"></div>
		</div>
		<div class="div-table-row"></div>
	</div>
	<div id="desc" class="portlet-msg-info">
		图表类型说明： <br /> 占比图模块只用于饼形图和环形图
	</div>

	<div class="ftitle">图表扩展设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="palette">选择调色板</form:label>
					<form:select path="palette">
						<form:option value="">默认</form:option>
						<form:option value="1">1</form:option>
						<form:option value="2">2</form:option>
						<form:option value="3">3</form:option>
						<form:option value="4">4</form:option>
						<form:option value="5">5</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img alt=""
						title="图表提供了5种调色板供选择,默认调色板为1"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="paletteColors">自定义调色</form:label>
					<form:input path="paletteColors" />
					<span class="taglib-icon-help"> <img alt=""
						title="自定义调色板颜色,如 FF5904,0372AB,FF0000"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="showValues">显示数值</form:label>
					<form:radiobutton path="showValues" value="0" />隐藏
					<form:radiobutton path="showValues" value="1" />显示
					<span class="taglib-icon-help"> <img alt=""
						title="是否在图表上显示数值"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="decimals">小数位数</form:label>
					<form:input path="decimals" class="easyui-numberbox" maxLength="2" />
					<span class="taglib-icon-help"> <img alt=""
						title="取值范围(0-10)"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="numberprefix">数字前缀</form:label>
					<form:input path="numberprefix" />
					<span class="taglib-icon-help"> <img alt="" title="如 $10"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="numbersuffix">数字后缀</form:label>
					<form:input path="numbersuffix" />
					<span class="taglib-icon-help"> <img alt="" title="如 0M"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="xaxismaxvalue">X轴最大值</form:label>
					<form:input path="xaxismaxvalue" />
					<span class="taglib-icon-help"> <img alt=""
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="xaxisminvalue">X轴最小值</form:label>
					<form:input path="xaxisminvalue" />
					<span class="taglib-icon-help"> <img alt=""
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="yaxismaxvalue">Y轴最大值</form:label>
					<form:input path="yaxismaxvalue" />
					<span class="taglib-icon-help"> <img alt=""
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="bgImage">背景图片地址</form:label>
					<form:input path="bgImage" />
					<span class="taglib-icon-help"> <img alt=""
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="bgImageAlpha">图片透明度</form:label>
					<form:input path="bgImageAlpha" class="easyui-numberbox"
						maxLength="3" />
					<span class="taglib-icon-help"> <img alt=""
						title="设置背景图片透明度,默认值为100,取值范围 0-100"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="scale">背景图片缩放</form:label>
					<form:input path="scale" />
					<span class="taglib-icon-help"> <img alt=""
						title="The value of this attribute can be anything between 0-300. The default value of the attribute is 100. Any value less than 100 will reduce thesize of the background image and any value more than 100 will increasethe size of the background image"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="bgImageHAlign">背景水平对齐</form:label>
					<form:select path="bgImageHAlign">
						<form:option value="">默认</form:option>
						<form:option value="left">向左</form:option>
						<form:option value="middle">居中</form:option>
						<form:option value="right">向右</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img alt=""
						title="设置图表背景水平对齐方式"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="bgImageVAlign">背景垂直对齐</form:label>
					<form:select path="bgImageVAlign">
						<form:option value="">默认</form:option>
						<form:option value="top">顶部</form:option>
						<form:option value="middle">居中</form:option>
						<form:option value="bottom">底部</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img alt=""
						title="设置图表背景垂直对齐方式"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="bgImageDisplayMode">背景显示模式</form:label>
					<form:select path="bgImageDisplayMode">
						<form:option value="none">无</form:option>
						<form:option value="center">居中</form:option>
						<form:option value="stretch">拉伸</form:option>
						<form:option value="tile">重复</form:option>
						<form:option value="fit">自适应</form:option>
						<form:option value="fill">填充</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img alt="" title=""
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
	</div>


	<div class="ftitle">图表查询设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="showQuery">显示查询</form:label>
					<form:radiobutton path="showQuery" value="true" />
					显示
					<form:radiobutton path="showQuery" value="false" />
					隐藏 <span class="taglib-icon-help"> <img title="设置显示或隐藏查询工具栏"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="queryType">查询类型</form:label>
					<form:select path="queryType">
						<form:option value="usage">任意时间</form:option>
						<form:option value="dayreport">用量日报</form:option>
						<form:option value="weekreport">用量周报</form:option>
						<form:option value="monthreport">用量月报</form:option>
						<form:option value="yearreport">用量年报</form:option>
						<form:option value="query">原始抄表</form:option>
					</form:select>
					<span class="taglib-icon-help"> <img
						title="设置数据查询方式:
任意时间(查询任意时间段的用量,最多同时32个变量)
用量日报(24小时内每个小时的用量，最多同时32个变量)
用量周报(一周内每天的用量，最多同时32个变量)
用量月报(一月内每天的用量，最多同时32个变量)
用量年报(一年内每月的用量，最多同时32个变量)
原始抄表(原始抄表数据明细)"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="defStarttime">默认起始时间</form:label>
					<form:select path="defStarttime">
						<form:option value="currenttime">当前时间</form:option>
						<form:option value="today">今天</form:option>
						<form:option value="yesterday">昨天</form:option>
						<form:option value="firstofweek">本周第一天</form:option>
						<form:option value="firstofmonth">本月第一天</form:option>
						<form:option value="firstofyear">本年第一天</form:option>
						<form:option value="custom">自定义</form:option>
					</form:select>
					<span id="starttimeValueWrap"> <form:input
							path="starttimeValue" /> </span>
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="defEndtime">默认结束时间</form:label>
					<form:select path="defEndtime">
						<form:option value="">无</form:option>
						<form:option value="currenttime">当前时间</form:option>
						<form:option value="today">今天</form:option>
						<form:option value="yesterday">昨天</form:option>
						<form:option value="endofweek">本周最后一天</form:option>
						<form:option value="endofmonth">本月最后天</form:option>
						<form:option value="custom">自定义</form:option>
					</form:select>
					<span id="endtimeValueWrap"> <form:input path="endtimeValue" />
					</span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="tspan">时间间隔</form:label>
					<form:input path="tspan" cssClass="easyui-numberbox" />
					(秒)，默认为一小时
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="defCount">默认结果条数</form:label>
					<form:input path="defCount" />
				</div>
			</div>
		</div>
	</div>


	<div class="ftitle">报表设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="displayReport">开启显示报表</form:label>
					<form:radiobutton path="displayReport" value="true" />
					启用
					<form:radiobutton path="displayReport" value="false" />
					禁用
				</div>
			</div>
		</div>
	</div>

	<div class="ftitle">数据来源</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="buildId">目标建筑</form:label>
					<form:input path="buildId" required="true" />
					<form:hidden path="settingWsUrl" />
					<span class="taglib-icon-help"> <img title="设置数据来源建筑"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="tagids">设备变量ID</form:label>
					<br />
					<c:forTokens var="str" items="${chartsetting.formula}" delims=","
						varStatus="status">
						<label>Serie${status.count}</label>
						<c:forTokens var="entry" items="${str}" delims=":"
							varStatus="entryStatus">
							<c:choose>
								<c:when test="${entryStatus.index==0}">
										名称：<input id="category${status.count}"
										name="category${status.count}" value="${entry}" type="text"  class="taginfo"  />
								</c:when>
								<c:otherwise>
										TagIDs：<input id="serie${status.count}"
										name="serie${status.count}" value="${entry}" type="text"
										style="width: 400px;"  class="taginfo"  />
									<span class="taglib-icon-help"> <img
										title="TagID可以是单个ID,也可以是计算表达式,表达式只支持如下类似格式 (5780*1.2)+(5781*1.3),每个算式之必须使用括号,不支持(5780+5781)*1.2之类的算式"
										src="/html/themes/classic/images/portlet/help.png" /> </span>
									<br />
								</c:otherwise>
							</c:choose>
						</c:forTokens>


						<c:if test="${status.last and status.count<30}">
							<c:forEach var="i" begin="${status.count+1}" end="30" step="1">
								<label>Serie${i}</label> 名称：<input id="category${i}"
									name="category${i}" type="text"  class="taginfo"  /> TagIDs：<input
									id="serie${i}" name="serie${i}" type="text" style="width:400px;"  class="taginfo"   /><span class="taglib-icon-help"> <img
										title="TagID可以是单个ID,也可以是计算表达式,表达式只支持如下类似格式 (5780*1.2)+(5781*1.3),每个算式之必须使用括号,不支持(5780+5781)*1.2之类的算式"
										src="/html/themes/classic/images/portlet/help.png" /> </span>
								<br />
							</c:forEach>
						</c:if>
					</c:forTokens>
				</div>
			</div>
		</div>
	</div>



</form:form>
<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>savePreference()">保存首选项</a>
</div>
<script language="javascript">
	$(function(){
		$("#enUsePyaxisname").hide();
		$("#starttimeValue").datepicker();
		$("#endtimeValue").datepicker();

		$("input[name='usePyaxisname']").click(function(){
			var checked = $("input[name='usePyaxisname']:checked").val();
			if(checked=="true"){
				$("#enUsePyaxisname").show();
				$("#disUsePyaxisname").hide();
			} else {
				$("#enUsePyaxisname").hide();
				$("#disUsePyaxisname").show();
			};
		});
		<c:choose>
			<c:when test="${!empty chartsetting.defStarttime and chartsetting.defStarttime=='custom'}">
				$("#starttimeValueWrap").show();
			</c:when>
			<c:otherwise>
				$("#starttimeValueWrap").hide();
			</c:otherwise>
		</c:choose>
			
		<c:choose>
			<c:when test="${!empty chartsetting.defEndtime and chartsetting.defEndtime=='custom'}">
				$("#endtimeValueWrap").show();
			</c:when>
			<c:otherwise>
				$("#endtimeValueWrap").hide();
			</c:otherwise>
		</c:choose>
		
		$( "#dlgDatasource" ).dialog({
			autoOpen: false
		});
		
		$("#datasrc").click(function() {		
			$("#dlgDatasource" ).dialog("open");
			return false;
		});
		
		<c:choose>
			<c:when test="${chartsetting.dataFormat=='xml'}">
			$("#datasrc").show();
			</c:when>
			<c:otherwise>
			$("#datasrc").hide();
			</c:otherwise>
		</c:choose>

		
		$("#dataFormat").change(function() {
			 var selval = $(this).children('option:selected').val();
			 if(selval=='xml') {
				 $("#datasrc").show();
			 } else {
				 $("#datasrc").hide();
			 };
		});
		
	});
	
	

	
	/**
	* 设置显示和隐藏自定义开始时间
	*/
	 $('#defStarttime').change(function(){
	        var selval = $(this).children('option:selected').val();
	        if(selval=='custom') {
	        	$("#starttimeValueWrap").show();
	        }else {
				$("#starttimeValueWrap").hide();
			};
	    });
	/**
	* 设置显示和隐藏自定义结束时间
	*/
	 $('#defEndtime').change(function(){
	        var selval = $(this).children('option:selected').val();
	        if(selval=='custom') {
	        	$("#endtimeValueWrap").show();
	        }else {
				$("#endtimeValueWrap").hide();
			};
	    });
	
	
	/**
	* 保存首选项信息
	*/
	function <portlet:namespace/>savePreference() {
		$("#chartsetting").form('submit', {
			url:'<%=renderResponse.encodeURL(savePrefUrl)%>',
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
			}
		});
	}

	/**
	* 获取建筑信息列表
	*/
	$("#buildId").combogrid({
		panelWidth:500,
		value:$("#buildId").val(),
		idField:'buildId',
		textField:'buildName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getBuildinfos"></portlet:resourceURL>',
		columns:[[
			{field:'buildId',title:'建筑编号',width:100},
			{field:'buildName',title:'建筑名称',width:100}
		]],keyHandler: {
			up: function(){},
			down: function(){},
			enter: function(){},
			query: function(q){
				$('#buildId').combogrid("grid").datagrid("reload", { 'keyword': q });
	            $('#buildId').combogrid("setValue", q);
			}
		}
	});

</script>
