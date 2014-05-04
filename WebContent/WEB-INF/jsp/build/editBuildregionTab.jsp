
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date:2012-6-17上午11:25:11
	LastModified Date:
	Description:
 -->
<c:choose>
	<c:when test="${empty buildinfo}">
		<div id="tip" class="tip-info" style="margin-bottom: 10px;">
			<div class="op-tip icon-tip">&nbsp;</div>
			<div>必段先保存建筑基本资料</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="easyui-layout" style="width: 100%; height: 420px;">
			<div region="west" split="true" title="区域结构" style="width: 450px;">
				<portlet:resourceURL id="getBuildregioninfoByBuildId" var="getBuildregioninfoByBuildIdURL">
				</portlet:resourceURL>
				<table id="<portlet:namespace/>buildregioninfos" class="easyui-treegrid"
					width="100%" style="height: 380px;"
					url="<%=renderResponse.encodeURL(getBuildregioninfoByBuildIdURL)%>"
					idField="regionId" treeField="regionName" rownumbers="true" pagination="false" singleSelect="true">
					<thead>
						<tr>
							<th field="regionId" width="120">区域ID</th>
							<th field="regionName" width="260">区域名称</th>
						</tr>
					</thead>
				</table>
			</div>
			<div region="center" title="建筑区域" style="background: #fafafa;">
				<form:form commandName="buildregioninfo" method="post"
					cssClass="editform"  action="#">
					<div class="div-table">
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="regionId">建筑区域ID</form:label>
									<c:choose>
										<c:when test="${!empty buildregioninfo.regionId}">
											<c:out value="${buildregioninfo.regionId}"></c:out>
											<form:hidden path="regionId" />
										</c:when>
										<c:otherwise>
											<form:input path="regionId" value="系统生成" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="regionName">区域名称</form:label>
									<form:input path="regionName" cssClass="easyui-validatebox"
						maxlength="24" required="true" /> *
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="buildregioninfo.regionId">上级区域</form:label>
									<form:input path="buildregioninfo.regionId"  cssClass="easyui-combotree" />
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="regionType">区域类型</form:label>
									<form:select path="regionType">
										<form:option value="build">建筑</form:option>
										<form:option value="floor">楼层</form:option>
										<form:option value="room">房间</form:option>
										<form:option value="area">区域</form:option>
									</form:select>
									*
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="regionRemark">区域说明</form:label>
									<form:input path="regionRemark" />
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="regionImage">区域图片</form:label>
									<form:input path="regionImage" style="width:300px;" /> <br /><a href="javascript:void(0)" id="uploadfile" onclick="uploadBuildregionImage()">上传图片</a>
									<a href="javascript:void(0);" id="preview">图片预览</a>
								</div>
							</div>
						</div>
						<div class="div-table-row">
							<div class="div-table-col">
								<label><input type="checkbox" id="setPosition"  /> 设置图片位置</label>
							</div>
						</div>
						
						<div class="position" style="dispaly:<c:if test="${empty buildregioninfo.left}">none;</c:if>" >
						<div class="div-table-row">
							<div class="div-table-2col">
								<div class="fitem">
									<form:label path="left">left</form:label>
									<form:input path="left" /> 
								</div>
							</div>
							<div class="div-table-2col">
								<div class="fitem">
									<form:label path="top">top</form:label>
									<form:input path="top" /> 
								</div>
							</div>
						</div>
						
						<div class="div-table-row">
							<div class="div-table-2col">
								<div class="fitem">
									<form:label path="width">width</form:label>
									<form:input path="width" /> 
								</div>
							</div>
							<div class="div-table-2col">
								<div class="fitem">
									<form:label path="height">height</form:label>
									<form:input path="height" /> 
								</div>
							</div>
						</div>
						
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="offset">offset</form:label>
									<form:input path="offset" /> 
								</div>
							</div>
						</div>
						
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="url">链接地址</form:label>
									<form:input path="url" /> 
								</div>
							</div>
						</div>
						
						
						<div class="div-table-row">
							<div class="div-table-col">
								<div class="fitem">
									<form:label path="title">图片提示</form:label>
									<form:input path="title" /> 
								</div>
							</div>
						</div>
						
						</div>
						
					</div>
					
					<form:hidden path="buildinfo.buildId" value="${buildinfo.buildId}" />
					<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
				</form:form>
				
				<div id="buttons" align="center">
					<a href="#" class="easyui-linkbutton" iconCls="icon-add"
						onclick="<portlet:namespace/>addForm()">新增</a>
					<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
						onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
						class="easyui-linkbutton" iconCls="icon-remove"
						onclick="<portlet:namespace/>remove()">删除</a> 
				</div>
				
				<div id="uploadDlg"  class="easyui-dialog"
			style="width: 400px; height: 280px; padding: 10px 20px" closed="true">

					<portlet:actionURL var="uploadBuildregioninfo"><portlet:param name="action" value="uploadBuildregioninfo" /></portlet:actionURL>
					<form:form id="frombuildregioninfo" commandName="buildregioninfo" method="post" cssClass="editform" action="#"  enctype="multipart/form-data">
						<form:input path="fileData" type="file" />
						<form:hidden path="buildinfo.buildId" value="${buildinfo.buildId}" />
						<input type="button" onclick="submitUploadBuildregioninfo()" value="上传图片" />
						<input type="hidden" id="uploadRegionid" />
					</form:form>
				</div>
			</div>
		</div>
		
		<div id="dlg" class="easyui-dialog" title="图片预览" style="width:600px;height:450px;padding:10px" closed="true">  
        	<img id="build-image" />
    	</div>
    
		<script language="javascript">
		
		$(function(){
			
			$("a#preview").hide();
			$("a#uploadfile").hide();
			
			$("a#preview").click(function(e){
				var src = $(this).attr("src");
				if(typeof(src)!='undefind') {
					if(src.length>0) {
						$("#build-image").attr('src',src);
						$('#dlg').dialog('open')
					}
				}
			});
			
			//显示位置设置属性
			$('#setPosition').is(':checked') ? $(".position").show() : $(".position").hide();
		});
		
		$("#<portlet:namespace/>buildregioninfos").treegrid({
			onClickRow:function(row,data) {
				$("#regionId").val(row.regionId);
				$("#uploadRegionid").val(row.regionId);
				$("#regionName").val(row.regionName);
				$("#regionRemark").val(row.regionRemark);
				$("#regionImage").val(row.regionImage);
				$("#buildinfo\\.buildId").val('${buildinfo.buildId}');
				var parentId = (row.buildregioninfo==null?'':row.buildregioninfo.regionId);
				$('#buildregioninfo\\.regionId').combotree('setValue', parentId);
				
				if(row.regionImage.length>0) {
					$("a#preview").show();
					$("a#preview").attr("src",row.regionImage);
				} else {
					$("a#preview").hide();
				}

				$("a#uploadfile").show();
			}
		});
		
		
		function uploadBuildregionImage() {
			$('#uploadDlg').dialog('open').dialog('setTitle','新增附件');
		}
		
		
		/**
		* 新增建筑区域
		*/
		function <portlet:namespace/>addForm() {
			var currentParentId = $('#buildregioninfo\\.regionId').combotree('getValue');
			$("#buildregioninfo").form('clear');
			$("#buildinfo\\.buildId").val('${buildinfo.buildId}');
			$("#regionId").val("系统生成");
			 $('#buildregioninfo\\.regionId').combotree('setValue',currentParentId);
			 
			 $("a#preview").hide();
			 $("a#uploadfile").hide();
		}
		
		/**
		*  保存建筑区域
		*/
		function <portlet:namespace/>saveForm() {
			var url='<portlet:resourceURL id="submitBuildregioninfoForm"></portlet:resourceURL>';
			$("#buildregioninfo").form('submit', {
				url: url,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success: function(result){
					var result = eval('('+result+')');
					if (result.success){	
						var currentParentId = $('#buildregioninfo\\.regionId').combotree('getValue');
						$.messager.confirm('Confirm','建筑区域信息保存成功,是否继续新增?',function(r){
							 if (r){ 
								 //继续新增
								 <portlet:namespace/>addForm();
							 }
							 $("#<portlet:namespace/>buildregioninfos").treegrid("reload");
							 $('#buildregioninfo\\.regionId').combotree('reload');
						});
						
						
					} else {
						$.messager.alert('错误',result.msg,'error');
					}
				}
			});
		}
		
		/**
		*  删除建筑区域
		*/
		function <portlet:namespace/>remove() {
			var row = $("#<portlet:namespace/>buildregioninfos").treegrid('getSelected');
			if(row) {
				$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
					 if (r){
						var removeUrl = "<portlet:resourceURL id='removeBuildregioninfo'></portlet:resourceURL>";
						$.post(removeUrl,{regionId:row.regionId},function(result){
							if (result.success){
								$.messager.alert('提示','数据删除成功!','info');
								$("#<portlet:namespace/>buildregioninfos").treegrid('reload');
								<portlet:namespace/>addForm();
							} else {
								$.messager.alert('Error',result.msg,'error');
							}
						},'json');
					} 
				});
			}else {
				$.messager.alert('提示','请选择您要删除的仪表信息','info');
			}
		}
		
		
		$("#buildregioninfo\\.regionId").combotree({
			url:"<portlet:resourceURL id="getBuildregionComboTree"></portlet:resourceURL>"
		});
		
		function submitUploadBuildregioninfo() {
			var url = '<portlet:actionURL><portlet:param name="action" value="uploadBuildregioninfo" /><portlet:param name="regionId" value="tempId" /></portlet:actionURL>';
			url = url.replace("tempId",$("#uploadRegionid").val());
			$("#frombuildregioninfo").form('submit', {
				url:url,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success: function(result){
					$('#uploadDlg').dialog('close');
					$.get('<portlet:resourceURL id="getBuildregioninfo"></portlet:resourceURL>',{regionId:$("#regionId").val()},function(data){
						$.each(data,function(index,obj){
							$("#regionImage").val(obj.regionImage);
						});		
					});
				}
			}); 
		}
		
		</script>
	</c:otherwise>
</c:choose>