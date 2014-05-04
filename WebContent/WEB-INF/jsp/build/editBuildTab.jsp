
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init-ext.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
 <div id="msg"></div>
<form:form commandName="buildinfo" method="post" cssClass="editform"
	action="#">
	<div class="ftitle">基本信息</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildId">建筑编号</form:label>
					<c:choose>
						<c:when test='${isnew==true}'>
								系统生成
						</c:when>
						<c:otherwise>
						${buildinfo.buildId}
						</c:otherwise>
					</c:choose>
					<form:hidden path="buildId" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildName">建筑名称</form:label>
					<form:input path="buildName" cssClass="easyui-validatebox"
						maxlength="24" required="true" />
					*
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildAliasname">字母别名</form:label>
					<form:input path="buildAliasname" maxlength="10" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="datacenterinfo.datacenterId">数据中心</form:label>
					<form:input path="datacenterinfo.datacenterId" maxlength="6"
						required="true" />
					*
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildOwner">建筑业主</form:label>
					<form:input path="buildOwner" maxlength="40" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildState">监测状态</form:label>
					<form:radiobutton path="buildState" value="1" />
					启用
					<form:radiobutton path="buildState" value="0" />
					停用
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildDistrictid">所属行政区</form:label>
					<form:input path="buildDistrictid"
						maxlength="6" />
					*
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildLong">建筑经度</form:label>
					<form:input path="buildLong" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildLat">建筑纬度</form:label>
					<form:input path="buildLat" /><span class="taglib-icon-help"> <img alt=""
						title="只有填写建筑经/纬度,才能在能耗地图标记建筑,坐标位置参考：http://www.earthol.com/"
						src="/html/themes/classic/images/portlet/help.png" /> </span>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildClimaticregion">所属气候区</form:label>
					<form:input path="buildClimaticregion" maxlength="40" />
				</div>
			</div>

			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildAddress">建筑地址</form:label>
					<form:input path="buildAddress" maxlength="40" />
				</div>
			</div>
		</div>
	</div>
	<div class="ftitle">建筑信息</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="buildYear">建成年代</form:label>
					<form:input path="buildYear" maxlength="4" class="easyui-numberbox" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="buildFunction">建筑功能类型</form:label>
					<form:input path="buildFunction" required="true" />
					*
					<!-- combogrid -->
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="buildUpfloor">地上建筑层数</form:label>
					<form:input path="buildUpfloor" class="easyui-numberspinner"
						min="1" max="1000" />
				</div>
			</div>
			<div class="div-table-2col">
				<div class="fitem">
					<form:label path="buildDownfloor">地下建筑层数</form:label>
					<form:input path="buildDownfloor" class="easyui-numberspinner"
						min="-10" max="100" />
				</div>
			</div>
		</div>
	</div>
	<div class="ftitle">维护信息</div>
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildTotalarea">建筑总面积</form:label>
					<form:input path="buildTotalarea" maxlength="18"
						class="easyui-numberbox" precision="4" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildAirarea">空调面积</form:label>
					<form:input path="buildAirarea" class="easyui-numberbox"
						maxlength="18" precision="4" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildHeatarea">采暖面积</form:label>
					<form:input path="buildHeatarea" cssClass="easyui-numberbox"
						maxlength="18" precision="4" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildAirtype">空调系统形式</form:label>
					<form:input path="buildAirtype" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildHeattype">采暖系统形式</form:label>
					<form:input path="buildHeattype" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildBodycoef">建筑体型系数</form:label>
					<form:input path="buildBodycoef" cssClass="easyui-numberbox"
						maxlength="18" precision="4" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildStrutype">建筑结构型式</form:label>
					<form:input path="buildStrutype" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildWallmattype">外墙材料形式</form:label>
					<form:input path="buildWallmattype" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildWallwarmtype">外墙保温形式</form:label>
					<form:input path="buildWallwarmtype" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildWallwintype">建筑外窗类型</form:label>
					<form:input path="buildWallwintype" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildGlasstype">建筑玻璃类型</form:label>
					<form:input path="buildGlasstype" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildWinframetype">窗框材料类型</form:label>
					<form:input path="buildWinframetype" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildStandard">是否标杆建筑</form:label>
					<form:radiobutton path="buildStandard" value="true" />
					是
					<form:radiobutton path="buildStandard" value="false" />
					否
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildDesigndept">方案设计单位</form:label>
					<form:input path="buildDesigndept" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildWorkdept">工程实施单位</form:label>
					<form:input path="buildWorkdept" />
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildMonitordate">开始监测日期</form:label>
					<form:input path="buildMonitordate" cssClass="easyui-datebox" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildAcceptdate">工程验收日期</form:label>
					<form:input path="buildAcceptdate" cssClass="easyui-datebox" />
				</div>
			</div>
			<div class="div-table-3col">
				<div class="fitem">
					<form:label path="buildCreatedbyuserid">创建人</form:label>
					<c:choose>
						<c:when test='${isnew==true}'>
						</c:when>
						<c:otherwise>
							<form:input path="buildCreatedbyuserid" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
