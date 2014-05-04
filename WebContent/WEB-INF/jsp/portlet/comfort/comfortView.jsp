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
		   <a 
		     href="#" class="easyui-linkbutton" iconCls="icon-edit
				plain="true" onclick="<portlet:namespace/>edit()">区域</a>
		   <div ><img src="${imageChildfilePath}" style="width: 750px;height: 500px" id="<portlet:namespace/>buildChildregionimg"> </div>
		   <input type="hidden" id="pid" value="${pid}" />
		   <c:forEach var="element" items="${tagidList}" begin="0"  varStatus="status">
		      <div style="position:absolute; font-size: 10px; text-align: center; top:${element.top}px;left:${element.left}px"> ${element.title}  ${element.url}</div>
		   </c:forEach>   
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
		  </c:if>
		</div>
  </div>
</div>
 <div id="change" style="clear: both"></div>
   <script type="text/javascript">
    function <portlet:namespace/>edit() {
		var regionId = $("#pid").val();
		var editUrl = "<portlet:renderURL portletMode='edit'><portlet:param name='action' value='editForm' /><portlet:param name='regionId' value='tempId' /></portlet:renderURL>";
		var url = editUrl.replace("tempId", regionId);
		window.location.href = url;
	}

    /*    渐变色
    function prefix(s) { 
        if (1==s.length) 
         s="0"+s;
         return s;
      }
      function breakApart(start) { 
        var temp = new Array();
        temp[0] = parseInt(start.substring(0,2),16); 
        temp[1] = parseInt(start.substring(2,4),16);
        temp[2] = parseInt(start.substring(4,6),16); 
        return temp; 
      }
      
      function diffParts(startInt, endInt, steps) {
       var temp = new Array() ; 
       for (var i=0; i<3; i++)
          temp[i] = Math.round((endInt[i] - startInt[i]) / steps); 
          return temp; 
      }

      function createHR(start, end, steps, width, height) {
       var startInt = breakApart(start); 
       var endInt = breakApart(end);
       var stepList = diffParts(startInt, endInt, steps); 
       str = "<TABLE width="+width + " height="+height;
       var alignment = arguments[7];
        if (null!=alignment) { 
          alignment.toLowerCase();
          if ("left"==alignment)
            str+=" align=left";
          else if ("right"==alignment)
            str+=" align=right"; 
          else if ("center"==alignment) 
            str+=" align=center"; 
        } 
        str+=" cellspacing=0 cellpadding=0 border=0><TR>"; 
        for (var r=0; r < steps; r++) { 
            var hr = prefix(startInt[0].toString(16));
            var hg = prefix(startInt[1].toString(16));
            var hb = prefix(startInt[2].toString(16));
           for (var i=0; i < 3; i++)
             startInt[i]+=stepList[i];
             str+="<TD BGCOLOR="+hr + hg + hb+">"
             if (arguments[5]==true) str+="<IMG SRC='../../gifs/s.gif' WIDTH=1 HEIGHT=1>" ;
              str+="</TD>"; 
              if ((arguments[6]==true) && (r < steps-1)) 
              str+="<TR>"; 
       }  

       str+="</TABLE>" 
       var st = '<table width="750" height="30" cellspacing="0" cellpadding="0" border="0" id="shu">'
                +'<tr><td align="center">冷</td><td align="center">比较舒适</td><td align="center">热</td></tr>'  
                +'</table>';
       str+=st;
       return str; 
       }           
      t1=createHR("009900","FF0000",49,750,20, true);
      document.write(t1);
      */
   </script>
  