$(function(){ 
	$(".data>p:eq(0)").text(getDate());

	$('#slides').slidesjs({
		width: 700,
		height: 44,
		play: {
			active: false,
			auto: true,
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

});
function getDate(){
	var date = new Date();
	var md = date.toLocaleDateString();
	var originalWeek = date.getDay();
	var compDate;
	var disWeek;
	
	switch(originalWeek){
		case 1 :
			disWeek = "星期一";
			break;
		case 2 :
			disWeek = "星期二";
			break;
		case 3 :
			disWeek = "星期三";
			break;
		case 4 :
			disWeek = "星期四";
			break;
		case 5 :
			disWeek = "星期五";
			break;
		case 6 :
			disWeek = "星期六";
			break;
		case 7 :
			disWeek = "星期日";
			break;
		default :
			return false;
	}
	compDate = md + ' ' + disWeek;
	return compDate;
}
