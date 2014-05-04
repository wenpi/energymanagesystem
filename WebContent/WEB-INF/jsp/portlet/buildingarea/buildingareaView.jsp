<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<div class="div-table">
	<div clas="div-table-row">
	<div class="div-cols-w25" style="height:100%;min-height: 100%;">
		<div class="accordion" id="<portlet:namespace/>buildregion" style="margin-left:10px;">
			<c:if test="${!empty parentRegions}">
				<c:forEach items="${parentRegions}" var="region" varStatus="status">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"  onclick="<portlet:namespace/>showRegion('${region.regionId}','${region.regionImage}');"
								data-parent="#<portlet:namespace/>buildregion" href="#${region.regionId}">
								${region.regionName} </a>
						</div>
						<div id="${region.regionId}" class="accordion-body collapse <c:if test="${status.index eq 0}">in</c:if>">
							<div class="accordion-inner">
							<c:if test="${!empty region.buildregioninfos}" >
							<ul class="nav nav-list">
							<c:forEach items="${region.buildregioninfos}" var="area" varStatus="areaStatus">
								<li><a href="#" id="${area.regionId}" src="${area.regionImage}">${area.regionName}</a></li>
							</c:forEach>
							</ul>
							</c:if>
							</div>
						</div>
					</div>

				</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="div-cols-w75" style="min-height:500px;line-height:500px;">
	<c:if test="${!empty parentRegions}">
			<img id="regionImage" alt="" src="${parentRegions[0].regionImage}"
				width="100%">
		</c:if>
	</div>
	</div>
</div>



<script language="javascript">
	$(function(){
		
		var elem = $("#<portlet:namespace/>buildregion .accordion-inner li a");
		
		$(elem).click(function(){
			if($(elem).parent().hasClass('active')) {
				$(elem).parent().removeClass('active');
			};
			$(this).parent().addClass('active');
			
			var regionImage = $(this).attr("src");
			$("#regionImage").attr({
				src : regionImage,
				width : '100%',
				height : '100%'
			});

		});
		
	});

	function <portlet:namespace/>showRegion(regionId, regionImage) {
		$("#regionImage").attr({
			src : regionImage,
			width : '100%',
			height : '100%'
		});
	}

</script>