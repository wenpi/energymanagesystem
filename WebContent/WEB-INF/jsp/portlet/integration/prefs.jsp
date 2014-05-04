<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- 
	AUTHOR: CHENPING
	Created Date: 2013-1-28 下午03:51:49
	LastModified Date:
	Description: 集成模块设置
 -->
<portlet:actionURL var="savePrefUrl">
	<portlet:param name="action" value="savePreferences" />
</portlet:actionURL>
<portlet:actionURL var="uploadfilesUrl">
	<portlet:param name="action" value="uploadfiles" />
</portlet:actionURL>
<div id="msg"></div>

<form:form modelAttribute="integrationMode" method="post"
	enctype="multipart/form-data">
	<div class="ftitle">建筑设置</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="buildId">所属建筑</form:label>
					<form:input path="buildId" required="true" />
					<span class="taglib-icon-help"> * <img alt=""
						title="当前设备所属建筑"
						src="/html/themes/classic/images/portlet/help.png" /> </span> <input
						type="hidden" name="realPath" id="realPath" value="${realPath}" />
				</div>
			</div>
		</div>
	</div>

	<div class="ftitle">集成目录</div>
	<div class="div-table navs">
		<div class="div-table-row navitem">
			<div class="div-table-3col">
				<div class="fitem">
					<label for="name">目录名称</label> <input type="text" name="name"
						value="" class=".name" required="true" />

				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<label for="filePath">文件名称</label> <input type="text"
						name="filePath" class="easyui-combo filePath" /> 
					<span class="taglib-icon-help"> 
						<img alt="" title="" class="selectFile"
						src="/html/themes/classic/images/portlet/options_selected.png" />
					</span>
				</div>
			</div>
		</div>
	</div>

	<div class="ftitle">上传文件</div>
	<div id="uploadmsg"></div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="subPath">文件目录</form:label>
					<form:input path="subPath" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">

					<form:label path="file">上传文件</form:label>
					<form:input path="file" type="file" />
					<input type="button" id="uploadfile"
						onclick="<portlet:namespace/>uploadfile()" value="上传文件">
				</div>
			</div>
		</div>

	</div>
</form:form>
<div id="buttons">
	<a href="#" class="easyui-linkbutton"
		onclick="<portlet:namespace/>savePreference()">保存首选项</a>
</div>
<script language="javascript">

	var console=console||{"log":function(){}};
	

	$(function(){
		
		var grid = $('#buildId').combogrid('grid');
		
		//选择文件
		$(".selectFile").click(function(){
			
			var filePath = $(this).parent().parent().find('.filePath');
			var name = $(this).parent().parent().parent().parent().children().find("input[name='name']");

		//	$(filePath).combobox({valueField:'fileId',textField:'fullName'});
			
			//获取当前选择的所属建筑
			var buildinfo = grid.datagrid('getSelected');
			
			if(buildinfo==null) {
				$("#msg").addClass("portlet-msg-error").html("请选择建筑。");
				return;
			} else {
				$("#msg").removeClass("portlet-msg-error").html("");
			}
			
			
			//获取目录文件列表 
			$.get('<portlet:resourceURL id="getFiles"></portlet:resourceURL>',
					{buildId:buildinfo.buildId,suffix:'.svg',realPath:$("#realPath").val(),subPath:''},
					function(data){	
				$(filePath).combo({valueField:'fileId',textField:'fullName',data:data});
			});
			
			/* $(filePath).combobox({
				onSelect:function(param) {
					var navname = "";
					if(typeof(param.fullName)!="undefined") {
						navname = param.fullName.replace(".svg","");
					}
					if($(name).length>0 && $(name).val()=='') {
						$(name).val(navname);
					}
				}
			}); */

			
		});
		

		
		$(".easyui-combo .filePath").combobox({
			onSelect:function(){
				var a = $(".filePath").combobox("getValue");
				console.log(a);
			}

		});
		
		
		
		
		
	});
	
	
	//上传文件
	function <portlet:namespace/>uploadfile() {
		if($("#file").val()=="") {
			$("#file").css("background-color","yellow");
		}
		var grid = $('#buildId').combogrid('grid');
		var buildinfo = grid.datagrid('getSelected');
		if(buildinfo==null || buildinfo.buildId=='') {
			$("#uploadmsg").addClass("portlet-msg-error").html("请选择建筑。");
			return;
		}

		$("#integrationMode").form("submit",{
			url:"<%=renderResponse.encodeURL(uploadfilesUrl)%>",
			onSubmit : function() {
				$("#file").removeAttr("style");
				return $(this).form('validate');
			},
			success : function(result) {
				$("#uploadmsg").addClass("portlet-msg-success").html("文件上传成功。");
			}
		});
		
		
		
	}

	
	
	/**
	* 保存首选项信息
	*/
	function <portlet:namespace/>savePreference() {
		$("#preferenceModel").form('submit', {
			url:'<%=renderResponse.encodeURL(savePrefUrl)%>',
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
			}
		});
	}

	/**
	 * 获取建筑信息列表
	 */
	$("#buildId").combogrid({
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
</script>
