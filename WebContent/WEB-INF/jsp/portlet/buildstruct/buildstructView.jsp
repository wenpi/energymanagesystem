<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-30 下午03:27:26
	LastModified Date:
	Description:
 -->
 
  <div class="layout-sidebar" style="width: 15%;" >
  <div class="title">
 	<h4> 楼层平面图 </h4> 
  </div>
  <c:forEach var="buildregionParent" items="${buildregionParentList}" begin='0'
		varStatus="status">
		<ul class="buildregion-list">
			<li  class="buildregion-list1" style="margin-bottom: -10px"><a
					href="<portlet:renderURL portletMode='view'><portlet:param name='action' value='getbuildregion' /><portlet:param name='regionId' value='${buildregionParent.regionId}' /></portlet:renderURL>">${buildregionParent.regionName}</a>
		    </li>
		</ul>
	</c:forEach>
 </div>	
 
<div class="layout-body" style="width: 80%;">	 
  <div class="title" >
		<div id="wrap"  style="position:relative;" >
		  <c:if test="${imagefilePath != ''}">
		    <img  src="${imagefilePath}"  style="width: 750px;height: 500px" id="<portlet:namespace/>buildimg">
		  </c:if> 
		  <c:if test="${imageChildfilePath != ''}">
		    <c:if test="<%= permissionChecker.isOmniadmin() %>">
		   <a 
		     href="#" class="easyui-linkbutton" iconCls="icon-edit
				plain="true" onclick="<portlet:namespace/>edit()">设备配置</a>
			</c:if>	
		   <div ><img src="${imageChildfilePath}" style="width: 750px;height: 500px" id="<portlet:namespace/>buildChildregionimg"> </div>
		   <input type="hidden" id="pid" value="${pid}" />
		   <table width="750" height="20" cellspacing="0" cellpadding="0" border="0" id="aui_3_2_0_11180">
		   <tbody id="aui_3_2_0_11179"><tr id="aui_3_2_0_11178"><td bgcolor="009900">
		   <img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="059600"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="0a9300"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="0f9000"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="148d00"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="198a00"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="1e8700"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="238400"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="288100"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="2d7e00"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="327b00"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="377800"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="3c7500"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="417200"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="466f00"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="4b6c00"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="506900"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="556600" id="aui_3_2_0_11177"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="5a6300"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="5f6000"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="645d00"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="695a00"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="6e5700"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="735400"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="785100"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="7d4e00"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="824b00"><img src="../../gifs/s.gif" width="1" height="1"></td>
		   <td bgcolor="874800"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="8c4500"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="914200"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="963f00"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="9b3c00"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="a03900"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="a53600"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="aa3300"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="af3000"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="b42d00"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="b92a00"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="be2700"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="c32400"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="c82100"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="cd1e00"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="d21b00"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="d71800"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="dc1500"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="e11200"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="e60f00"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="eb0c00"><img src="../../gifs/s.gif" width="1" height="1"></td><td bgcolor="f00900"><img src="../../gifs/s.gif" width="1" height="1"></td></tr></tbody></table>
		   <table width="750" height="30" cellspacing="0" cellpadding="0" border="0" id="shu"><tbody><tr><td align="center">冷</td><td align="center">比较舒适</td><td align="center">热</td></tr></tbody></table>
		   <tr style="vertical-align: top;">
		    <td colspan="3">
			<table width=750px>
				<tr valign="top" >
				<c:if test="${fHserie2 eq ''}">
					<td width="100%">
					<section class="portlet"> <header
							class="portlet-topper">
						<h1 class="portlet-title" style="text-align: center;">
							<span class="portlet-title-text"  ><b>用电量</b></span>
						</h1>
						</header>
						<div class="portlet-content">
							<div class=" portlet-content-container" style="">
								<div class="portlet-body">
							<table id="<portlet:namespace/>QueryHdresult" class="easyui-datagrid"
							>
							<thead>
								<tr>
									<th field="time" width="300">时间</th>
									<th field="val" width="200">耗电(kWh)</th>
									<th field="total" width="200">总计(kWh)</th>
								</tr>
							</thead>
						</table>
								</div>
							</div>
						</div>
						</section></td>
				</c:if>
				
				 <c:if test="${fHserie2 != ''}">
					<td width="50%">
					<section class="portlet"> <header
							class="portlet-topper">
						<h1 class="portlet-title">
							<span class="portlet-title-text" >用电量</span>
						</h1>
						</header>
						<div class="portlet-content">
							<div class=" portlet-content-container" style="">
								<div class="portlet-body">
							<table id="<portlet:namespace/>QueryHdresult" class="easyui-datagrid"
							>
							<thead>
								<tr>
									<th field="time" width="150">时间</th>
									<th field="val" width="100">耗电(kWh)</th>
									<th field="total" width="100">总计(kWh)</th>
								</tr>
							</thead>
						</table>
								</div>
							</div>
						</div>
						</section></td>
						<td width="50%"><section class="portlet"> <header
							class="portlet-topper">
						<h1 class="portlet-title">
							<span class="portlet-title-text">冷量</span>
						</h1>
						</header>
						<div class="portlet-content">
							<div class=" portlet-content-container" style="">
								<div class="portlet-body">
							<table id="<portlet:namespace/>QueryLlresult" class="easyui-datagrid"
							>
							<thead>
								<tr>
									<th field="time" width="150">时间</th>
									<th field="val" width="100">冷量(kWh)</th>
									<th field="total" width="100">总计(kWh)</th>
								</tr>
							</thead>
						</table>
								</div>
							</div>
						</div>
						</section></td>
					</c:if> 
 <!--  			 	
						<td width="33%"><section class="portlet"> <header
							class="portlet-topper">
						<h1 class="portlet-title">
							<span class="portlet-title-text">PMV值</span>
						</h1>
						</header>
						<div class="portlet-content">
							<div class=" portlet-content-container" style="">
								<div class="portlet-body">
							<table id="<portlet:namespace/>QueryPMVresult" class="easyui-datagrid"
							>
							<thead>
								<tr>
									<th field="time" width="150">时间</th>
									<th field="val" width="100">PMV值</th>
								</tr>
							</thead>
						</table>
								</div>
							</div>
						</div>
						</section></td>
