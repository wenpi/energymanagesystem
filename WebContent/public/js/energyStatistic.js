var tb = tb = tb || {};

$(function(){
	$(".link_total_energy>i").click(function(){
		$(this).parent().parent().parent().removeClass("cur");
		$(".itemize").parent().addClass("cur");
	})

});