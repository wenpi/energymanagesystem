$(function() {

	// 界面初始化
	try { // 此处，可能会报错！
		// equipmentDetectionDataInit();
	} catch (e) {
	}

	$("#detectView").show();

	// 移除报表页面的tr标签的big_tr样式
	$("tr:even").removeClass("big_tr");

	// 设备监测，全息图 切换绑定
	$(".classify>ul>li").each(function(index) {

		// $(this).hover(function(){
		// // $(this).stop(true,true).fadeOut();$(this).stop(true,
		// true).fadeIn();
		// $(this).css("color","#00f");
		// },function(){
		// $(this).css("color","#333");
		// });
		$(this).click(function() {
			$(this).siblings().removeClass("highlight");
			$(this).addClass("highlight");
			var $swapdom = $('#swap_info>div');
			$swapdom.each(function() {
				$(this).removeClass("cur").hide();
			});
			var $dom = $swapdom[index];
			$($dom).show();
			$('#topDoubleChart').show(); // 显示顶部的两个图表
			$(".inner_content:eq(0)").show();
			$(".inner_content:eq(0)~div").hide();

			$('#all_region_view').show(); // 显示“园区全息图”div
			if (!isNotChinaArts) { // 淘宝城项目
				$('#tb_build_list').show(); // 隐藏全息图中的，顶部建筑列表
				$('#taobao_holo').show(); // 隐藏全息图中的淘宝城的模型图
				$('#chinaArts_holo').hide(); // 显示全息图中的中国馆的模型图
				$('#quanxitu').height(1150);// 设置高度，目的是为了完整的显示版权信息
			} else { // 中国馆项目需要隐藏部分内容
				$('#tb_build_list').hide(); // 隐藏全息图中的，顶部建筑列表
				$('#taobao_holo').hide(); // 隐藏全息图中的淘宝城的模型图
				$('#chinaArts_holo').show(); // 显示全息图中的中国馆的模型图
				$('#quanxitu').height(900);// 设置高度，目的是为了完整的显示版权信息
			}
		});
		// 全息图上方图表
		initHoloOverViewTopChart();
	});

	// 全息图 hover弹出层css调整
	// $(".holograph>div:gt(4)").css("font-size", "16px");
	$(".device_test").click(function() {
		// 设置模块的高度，以适应版权的高度(zzx于20130924增加，解决公司版权位置显示问题)
		$("#swap_info").height(811);
		$('#devicemonitor_formdiv').height(800);
		$('#hrefFm').height(0);

		$(".overview").show();
		$(".overview").siblings().hide();
	});

	// 中国馆项目，鼠标悬浮到对应M上创建浮层
	var content;
	$(".holograph>div").hover(function(index) {
		content = $(this).text();
		createHolographicDom(content);
	}, function() {
		// 隐藏全息图提示
		$("." + content.toLowerCase() + "x").hide();
		$(".m" + content.toLowerCase() + "x").hide();
	});

	// 淘宝城项目，鼠标悬浮到对应建筑群上创建浮层
	var content;
	$(".taobao_holograph>div").hover(function(index) {
		content = $(this).text();
		createTaobaoHolographicDom(content);
	}, function() {
		// 隐藏全息图提示
		$("." + content + "x").hide();
		$(".m" + content + "x").hide();
	});

	/**
	 * 设备监测事件绑定
	 */
	$(".floor>li").each(function(index) {
		$(this).click(function() {
			// 设备监测数据初始化
			// equipmentDetectionDataInit();

			// console.log($(this).text() + "`index:" + index + "`");

			// 记录选择的建筑号,任然有用，但暂时屏蔽
			$(this).siblings().removeClass("highlight");
			$(this).addClass("highlight");

			$("#detectView").show();
			// var $devicedom = $("#all_device>div");
			// $devicedom.css("display", "none");
			// console.log("class--" + $devicedom.attr("class"));
			// if (!($devicedom.attr("class"))) {
			// $devicedom.addClass("device" + index);
			// }
			// ;
			// console.log($("#all_device>div"));
			// var devicedom = $("#all_device>div")[index];
			// console.log(index);
			// console.log(devicedom);
			// 如果不同建筑展现方式不同，则启用下面的方法转换到不同节点
			// $(devicedom).show();

		});

	});

	/**
	 * 淘宝城全息图上切换建筑触发的事件
	 */
	$(".taobao_overView>li").each(function(index) {
		$(this).click(function() {
			// 记录选择的建筑号,任然有用，但暂时屏蔽
			$(this).siblings().removeClass("highlight");
			$(this).addClass("highlight");
		});
	});

	// var deviceL = $("#all_device>div").length;
	// console.log(deviceL);
	// var len = $("#swap_info>div").length;
	// console.log(s[0]);

	// $(".cold_classify").append($colddomTitle);
	// var mk = $(".device_title")[0];
	var arr1 = new Array();
	var arr2 = new Array();
	var arr3 = new Array();
	var tabArr = new Array();
	var turnName;
	$(".device_title").each(function() {
		arr1.push($(this).find("li:gt(0)"));
		arr2.push($(this).find("li:eq(0)"));
		arr3.push($(this).find("li:eq(1)"));
	});
	for ( var i = 0; i < arr1.length; i++) {
		arr1[i].css({
			"float" : "right",
			"margin-right" : "10px"
		});
		arr2[i].css({
			"font-size" : "20px",
			"cursor" : "pointer"
		}).click(function() {
			var clsNames = $(this).parent().parent().attr("class").split(" ");
			var clicName = $(this).text();
			turnName = clsNames[1] + clicName;
			turnModule(turnName);
		});
		arr3[i].css("font-size", "20px");
	}
	;

	$(".tbod").each(function() {
		tabArr.push($(this).find("tr:eq(1)"));
	})
	for ( var i = 0; i < tabArr.length; i++) {
		tabArr[i].css("font-size", "14px");
	}

	// 中国馆 运行监测-全息图-49m(类似的地方)点击事件
	$(".holograph>div").each(function(index) {
		$(this).click(function() {
			var className = $(this).attr("class");

			$(".module").show();
			$(this).parent().parent().hide();
			$(".bet2>li").css("color", "#666"); // 设置颜色
			$(".build_para>div").hide();
			buidlPara(className, $(this).context.innerText);// 初始化全息图细节
		});
	});
	
	// 淘宝城 运行监测-全息图-T1(类似的地方)点击事件
	$(".taobao_holograph>div").each(function(index) {
		$(this).click(function() {
			var className = $(this).attr("class");
			$(".module").show();
			$(this).parent().parent().hide();
			$(".bet2>li").css("color", "#666"); // 设置颜色
			$(".build_para>div").hide();
			buidlPara(className, $(this).context.innerText);// 初始化全息图细节
		});
	});

	$(".bet2>li:gt(0)").click(function() {
		var buildName = $(this).attr("class");
		$(".build_para>div").hide();
		buildSwap(buildName);
		$(this).siblings().css("color", "#666")
		$(this).css("color", "#00f");
	});

	$(".table>tbody>tr").removeClass();
	$(".indoor_table>tbody>tr").removeClass();

	// $(".sub_menu>li:gt(1)").each(function(index) {
	// $(this).click(function() {
	//			
	//
	// })
	// });

	$(".l_navigation>li").each(function(index) {
		$(this).click(function() {
			$(this).siblings().removeClass("hovered");
			$(this).addClass("hovered");
		})
	});

	// 當前时间
	var curr_time = new Date();
	var curr_date = curr_time.getFullYear() + "-" + (curr_time.getMonth() + 1)
			+ "-" + curr_time.getDate();

	// sub_menu第一个标签切换的时候点击效果
	$(".sub_menu>li:gt(1)").each(function(index) {
		$(this).click(function() {

			// 初始化开始时间和查询类型(日、周、月),防止在切换tab的时候，导致图表展示错误
			csTFrom = curr_date;
			csType = "day";

			$(this).siblings().removeClass("highlight");
			$(this).addClass("highlight");

			$(".switch_device>div").hide();
			var clickName = $(this).text();

			var switchDom = $($(".switch_device>div")[index]);
			switchDom.show();

			// 切换设备,回调方法 by zrx
			switch (clickName) {
			case "冷机":
				coolerMachineClick();
				break;
			case "水系统":
				waterSysClick();
				break;
			case "冷却泵":
				coolingPumpClick();
				break;
			case "冷冻泵":
				sealPumpClick();
				break;
			case "冷却塔":
				coolingTowerClick();
				break;
			}

		});
	});

	$(".reikenli>div:gt(0)").hide();
	$(".switch_device>div:gt(0)").hide();

	$(".l_navigation>li").each(function(index) {
		$(this).click(function() {
			$(".reikenli>div").hide();
			var dataDom = $($(".reikenli>div")[index]);
			dataDom.show();
		});
	});

	// 设置模块的高度，以适应版权的高度(zzx于20130924增加，解决公司版权位置显示问题)
	$('#devicemonitor_formdiv').height(800);
});

