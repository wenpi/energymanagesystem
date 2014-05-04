<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-7-2 下午05:11:56
	LastModified Date:
	Description:
 -->
<style>
<!--
.datarevise {
	margin: 10px;
}

.datarevise-container {
	clear: both;
	overflow:auto; zoom:1;
}

.datarevise-container ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

.datarevise-container ul li {
	width: <%=prefs.getValue("width", "")%>px;
	float: left;
	margin: 10px 10px 0px 0px;
	display: inline;
	text-align: center;
	padding:10px;
	background:#f4f4f4;
}

.datarevise-container ul li a {
	display: block;
}

.datarevise-container ul li a img {
	padding: 1px;
	border: 1px solid #e1e1e1;
	margin-bottom: 3px;
}

.datarevise-container ul li a:hover img {
	padding: 0px;
	border: 2px solid #f98510;
}
-->
</style>
<div class="datarevise">
	<c:forEach var="metertype" items="${metertypes}" begin='0'>
		<h4>${metertype.itemName}</h4>
		<div class="datarevise-container">
			<ul>
				<c:forEach var="meteruseinfo" items="${meteruseinfos}" begin='0'
					varStatus="status">
					<c:if test="${metertype.itemCode eq meteruseinfo.meterproinfo.meterType}">
					<li>
							<a
								onclick="edit('${meteruseinfo.meterId}','${meteruseinfo.meterproinfo.meterProductname}','${meteruseinfo.meterproinfo.meterProducter}','${meteruseinfo.meterproinfo.meterModel}','${meteruseinfo.meterId}','${meteruseinfo.meterName}')">
								<img width="<%=prefs.getValue("width", "")%>"
								height="<%=prefs.getValue("height", "")%>"
								src="${meteruseinfo.meterproinfo.meterPhoto}"
								style="cursor: pointer" /> ${meteruseinfo.meterName}</a>
						
					</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</c:forEach>
	<div style="clear: both;"></div>
</div>


<div id="<portlet:namespace/>dlg" class="easyui-dialog"
	style="width: 420px; height: 500px; padding: 10px 15px" closed="true"
	buttons="#<portlet:namespace/>dlg-buttons">
	<div class="ftitle">仪器信息</div>
	<form:form commandName="meterproinfo" method="post" cssClass="editform"
		action="#">

		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>产品名称：</label><b><span
						id="meterProductname"></span> </b>
				</div>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>生产厂家：</label><b><span id="meterProducter"></span>
					</b>
				</div>
			</div>
		</div>

		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>产品型号：</label><b><span id="meterModel"></span>
					</b>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>装表ID：</label>
					<strong><span id="meterId"></span></strong>
				</div>
			</div>
		</div>
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<label>装表名称：</label><span id="meterName"></span>
				</div>
			</div>
		</div>
		
	</form:form>

	<div class="ftitle">仪表修正信息</div>
	<form:form modelAttribute="meteruseinfo" method="post"
		cssClass="editform" action="#">

	</form:form>

</div>
<div id="<portlet:namespace/>dlg-buttons" align="center">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>save()">保存</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-cancel"
		onclick="javascript:$('#<portlet:namespace/>dlg').dialog('close')">取消</a>
</div>

<script type="text/javascript">
/**
* 添加仪表属性
*/
function edit(meterId,meterProductname,meterProducter,meterModel,meterId,meterName){
			$('#<portlet:namespace/>dlg').dialog('open').dialog('setTitle','编辑仪表属性');
			$("#meterId").text(meterId);
			$("#meterProductname").text(meterProductname);
			$("#meterProducter").text(meterProducter);
			$("#meterModel").text(meterModel);
			$("#meterId").text(meterId);
			$("#meterName").text(meterName);

			var html="";
			$.post('<portlet:resourceURL id="getMeteruseattributes"></portlet:resourceURL>',{meterId:meterId},function(data){
				$.each(data,function(index,obj) {		
					html+= getMeterAttributeHtml(index,obj);
				});		
				$("#meteruseinfo").html("");
				if(html=="") {
					html = '<div id="tip" class="tip-info" style="margin-bottom: 10px;"><div class="op-tip icon-tip">&nbsp;</div><div>仪表未添加参数信息,请联系设备管理员</div></div>';
				}
				$("#meteruseinfo").append(html);
			});
			
       } 


function getMeterAttributeHtml(index,obj) {
	var html = "";
	html += "<fieldset>";
	html += "<legend>"+obj.id.meterattrName+"</legend>";
	html += "<div class='fitem'><label>属性名称：</label>"+ obj.id.meterattrName +"</div>";
	html += "<div class='fitem'><label>属性值：</label>"+ obj.meterattrValue +"</div>";
	html += "<div class='fitem'><label>原始记录值：</label><input type=\"text\" name=\"meteruseattributeslist["+ index +"].meterattrCurrentvalue\" value=\""+ obj.meterattrCurrentvalue +"\"></div>";
	html += "<div class='fitem'><label>当前读表值：</label><input type=\"text\" name=\"meteruseattributeslist["+ index +"].meterattrReadvalue\" value=\""+ obj.meterattrReadvalue +"\"  ></div>";
	html += "<div class='fitem'><label>数据偏差值：</label>"+ obj.meterattrDiffvalue +"</div>";
	html += "<input type=\"hidden\" name=\"meteruseattributeslist["+ index +"].id.meterId\" value=\""+ obj.id.meterId +"\">";
	html += "<input type=\"hidden\" name=\"meteruseattributeslist["+ index +"].id.meterattrName\" value=\""+ obj.id.meterattrName +"\">";
	html += "</fieldset>";
	return html;
}


function <portlet:namespace/>save() {
	var url = '<portlet:resourceURL id="submitForm"></portlet:resourceURL>';
	$("#meteruseinfo").form('submit', {
		url: url,
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			var result = eval('('+result+')');
			if (result.success){
				$.messager.alert('提示','数据保存成功!','info');
				$('#<portlet:namespace/>dlg').dialog('close');
			} else {
				$.messager.alert('错误',result.msg,'error');
			}
		}
	});
}

</script>

