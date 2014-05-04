<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
  ${configJson}		
 <div id="<portlet:namespace />hichcharts"  ></div>
  
 <script type="text/javascript">
function initHighcharts<portlet:namespace />(){
	$('#<portlet:namespace />hichcharts').highcharts(
		${configJson}		
	);
	
}
</script>
 	
<script type="text/javascript">
$(function(){
	initHighcharts<portlet:namespace />();
})
</script> 