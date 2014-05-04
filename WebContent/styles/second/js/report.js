$(function(){
	$(".chart_switch_btn").on("click", function(){
		$(this).siblings().removeClass("btn_press");
		$(this).addClass("btn_press");
	});

	$(".slides").slidesjs({
		width: 700,
		height: 104,
		play: {
			active: false,
			auto: false,
			interval: 4000,
			swap: true,
			pauseOnHover: true,
			restartDelay: 2500
		},
		navigation: {
			active: true,
			effect: "slide"
		},
		pagination: {
			active: false,
			effect: "slide"
		},
		effect: {
			slide: {
				speed: 1000
			},
			fade: {
				speed: 1800,
				crossfade: true
			}
		}
	});
	$('.selectpicker').selectpicker({
		"width" : "70px"
	});

	$('.selectpicker_2').selectpicker({
		"width" : "95px"
	});
	

});