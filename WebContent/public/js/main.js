var tb = tb = tb || {};

$(function(){
	$(".client_para>tbody>tr:even").addClass("big_tr");

	$(".navigation>li:gt(1)").css("float", "right" , "margin-right", "15px");

	$(".press_effect").css("color","#f00");



	$(".pulldown_list>li:gt(0)").addClass("poping").hide();
	$(".pulldown_list>li:eq(0)").hover(function(){
		$(this).siblings().show();
	},function(){
		$(this).siblings().hide();
	});

});

function getParam(pname) { 
    var params = location.search.substr(1); // 获取参数 平且去掉？ 
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        //只有一个参数的情况 
        return params.split('=')[1]; 
    } 
    else { 
         //多个参数参数的情况 
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  
$(function() { 
    var mao = $("#" + getParam("div_b")); //获得锚点 
    if (mao.length > 0) {//判断对象是否存在 
        var pos = mao.offset().top; 
        var poshigh = mao.height(); 
        $("html,body").animate({ scrollTop: pos-poshigh-30 }, 3000); 
    } 
});  