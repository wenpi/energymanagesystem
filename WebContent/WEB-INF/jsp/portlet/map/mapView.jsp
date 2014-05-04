<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-9-4 上午11:05:16
	LastModified Date:
	Description: 项目地图
 -->

<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
<div id="map_canvas" style="width: 830px; height: 600px;"></div>
<script type="text/javascript">
	$(function() {
		
		var dictitms = [
		   <c:forEach items="${buildfunctions}" var="func" varStatus="status">
		   {itemCode:'${func.itemCode}',itemName:'${func.itemName}'}<c:if test="${!status.last}">,</c:if>
		   </c:forEach>];
		
		function getFuncname(value){
			for(var i=0; i<dictitms.length; i++){
				if (dictitms[i].itemCode == value) return dictitms[i].itemName;
			}
			return value;
		}

		
		var map = new BMap.Map('map_canvas');

		map.centerAndZoom(new BMap.Point(103.996094, 38.694866), 5);
		map.enableScrollWheelZoom();
		map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件
		map.addControl(new BMap.OverviewMapControl({
			isOpen : false,
			anchor : BMAP_ANCHOR_TOP_RIGHT
		})); //右上角，打开

		// 编写自定义函数,创建标注
		function addMarker(point, message) {
			var marker = new BMap.Marker(point);
			map.addOverlay(marker);

			var infoWindow = new BMap.InfoWindow(message);
			marker.addEventListener("click", function() {
				this.openInfoWindow(infoWindow);
			});
		}
		var content = "";
		<c:forEach items="${buildinfos}" var="build">
			
			content =
				"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>建筑名称：<c:out value="${build.buildName}" /></h4>" + 
				"<table width='100%' class='buildinfo'>"+
				"<tr><td rowspan='6' style='padding:0px;'><img id='${build.buildId}' src='${build.buildCover}' width='169' height='130' title='${build.buildName}'/></td>"+
				"<td>建筑类型："+ getFuncname('${build.buildFunction}') +"</td></tr>" +
				"<tr><td>建筑年代：${build.buildYear}</td></tr>" + 
				"<tr><td>建筑层数：地上${build.buildUpfloor}F,地下${build.buildDownfloor}F</td></tr>" + 
				"<tr><td>建筑总面积:${build.buildTotalarea}㎡</td></tr>" + 
				"<tr><td>监测日期：<fmt:formatDate value="${build.buildMonitordate}" type="date"/></td></tr>" + 
				"<tr><td>建筑能耗：</td></tr>" + 
				"</table>";
				<c:if test="${!empty build.buildLong and !empty build.buildLat}">
				addMarker(new BMap.Point(<c:out value="${build.buildLong}" />,<c:out value="${build.buildLat}" />), 
						content);
				</c:if>
			
			  
		</c:forEach>
		
		/* var chenjianPoint = new BMap.Point(121.53171099999997, 31.222367);
		addMarker(chenjianPoint, "上海城建国际大厦");

		var shibPoint = new BMap.Point(121.49237700000003, 31.183374);
		addMarker(shibPoint, "上海世博中国馆"); */

	});
</script>


