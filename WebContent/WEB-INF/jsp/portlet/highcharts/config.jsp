<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>


<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>
<div id="msg">${errorMsg}</div>

<form:form commandName="reportSetting" id="<portlet:namespace/>ConfigForm" method="post" class="" action="#">
	<div class="ftitle">
		图表常规设置 <span class="title-back"><a
			href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
		</span>
	</div>
	<div>
		
		<div>
		配置：
			<br> 类型：<input name="${cf.chart.type}" value="${cf.chart.type}" type="text" 
			 class="taginfo" style="width: 400px;" />
			<br> 宽<input name="${cf.chart.width}" value="${cf.chart.width}" type="text" 
			 class="taginfo" style="width: 400px;" />
			 <br>高<input name="${cf.chart.height}" value="${cf.chart.height}" type="text" 
			 class="taginfo" style="width: 400px;" />
			 
			<br>标题 <input name="${cf.title.text}" value="${cf.title.text}" type="text" 
			 class="taginfo" style="width: 400px;" />
 
			 
			<br>x轴标刻类型 <input name="${cf.xAxis.categoType}" value="${cf.xAxis.categoType}" type="text" 
			 class="taginfo" style="width: 400px;" />
			<br>标刻展示步长 <input name="${cf.xAxis.labels.step}" value="${cf.xAxis.labels.step}" type="text" 
			 class="taginfo" style="width: 400px;" /> 
			 
			<br>y轴标刻名称 <input name="${cf.yAxis.title.text}" value="${cf.yAxis.title.text}" type="text" 
			 class="taginfo" style="width: 400px;" />
			<br>y轴最小值 <input name="${cf.xAxis.title.min}" value="${cf.yAxis.title.min}" type="text" 
			 class="taginfo" style="width: 400px;" /> 
			 <br>y轴最大值<input name="${cf.xAxis.title.max}" value="${cf.yAxis.title.max}" type="text" 
			 class="taginfo" style="width: 400px;" />
			 
		</div>
	</div> 
  


</form:form>
<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>savePreference()">保存首选项</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>

<script type="text/javascript">
 function <portlet:namespace/>savePreference(){
	 $("#<portlet:namespace/>ConfigForm").submit();
	 
 }
</script>
  
  		
 