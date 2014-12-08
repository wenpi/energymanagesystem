$(function() {

			$("#top_navigation").css("display", "none"); // 隐藏顶部菜单栏
			$("#tb_div_navigation").css("display", "none"); // 隐藏菜单栏
			$("#toolbar").css("display", "none"); // 隐藏工具栏

			// 实时刷新时间
			getTime();
			setInterval("getTime()", 5000); 
			
		});

// submit
function submitForm() {
	if ($("#username").val() == 'admin' && $("#password").val() == '1234') {
		var locationUrl = document.location.href;
		var submitUrl = locationUrl.substring(0, locationUrl.lastIndexOf("/"));
		document.location.href = submitUrl + "/home";
	} else {
		alert("请输入正确用户名和密码！");
		return false;
	}
}

/**
 * 动态设置日期时间和星期
 */
function getTime() {
	var mon, day, now, hour, min, sec;
	mon = new Array("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12");
	day = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
	now = new Date();
	hour = now.getHours();
	min = now.getMinutes();
	sec = now.getSeconds();
	if (hour < 10) {
		hour = "0" + hour;
	}
	if (min < 10) {
		min = "0" + min;
	}
	if (sec < 10) {
		sec = "0" + sec;
	}

	var time = hour + ":" + min;
	var date = now.getFullYear() + "-" + mon[now.getMonth()] + "-" + now.getDate();
	var week = day[now.getDay()];

	if ($(".loginLeftTime").length) {
		$(".loginLeftTime").html(time);
	}
	if ($(".loginTime").length) {
		$(".loginTime").html(date);
	}
	if ($(".loginWeek").length) {
		$(".loginWeek").html(week);
	}
}