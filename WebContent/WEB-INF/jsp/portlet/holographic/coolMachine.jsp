<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="span12 switch_device">
<%-- 冷机 --%>
<%@ include file="detectCoolMachine.jsp"%>
<%-- 水系统 --%>	
<%@ include file="detectWaterSys.jsp"%>	 
<%-- 冷却泵--%>		           	
<%@ include file="detectCoolingPump.jsp"%>	
<%-- end冷却泵--%>			           	
<%-- 冷冻泵--%>
<%@ include file="detectSealmPump.jsp"%> 
<%-- end冷冻泵--%>
<%-- 冷却塔--%>		           	
<%@ include file="detectCoolingTower.jsp"%>
<%-- end冷却塔--%>
</div>
<script type="text/javascript">
var csTFrom=prettyFrom;  
var csTTo;
var csMachineId;
var csType="day";

</script>		        
<script type="text/javascript">
 
function dateFormater(type,val) {  
	format="";
	switch(type){
	case 'day': format='%H:%M';break;
	case 'week':format='%m/%d';break;
	case 'month':format='%m/%d';break;
	}
  	
    return  Highcharts.dateFormat(format, val); 
} 

function getDateStart(start,type){
	//alert(csTFrom);
		parseDate = new Date(start);
      switch(type){
       
      case 'month':
		parseDate.setDate(1);
		break;
      case 'week':
    	  minus=parseDate.getDay();
    	  parseDate.setDate(parseDate.getDate()-minus+1);
    	  break;
      
      }  
      //alert(parseDate);
    return parseDate.getTime();
}
 
</script>
  


		        