</form:form>
<div id="buttons" align="center">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-remove"
		onclick="<portlet:namespace/>remove()">删除</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>
<script language="javascript">
	$(function() {
		//数据中心列表
		$("#datacenterinfo\\.datacenterId").combogrid({
			panelWidth:450,
			value:$("#datacenterinfo\\.datacenterId").val(),
			idField:'datacenterId',
			textField:'datacenterName',
			pagination : true,//是否分页  
			rownumbers:true,
			fit: true,
			pageSize: 10,
			pageList: [10],
			url:'<portlet:resourceURL id="getDatacenters"></portlet:resourceURL>',
			columns:[[
				{field:'datacenterId',title:'数据中心ID',width:100},
				{field:'datacenterName',title:'中心名称',width:100},
				{field:'datacenterType',title:'中心类型',width:100,formatter:function(value,row){
					if(value==1) {
						return "数据中心";
					} else {
						return "数据中转站";
					}
				}}
			]]
		});
		
		//数据字典列表
		<portlet:namespace/>getDictitemsByGroupcode('buildFunction','build_function');
		<portlet:namespace/>getDictitemsByGroupcode('buildAirtype','build_airtype');
		<portlet:namespace/>getDictitemsByGroupcode('buildHeattype','build_heattype');
		<portlet:namespace/>getDictitemsByGroupcode('buildStrutype','build_strutype');
		<portlet:namespace/>getDictitemsByGroupcode('buildWallmattype','build_wallmattype');
		<portlet:namespace/>getDictitemsByGroupcode('buildWallwarmtype','build_wallwarmtype');
		<portlet:namespace/>getDictitemsByGroupcode('buildWallwintype','build_wallwintype');
		<portlet:namespace/>getDictitemsByGroupcode('buildGlasstype','build_glasstype');
		<portlet:namespace/>getDictitemsByGroupcode('buildWinframetype','build_winframetype');

	});
	
	/**
	* 获取行政区划列表
	*/
	$('#buildDistrictid').combogrid({
		panelWidth:500,
		value:$('#buildDistrictid').val(),
		idField:'districtId',
		textField:'districtName',
		pagination : true,//是否分页  
		rownumbers:true,
		fit: true,
		pageSize: 10,
		pageList: [10,20,30,40,50],
		url:'<portlet:resourceURL id="getDistricts"></portlet:resourceURL>',
		columns:[[
			{field:'districtId',title:'行政区编号',width:100},
			{field:'districtName',title:'行政区名称',width:100},
			{field:'districtinfo',title:'上级行政区',width:100,formatter:function(value,row){
				if(value!=null)
					return value.districtId;
			}},
			{field:'districtPostcode',title:'邮编',width:60},
			{field:'districtAreacode',title:'区号',width:60}
		]],keyHandler: {
			up: function(){},
			down: function(){},
			enter: function(){},
			query: function(q){
				$('#buildDistrictid').combogrid("grid").datagrid("reload", { 'keyword': q });
                $('#buildDistrictid').combogrid("setValue", q);
			}
		}
	});
	/**
	* 保存建筑数据
	*/
	function <portlet:namespace/>saveForm() {
		var resurl = '<portlet:resourceURL id="submitBuildinfoForm"></portlet:resourceURL>';
		$("#buildinfo").form('submit', {
			url: resurl,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success: function(result){
				var result = eval('('+result+')');
				if (result.success){
					var isnew = $("#isnew").val();
					if(isnew=='true') {
						var redirect = $("#<portlet:namespace/>redirect").val();
						redirect += "&<portlet:namespace/>action=editBuildinfoForm&<portlet:namespace/>buildId="+result.msg; 
						window.location.href = redirect;		
					}
					$("#msg").addClass("portlet-msg-success").html("您的请求已处理成功。");
				} else {
					$.messager.alert('错误',result.msg,'error');
				}
			}
		});
	}	
	
	/**
	* 删除建筑信息
	*/
	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','删除建筑数据将删除所有关联此建筑的数据,确定要删除吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeBuildinfo'></portlet:resourceURL>";
					$.post(removeUrl,{buildId:'${buildinfo.buildId}'},function(result){
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