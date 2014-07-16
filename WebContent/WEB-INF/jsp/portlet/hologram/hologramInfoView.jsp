<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: LIUCHAO
	Created Date: 2013-12-10 上午9点06分
	LastModified Date:
	Description: 全息图切换页面
 -->
<div class="content hologram_size">
	<div id="main" class="hologram hologram_margin">
		<div class="hologram_page hologram_display">
			<div class="title_block">
				<p>园区全息图</p>
			</div>
			<iframe name="<portlet:namespace />tmpFrame"
				id="<portlet:namespace />tmpFrame" width="1" height="1"
				style="visibility: hidden; position: absolute; display: none"></iframe>
			<div class="choose_build">
				<div class="tab_menu">
					<ul>
						<li title="建筑总体" class="cur_tab">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>建筑总体</p>
							</div>
						</li>
						<li title="A1">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>A1楼</p>
							</div>
						</li>
						<li title="P1">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>P1楼</p>
							</div>
						</li>
						<li title="P2">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>P2楼</p>
							</div>
						</li>
						<li title="T1">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>T1楼</p>
							</div>
						</li>
						<li title="T2">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>T2楼</p>
							</div>
						</li>
						<li title="T3">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>T3楼</p>
							</div>
						</li>
						<li title="T4">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>T4楼</p>
							</div>
						</li>
						<li title="T5">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>T5楼</p>
							</div>
						</li>
					</ul>
				</div>
				<div class="tab_content current">
					<%@include file="../hologram/buildHologramView.jsp"%>
				</div>
			</div>
			<div class="build_plan">
				<div class="build build_A1" title="A1">
					<div class="build_header">Building A1<i class="sandian"></i></div>
					<div class="build_para"></div>
				</div>
				<div class="build build_P1" title="P1">
					<div class="build_header">Building P1<i class="sandian"></i></div>
					<div class="build_para"></div>
				</div>
				<div class="build build_P2" title="P2">
					<div class="build_header">Building P2<i class="sandian"></i></div>
					<div class="build_para"></div>
				</div>
				<div class="build build_T1" title="T1">
					<div class="build_header">Building T1<i class="sandian"></i></div>
					<div class="build_para"></div>
				</div>
				<div class="build build_T2" title="T2">
					<div class="build_header">Building T2<i class="sandian"></i></div>
					<div class="build_para"></div>
				</div>
				<div class="build build_T3" title="T3">
					<div class="build_header">Building T3<i class="sandian"></i></div>
					<div class="build_para"></div>
				</div>
				<div class="build build_T4" title="T4">
					<div class="build_header">Building T4<i class="sandian"></i></div>
					<div class="build_para"></div>
				</div>
				<div class="build build_T5" title="T5">
					<div class="build_header">Building T5<i class="sandian"></i></div>
					<div class="build_para"></div>
				</div>
			</div>
		</div>

		<div class="build_page">
			<div class="title_block sub_title_block">
				<p class="back_hologram" onclick="<portlet:namespace />goBack()">全息图</p>
			</div>
			<div class="fault_tab build_select ">
				<div class="tab_menu">
					<ul>
						<li title="A1">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>A1楼</p>
							</div>
						</li>
						<li title="P1">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>P1楼</p>
							</div>
						</li>
						<li title="P2">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>P2楼</p>
							</div>
						</li>
						<li title="T1">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>T1楼</p>
							</div>
						</li>
						<li title="T2">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>T2楼</p>
							</div>
						</li>
						<li title="T3">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>T3楼</p>
							</div>
						</li>
						<li title="T4">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>T4楼</p>
							</div>
						</li>
						<li title="T5">
							<div>
								<img
									src="${pageContext.request.contextPath}/styles/second/images/dot.png" />
								<p>T5楼</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="tab_switch_group">
				<div class="fault_tab_content current">
					<%@include file = "../hologram/buildFloorsView.jsp"%>
				</div>
			</div>
		</div>
		<div class="hidden_tool">
			<span class="floor_select_block"> | <span class="floor_select">一层</span></span>
			<div class="floor_list">
				<ul>
					<li title="B1">B1</li>
					<li title="B2">B2</li>
					<li title="1F">一层</li>
					<li title="JC">夹层</li>
					<li title="2F">二层</li>
					<li title="3F">三层</li>
					<li title="4F">四层</li>
					<li title="5F">五层</li>
					<li title="6F">六层</li>
					<li title="7F">七层</li>
					<li title="JF">机房</li>
					<li title="WD">屋顶</li>
				</ul>
			</div>
			<table class="build_para_table">
				<tbody>
					<!-- <tr>
						<td>人数</td>
						<td><span>516</span><span>人</span></td>
					</tr> -->
					<tr>
						<td>当日耗电量</td>
						<td><span>1000</span><span>kWh</span></td>
					</tr>
					<tr>
						<td>当日耗冷量</td>
						<td><span>800</span><span>kW</span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	$(".choose_build").each(function(){
		var thisdom = $(this).find(".tab_menu li");
		var thisdomCount = $(this).find(".tab_menu li").length;
		var tabdom = $(".choose_build");
		fitWidth(thisdom,thisdomCount,tabdom);	
	});
	
	// 全息图首页面-选择建筑总体及楼层事件
	$(".choose_build").each(function(){
		$(this).find(".tab_menu li").each(function(index){
			$(this).on("click", function(){
				$(this).siblings().removeClass("cur_tab");
				$(this).addClass("cur_tab");
				<portlet:namespace />choose_build = $(this).attr("title"); // 存放选择的建筑 
				<portlet:namespace />change_parameter();
			});
		});
	});
	
	$(".fault_tab").each(function(){
		var thisdom = $(this).find(".tab_menu li");
		var thisdomCount = $(this).find(".tab_menu li").length;
		var tabdom = $(".fault_tab");
		fitWidth(thisdom,thisdomCount,tabdom);
	});

	// 全息图中-具体建筑里面的选择建筑
	$(".fault_tab").each(function(){
		$(this).find(".tab_menu li").each(function(index){
			$(this).on("click", function(event){
				holo_cur_build = $(this).attr("title"); // 具体建筑里面的选择建筑
				
				if("${tbinfo.isShowPlan}" == "block")
					$("#pmPic").attr("src", "${pageContext.request.contextPath}/styles/second/images/" + holo_cur_build + ".png"); // 更换对应的平面图
				
				<portlet:namespace />default_build = index;
				$(this).siblings().removeClass("cur_tab");
				$(this).addClass("cur_tab");
				//$(".tab .tab_content:eq(0)").show().siblings(".tab_content").hide();
				
				<portlet:namespace />getParameter();
				event.stopPropagation();
			});
		});
	});

	// 全息图上的建筑触发事件
	$(".build_plan > .build").each(function(index){
		var that = $(this);
		$(this).find(".build_header").hover(function(){
			var thisdom = that.find(".build_para");
			that.find(".build_para").show();
			that.css({"z-index": 100});
			showBuildParam(thisdom, that.attr("title"), <portlet:namespace />start_date);
		},function(){
			that.find(".build_para").hide();
			that.css({"z-index": 50});
			$(".build_para").children().remove();
		});
		$(this).find(".build_header").on("click", function(){
			holo_cur_build = $(this).parent().attr("title"); // 全息图上点击的建筑
			
			if("${tbinfo.isShowPlan}" == "block")
				$("#pmPic").attr("src", "${pageContext.request.contextPath}/styles/second/images/" + holo_cur_build + ".png"); // 更换对应的平面图
			
			$(".fault_tab .tab_menu li").removeClass("cur_tab");
			$(".fault_tab .tab_menu li:eq("+ index +")").addClass("cur_tab");
			<portlet:namespace />default_build = index;
			$(".fault_tab .tab_menu li:eq("+ index +")").siblings().find(".floor_list").remove();
			var addText = $(".hidden_tool .floor_select_block").clone(true);
			$(".fault_tab .tab_menu li:eq("+ index +")").find(".floor_select_block").remove();
			$(".fault_tab .tab_menu li:eq("+ index +")").find("p").append(addText);

			<portlet:namespace />getParameter();
			$(".build_page").show();
			$(".hologram_page").hide();
		});
	});
	
	// 全息图-具体建筑中选择楼层 
	$(".floor_list li").each(function(index){
		$(this).click(function(){
			holo_floor_text = $(this).text(); // 当前楼层对应的中文名字
			holo_cur_floor = $(this).attr("title"); // 默认为1F楼
			f_ele_id = f_temp_id = f_co2_id = r_ele_id = r_temp_id = holo_cur_floor;
			<portlet:namespace />choose_build1 = index;
			$(".hidden_tool > .floor_select_block > .floor_select").text(holo_floor_text); // 选择的楼层
			$(".cur_tab").find(".floor_select").text(holo_floor_text); // 设置当前选择的楼层
			$(".cur_tab .floor_list").remove();
			<portlet:namespace />getParameter();
			event.stopPropagation();
		});
	});
	
	$(".btn_group div").on("click", function(){
		$(this).siblings().removeClass("btn_press");
		$(this).addClass("btn_press");
	});
	
	//返回全息图初始页面
	function <portlet:namespace />goBack(){
		$(".fault_tab .tab_menu li").find(".floor_select_block").remove();
		$(".choose_build .tab_menu li:eq(0)").addClass("cur_tab").siblings().removeClass("cur_tab");
		$(".build_page").hide();
		$(".hologram_page").show();
	}

	// 鼠标浮在对应的建筑上显示对应的建筑信息
	function showBuildParam(thisdom, buildId, starttime){
		$.ajax({
			type : "POST",
			url : "<portlet:resourceURL id='getDatasForNamesAndAtts'></portlet:resourceURL>",
			data : {
				from : starttime,
				name : hologram_name,
				id : 'total_' + buildId + ',total_' + buildId, // hologram_id,
				ispd : hologram_ispd,
				att : 'sum',
				type : 'day',
				decimals: '0',
				build_id: buildId,
				region_id: 'total'
			},
			success : function(result) {
				var data = result.data;
				//$(".build_para_table tr:eq(0) > td:eq(1) > span:eq(0)").text(data[0][0][0]); // 人数
				$(".build_para_table tr:eq(0) > td:eq(1) > span:eq(0)").text(data[0][0][0]); // 当日耗电量
				try {
					$(".build_para_table tr:eq(1) > td:eq(1) > span:eq(0)").text(data[1][0][0]); // 当日耗冷量
				} catch(e) {
					$(".build_para_table tr:eq(1) > td:eq(1) > span:eq(0)").text(0); // 当日耗冷量
				}
				
				var disTable = $(".build_para_table").clone();
				disTable.appendTo($(".build_para"));
			},
			error : function(result) {
				console.log('getLeftRegionData + error');
			}
		});
	}

	// 鼠标浮在对应的建筑上显示对应的建筑信息
	function getRegionList() {
		$.ajax({
			type : "POST",
			url : "<portlet:resourceURL id='getQuerySchemeListByCondition'></portlet:resourceURL>",
			data : {
				buildId: holo_cur_build,
				comments: '%co2浓度%',
				order: ' id asc'
			},
			async: false,
			success : function(result) {
				var data = result.result;
				$("#choose_region").empty(); // 清空下拉列表
				if(data.length == 0) {
					$("#<portlet:namespace />concentration_chart").children().remove();
				} else {
					for(var i = 0; i < data.length; i++) {
						if(i == 0) {
							r_region_id = data[i].regionId;
							r_co2_id = data[i].id;
						}
						$("#choose_region").append("<option region='" + data[i].regionId + "' value='" + data[i].id + "'>" + data[i].comments + "</option>");
					}
				}
				
				if($("#choose_region").find("option").length == 0) { // 如果区域下拉列表为空，则不允许选择时间 
					// 最大、最小、平均区域CO2浓度 
					$(".region_co2 > tr:eq(0) > td:eq(1)").text(0); // 最大CO2浓度
					$(".region_co2 > tr:eq(0) > td:eq(3)").text(''); // 最大CO2浓度对应的时间
					$(".region_co2 > tr:eq(1) > td:eq(1)").text(0); // 最小CO2浓度
					$(".region_co2 > tr:eq(1) > td:eq(3)").text(''); // 最小CO2浓度对应的时间
					$(".region_co2 > tr:eq(2) > td:eq(1)").text(0); // 平均CO2浓度			
				}
			},
			error : function(result) {
				console.log('getRegionList + error');
			}
		});
	}

</script>