--> 						
				</tr>
			</table>
		   </td>
	     </tr>
		  </c:if>
		</div>
  </div>
</div>
 <div id="change" style="clear: both"></div>
 <!--
 <div class="layout-sidebar" style="width: 15%;">
  <div class="title">
 	<h4> 楼层平面图 </h4>  
 	
  </div>
      
     
		<c:forEach var="buildregionParent" items="${buildregionParentList}" begin='0'
		varStatus="status">
		<ul class="buildregion-list">
			<li  class="buildregion-list1" style="margin-bottom: -30px"> <a onclick="showBuild('${buildregionParent.regionImage}')">
					${buildregionParent.regionName}
				    </a>     
				<ul class="">
					<c:forEach var="buildregionChild" items="${buildregionChildList}" begin='0'
						varStatus="status">
						<c:if test="${buildregionParent.regionId==buildregionChild._parentId}">
							<li><a
								href="<portlet:renderURL portletMode='view'><portlet:param name='action' value='getChildbuildregion' /><portlet:param name='regionId' value='${buildregionChild.regionId}'/></portlet:renderURL>">
								${buildregionChild.regionName}
							</a>
							</li>
						</c:if>
					</c:forEach>
				</ul></li>
		</ul>
	 </c:forEach>
	
	 
	 
 </div>	
 
