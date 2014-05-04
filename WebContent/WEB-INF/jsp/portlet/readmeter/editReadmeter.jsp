<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:  2012-6-5
	LastModified Date:
 -->
 <portlet:resourceURL id="submitReadmeterForm" var="submitReadmeterFormUrl"></portlet:resourceURL>
 <div class="ftitle">
	<span>抄表信息</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
	</span>
</div>
 <div id="msg"></div>
 <form:form commandName="readmeter" method="post" cssClass="editform" action="${submitReadmeterFormUrl}" onKeyDown="KeyDown(event)" >
<div class="div-table">
	<div class="div-table-row">
		<div class="div-table-4col">
			<div class="fitem">
				<form:label path="buildId">建筑名称：</form:label>
				<form:input path="buildId"  />
			</div>
		</div>
		<div class="div-table-4col">
			<div class="fitem">
				<form:label path="energydict.energydictId">类型：</form:label>
				<form:input path="energydict.energydictId" />
			</div>
		</div>
		<div class="div-table-4col">
			<div class="fitem">
				<form:label path="readingDate">抄表日期：</form:label>
				<form:input path="readingDate" cssClass="easyui-datebox" />
			</div>
		</div>
		<div class="div-table-4col">
			<div class="fitem">
				<form:label path="readingPerson">抄表人：</form:label>
				<form:input path="readingPerson" cssClass="easyui-validatebox"
						 required="true" />
			</div>
		</div>
	</div>
</div>
<div class="ftitle"></div>
<div class="gk" style="height: 20px"></div>
<div class="div-table" style="margin-left:50px">
	<div class="div-table-row">
		<div class="div-table-col">
			<div class="fitem">
				<form:label path="meterId"><font  size=3px>仪表名称：</font></form:label>
  		    	<form:input path="meterId"  cssClass="easyui-validatebox" required="true" size="50"  onclick="showMeter()"/>
			</div>
		</div>
   </div>	
   
   <div class="div-table-row">	
		<div class="div-table-col">
			<div class="fitem">
				<form:label path="readingData"><font  size=3px>抄表数：</font></form:label>
				<form:input path="readingData"  cssClass="easyui-validatebox" size="50" onkeyup="value=value.replace(/[^\d.]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" 
						 required="true"  /> *(必须为数值)
			</div>
		</div>
   </div>
</div>   
<form:hidden path="readingid"/>
<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
</form:form>
<div id="<portlet:namespace/>dlg-buttons" style="margin-left:100px">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="<portlet:namespace/>save()" >保存</a>
	<a href="#"
				class="easyui-linkbutton" iconCls="icon-back"
				onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>
<script type="text/javascript">
$(function(){
	$('#buildId').combogrid({
		panelWidth : 500,
		value : $("#buildId").val(),
		idField : 'buildId',
		textField : 'buildName',
		pagination : true,//是否分页  
		rownumbers : true,
		fit : true,
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		url : '<portlet:resourceURL id="getBuildinfos"></portlet:resourceURL>',
		columns : [ [ {
			field : 'buildId',
			title : '建筑编号',
			width : 100
		}, {
			field : 'buildName',
			title : '建筑名称',
			width : 100
		} ] ],
		keyHandler : {
			up : function() {
			},
			down : function() {
			},
			enter : function() {
			},
			query : function(q) {
				$('#buildId').combogrid("grid").datagrid("reload", {
					'keyword' : q
				});
				$('#buildId').combogrid("setValue", q);
			}
		}
	});

	/**
	   * 获取能源列表
	   */
	$("#energydict\\.energydictId").combogrid({
		panelWidth:500,
		value:$("#energydict\\.energydictId").val(),
		idField:'energydictId',
		textField:'energydictName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getEnergydicts"></portlet:resourceURL>',
		columns:[[
			{field:'energydictName',title:'名称',width:100}
		]],keyHandler: {
			up: function(){},
			down: function(){},
			enter: function(){},
			query: function(q){
				$('#energydictId').combogrid("grid").datagrid("reload", { 'keyword': q });
	            $('#energydictId').combogrid("setValue", q);
			}
		}
	  });
   });
 //提交保存
   function <portlet:namespace/>save() {
	   var buildId =  $('#buildId').combogrid("getValue");
	   var mType = $("#energydict\\.energydictId").combogrid("getValue");
       var rdate = $('#readingDate').combogrid("getValue");
       if(buildId==""){
   			alert("请选择建筑");
   			return;
     	}
     	if(mType==""){
   	    	alert("请选择类型");
   	    	return;
   	    }
     	if(rdate==""){
       	    alert("请选择抄表日期");
       	    return;
       	}
     
 		var url = '<portlet:resourceURL id="submitReadmeterForm"></portlet:resourceURL>';
 		$("#readmeter").form('submit',{
 			url: url,
 			onSubmit: function(){
 					return $(this).form('validate');
 			},
 			success: function(result){
 				var result = eval('('+result+')');
 				if (result.success){
 					if(isnew=='true') {
 						var redirect = $("#<portlet:namespace/>redirect").val();
 							redirect += "&<portlet:namespace/>action=editReadmeterForm&<portlet:namespace/>readingid="+result.msg; 
 							window.location.href = redirect;
 					}
 					meterId.value = "";
 					readingData.value = "";
 					$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");		
 				} else {
 					$.messager.alert('错误',result.msg,'error');
 				}
 			}
 		}); 
   }

   function KeyDown(evt)
   {   
	   var k=window.event?evt.keyCode:evt.which;
	   if(k == 13){
          <portlet:namespace/>save();
       }
   }
   function showMeter()
   { 
	   var bId =  $('#buildId').combogrid("getValue");
	   if(bId==""){
	   		alert("请选择建筑");
	   		return;
	     }
	   $("#meterId").flushCache();
	   var arrayObj = new Array();
	   var buildId = $('#buildId').combogrid("getValue");
	   $.post('<portlet:resourceURL id="getMeterIds"></portlet:resourceURL>',{buildId:buildId},function(data){
		   if(data[0]!=undefined && data[0] !=null){
			   $.each(data,function(index,obj) {
				   arrayObj.push(obj);
				});
			   $("#meterId").autocomplete(arrayObj, { 
			    	  width: 200, 
			    	  max: 500,
		              matchContains: true,   //true 则显示包含关键字的词
				}); 
			}
		});
   }
</script>
