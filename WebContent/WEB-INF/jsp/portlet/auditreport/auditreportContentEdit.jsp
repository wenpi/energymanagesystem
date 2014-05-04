<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-30 下午03:27:12
	LastModified Date:
	Description:
 -->


  
 <portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>

<div id="msg"></div>
<form:form commandName="auditreport" method="post" class="" action="#">
    <div class="div-table">
      <div class="ftitle">报告标题</div> 
         <div class="div-table-row"> 
           <div class="fitem" >
			 <form:input path="title" cssClass="easyui-validatebox" required="true"  style="width:200px" /> *
			</div>
	    </div>
  
         <div class="ftitle">报告内容</div>
           <div class="div-table-row"> 
             <div class="fitem" >
		      <form:textarea path="mycontent"  style="width:200px" />
		      <script type="text/javascript" src="/html/js/editor/ckeditor/ckeditor.js"></script>
		      <script type="text/javascript" > 

		     	 CKEDITOR.plugins.add('matheqn', {
		    	    requires: ['dialog'],
		    	    init: function(editor){
		    	  // Add the link and unlink buttons.
		    	  editor.addCommand('matheqn', new CKEDITOR.dialogCommand('matheqn'));
		    	  
		    	        editor.ui.addButton('matheqn', {
		    	            label: '插入图表',
		    	            icon: '/html/icons/polls_display.png',
		    	            command: 'matheqn',
		    	        });
//		    	        CKEDITOR.dialog.add('linkcontent', this.path + 'dialogs/linkcontent.js');
		    	    }
		    	});
		      
		      CKEDITOR.replace( 'mycontent', 
		    		  {    
		    	           extraPlugins : 'matheqn',
		    	           enterMode : Number( 2),//设置enter键的输入1.<p>2为<br/>3为<div> 
		                   shiftEnterMode : Number( 1), // 设置shiftenter的输入 
		    		  //自定义的工具栏
		    		       toolbar : [
		   		    		  
['Source','unlink','-','Save','unlink','Preview','-','Templates'],
['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print','SpellChecker','Scayt'],
['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
'/',
['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
['Link','Unlink','Anchor'],
['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar',
'PageBreak','matheqn'], //我的按钮
'/',
['Styles','Format','Font','FontSize'],
['TextColor','BGColor'],
['Maximize','ShowBlocks','-','About','-']
],
		    		  });
          </script>
		     </div>
	    </div>
    </div>
	
	<div class="ftitle">数据来源</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="buildId">目标建筑</form:label>
					<form:input path="buildId" required="true" />
					<span class="taglib-icon-help"> <img title="设置数据来源建筑"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
	</div>	
	
	<form:hidden path="reportid" />   
	<form:hidden path="version" />
	<form:hidden path="articleid" />
</form:form>

<div id="buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>savePreference()">保存首选项</a>
</div>

<script language="javascript">
	/**
	* 保存
	*/
	function <portlet:namespace/>savePreference() {
		$("#auditreport").form('submit', {
			url:'<%=renderResponse.encodeURL(savePrefUrl)%>',
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
			}
		});
	}

	/**
	* 获取建筑信息列表
	*/
	$("#buildId").combogrid({
		panelWidth:500,
		value:$("#buildId").val(),
		idField:'buildId',
		textField:'buildName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getBuildinfos"></portlet:resourceURL>',
		columns:[[
			{field:'buildId',title:'建筑编号',width:100},
			{field:'buildName',title:'建筑名称',width:100}
		]],keyHandler: {
			up: function(){},
			down: function(){},
			enter: function(){},
			query: function(q){
				$('#buildId').combogrid("grid").datagrid("reload", { 'keyword': q });
	            $('#buildId').combogrid("setValue", q);
			}
		}
	});
</script>	

    