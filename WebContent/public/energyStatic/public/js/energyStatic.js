$(function(){
	$(".kindpicker").on("click", function(event){
		$(this).find(".kind_select").show();
		event.stopPropagation();
	});

	// $(".kindpicker .kind_select li").on("click", function(event){
	// 	$(".kindpicker li:eq(0)").text($(this).text());
	// 	$(".kind_select").hide();
	// 	$(".")
	// 	event.stopPropagation();
	// });

	// $(".kindpicker .kind_select li").each(function(index){
	// 	$(this).on("click", function(event){
	// 		console.log(index);
	// 		console.log($(".kindpicker .kind_select li").length);
	// 		console.log($(this));
	// 		var $thisdomPar = $(this).parent().parent();
	// 		$thisdomPar.siblings().text($(this).text());
	// 		$thisdomPar.hide();
	// 		$(this).parentsUntil(".chart_bottom_content").find(".switch_picker div").removeClass("cur");
	// 		$($(this).parentsUntil(".chart_bottom_content").find(".switch_picker div")[index]).addClass("cur");
	// 		event.stopPropagation();
	// 	});
	// })

	$(".energy_chart").each(function(){
		$(this).find(".kind_select li").each(function(index){
			$(this).on("click", function(event){
				var $thisdomPar = $(this).parent().parent();
				$thisdomPar.hide();
				$thisdomPar.parent().parent().parent().find(".switch_picker div").removeClass("cur");
				$($thisdomPar.parent().parent().parent().find(".switch_picker div")[index]).addClass("cur");		
				event.stopPropagation();
			})			
			
		})
	})

	document.onclick = function(){
		$(".kind_select").hide();
	}

	$(".btn_group div").on("click", function(){
		$(this).siblings().removeClass("btn_press");
		$(this).addClass("btn_press");
	});

	// $('#datetimepicker input').on("focus", function(event){
	// 	$("#datetimepicker").datetimepicker();
	// 	$(this).parent().find(".add-on").trigger("click");
	// 	event.stopPropagation();
	// })

// 	$('#datepicker').datepicker({
//     format: 'mm-dd-yyyy'
// });
})