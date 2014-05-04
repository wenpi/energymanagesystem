<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 淘宝城全息图建筑选择 --%>
<div class="span12 taobao_holograph bet3">
	<div class="taobao_p1">P1</div>
	<div class="taobao_t1">T1</div>
	<div class="taobao_t2">T2</div>
	<div class="taobao_t3">T3</div>
	<div class="taobao_t4">T4</div>
	<div class="taobao_t5">T5</div>
	<div class="taobao_a1">A1</div>
	<div class="taobao_p2">P2</div>
</div>

<script type="text/javascript">
	var jsonData = null;
	function createTaobaoHolographicDom(hoverName) {
		var _name = 'S7_temp_display_OUTDOOR_TEMP,electricity,cooling_capacity', _id = 'chiller,total,chiller', _ispd = '3,0,0', _att = 'value,value,value'; //建筑对应的name、id、ispd 
		var url = '<portlet:resourceURL id="getValueListByNamesAndAtts"></portlet:resourceURL>&from='
				+ '2013-06-05&name='
				+ _name
				+ "&id="
				+ _id
				+ "&ispd="
				+ _ispd
				+ "&att=" + _att + "&type=day&decimals=0";
		$.ajax({
			type : "POST",
			url : url,
			async : false,
			success : function(result) {
				jsonData = result.data;
				renderTaoBaoDom(hoverName);
			}
		});
	}

	function renderTaoBaoDom(hoverName) {
		$div = $("<div/>").css("opacity", 1).css({
			"font-size" : "18px",
			"color" : "#fff"
		});//全息图 hover弹出层css调整    
		$div.addClass(hoverName + "x");
		$(".taobao_holograph").append($div);

		$divTitle = $("<div/>", {
			text : hoverName + "号楼",
			class : "divTitle"
		}).appendTo($div);

		$divContent = $(
				"<div/>",
				{
					html : "<table class='para_tab'><tr><td class='lt_word'>人数"
							+ "</td><td>" + jsonData[0] + "人</td></tr>"
							+ "<tr><td class='lt_word'>当日耗电量" + "</td><td>"
							+ jsonData[1] + "kWh</td></tr>"
							+ "<tr><td class='lt_word'>当日耗冷量" + "</td><td>"
							+ jsonData[2] + "kw</td></tr></table>",
					class : "taobao_divContent"
				}).appendTo($div);
	}
</script>