<div class="layout-body" style="width: 80%;">	 
  <div class="title" >
		<div id="wrap"  style="position:relative;" >
		<c:if test="${imagefilePath != ''}">
		    <img  src="${imagefilePath}"  style="width: 750px;height: 500px" id="<portlet:namespace/>buildimg">
		</c:if>    
		<c:if test="${imageChildfilePath != ''}">
		<div><img src="${imageChildfilePath}" style="width: 750px;height: 500px" id="<portlet:namespace/>buildChildregionimg"> </div>
		</c:if>
		</div>
  </div>
  
</div>
  <div id="change" style="clear: both"></div>
     <div id="<portlet:namespace/>dlg" class="easyui-dialog"
	style="width: 600px; height: 500px; "closed="true">
	   <div id="lc"  style="position:relative;" >
	   </div>
	</div>
  
  <script type="text/javascript">
//各区域标号及其图片
  var areaposition =  [
                      {'left': '420', 'top': '320',  'img': '/energymanagesystem/uploadfiles/builds/000001070001/f2.png',  'img1':'/energymanagesystem/uploadfiles/builds/000001070001/a.png'},  /* 제조공정 */
                      {'left': '180', 'top': '270',  'img': '/energymanagesystem/uploadfiles/builds/000001070001/f1.png',  'img1':'/energymanagesystem/uploadfiles/builds/000001070001/a.png'}  /* 제조공정 */
  			          ];
//各楼层图片
  var tagposition =  [
                     {'left': '20', 'top': '70',  'img': '/energymanagesystem/uploadfiles/builds/000001070001/7.png', 'url': 'http://localhost:8080/zh/web/guest/92?p_p_id=buildstruct_WAR_energymanagesystem_INSTANCE_ap4T&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_action=getbuildregion&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_regionId=0000010700010003' },  /* 제조공정 */
                     {'left': '20', 'top': '120', 'img': '/energymanagesystem/uploadfiles/builds/000001070001/6.png', 'url': 'http://localhost:8080/zh/web/guest/92?p_p_id=buildstruct_WAR_energymanagesystem_INSTANCE_ap4T&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_action=getbuildregion&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_regionId=0000010700010001' },  /* 제조공정 */
                     {'left': '20', 'top': '170', 'img': '/energymanagesystem/uploadfiles/builds/000001070001/5.png', 'url': 'http://localhost:8080/zh/web/guest/92?p_p_id=buildstruct_WAR_energymanagesystem_INSTANCE_ap4T&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_action=getbuildregion&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_regionId=0000010700010006' },  /* 제조공정 */
                     {'left': '20', 'top': '220', 'img': '/energymanagesystem/uploadfiles/builds/000001070001/4.png', 'url': 'http://localhost:8080/zh/web/guest/92?p_p_id=buildstruct_WAR_energymanagesystem_INSTANCE_ap4T&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_action=getChildbuildregion&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_regionId=0000010700010004' },  /* 제조공정 */
                     {'left': '20', 'top': '270', 'img': '/energymanagesystem/uploadfiles/builds/000001070001/3.png', 'url': 'http://localhost:8080/zh/web/guest/92?p_p_id=buildstruct_WAR_energymanagesystem_INSTANCE_ap4T&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_action=getChildbuildregion&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_regionId=0000010700010004' },  /* 제조공정 */
			         {'left': '20', 'top': '320', 'img': '/energymanagesystem/uploadfiles/builds/000001070001/2.png', 'url': 'http://localhost:8080/zh/web/guest/92?p_p_id=buildstruct_WAR_energymanagesystem_INSTANCE_ap4T&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_action=getChildbuildregion&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_regionId=0000010700010004' },  /* 제조공정 */
			         {'left': '18', 'top': '370', 'img': '/energymanagesystem/uploadfiles/builds/000001070001/1.png', 'url': 'http://localhost:8080/zh/web/guest/92?p_p_id=buildstruct_WAR_energymanagesystem_INSTANCE_ap4T&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_action=getChildbuildregion&_buildstruct_WAR_energymanagesystem_INSTANCE_ap4T_regionId=0000010700010004' },  /* 제조공정 */
			         ];
  
  if('${imagefilePath}'!="")
  {    
	  showAreaposition();   
  }
