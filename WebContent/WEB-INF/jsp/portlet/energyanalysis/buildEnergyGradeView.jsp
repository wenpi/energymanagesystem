<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- HTML START -->
<!-- 
	AUTHOR: ZOUZHIXIANG
	Created Date: 2013-8-7 下午7点59分
	LastModified Date:
	Description: 能效分析-建筑用能评分
 -->


<div class="div-table">

	<div class="timediv">
		<input id="<portlet:namespace />datetime4" type="hidden" />
		<div id="<portlet:namespace />day4" style="color: red;"
			class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('day')">日视图</div>
		<div id="<portlet:namespace />week4" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('week')">周视图</div>
		<div id="<portlet:namespace />month4" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('month')">月视图</div>
		<div id="<portlet:namespace />year4" class="inlinediv tdatt"
			onclick="<portlet:namespace />selectdate4('year')">年视图</div>

		<div id="<portlet:namespace />yearddd4" class="tdatt output">输出</div>

		<div class="bgimgdiv">
			<div class="grade gradetop gradediv" id="gradePostion">
				<div class="arrow"></div>
				<h3 class="grade-title gradepos">
					当前评分：<span id="grade">B+</span>
				</h3>
			</div>
		</div>

	</div>

	<div class="parameter bulid_score">
		<div class="page_header">
			<h1>建筑用能评分</h1>
		</div>
		<h5>依据当前建筑的单位面积总能耗与同一地区同类建筑的单位面积总能耗的差值，分为ABCDE五个档次，A为低能耗水平。</h5>
		<div class="division"></div>
		<table class="client_para">
			<tr>
				<td><span id="<portlet:namespace />datavalue4_1">A用能非常好，B/C/D用能一般，E用能差</span></td>
			</tr>
		</table>
	</div>

</div>

<script type="text/javascript">
var <portlet:namespace />timeArr4 = ["<portlet:namespace />day4", "<portlet:namespace />week4", "<portlet:namespace />month4", "<portlet:namespace />year4"];    
function <portlet:namespace />changeColor4(type){
	//设置其它td标签的字体颜色
	$.each(<portlet:namespace />timeArr4,function(i,obj) {
		document.getElementById(this).style.color='#666666';
	});
	
	// 设置当前点击的标签的字体颜色
	document.getElementById("<portlet:namespace />"+type+"4").style.color='red';
}

	var start_date4 = ''; // 开始时间
	var choose_type4 = ''; // 点击类型（日、周、月、年）

	// 选择时间（日、周、月、年）
	function <portlet:namespace />selectdate4(type) {
		//切换点击字体效果
		<portlet:namespace />changeColor4(type);
		
		var dformt = 'yyyy-MM-dd';
		if (type == "day")
			dformt = 'yyyy-MM-dd';
		else if (type == "week")
			dformt = 'yyyy-MM-dd';
		else if (type == "month")
			dformt = 'MM';
		else if (type == "year")
			dformt = 'yyyy';

		WdatePicker({
			el : '<portlet:namespace />datetime4',
			dateFmt : dformt,
			onpicked : function(dp) {
				var _time = dp.cal;
				start_date4 = _time.getDateStr('yyyy-MM-dd');
				choose_type4 = type;

				// 获取页面数据的值
				<portlet:namespace />setTextAndValue4();
			}
		});
	}

	// 取后台数据赋值到前台页面
	function <portlet:namespace />setTextAndValue4() {
		$
				.post(
						'<portlet:resourceURL id="getValueByNameAndId"></portlet:resourceURL>',
						{
							from : start_date4,
							to : '',
							name : '${importantenergytarget.choose_name4}',
							id : '${importantenergytarget.choose_id4}',
							ispd : '${importantenergytarget.ispd4}',
							decimals : '${importantenergytarget.decimals4}',
							att : 'average',
							type : choose_type4
						}, function(data) {
							// 为相应的位置赋值
							var valueList = data.data;
							var value = parseFloat(valueList[0]); // ""+Math.round(valueList[0]*100)/100;
							
							var temp = 3;
							var text = "当前建筑用能处于节能状态";
							if(value >= parseFloat(0.4)){ // 评分为E
								temp = 0;
								 text = "当前建筑用能水平处于不节能状态";
							} 

							if(parseFloat(0.2) <= value && value <= parseFloat(0.4)){ // 评分为D
								temp = 1; text = "当前建筑用能水平处于不节能状态";
							} 

							if(parseFloat(0) <= value && value <= parseFloat(0.2)){ // 评分为C
								temp = 2; text = "当前建筑用能处于一般水平";
							} 

							if(parseFloat(-0.2) <= value && value <= parseFloat(0)){ // 评分为B
								temp = 3; text = "当前建筑用能处于节能状态";
							} 

							if(parseFloat(value) <= parseFloat(-0.2)){ // 评分为A
								temp = 4; text = "当前建筑用能处于节能状态";
							}
							
							// 根据评分为其赋值
							$("#<portlet:namespace />datavalue4_1").text(text);
							
							var gradeList = [ 'E', 'D', 'C', 'B', 'A' ];
							var postList = [ 20, 110, 195, 290, 370 ];
							//var temp = Math.floor(Math.random() * 5);
							$("#gradePostion").css("left", postList[temp]);
							$("#grade").text(gradeList[temp]);
						}, 'json');
	}

	// 默认显示当前时间
	choose_type4 = "day";
	if("${importantenergytarget.defaulttime4}" == ""){
		var nowdate = new Date();
		start_date4 = nowdate.getFullYear() + "-" + (nowdate.getMonth() + 1) + "-"
				+ nowdate.getDate();
	} else {
		start_date4 = "${importantenergytarget.defaulttime4}";
	}
	
	// 获取页面数据的值
	<portlet:namespace />setTextAndValue4();
</script>