<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-11-06 下午03:15:32
	LastModified Date:
	Description:
 -->
<style type="text/css">
h1,h2,h3,p {
	margin: 0em 0;
}
</style>

<div class="div-table board_div">
	<!--
	<div class="header">
		<span>阿里巴巴淘宝城 &nbsp;|&nbsp; LIGHT能效管理系统</span>
		<div class="login">
			<span>请登录</span>
		</div>
	</div> 
	-->
	<div class="main">
		<div class="left_bar">
			<div class="title">
				<div class="block"></div>
				<div class="title_name">建筑动态</div>
			</div>
			<div class="video"></div>
			<div class="chart_group">
				<div class="left_charts_group">
					<div class="customer">
						<div class="chart_title">访客</div>
						<div id="visitor"></div>
						<div class="data">
							<p>6月25日 星期二</p>
							<p class="people">
								<span class="people_count specially_font">45,325</span><span>人</span>
							</p>
						</div>
					</div>
					<div class="map">
						<div class="board_map"></div>
						<div class="data">
							<p class="build_name">中国馆</p>
							<p class="location">上海浦东新区</p>
						</div>
					</div>
				</div>
				<div class="right_charts_group">
					<div>
						<p>冷热量变化</p>
						<div class="chart" id="temperature"></div>
					</div>
					<div>
						<p>室内温度变化</p>
						<div class="chart" id="indoor_temperature"></div>
					</div>
					<div>
						<p>同类建筑对比</p>
						<div class="chart" id="buildings"></div>
					</div>
					<div class="data">
						<p class="describe">能耗参考值</p>
						<p class="para">
							<span class="specially_font">256</span><span>kWh/m<sup>2</sup>a
							</span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="middle_bar">
			<div class="title">
				<div class="block"></div>
				<div class="title_name">能源使用</div>
			</div>
			<div class="carousel">

				<div id="carousel_content">
					<div id="slides">
						<div class="btn left_btn slidesjs-previous slidesjs-navigation"></div>
						<div class="display_para">
							<span class="energy_title">总能耗</span>
							<div class="division_line_2"></div>
							<span class="energy_number specially_font">2,768,528,123<span
								class="unit">kWh</span></span>
						</div>
						<div class="display_para">
							<span class="energy_title">总水耗</span>
							<div class="division_line_2"></div>
							<span class="energy_number specially_font">2,768,528,123<span
								class="unit">ton</span></span>
						</div>
						<div class="display_para">
							<span class="energy_title">总气耗</span>
							<div class="division_line_2"></div>
							<span class="energy_number specially_font">2,768,528,123<span
								class="unit">m³</span></span>
						</div>
						<div class="btn right_btn slidesjs-next slidesjs-navigation"></div>
					</div>
				</div>

			</div>


			<div class="charts_group_2">
				<div>
					<div class="top_chart">
						<div id="elec" class="chart" style="background-color: #E9EAED;">
							<h3 style="color: #C0C0C0;">今日用电量</h3>
							<h1 class="specially_font color_1"></h1>
							<h4 style="color: #E37743">kWh</h4>
							<!-- <img style="position: absolute; right: 115px; top: 145px"
								src="public/images/ele_amount.png"></img> -->
							<div class="ele_amount_class"></div>

							<canvas id="canvas1" width="200" height="180"
								style="border: 0px; position: absolute; left: 24px; top: 0"></canvas>
							<canvas id="canvas2" width="200" height="180"
								style="border: 0px; position: absolute; left: 24px; top: 0"></canvas>
							<canvas id="canvas3" width="200" height="180"
								style="border: 0px; position: absolute; left: 24px; top: 0"></canvas>
						</div>
						<div class="total_consume">
							<p class="specially_font">up to</p>
							<h1 class="specially_font color_1"></h1>
							<span>累计用电量</span>
						</div>
						<div class="data bg_1">
							<h1>用电量</h1>
							<span>kWh（度）</span>
						</div>
					</div>

					<div class="bottom_chart">
						<div class="describe">
							<span class="what_system">空调系统用电量</span><span class="unit">kWh（度）</span>
						</div>
						<div id="air_sys_ele"></div>
					</div>
				</div>
				<div>
					<div class="top_chart">
						<div id="water" class="chart" style="background-color: #E9EAED;">
							<h3 style="color: #C0C0C0;">今日用水量</h3>
							<h1 class="specially_font color_2"></h1>
							<h4 style="color: #5AD0F3">ton</h4>
							<!-- <img style="position: absolute; right: 115px; top: 145px"
								src="public/images/water_amount.png"></img> -->
							<div class="water_amount_class"></div>

							<canvas id="canvas4" width="200" height="180"
								style="border: 0px; position: absolute; left: 24px; top: 0px"></canvas>
							<canvas id="canvas5" width="200" height="180"
								style="border: 0px; position: absolute; left: 24px; top: 0px"></canvas>
							<canvas id="canvas6" width="200" height="180"
								style="border: 0px; position: absolute; left: 24px; top: 0px"></canvas>
						</div>
						<div class="total_consume">
							<p class="specially_font">up to</p>
							<h1 class="specially_font color_2"></h1>
							<span>累计用水量</span>
						</div>
						<div class="data bg_2">
							<h1>用水量</h1>
							<span>ton（吨）</span>
						</div>
					</div>
					<div class="bottom_chart">
						<div class="describe">
							<span class="what_system">照明系统用电量</span><span class="unit">kWh（度）</span>
						</div>
						<div id="light_sys_chart"></div>
					</div>
				</div>
				<div class="nomargin">
					<div class="top_chart">
						<div id="gas" class="chart" style="background-color: #E9EAED;">
							<h3 style="color: #C0C0C0;">今日用气量</h3>
							<h1 class="specially_font color_3"></h1>
							<h4 style="color: #B5CA63">m³</h4>
							<!-- <img style="position: absolute; right: 112px; top: 145px"
								src="public/images/gas_amount.png"></img> -->
							<div class="gas_amount_class"></div>

							<canvas id="canvas7" width="200" height="180"
								style="border: 0px; position: absolute; left: 24px; top: 0px"></canvas>
							<canvas id="canvas8" width="200" height="180"
								style="border: 0px; position: absolute; left: 24px; top: 0px"></canvas>
							<canvas id="canvas9" width="200" height="180"
								style="border: 0px; position: absolute; left: 24px; top: 0px"></canvas>
						</div>
						<div class="total_consume">
							<p class="specially_font">up to</p>
							<h1 class="specially_font color_3"></h1>
							<span>累计用气量</span>
						</div>
						<div class="data bg_3">
							<h1>用气量</h1>
							<span>m³（立方）</span>
						</div>
					</div>
					<div class="bottom_chart">
						<div class="describe">
							<span class="what_system">办公设备</span><span class="unit">kWh（度）</span>
						</div>
						<div id="office_device"></div>
					</div>
				</div>
			</div>
			<div class="charts_group_3">
				<div>
					<div class="chart_logo car">
						<h1>碳足迹</h1>
						<i class="icon_car"></i>
						<h2>一辆汽车行驶</h2>
					</div>
					<div class="data">
						<p class="describe">Kilometer</p>
						<p class="para specially_font">30750</p>
					</div>
				</div>
				<div>
					<div class="chart_logo air">
						<i class="icon icon_air"></i>
						<h2>一辆汽车行驶</h2>
					</div>
					<div class="data">
						<p class="describe">Times</p>
						<p class="para specially_font">3.15</p>
					</div>
				</div>
				<div>
					<div class="chart_logo tree">
						<i class="icon icon_tree"></i>
						<h2>一棵大树成长</h2>
					</div>
					<div class="data">
						<p class="describe">Years</p>
						<p class="para specially_font">15</p>
					</div>
				</div>
				<div class="nomargin">
					<div class="chart_logo bulb">
						<i class="icon icon_bulb"></i>
						<h2>一只灯泡点亮</h2>
					</div>
					<div class="data">
						<p class="describe">Hours</p>
						<p class="para specially_font">15,168</p>
					</div>
				</div>
			</div>
		</div>
		<div class="dashboard_right_bar">
			<div class="title">
				<div class="block"></div>
				<div class="title_name">天气信息</div>
			</div>
			<div class="weather_overview">
				<div class="weather_describe">
					<i></i><span style="display: inline"></span>&nbsp;&nbsp;<span style="display: inline" id="wind_level_temp"></span>
				</div>
				<div class="maxmin specially_font">
					<span></span><span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="margin-left: 20px;font-size:16px;">湿度：</span>
					<span style="font-size:24px;"
						id="current_hump_text"></span>
				</div>
				<h1 class="specially_font" id="current_temp_c">12°</h1>
			</div>
			<div class="next_weather">
				<table>
					<tr>
						<td></td>
						<td><img></td>
						<td></td>
						<td class="min_temp"></td>
					</tr>
					<tr>
						<td></td>
						<td><img></td>
						<td></td>
						<td class="min_temp"></td>
					</tr>
					<tr>
						<td></td>
						<td><img></td>
						<td></td>
						<td class="min_temp"></td>
					</tr>
					<tr>
						<td></td>
						<td><img></td>
						<td></td>
						<td class="min_temp"></td>
					</tr>
					<tr>
						<td></td>
						<td><img></td>
						<td></td>
						<td class="min_temp"></td>
					</tr>
					<tr>
						<td></td>
						<td><img></td>
						<td></td>
						<td class="min_temp"></td>
					</tr>
				</table>
			</div>
			<div class="unit_div pollution">
				<div class="unit_title pollution_title">
					<p class="">空气污染指数</p>
					<div>
						<span class="specially_font number">127</span>&nbsp;&nbsp;<span
							id="api_val" class="degree">轻度</span>
					</div>
				</div>
				<div>
					<div class="arrow"></div>
					<div class="wr_bar_class"></div>
				</div>
				<div>
					<table
						style="text-align: center; color: #FFF; position: relative; right: -30px; bottom: -14px;">
						<tr>
							<td width="39px">50</td>
							<td width="39px">100</td>
							<td width="39px">150</td>
							<td width="39px">200</td>
							<td width="39px">300</td>
							<td width="78px">500</td>
						</tr>
						<tr>
							<td>优</td>
							<td>良</td>
							<td>轻度</td>
							<td>中度</td>
							<td>重度</td>
							<td>严重</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="unit_div air_speed">
				<div class="unit_title pollution_title">
					<p class="">风速</p>
				</div>
				<div class="wind_data">
					<i class="windmill"></i>
					<div>
						<p id="wind_level_info">东风&nbsp;&nbsp;2级&nbsp;&nbsp;轻风</p>
						<p id="wind_speed">清风拂面较为舒适</p>
					</div>
				</div>
			</div>
			<div class="sun_position">
				<div class="unit_title pollution_title">
					<p class="">日出日落时间</p>
				</div>
				<div style="height: 139px;">
					<img id="sun_pic"
						src="${pageContext.request.contextPath}/dashboard/public/images/sun.png">
					<!-- <div id="sun_pic" class="sun_pic_class"></div> -->

					<div
						style="background-color: #373739; width: 304px; height: 101px; position: relative; top: 28px">
						<canvas id="myCanvasTag" width="304" height="100"
							style="border: 0px;"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- js代码 -->
