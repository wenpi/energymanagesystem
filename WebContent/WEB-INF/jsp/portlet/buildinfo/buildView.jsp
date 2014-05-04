<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-2 下午05:11:56
	LastModified Date:
	Description:
 -->

<div class="div-table">
	<div class="client_pic_zgg"></div>
	<div class="parameter"
		style="background-color:${coreinfo.backgroundColor};">
		<div class="page_header">
			<h1>建筑基本信息</h1>
		</div>
		<h5>${coreinfo.description}</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td>${buildinfo.buildName}</td>
				<td>${buildDistrictName}</td>
				<td><span id="<portlet:namespace />buildarea"></span><sup>m<sup> 2</sup></sup></td>
				<td>${buildinfo.buildYear}</td>
			</tr>
			<tr>
				<td>建筑名称</td>
				<td>地理位置</td>
				<td>建筑面积</td>
				<td>建成年代</td>
			</tr>
			<tr>
				<td>${buildFunction}</td>
				<td>${buildAirtype}</td>
				<td>${buildinfo.buildUpfloor}<sup>层</sup></td>
				<td>69<sup>m<sup></td>
			</tr>
			<tr>
				<td>建筑类型</td>
				<td>空调类型</td>
				<td>建筑层数</td>
				<td>建筑高度</td>
			</tr>
		</table>
	</div>

</div>

<script type="text/javascript">
	//设置顶部的皮肤背景颜色 
	try{
		$('#nav_bg_div').css("background-color", "#086761");
		$('.nav_gat_bar>li').css("background-color", "#075C57");
	}catch(e){}

	// 将建筑面积用js转换成整数
	var area = "${buildinfo.buildTotalarea}";
	$('#<portlet:namespace />buildarea').text(parseInt(area));
</script>