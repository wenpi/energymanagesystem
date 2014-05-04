<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="span12 holograph">
	<div class="chinaArts_m0">0M</div>
	<div class="chinaArts_m5">5M</div>
	<div class="chinaArts_m33">33M</div>
	<div class="chinaArts_m41">41M</div>
	<div class="chinaArts_m49">49M</div>
</div>
<portlet:resourceURL id="json" var="jsonHolographicDataURL">
</portlet:resourceURL>

<script type="text/javascript">
	// 鼠标浮到49M这样的地方，渲染的效果  
	function createHolographicDom(hoverName) {
		var date = new Date();
		var _name = 'electricity', _id = hoverName, _ispd = '0', _att = 'value'; //建筑对应的name、id、ispd 
		var url = '<portlet:resourceURL id="getValueListByNamesAndAtts"></portlet:resourceURL>&from='
				+ (date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date
						.getDate())
				+ '&name='
				+ _name
				+ "&id="
				+ _id
				+ "&ispd=" + _ispd + "&att=" + _att + "&type=day&decimals=0";
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			success : function(result) {
				jsonData = result.data;
				renderDom(hoverName);
			}
		});
	}
</script>
<script>
	function renderDom(hoverName) {
		$div = $("<div/>").css("opacity", 1).css({
			"font-size" : "18px",
			"color" : "#fff"
		});//全息图 hover弹出层css调整    

		$div.addClass("m" + hoverName.toLowerCase() + "x");
		$(".holograph").append($div);

		$divTitle = $("<div/>", {
			text : hoverName + "",
			class : "divTitle"
		}).appendTo($div);
		upper = hoverName.toUpperCase();
		$divContent = $(
				"<div/>",
				{
					html : "<table class='para_tab'><tr><td class='lt_word'>当日耗电量</td><td>"
							+ jsonData[0] + "kWh</td></tr></table>",
					class : "divContent"
				}).appendTo($div);
	}
</script>
