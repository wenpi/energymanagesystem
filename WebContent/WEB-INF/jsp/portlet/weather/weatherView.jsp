<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-2 下午05:11:56
	LastModified Date:
	Description:
  -->
<div id="fate"> 
<c:if test="${!empty errmsg}"></c:if>
<c:choose>
	<c:when test="${!empty errmsg}">
		<div id="tip" class="tip-info" style="margin-bottom: 10px;">
			<div class="op-tip icon-tip">&nbsp;</div>
			<div>${errmsg}</div>
		</div>
	</c:when>
	<c:otherwise>
		<table style="padding: 4px 0 0" cellspacing="0">
			<tbody>
				<tr>
					<c:forEach var="entry" items="${weathers}" begin='0' end='0'>
						<td style="vertical-align: center; padding-right: 10px"
							rowspan="5"><img width="40" height="40" src= ${fn:split(entry.icon,"_")[0]}  
							border="0" style="margin-right: 3px; vertical-align: top">
							<c:if
	                       test="${fn:split(entry.icon,'_')[1]!='/energymanagesystem/images/weather/b99.gif'}">	
							            <img width="40" height="40" src= ${fn:split(entry.icon,"_")[1]}  
							border="0" style="margin-right: 3px; vertical-align: top">
						</c:if>		 
						</td>
					</c:forEach>
					<c:forEach var="entry" items="${weathers}" begin='0' end='0'>
						<td
							style="font-size: 140%; white-space: nowrap; vertical-align: top; padding-right: 15px; font-weight: bold"
							rowspan="2">${entry.conditionTemp_h}°C~${entry.conditionTemp_l}°C</td>
					</c:forEach>
					<td style="width: 5px; border-left: solid 1px #d8d8d8" rowspan="5"></td>
					<c:forEach var="entry" items="${weathers}" begin='1' end='${fate}'>
						<td style="vertical-align:top" align="center" colspan="2">${entry.week}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="entry" items="${weathers}" begin='1' end='${fate}'>
						<td style="text-align: center" rowspan="3" colspan="2"><img
							width="20" height="20" src=${fn:split(entry.icon,"_")[0]} 
							title=${ entry.wind_condition } alt=${entry.wind_condition}
							border="0"
							style="vertical-align: top; margin: 0 0px">
						<c:if
	                       test="${fn:split(entry.icon,'_')[1]!='/energymanagesystem/images/weather/b99.gif'}">		
							<img
							width="20" height="20" src=${fn:split(entry.icon,"_")[1]} 
							title=${ entry.wind_condition } alt=${entry.wind_condition}
							border="0"
							style="margin-right: 3px; vertical-align: top;">
						</c:if>	
						</td>
					</c:forEach>
				</tr>
				
				<tr>
					<c:forEach var="entry" items="${weathers}" begin='0' end='0'>
						<td style="white-space: nowrap; padding-right: 15px; color: #666">${entry.wind_condition}</td>
					</c:forEach>
				</tr>
				
				<tr>
					<c:forEach var="entry" items="${weathers}" begin='0' end='0'>
						<td style="white-space: nowrap; padding-right: 15px; color: #666">${entry.week}</td>
					</c:forEach>
				</tr>
				
				<tr>
				    <c:forEach var="entry" items="${weathers}" begin='0' end='0'>
				    <td style="white-space: nowrap; padding-right: 15px; color: #666">${entry.humidity}</td>
				    </c:forEach>
					<c:forEach var="entry" items="${weathers}" begin='1' end='${fate}'>
						<td style="vertical-align:top ; " align="center" colspan="2">${entry.humidity}
						</td>
					</c:forEach>
				</tr>
				<tr >
				        <td style="white-space:nowrap;padding-right:25px;vertical-align:top;color:#666"></td>
				         <td 
				         style="white-space:nowrap;padding-right:25px;vertical-align:top;color:#666"></td>
				         <td 
				         style="white-space:nowrap;padding-right:25px;vertical-align:top;color:#666"></td>
					<c:forEach var="entry" items="${weathers}" begin='1' end='${fate}'>
						<td
							style="text-align: right; white-space: nowrap; padding-left: 5px; padding-right: 2px; vertical-align: top; color: #666">${entry.conditionTemp_h}~</td>
						<td
							style="text-align: left; white-space: nowrap; padding-left: 2px; padding-right: 5px; vertical-align: top; color: #666">${entry.conditionTemp_l}°C</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</c:otherwise>
</c:choose>
</div>







