var tb = tb = tb || {};

$(function(){
	$("tr:even").addClass("big_tr");

	$(".navitagion>li:gt(1)").css("float", "right" , "margin-right", "15px");

	$(".classify>ul>li").each(function(index){
		$(this).hover(function(){
			$(this).stop(true,true).fadeOut();$(this).stop(true, true).fadeIn();
		})
		$(this).click(function(){
			var $swapdom = $('#swap_info>div');
			$swapdom.each(function(){
				$(this).removeClass("cur").hide();
			});
			var $dom = $swapdom[index];
			$($dom).show();
		})
	});

	// $(".holograph>div").hover(function(index){
	// 	var temp = $(this).text();
	// 	// console.log(temp);
	// 	// console.log(typeof temp);
	// })
	var content;
	$(".holograph>div").hover(function(index){
		content = $(this).text();
		// // console.log(content);
		
		switch(content) {
			case "P1" : 
				createHolographicDom(content);
				break;
			case "T1-T2" :
				createHolographicDom(content);
				break;
			case "A1" :
				createHolographicDom(content);
				break;
			case "T3-T5" :
				createHolographicDom(content);
				break;
			case "P2" :
				createHolographicDom(content);
				break;
			default : 
				return false;
		}
	},function(){
		//// console.log(content);
		$("." + content + "x").hide();
	});

	// $(".floor>li").click(function(){
	// 	// console.log($(this).text());
	// });

	$(".floor>li").each(function(index){
		$(this).click(function(){
			var $devicedom = $("#all_device>div");
			$devicedom.css("display", "none");
			if (!($devicedom.attr("class"))) {
				$devicedom.addClass("device" + index);
			};
			// // console.log(index);
			var devicedom = $("#all_device>div")[index];
			// // console.log(index);
			$(".device"+index).click(function(){
				alert("123");
			})
			// // console.log(devicedom);
			$(devicedom).show();
		});

	})
	var deviceL = $("#all_device>div").length;
	// // console.log(deviceL);
	// var len = $("#swap_info>div").length;
	// // console.log(s[0]);
	
	// $(".cold_classify").append($colddomTitle);
	//var mk = $(".device_title")[0];
	var arr1=new Array();
	var arr2=new Array();
	var arr3=new Array();
	var tabArr = new Array();
	var turnName;
	$(".device_title").each(function(){
	    arr1.push($(this).find("li:gt(0)"));
	    arr2.push($(this).find("li:eq(0)"));
	    arr3.push($(this).find("li:eq(1)"));
	  });
	for (var i = 0; i < arr1.length; i++) {
		arr1[i].css({"float":"right","margin-right": "10px"});
		arr2[i].css({"font-size": "20px","cursor": "pointer"}).click(function(){
			var clsNames = $(this).parent().parent().attr("class").split(" ");
			var clicName = $(this).text();
			turnName = clsNames[1] + clicName;
			// console.log(turnName);
			// 跳转页面函数
			//turnPage(turnName);
		});
		// console.log(turnName);
		arr3[i].css("font-size", "20px");
	};
	
	$(".tbod").each(function(){
		tabArr.push($(this).find("tr:eq(1)"));
	})
	for (var i = 0; i < tabArr.length; i++) {
		tabArr[i].css("font-size","14px");
	};

});

function createHolographicDom(hoverName){
	$div = $("<div/>");
	$div.addClass(hoverName+"x");
	$(".holograph").append($div);
};

// function turnPage(pageName){
// 	switch(pageName){
// 		case "cold_title冷机" :
// 			$(".").show();
// 			break;
// 		case "air_title一层" :
// 			$(".").show();
// 			break;
// 		case "terminal_title一层" :
// 			$(".").show();
// 			break;
// 		case "blowers_title送风机" :
// 			$(".").show();
// 			break;
// 			.
// 			.
// 		default :
// 			return false;
// 	}
// }
var bgclolr = [""]