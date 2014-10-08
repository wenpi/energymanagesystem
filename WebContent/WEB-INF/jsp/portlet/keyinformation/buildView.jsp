<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-11-29 下午5点46分
	LastModified Date:
	Description: 建筑基本信息
 -->

<div class="build_des pic_width" 
	 style="background-color:${tbinfo.backgroundColor};">
	<table>
		<caption>建筑基本信息</caption>
		<tr>
			<td>${buildinfo.buildName}</td>
			<td>${buildFunction}</td>
			<td>8<sup>栋</sup></td>
		</tr>
		<tr>
			<td>建筑名称</td>
			<td>建筑类型</td>
			<td>建筑数量</td>
		</tr>
		<tr>
			<td>${buildAirtype}</td>
			<td><span id="<portlet:namespace />buildarea"></span><sup>m²</sup></td>
			<td>${buildinfo.buildYear}</td>
		</tr>
		<tr>
			<td>空调类型</td>
			<td>建筑面积</td>
			<td>建成年代</td>
		</tr>
	</table>
</div>

<script type="text/javascript">
	// 将建筑面积用js转换成整数
	var area = "${buildinfo.buildTotalarea}";
	$('#<portlet:namespace />buildarea').text(parseInt(area));
</script>