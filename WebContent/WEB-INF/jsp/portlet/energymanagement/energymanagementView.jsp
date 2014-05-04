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
 <div id="en"  style="height:200px">
   <div class="div-table-row">
    <div class="div-table-col">
			<div class="fitem">
			 <img src="/energymanagesystem/images/icons/sz.png"> 
			               从
				<input id="starttime" name="starttime" class="easyui-datebox">
				<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				至
				<input id="jstime" name="jstime" class="easyui-datebox" >
				<a href="#" class="easyui-linkbutton"
		         onclick="<portlet:namespace/>">确定</a>
			</div>
	</div>
   </div>
    <div class="div-table-row" >
      <div class="div-table-2col" align="center" style="padding-top: 20px">
			<span class="span4">
        <span class="stat circular inline">
            <span id="cs-2" data-provide="circular" data-fill-color="#8DB3E2" data-value=<%=prefs.getValue("bfb","") %>  data-decimals="1" data-radius="36" data-percent="true" data-thickness="8"></span>
   </span>
   </span>
	</div>
	
	<div class="div-table-2col">
	         <p>
	         <div class="fitem" align="center" >
			   <b>能耗目标：</b><p>
			 <font color="#8DB3E2" size=3px> <%=prefs.getValue("nhmb","") %>k kwh</font>
			 </div>
			   <p>
			 <div class="fitem" align="center">  
			   <b>&nbsp&nbsp&nbsp&nbsp&nbsp能源消耗量：</b><p>
			 <font color="#8DB3E2" size=3px><%=prefs.getValue("nyxhl","") %>k kwh</font>
			</div>
			</div>
	  </div>
  </div>
<script type="text/javascript">
var myDate = new Date();
var m = 00;
if(myDate.getMonth()==0){
	m=01;
}
if(myDate.getMonth()==1){
	m=02;
}
if(myDate.getMonth()==2){
	m=03;
}
if(myDate.getMonth()==3){
	m=04;
}
if(myDate.getMonth()==4){
	m=05;
}
if(myDate.getMonth()==5){
	m=06;
}
if(myDate.getMonth()==6){
	m=07;
}
if(myDate.getMonth()==7){
	m=08;
}
if(myDate.getMonth()==8){
	m=09;
}
if(myDate.getMonth()==9){
	m=10;
}
if(myDate.getMonth()==10){
	m=11
}
if(myDate.getMonth()==11){
	m=12;
}

if(myDate.getDate()>=10){
	starttime.value = myDate.getFullYear()+"-"+m+"-"+ myDate.getDate();  
	jstime.value = myDate.getFullYear()+"-"+m+"-"+myDate.getDate();
}
else{
	starttime.value = myDate.getFullYear()+"-"+m+"-"+"0"+ myDate.getDate();  
	jstime.value = myDate.getFullYear()+"-"+m+"-"+"0"+ myDate.getDate(); 
}

</script>

 