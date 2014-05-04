<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-9 上午08:53:46
	LastModified Date:
	Description:
 -->
<c:choose>
	<c:when test="${empty preferenceModel}">
		<div id="msg" class="portlet-msg-error">请设置模块首选项</div>
	</c:when>
	<c:otherwise>
		<style type="text/css">
div.sc_menu { /* Set it so we could calculate the offsetLeft */
	overflow:scroll
}
ul.sc_menu {
	display: block;

	padding: 1px 0 0 15px;
	/* removing default styling */
	margin: 0;
	list-style: none;
}

.sc_menu li {
	display: block;
	float: left;
	padding: 0 4px;
	border: 1px solid #ccc;
	cursor: pointer;
}

.sc_menu a {
	display: block;
	text-decoration: none;
}

.sc_menu span {
	display: none;
	margin-top: 3px;
	text-align: center;
	font-size: 12px;
	color: #fff;
}

.sc_menu a:hover span {
	display: block;
}

.sc_menu img {
	border: 3px #fff solid;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
}

.sc_menu a:hover img {
	filter: alpha(opacity = 50);
	opacity: 0.5;
}

/* Here are styles for the back button, don't look at them */
#back {
	display: block;
	width: 500px;
	text-align: center;
	color: #003469;
	font-size: 16px;
}
</style>

		<c:choose>
			<c:when test="!{empty preferenceModel.currentsvgs}">
				<div id="tip" class="tip-info" style="margin-bottom: 10px;">
					<div class="op-tip icon-tip">&nbsp;</div>
					<div>请配置模块首选项</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="sc_menu" width="${preferenceModel.width}">
					<ul id="<portlet:namespace/>svgtitle" class="sc_menu">
						<c:forEach items="${preferenceModel.currentsvgs}" var="svg">
							<li><c:out value="${svg}"></c:out>
							</li>
						</c:forEach>
					</ul>
				</div>
				<iframe id="<portlet:namespace/>svg"
					width="${preferenceModel.width}" height="${preferenceModel.height}"
					frameborder="0" marginheight="0" marginwidth="0" scrolling="auto"></iframe>
				<script language="javascript">
					$(function() {
						
						var console = console || {"log":function(){}}
						
						var $svg = $("#<portlet:namespace/>svg");
						var source = "/energymanagesystem/${preferenceModel.svgFolder}/"+ encodeURI('${preferenceModel.currentsvgs[0]}') +".html";
						console.log(source);
						$("#<portlet:namespace/>svg").attr("src",source);
						
						//Get our elements for faster access and set overlay width
						var div = $('div.sc_menu'), ul = $('ul.sc_menu'), ulPadding = 15;
						//Get menu width
						var divWidth = div.width();

						//Remove scrollbars	
						div.css({
							overflow : 'hidden'
						});

						//Find last image container
						var lastLi = ul.find('li:last-child');

						//When user move mouse over menu
						div.mousemove(function(e) {
							//As images are loaded ul width increases,
							//so we recalculate it each time
							var ulWidth = lastLi[0].offsetLeft
									+ lastLi.outerWidth() + ulPadding;
							var left = (e.pageX - div.offset().left)
									* (ulWidth - divWidth) / divWidth;
							div.scrollLeft(left);
						});
					});

					$("#<portlet:namespace/>svgtitle li")
							.click(
									function() {
										var url = '/energymanagesystem/${preferenceModel.svgFolder}/'
												+ $.trim($(this).text()) + '.html';
										console.log("svg url:"+ url);
										$("#<portlet:namespace/>svg",
												parent.document.body).attr(
												'src', url);
									});
				</script>
			</c:otherwise>
		</c:choose>

	</c:otherwise>
</c:choose>


