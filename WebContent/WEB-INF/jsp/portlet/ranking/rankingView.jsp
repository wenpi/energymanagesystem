<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-12 下午04:39:53
	LastModified Date:
	Description:
 -->

<div class="rankingContainer">
	<div id="buildtypeTabs" class="buildTypes">
		<ul>
		</ul>
	</div>
	<div id="energytypes" class="energytypes">
		<ul>
			<li><span>电耗</span></li>
			<li><span>水耗</span></li>
			<li><span>气耗</span></li>
			<li><span>其它</span></li>
		</ul>
	</div>
	<div>
		<ol id="buildlist">
		</ol>
	</div>
	
	
</div>

<script type="text/javascript">
<!--
	$(function() {
		//load build types list
		var resUrl = '<portlet:resourceURL id="getDictitemByGroupcode"></portlet:resourceURL>';
		$.post(resUrl, {
			groupCode : 'build_function'
		}, function(data) {
			$.each(data, function(index, rows) {
				$.each(rows, function(index, dict) {
					$('#buildtypeTabs ul').append(
							$('<li>').append(
									$('<a>').attr('href',
											'#tabs-' + dict.itemCode).attr('id',dict.itemCode)
											.append($('<span>').append(dict.itemShortname)))
											);    
				});
			});
			$('#buildtypeTabs ul').append(
					$('<li>').append(
							$('<a>').attr('href', '#tabs-0').attr('id','0').append($('<span>').attr('class', 'current').append("全部"))));
			
			setBuildlist(0);
			
			
			
			//set build type item's class
			$("#buildtypeTabs li a").click(function() {
				//alert(this.id);
				var tab = $(this).attr('href');
				$("#buildtypeTabs li span").removeClass("current");
				$(this).children("span").addClass("current");
				$(tab).show();
				
				setBuildlist(this.id);
			});	
			
		}, 'json');

		//set energy type item's class 
		$("#energytypes li").click(function() {
			$("#energytypes li span").removeClass("current");
			$(this).children("span").addClass("current");
			
		});
		
	});
	
	function setBuildlist(typeid) {
		$.post('<portlet:resourceURL id="getRankingByBuildfunc"></portlet:resourceURL>', {
			buildfunc : typeid
		}, function(data) {
			$('#buildlist li').remove();
			$.each(data, function(index, build) {
				$('#buildlist').append($('<li>').append($('<a>').attr('href','ss').append(build.buildName)));
			});
			
		});
	}

	
//-->
</script>
