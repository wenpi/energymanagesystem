<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- 
	运行监测——设备检测显示页面
	@Author:ZHANGTIANLE
	包含其他页面--静态包含
-->
<div class="div-table zero_margin">
	<div class="content equ_monitoring">
		<div id="main" class="device_monitor">
			<div class="all_device_list">
				<div class="air_condition">
					<div class="title_block">
						<p>空调系统</p>
					</div>
					<div class="device_list">
						<%@include file="air_sys.jsp"%>
						<%@include file="wind.jsp"%>
					</div>
				</div>
				<div class="light_system">
					<div class="title_block">
						<p>照明系统</p>
					</div>
					<div class="device_list">
						<%@include file="light_sys.jsp"%>
					</div>
				</div>
			</div>
			<jsp:include page="detail_page.jsp"></jsp:include>
		</div>
	</div>

	<div id="mask" class="mask">
		<div class="dialog-popover dialog-device-zoom">
			<div class="dialog-header">
				<h3>冷站 | 常规制冷系统</h3>
				<div class="dialog-cancel_btn"></div>
				<div class="dialog-more-btn"></div>
				<div class="dialog-download-btn"></div>
			</div>
			<div class="dialog-body chart">
				<div class="btn-block">
					<div class="view_switch_btn">
						<input type="hidden" id="hd_1" value="1"> <input
							type="hidden" id="hd_2" value="1">
						<div>开启台数</div>
						<!-- <div>开启冷量</div>
						<div>开启功率</div> -->
					</div>
				</div>
				<div class="chartArea" id="<portlet:namespace/>magnifyChart"
					style="height: 135px"></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$.fn.getHexBackgroundColor = function() { var rgb = $(this).css('background-color'); if(!$.browser.msie){ rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/); function hex(x) {return ("0" + parseInt(x).toString(16)).slice(-2);} rgb= "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]); } return rgb; }
		
		// 显示当前时间
		setTimes();
		
		// 给开启台数等按钮添加数据
		var moreNum = $(".chart>.btn_group").length;
		for ( var i = 0; i < parseInt(moreNum); i++ ) {
			$(".btn_group:eq(" + i + ")>div:eq(0)").data('num', 1);
			$(".btn_group:eq(" + i + ")>div:eq(1)").data('num', 2);
			$(".btn_group:eq(" + i + ")>div:eq(2)").data('num', 3);
		}
		
		// 放大按钮添加事件
		$(".zoomin").on('click', function() {
			var thisTitle = $(this).parent().text();
			$("#mask").show();
			$(".dialog-device-zoom").show();
			$(".dialog-device-zoom").find(".dialog-header > h3").text(thisTitle); // 设置文字
			$(".dialog-device-zoom").find(".dialog-header > h3").attr("tip", $(this).parent().parent().attr("id")); // 设置tip，便于后序使用
			
			var curId = $(this).parent().parent().attr("id"); // 当前点击放大的id
			//调整图标区域的大小、显隐
			var num = ".data_"+($(this).index(".zoomin") + 1);
			$(".dialog-popover").find(num).siblings(".data").css('display','none').removeClass("data");
			$(".dialog-popover").find(num).addClass("data").css('display','block');
			if ($(this).parent().siblings(".data").length == 1) {
				$(".dialog-body").css('height', '400px');
				$("#<portlet:namespace/>magnifyChart").css('height', '355px');
			} else if ($(this).parent().siblings(".data").length == 2) {
				$(".dialog-body").css('height', '317px');
				$("#<portlet:namespace/>magnifyChart").css('height', '272px');
			}
			var num0 = $(this).parent().siblings(".chart").find("input:eq(1)").val();//table上点击按钮的位置
			$("#mask .btn-block input:eq(1)").val(num0);
			if(num0 <= 4) {//Table只有一行的情况
				var div=$(".dialog-popover").find(num+":eq(0)").find("."+num0+"th_d");
				div.addClass("chart_data" + num0 + "_bg");
				if (div.index() != 0) {
						$(div.siblings()[0]).removeClass("chart_data1_bg");
					$(div.parent().siblings(num).last().children()[0])
							.removeClass("chart_data1_bg");
					$(div.parent().siblings(num).children()[1])
							.removeClass("chart_data2_bg");
					$(div.parent().siblings(num).children()[2])
							.removeClass("chart_data3_bg");
					$(div.parent().siblings(num).children()[3])
							.removeClass("chart_data4_bg"); 
				}
			} else {//Table有两行的情况
				num0-=4;
				var div=$(".dialog-popover").find(num+":eq(1)").find("."+num0+"th_d");
				div.addClass("chart_data"+num0+"_bg");
				if (div.index() == 0) {
					$(div.siblings()[0]).removeClass("chart_data2_bg");
					$(div.siblings()[1]).removeClass("chart_data3_bg");
					$(div.siblings()[2]).removeClass("chart_data4_bg");
				}
				if (div.index() == 1) {
					$(div.siblings()[0]).removeClass("chart_data1_bg");
					$(div.siblings()[1]).removeClass("chart_data3_bg");
					$(div.siblings()[2]).removeClass("chart_data4_bg");
				}
				if (div.index() == 2) {
					$(div.siblings()[0]).removeClass("chart_data1_bg");
					$(div.siblings()[1]).removeClass("chart_data2_bg");
					$(div.siblings()[2]).removeClass("chart_data4_bg");
				}
				if (div.index() == 3) {
					$(div.siblings()[0]).removeClass("chart_data1_bg");
					$(div.siblings()[1]).removeClass("chart_data2_bg");
					$(div.siblings()[2]).removeClass("chart_data3_bg");
				}
				$(div.parent().siblings(num).children()[0])
						.removeClass("chart_data1_bg");
				$(div.parent().siblings(num).children()[1])
						.removeClass("chart_data2_bg");
				$(div.parent().siblings(num).children()[2])
						.removeClass("chart_data3_bg");
				$(div.parent().siblings(num).children()[3])
						.removeClass("chart_data4_bg"); 
			}
			//创建按钮
			var index=$(this).index(".zoomin");
			if(index == 6) {
				$(".view_switch_btn div:eq(0)").text("开启回路");
				$(".view_switch_btn div:eq(1)").text("开启功率");
				$(".view_switch_btn div:eq(2)").hide();
			} else if(index == 5 || index == 4) {
				$(".view_switch_btn div:eq(0)").text("开启台数");
				$(".view_switch_btn div:eq(1)").text("开启风量");
				$(".view_switch_btn div:eq(2)").show();
			} else if(index == 1) {
				$(".view_switch_btn div:eq(0)").text("开启台数");
				$(".view_switch_btn div:eq(1)").text("开启热量");
				$(".view_switch_btn div:eq(2)").show();
			} else {
				$(".view_switch_btn div:eq(0)").text("开启台数");
				$(".view_switch_btn div:eq(1)").text("开启冷量");
				$(".view_switch_btn div:eq(2)").show();
			}
			var btn=$(this).parent().siblings(".chart").find(".btn_group>input:eq(0)").val()-1;
			$(".view_switch_btn div:eq("+btn+")").addClass("btn_press").siblings("div").removeClass("btn_press");
			//渲染
			$("#mask .btn-block input:eq(0)").val($(this).parent().siblings(".chart").find("input:eq(0)").val());
			buildSmallChart('<portlet:namespace/>magnifyChart', curId);
		});
		
		// 绘图表--点击变化
		$(".chart > .btn_group > div").click(function() {
			var num_0 = $(this).siblings("input:eq(0)").val();
			var num_1 = $(this).data('num');
			if(num_0 != num_1) {
				$(this).siblings("input:eq(0)").val(num_1); // 给num传数字
				buildSmallChart($(this).parent().next().attr("id"), null); // 绘图
			}
		});
		
		// 放大图表区域--右上角的三个按钮
		$(".view_switch_btn > div").click(function() {
			$(this).siblings().removeClass("btn_press");
			$(this).addClass("btn_press");
			var num_0 = $(this).siblings("input:eq(0)").val();
			var num_1 = $(this).index() - 1;
			if(num_0 != num_1){
				$(this).siblings("input:eq(0)").val(num_1);//给num传数字
				buildSmallChart('<portlet:namespace/>magnifyChart', $(this).parent().parent().parent().prev().find("h3").attr("tip"));//绘图
			}
		});
		
		// 每个区域的下方按钮的样式切换
		$(".data > .1th_d").hover(function() {
			$(this).addClass("change_chart_data1_bg");
			if($(this).find("div").find("p").find("span").text().indexOf("/0") != -1)
				$(this).find("div").find("p").addClass("change_chart_data1_bg_font");
		}, function() {
			$(this).removeClass("change_chart_data1_bg");
			if($(this).getHexBackgroundColor() == '#50597b') {
				$(this).find("div").find("p").removeClass("change_chart_data1_bg_font");
			}
		});
		
		$(".data>.2th_d").hover(function() {
			$(this).addClass("change_chart_data2_bg");
			if($(this).find("div").find("p").find("span").text().indexOf("/0") != -1)
				$(this).find("div").find("p").addClass("change_chart_data2_bg_font");
		}, function() {
			$(this).removeClass("change_chart_data2_bg");
			if($(this).getHexBackgroundColor() == '#50597b') {
				$(this).find("div").find("p").removeClass("change_chart_data2_bg_font");
			}
		});
		
		$(".data>.3th_d").hover(function() {
			$(this).addClass("change_chart_data3_bg");
			if($(this).find("div").find("p").find("span").text().indexOf("/0") != -1)
				$(this).find("div").find("p").addClass("change_chart_data3_bg_font");
		}, function() {
			$(this).removeClass("change_chart_data3_bg");
			if($(this).getHexBackgroundColor() == '#50597b') {
				$(this).find("div").find("p").removeClass("change_chart_data3_bg_font");
			}
		});
		
		$(".data>.4th_d").hover(function() {
			$(this).addClass("change_chart_data4_bg");
			if($(this).find("div").find("p").find("span").text().indexOf("/0") != -1) {
				$(this).find("div").find("p").addClass("change_chart_data4_bg_font");
			}
		}, function() {
			$(this).removeClass("change_chart_data4_bg");
			if($(this).getHexBackgroundColor() == '#50597b') {
				$(this).find("div").find("p").removeClass("change_chart_data4_bg_font");
			}
		});
		
		// 表格下方div的点击效果
		$(".data > div").click(function() {
					ahu_build_id = $(this).attr("title"); // 空调箱上，点击的建筑，如A1
					$($(this).parent().siblings(".data").children()[0]).find("div").find("p").removeClass("change_chart_data1_bg_font");
					$($(this).parent().siblings(".data").children()[1]).find("div").find("p").removeClass("change_chart_data2_bg_font");
					$($(this).parent().siblings(".data").children()[2]).find("div").find("p").removeClass("change_chart_data3_bg_font");
					$($(this).parent().siblings(".data").children()[3]).find("div").find("p").removeClass("change_chart_data4_bg_font");
					if ($(this).index() == 0) {
						$(this).addClass("chart_data1_bg");
						if($(this).find("div").find("p").find("span").text().indexOf("/0") != -1) {
							$(this).find("div").find("p").addClass("change_chart_data1_bg_font");
						}
						$($(this).siblings()[0]).find("div").find("p").removeClass("change_chart_data2_bg_font");
						$($(this).siblings()[1]).find("div").find("p").removeClass("change_chart_data3_bg_font");
						$($(this).siblings()[2]).find("div").find("p").removeClass("change_chart_data4_bg_font");
						$($(this).siblings()[0]).removeClass("chart_data2_bg");
						$($(this).siblings()[1]).removeClass("chart_data3_bg");
						$($(this).siblings()[2]).removeClass("chart_data4_bg");
					}
					if ($(this).index() == 1) {
						$(this).addClass("chart_data2_bg");
						if($(this).find("div").find("p").find("span").text().indexOf("/0") != -1) {
							$(this).find("div").find("p").addClass("change_chart_data2_bg_font");
						}
						$($(this).siblings()[0]).find("div").find("p").removeClass("change_chart_data1_bg_font");
						$($(this).siblings()[1]).find("div").find("p").removeClass("change_chart_data3_bg_font");
						$($(this).siblings()[2]).find("div").find("p").removeClass("change_chart_data4_bg_font");
						$($(this).siblings()[0]).removeClass("chart_data1_bg");
						$($(this).siblings()[1]).removeClass("chart_data3_bg");
						$($(this).siblings()[2]).removeClass("chart_data4_bg");
					}
					if ($(this).index() == 2) {
						$(this).addClass("chart_data3_bg");
						if($(this).find("div").find("p").find("span").text().indexOf("/0") != -1) {
							$(this).find("div").find("p").addClass("change_chart_data3_bg_font");
						}
						$($(this).siblings()[0]).find("div").find("p").removeClass("change_chart_data1_bg_font");
						$($(this).siblings()[1]).find("div").find("p").removeClass("change_chart_data2_bg_font");
						$($(this).siblings()[2]).find("div").find("p").removeClass("change_chart_data4_bg_font");
						$($(this).siblings()[0]).removeClass("chart_data1_bg");
						$($(this).siblings()[1]).removeClass("chart_data2_bg");
						$($(this).siblings()[2]).removeClass("chart_data4_bg");
					}
					if ($(this).index() == 3) {
						$(this).addClass("chart_data4_bg");
						if($(this).find("div").find("p").find("span").text().indexOf("/0") != -1) {
							$(this).find("div").find("p").addClass("change_chart_data4_bg_font");
						}
						$($(this).siblings()[0]).find("div").find("p").removeClass("change_chart_data1_bg_font");
						$($(this).siblings()[1]).find("div").find("p").removeClass("change_chart_data2_bg_font");
						$($(this).siblings()[2]).find("div").find("p").removeClass("change_chart_data3_bg_font");
						$($(this).siblings()[0]).removeClass("chart_data1_bg");
						$($(this).siblings()[1]).removeClass("chart_data2_bg");
						$($(this).siblings()[2]).removeClass("chart_data3_bg");
					}
					$($(this).parent().siblings(".data").children()[0]).removeClass("chart_data1_bg");
					$($(this).parent().siblings(".data").children()[1]).removeClass("chart_data2_bg");
					$($(this).parent().siblings(".data").children()[2]).removeClass("chart_data3_bg");
					$($(this).parent().siblings(".data").children()[3]).removeClass("chart_data4_bg");
					var num_0 = $(this).parent().siblings(".chart").find("input:eq(1)").val();
					var num_1 = $(this).data('num');
					var chartId = $(this).parent().parent().find(".chart").find(".chartArea").attr("id");
					var curId = $(this).parent().parent().attr("id"); // 选前选择的模块id
					if($(this).parent().parent().parent().attr('id') == 'mask'){ // 放大区域绘图区域处理
						chartId = '<portlet:namespace/>magnifyChart';
						curId = $(this).parent().parent().find(".dialog-header").find("h3").attr("tip");
					}
					if(num_0 != num_1) { // 去除重复渲染
						$(this).parent().siblings(".chart:eq(0)").find("input:eq(1)").val($(this).data('num'));
					
						if(ahu_build_id == undefined) {
							buildSmallChart(chartId, curId);
						} else {
							smallChartAndBuild(chartId, curId, ahu_build_id);
						}
					}
				});
	});
</script>