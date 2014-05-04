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
   #shezhi {margin-left:30px;}
</style>
    <div class="div-table">
        <div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
				  <img src="/energymanagesystem/images/icons/sz.png">   时间段：         <%=prefs.getValue("starttime","")%> — <%=prefs.getValue("jstime","")%>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
			     <div class="fitem">
				              人均耗能：<b><%=prefs.getValue("rjhn","") %> kwh/m³.a</b>
				    <p>
				               建筑平均耗能：<b><%=prefs.getValue("jzpjhn","") %> kwh/m³.a</b>
				  </div>  
			</div>
			<div class="div-table-2col">
				   <div class="fitem" style="padding-left: 50px; ">
		<c:forEach  begin='1' end='${xj}'>
						<td style="white-space: nowrap; padding-right: 15px; color: #666"><img src="${addfilePath}"></td>
		</c:forEach>
		            </div>
			</div>
		</div>
		<div id="shezhi" >
			<div class="div-table-2col">
				 <b>总节能量：</b><font color="#8DB3E2" size=15px><%=prefs.getValue("zjnl","") %>tce</font>
			</div>
			<div class="div-table-2col">
				  <b>总碳排放减少量：</b><font color="#8DB3E2" size=15px><%=prefs.getValue("ztpfjsl","") %>t</font>
			</div>
		</div>
</div>	
<script type="text/javascript">
	
</script>

 