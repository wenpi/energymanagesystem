<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-13 下午02:33:39
	LastModified Date:
	Description:
 -->
<div class="buildlistContainer">
	<div class="techtabs" id="<portlet:namespace />tabs">
	<ul id="<portlet:namespace />techtabs">
		<li><a href="#<portlet:namespace />tabs-1"><span>太阳能发电</span></a></li>
		<li><a href="#<portlet:namespace />tabs-2"><span>太阳能热水</span></a></li>
		<li><a href="#<portlet:namespace />tabs-3"><span>热泵系统</span></a></li>
		<li><a href="#<portlet:namespace />tabs-4"><span>雨水回水</span></a></li>
		<li><a href="#<portlet:namespace />tabs-5"><span>杂排水处理</span></a></li>
		<li><a href="#<portlet:namespace />tabs-0"><span class="current">全部</span></a></li>
	</ul>
	<div style="border-bottom:2px solid #52A2BE;clear:both;">
	</div>
	</div>
	<div id="<portlet:namespace />tabs-0" class="mytab">
		<ol>
			<li>上海城建国际大厦</li>
			<li>世博中国馆</li>
			<li>淘宝城</li>
			<li>圆融大厦</li>
			<li>天津生态城</li>
			<li>国家体育场</li>

		</ol>
	</div>
	<div id="<portlet:namespace />tabs-1" class="mytab">
		<ol>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ol>
	</div>
	<div id="<portlet:namespace />tabs-2"  class="mytab">
		<ol>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ol>
	</div>
	<div id="<portlet:namespace />tabs-3" class="mytab">
		<ol>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ol>
	</div>
	<div id="<portlet:namespace />tabs-4" class="mytab">
		<ol>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ol>
	</div>
	<div id="<portlet:namespace />tabs-5"  class="mytab">
		<ol>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ol>
	</div>
	
<div style="clear:both"></div>
</div>

<script type="text/javascript">
<!--
$(function() {
	$(".mytab").hide();
	$("#<portlet:namespace />tabs-0").show();
	$(".techtabs li a").click(function() {
		$(".mytab").hide();
		var tab = $(this).attr('href');
		$(".techtabs li span").removeClass("current");
		$(this).children("span").addClass("current");
		$(tab).show();
	});
});

//-->
</script>