//定位各区域  
  function showAreaposition(){
	  var strTags = '';
	  $(areaposition).each(function (index, element) {
		  strTags += '<div style="position:absolute;top:' + element.top + 'px;left:' + element.left + 'px;cursor:pointer;"><img onclick="showBuild(\''+element.img1+'\');"  src="' + element.img + '"></div>';
    	})
          $("#wrap").append(strTags);
  }
//显示区域
  function showBuild(img1){
	  if(img1!=""){
	  $('#<portlet:namespace/>dlg').dialog('open').dialog('setTitle','楼层选择');
	  var html = '';
	  $("#lc").empty();
	  html+='<img   style="width: 580px;height: 450px"  src="' + img1 + '">';
	  $("#lc").append(html);
	  showPosition();
	  }
  }
//具体楼层
  function showPosition(){
	  var strTags = '';
	  $(tagposition).each(function (index, element) {
		  strTags += '<div style="position:absolute;top:' + element.top + 'px;left:' + element.left + 'px;cursor:pointer;"><a href="'+ element.url+'"><img src="' + element.img + '"></a></div>';
    	});
      $("#lc").append(strTags);
 }
  
  </script>
  
   -->
   <script type="text/javascript">
 //编辑记录
    
    function <portlet:namespace/>edit() {
		var regionId = $("#pid").val();
		var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editForm' /><portlet:param name='regionId' value='tempId' /></portlet:renderURL>";
		var url = editUrl.replace("tempId", regionId);
		window.location.href = url;
	}

    $(function() {
    	var id = $("#pid").val();
 	   $.post('<portlet:resourceURL id="getHdresult"></portlet:resourceURL>',
 				{regionId:id},function(data){
 				$("#<portlet:namespace/>QueryHdresult").datagrid('loadData',data);
 	   });

 	   $.post('<portlet:resourceURL id="getLlresult"></portlet:resourceURL>',
 				{regionId:id},function(data){
 				$("#<portlet:namespace/>QueryLlresult").datagrid('loadData',data);
 	   });

 	   $.post('<portlet:resourceURL id="getPMVresult"></portlet:resourceURL>',
 				{regionId:id},function(data){
 				$("#<portlet:namespace/>QueryPMVresult").datagrid('loadData',data);
 	  });
  	  
	  var strTags = '';
 	  $.post('<portlet:resourceURL id="showPMV"></portlet:resourceURL>',{regionId:id},function(data){  
				 	  var top = 25;
				 	  $(data).each(function (index, element) {
				 		   if(data[0]!=undefined && data[0] !=null){
				 		  strTags += '<div style="position:absolute; font-size: 20px; text-align: center; top:' + element.top + 'px;left:' + element.left + 'px;" ' + 'title='+element.url +'>'+element.title+'</div>';
				 	      var bg = '';
				 			if(5>parseInt(element.url)&&parseInt(element.url)>=0){
				 				bg = 'background:#517400;'; 
				 			}
				 			if(10>parseInt(element.url)&&parseInt(element.url)>=5){
				 				bg = 'background:#159c00;'; 
				 			}
				 			if(15>parseInt(element.url)&&parseInt(element.url)>=10){
				 				bg = 'background:#8d4c00;'; 
				 			}
				 			if(parseInt(element.url)&&parseInt(element.url)>=15){
				 				bg = 'background:#c92400;'; 
				 			}
				 		  strTags += '<div style="position:absolute; width:60px; height:30px; color:#55FF99; '+bg+' font-size: 20px; text-align: center; top:' +top+'px;left:0px; " >'+element.title+'</div>';
				 		  top = top+30;
				 		   }
				 	  })
				 	   $("#wrap").append(strTags);
	  });
    	  });
   </script>
  