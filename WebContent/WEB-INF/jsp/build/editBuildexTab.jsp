<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date: ${date} ${time}
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
		<form:form commandName="buildexinfo" method="post" cssClass="editform" action="#">
			<div class="ftitle">办公建筑</div>
			<div class="div-table">
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildWorkernum">办公人员人数</form:label>
							<form:input path="buildWorkernum" class="easyui-numberbox"
								title="取上一年日平均数" />
						</div>
					</div>
				</div>
			</div>
			<div class="ftitle">商场建筑</div>
			<div class="div-table">
				<div class="div-table-row">
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildCustomernum">日均客流量</form:label>
							<form:input path="buildCustomernum" class="easyui-numberbox"
								title="取上一年日平均数" />
						</div>
					</div>
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildOpenhours">运营小时数</form:label>
							<form:input path="buildOpenhours" class="easyui-numberbox"
								precision="4" title="取上一年日平均数" />
						</div>
					</div>
				</div>
			</div>
			<div class="ftitle">宾馆饭店建筑</div>
			<div class="div-table">
				<div class="div-table-row">
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildServicelevel">宾馆星级</form:label>
							<form:input path="buildServicelevel" maxlength="8" title="文字描述" />
						</div>
					</div>
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildHotelliverate">入住率</form:label>
							<form:input path="buildHotelliverate" class="easyui-numberbox"
								precision="4" title="取上一年日平均数" />
						</div>
					</div>
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildHotelbednum">床位数量</form:label>
							<form:input path="buildHotelbednum" class="easyui-numberbox"
								title="" />
						</div>
					</div>
				</div>
			</div>
			<div class="ftitle">影院场馆建筑</div>
			<div class="div-table">
				<div class="div-table-row">
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildVistornum">参观总人数</form:label>
							<form:input path="buildVistornum" class="easyui-numberbox"
								title="取上一年总人数" />
						</div>
					</div>
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildSpectaotrnum">体育馆客流量</form:label>
							<form:input path="buildSpectaotrnum" class="easyui-numberbox"
								title="取上一年总人数" />
						</div>
					</div>
				</div>
			</div>
			<div class="ftitle">文化教育建筑</div>
			<div class="div-table">
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildStudentnum">学生人数</form:label>
							<form:input path="buildStudentnum" class="easyui-numberbox"
								title="取上一年总人数" />
						</div>
					</div>
				</div>
			</div>
			<div class="ftitle">医院建筑</div>
			<div class="div-table">
				<div class="div-table-row">
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildHospitalstandard">医院等级</form:label>
							<form:input path="buildHospitalstandard" />
						</div>
					</div>
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildHospitaltype">医院类别</form:label>
							<form:input path="buildHospitaltype" />
						</div>
					</div>
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildPatientnum">就诊人数</form:label>
							<form:input path="buildPatientnum" class="easyui-numberbox" />
						</div>
					</div>
					<div class="div-table-4col">
						<div class="fitem">
							<form:label path="buildHospitalbednum">病床床位数</form:label>
							<form:input path="buildHospitalbednum" class="easyui-numberbox" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					
				</div>
			</div>

			<div class="ftitle">说明信息</div>
			<div class="div-table">
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildGroupfunc">不同建筑用能区分</form:label>
							<form:textarea path="buildGroupfunc"
								style="height:40px;width:80%" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildExtendfunc">其它建筑用能区分</form:label>
							<form:textarea path="buildExtendfunc"
								style="height:40px;width:80%" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildElectriprice">电价说明</form:label>
							<form:textarea path="buildElectriprice"
								style="height:40px;width:80%" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildWaterprice">水价说明</form:label>
							<form:textarea path="buildWaterprice"
								style="height:40px;width:80%" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildGasprice">气价说明</form:label>
							<form:textarea path="buildGasprice" style="height:40px;width:80%" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildHeatprice">热价说明</form:label>
							<form:textarea path="buildHeatprice"
								style="height:40px;width:80%" />
						</div>
					</div>
				</div>
				<div class="div-table-row">
					<div class="div-table-col">
						<div class="fitem">
							<form:label path="buildOtherprice">其它价绍说明</form:label>
							<form:textarea path="buildOtherprice"
								style="height:40px;width:80%" />
						</div>
					</div>
				</div>
			</div>
			<form:hidden path="buildId"/>
			<form:hidden path="buildinfo.buildId" />
		</form:form>
		<div id="buttons" align="center">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="<portlet:namespace/>saveForm()">保存</a> 
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="<portlet:namespace/>remove()">删除</a> 
			<a href="#" class="easyui-linkbutton" iconCls="icon-back" onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
		</div>
		<script language="javascript">
		/**
		* 保存建筑扩展信息
		*/
		function <portlet:namespace/>saveForm() {
			var resurl = '<portlet:resourceURL id="submitBuildexinfoForm"></portlet:resourceURL>';
			$("#buildexinfo").form('submit', {
				url: resurl,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success: function(result){
					var result = eval('('+result+')');
					if (result.success){
						
					} else {
						$.messager.alert('错误',result.msg,'error');
					}
				}
			});
		}	
		
		/**
		* 删除建筑扩展信息
		*/
		function <portlet:namespace/>remove() {
			if($("#isnew").val()=="false") {
				$.messager.confirm('Confirm','确定要删除建筑扩展资料吗?',function(r){
					 if (r){
						var removeUrl = "<portlet:resourceURL id='removeBuildexinfo'></portlet:resourceURL>";
						$.post(removeUrl,{buildId:'${buildexinfo.buildId}'},function(result){
							if (result.success){
								alert("数据删除成功!");
								var redirect = $("#<portlet:namespace/>redirectview").val();
								window.location.href = redirect;		
							} else {
								$.messager.alert('Error',result.msg,'error');
							}
						},'json');
					} 
				});
			}
		}
		
		</script>
	</c:otherwise>
</c:choose>