/**
 * 全息图 》建筑切换
 * 
 * @param buildName
 */
function buildSwap(buildName) {
	// alert("buildSwap");
	var buildArr = buildName.split("_");
	var checkName = buildArr[0];
	var string = "." + checkName + "_details";
	// $("." + checkName + "_details").show();
	// 只展示A1的层,其它建筑也只是在A1的界面上ajax切换数据
	$(".a1_details").show();
	// 回调
	holoBuildingCallback(checkName);
};

// 模块跳转
/**
 * 设备监测》选择设备组
 * 
 * @param turnName
 * @returns {Boolean}
 */
function turnModule(turnName) {
	switch (turnName) {
	case "cold_title冷机":
		coolerMachineClick();
		break;
	case "air_title一层":
		airConditionPageInit();
		break;
	case "air_title0M":
		// airConditionPageInit();
		break;
	case "air_title5M":
		// airConditionPageInit();
		break;
	case "air_title33M":
		// airConditionPageInit();
		break;
	case "air_title41M":
		// airConditionPageInit();
		break;
	case "air_title49M":
		// airConditionPageInit();
		break;
	case "terminal_title一层":
		airCdtEndPageInit();
		break;
	case "terminal_title33M":
		airCdtEndPageInit();
		break;
	case "terminal_title41M":
		airCdtEndPageInit();
		break;
	case "terminal_title49M":
		airCdtEndPageInit();
		break;
	case "blowers_title送排风机":
		fanPageInit();
		break;
	case "cold_title水系统":
		waterSysClick();
		break;
	case "cold_title冷冻泵":
		sealPumpClick();
		break;
	case "cold_title冷却泵":
		coolingPumpClick();
		break;
	case "cold_title冷却塔":
		coolingTowerClick();
		break;
	default:
		return false;
	}
};

// 初始化全息图细节
function buidlPara(className, valueText) {
	bpSelecter = "." + className + "_details";
	var $curdom = $(bpSelecter);
	$(".build_para").show();
	$curdom.show();
	$('.' + className + "_label").css("color", "blue");
	// 初始化全息图细节
	initHoloDetailGraphic(valueText);
}