<script type="text/javascript">
	$('#tb_div_navigation').css('display','none'); // 隐藏左侧的导航 
	
	var url = "http://www.weather.com.cn/data/sk/101010100.html";
	var beijing_jd = '-116.28'; // 经度 
	var beijing_wd = '39.54'; // 纬度
	var beijing_timezone = -8; // 时区 
	
	// 设置 风力,级数 ,湿度，和日出日落时间
	function getCurrentWeather() {
		$.ajax({
					type : "POST",
					url : '<portlet:resourceURL id="getContentByUrl"></portlet:resourceURL>&url='
							+ url
							+ "&latitude="
							+ beijing_wd
							+ "&longitude="
							+ beijing_jd + "&timezone=" + beijing_timezone + "&charset=UTF-8",
					async : false,
					success : function(result) {
						var temp_str = result.json;
						$('#current_temp_c').text(temp_str.substring(temp_str.indexOf("temp")+7,temp_str.indexOf("WD")-3) + "°");// 获取实时温度 
						
						var wind = temp_str.substring(
								temp_str.indexOf('WD":"') + 5, temp_str
										.indexOf('","WS"')); // 风
						var wind_level = temp_str.substring(temp_str
								.indexOf('","WS"') + 8, temp_str.indexOf('","SD"')); // 级数
						var hump = temp_str.substring(
								temp_str.indexOf('","SD"') + 8, temp_str
										.indexOf('","WSE"')); // 湿度 
						$('#current_hump_text').text(hump); // 当前的湿度 
						$('#wind_level_info').text(wind + "   " + wind_level);
						$('#wind_level_temp').text(wind + "   " + wind_level);

						runSun(result.sunup, result.sundown); // 日出日落效果
					},
					error : function(result) {
						console.log('error');
					}
				});
	}
	getCurrentWeather(); // 初始化获取一次 
	window.setInterval("getCurrentWeather()", 600000); // 十分钟获取一次

	// 左侧的4个图表数据
	var categories = [ '7月1日', '7月2日', '7月3日', '7月4日', '7月5日', '7月6日', '7月7日' ];
	var data = [ 12, 24, 26, 18, 20, 22, 24 ];
	//参数       图表ID|图表类型|背景色|高|边角弧度|底部高|x轴标签|数据|数据名|单位|点的填充色
	getHicharts("visitor", "line", "#A5BA51", 130, 3, 10, categories, data,
			'访客', '人次', "#A5BA51");
	var categories1 = [ '7:00', '8:00', '9:00', '10:00', '11:00', '12:00',
			'13:00', '14:00', '15:00', '16:00', '17:00', '18:00' ];
	var data1 = [ 15, 17, 18, 19, 20, 22, 24, 23, 22, 22, 20, 18 ];
	getHicharts("temperature", "line", "#0D0502", 100, 0, 22, categories1,
			data1, '冷热量', '℃', "#0D0502");
	var categories2 = [ '7:00', '8:00', '9:00', '10:00', '11:00', '12:00',
			'13:00', '14:00', '15:00', '16:00', '17:00', '18:00' ];
	var data2 = [ 15, 17, 18, 19, 20, 22, 24, 23, 22, 22, 20, 18 ];
	getHicharts("indoor_temperature", "line", "#0E0402", 100, 0, 2,
			categories2, data2, '温度', '℃', "#0E0402");
	var categories3 = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g' ];
	var data3 = [ null, 286, 276, {
		y : 256,
		color : "#909BBB"
	}, 300, 240, null ];
	getHicharts("buildings", "column", "#030504", 120, 0, 22, categories3,
			data3, '能耗', 'kWh/m²a', "#030504");

	// 中间三个 空调、照明及办公系统用电数据填写
	/*
	 参数(图表块ID（不变）,饼图数1,饼图数2,饼图数据1名称,饼图数据1颜色,昨日总数,今日总数,昨日实际,今日实际)
	 */
	getMixCharts("air_sys_ele", 50, 100, '空调系统', "#F34B3E", 150, 160, 100, 110);
	getMixCharts("light_sys_chart", 20, 100, '照明系统', "#46AFDE", 140, 150, 110,
			120);
	getMixCharts("office_device", 30, 100, '办公设备', "#A8BE51", 145, 155, 100,
			115);

	// 获取右上角的 天气信息 
	function getWeatherData() {
		$
				.ajax({
					url : "http://api.wunderground.com/api/f460985732f3eaa1/forecast10day/lang:CN/q/China/BeiJing.json",
					dataType : "jsonp",
					success : function(data) {
						var weatherData = data.forecast.simpleforecast.forecastday;
						var current_wind = data.forecast.txt_forecast.forecastday[0].fcttext_metric; // 当前风速(风速: 10-15 公里/小时)
						if(current_wind.indexOf("Light Wind") != -1){ // 如果返回的字符串中有｛Light Wind｝的话，则为轻风
							current_wind = "轻风";
						} else {
							current_wind = current_wind.substring(current_wind.lastIndexOf("风速: ") + 4, current_wind.lastIndexOf("风向: ") - 2);
						}
						$('#wind_speed').text(current_wind); // 当前的风速  
						$(".weather_describe i").css(
								{
									"background" : "url('"
											+ weatherData[0].icon_url + "')",
									"background-position" : "center",
									"background-repeat" : "no-repeat",
									"width" : "67px",
									"height" : "45px"
								});
						$(".weather_describe>span:eq(0)").html(
								weatherData[0].conditions);
						//$(".maxmin").siblings("h1").html(weatherData[0].);
						//$(".wind_data div>p:eq(0)").html(weatherData[0].avewind.dir + "风");
						
						for ( var i = 0; i < 6; i++) {
							$(".next_weather tr:eq(" + i + ")>td:eq(0)").html(
									weatherData[i + 1].date.weekday);
							$(".next_weather tr:eq(" + i + ")>td:eq(1) img")
									.attr({
										'src' : weatherData[i + 1].icon_url,
										'width' : '20px',
										'height' : '20px'
									});
							$(".next_weather tr:eq(" + i + ")>td:eq(2)").html(
									weatherData[i + 1].high.celsius + "°"); // 最高温度 
							$(".next_weather tr:eq(" + i + ")>td:eq(3)").html(
									weatherData[i + 1].low.celsius + "°"); // 最低温度 
						}
					},
					error : function() {
						console.log('error');
					}
				})
	};

	getWeatherData(); // 获取天气信息 

	window.setInterval(function() {
		getWeatherData();
	}, 300000); // 每隔5分钟

	<!-- ,"#66E3FF","#46AFDE","#BDD170","#A5BC47" -->
	var elec0 = 2410512;//初始化加载
	var elec1 = 1200012;
	var water0 = 12105;
	var water1 = 11000;
	var gas0 = 27264;
	var gas1 = 14569;

	$(".total_consume:eq(0)").find("h1").html(
			elec0.toLocaleString());//初始赋值
	$(".total_consume:eq(1)").find("h1").html(
			water0.toLocaleString());
	$(".total_consume:eq(2)").find("h1").html(
			gas0.toLocaleString());
	$("#elec h1").html(parseFloat((elec1+"").substring(0,5)).toLocaleString());
	$("#water h1").html(parseFloat((water1+"").substring(0,5)).toLocaleString());
	$("#gas h1").html(parseFloat((gas1+"").substring(0,5)).toLocaleString());
	
	//初始化圆
	getCircles("canvas1", "canvas2", "canvas3",
			elec0, elec1, "#FA7F44", "#B86E4B",
			"canvas4", "canvas5", "canvas6",
			water0, water1, "#66E3FF", "#46AFDE",
			"canvas7", "canvas8", "canvas9", gas0,
			gas1, "#BDD170", "#A5BC47");
	
	var elec2 = 1700100;//从后台得到实时数据
	var water2 = 11400;
	var gas2 = 14800;
	function dizneng(elec2, water2, gas2) {
		var elec = $("#elec h1").html().replace(/,/g,
				"");//得到基数
		elec = 1200012; // test为了演示 
		var water = $("#water h1").html().replace(/,/g,
				"");
		var gas = $("#gas h1").html().replace(/,/g, "");
		dataIncre(elec2 - elec, water2 - water, gas2
				- gas);//画图
		$("#elec h1").html(parseFloat((elec2+"").substring(0,5)).toLocaleString());
		$("#water h1").html(parseFloat((water2+"").substring(0,5)).toLocaleString());
		$("#gas h1").html(parseFloat((gas2+"").substring(0,5)).toLocaleString());
	}
	window.setInterval(function() {
		//dizneng(elec2, water2, gas2);
	}, 3000);
	
	// 求最高温度和最低温度 
	// var current_temp_c_url = 'http://m.weather.com.cn/data/101010100.html';
	var current_temp_c_url = 'http://www.weather.com.cn/data/cityinfo/101010100.html';
	// 设置 风力,级数 ,湿度，和日出日落时间 
	$.ajax({
		type : "POST",
		url : '<portlet:resourceURL id="getContentByUrl"></portlet:resourceURL>&url='
				+ current_temp_c_url+"&charset=UTF-8",
		success : function(result) {
			var resultStr = jQuery.parseJSON(result.json);
			var weather = resultStr.weatherinfo;
			$(".maxmin>span:eq(0)").html(weather.temp1.substring(0,weather.temp1.indexOf("℃")) + "° / "); // 当前最高温度 
			$(".maxmin>span:eq(1)").html(weather.temp2.substring(0,weather.temp2.indexOf("℃")) + "°");  // 当前最低温度 
			
			// resultStr = resultStr.substring(resultStr.indexOf("temp1") + 8,resultStr.indexOf("temp2")-3);
			// var max_temp_c = resultStr.substring(0,resultStr.indexOf("℃"));
			// var min_temp_c = resultStr.substring(resultStr.indexOf("~")+1,resultStr.lastIndexOf("℃"));
			// $(".maxmin>span:eq(0)").html(max_temp_c + "° / "); // 当前最高温度 
			// $(".maxmin>span:eq(1)").html(min_temp_c + "°");  // 当前最低温度 
		},
		error : function(result) {
			console.log('error');
		}
	});
	
	
	// 设置 风力,级数 ,湿度，和日出日落时间 
	// var apiUrl = "http://aqicn.info/?city=Beijing";
	var apiUrl = "http://www.china-jcw.cn/AirDailyReport.htm";
	$.ajax({
		type : "POST",
		url : '<portlet:resourceURL id="getContentByUrl"></portlet:resourceURL>&url='
				+ apiUrl
				+ "&latitude="
				+ beijing_wd
				+ "&longitude="
				+ beijing_jd + "&timezone=" + beijing_timezone, // + "&api=api",
		//async : false,
		success : function(result) {
			var resultString = result.json;
			resultString = resultString.substring(resultString.indexOf("朝阳奥体中心")+16,resultString.indexOf("朝阳农展馆"));
			var WRIndex = resultString.substring(resultString.indexOf(">")+1,resultString.indexOf("</td>"));
			try{
				if(WRIndex == "NaN" || WRIndex == undefined)
					WRIndex = 127;
				else 
					WRIndex = parseInt(WRIndex);
			}catch(e){
				WRIndex = 127; 
			}
				
			// 获取空气污染指数
			//var WRIndex = 127;
			//try{
			//	if(result.api == "NaN" || result.api == undefined)
			//		WRIndex = 127;
			//	else 
			//		WRIndex = parseInt(result.api);
			//}catch(e){
			//	WRIndex = 127; 
			//}
			var WRdecti = ""; 
			$(".pollution_title div:eq(0) span:eq(0)").html(WRIndex);
			if (WRIndex < 50) {
				WRdecti = "优";
			} else if (WRIndex<100&&WRIndex >= 50) {
				WRdecti = "良";
			} else if (WRIndex<150&&WRIndex >= 100) {
				WRdecti = "轻度";
			} else if (WRIndex<200&&WRIndex >= 150) {
				WRdecti = "中度";
			} else if (WRIndex<300&&WRIndex >= 200) {
				WRdecti = "重度";
			} else if (WRIndex<500&&WRIndex >= 300) {
				WRdecti = "严重";
			} else {
				WRdecti = "轻度";
			}
			$("#api_val").text(WRdecti);
			getWRIndex(WRIndex);
		},
		error : function(result) {
			console.log('error');
		}
	});
</script>