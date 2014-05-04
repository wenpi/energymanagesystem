
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">

<!-- HTML START -->
<!-- 
	AUTHOR: 
	Created Date:
	LastModified Date:
	Description:
 -->
<div class="ftitle">
	<span>能源价格</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
	</span>
</div>
 <div id="msg"></div>
<form:form commandName="energyprice" method="post" cssClass="editform">
	<div class="div-table">
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
				    <form:hidden path="priceid" />
					<form:label path="energydict.energydictId">能源</form:label>
					<form:input path="energydict.energydictId" maxlength="16"/>
				</div>
			</div>
		</div>
		
		<div class="div-table-row">
			<div class="div-table-col"> 
				<div class="fitem">
					<form:label path="pricetype">收费方式</form:label>
					 <form:select path="pricetype" cssClass="easyui-validatebox" style="width:130px; height:25px" onChange="setPricetype()">
		             <form:option value="0">不启用收费方式</form:option>
		    <!--     <form:option value="1">峰顶峰谷收费</form:option>
		             <form:option value="2">阶梯收费</form:option>
		    -->          
		            </form:select>
				</div>
			</div>
		</div>
		
		<c:choose>
			<c:when test="${0==energyprice.pricetype||empty energyprice.pricetype}">
				<div class="div-table-row">	
			       <div class="div-table-col">
				<div class="fitem">
					<form:label path="pricetypevalue">收费方式分类</form:label>
					 <form:select path="pricetypevalue" cssClass="easyui-validatebox" style="width:130px; height:25px">
		             <form:option value="0">基础价格</form:option>
		            </form:select> 
				</div>
			    </div>
		        </div>
			</c:when>
			<c:when test="${1==energyprice.pricetype}">
				<div class="div-table-row">	
			       <div class="div-table-col">
				<div class="fitem">
					<form:label path="pricetypevalue">收费方式分类</form:label>
					 <form:select path="pricetypevalue" cssClass="easyui-validatebox" style="width:130px; height:25px">
		             <form:option value="0">基础价格</form:option>
		             <form:option value="11">峰谷价格</form:option>
		             <form:option value="12">峰顶价格</form:option>
		            </form:select> 
				</div>
			    </div>
		        </div>
			</c:when>
			<c:when test="${2==energyprice.pricetype}">
				<div class="div-table-row">	
			       <div class="div-table-col">
				<div class="fitem">
					<form:label path="pricetypevalue">收费方式分类</form:label>
					 <form:select path="pricetypevalue" cssClass="easyui-validatebox" style="width:130px; height:25px" >
		             <form:option value="0">基础价格</form:option>
		             <form:option value="23">第二档价格</form:option>
		             <form:option value="24">第三档价格</form:option>
		            </form:select> 
				</div>
			    </div>
		        </div>
			</c:when>
		</c:choose>
		<div class="div-table-row">	
			       <div class="div-table-col">
				<div class="fitem">
		<form:label path="begintime">开始时间</form:label>
					 <form:select path="begintime" cssClass="easyui-validatebox" disabled="true" >
					 <form:option value="0">0</form:option>
		             <form:option value="1">1</form:option>
		             <form:option value="2">2</form:option>
		             <form:option value="3">3</form:option>
		             <form:option value="4">4</form:option>
		             <form:option value="5">5</form:option>
		             <form:option value="6">6</form:option>
		             <form:option value="7">7</form:option>
		             <form:option value="8">8</form:option>
		             <form:option value="9">9</form:option>
		             <form:option value="10">10</form:option>
		             <form:option value="11">11</form:option>
		             <form:option value="12">12</form:option>
		             <form:option value="13">13</form:option>
		             <form:option value="14">14</form:option>
		             <form:option value="15">15</form:option>
		             <form:option value="16">16</form:option>
		             <form:option value="17">17</form:option>
		             <form:option value="18">18</form:option>
		             <form:option value="19">19</form:option>
		             <form:option value="20">20</form:option>
		             <form:option value="21">21</form:option>
		             <form:option value="22">22</form:option>
		             <form:option value="23">23</form:option>
		             <form:option value="24">24</form:option>
		 </form:select>
		</div>
			    </div>
		  </div> 
	<div class="div-table-row">	
			       <div class="div-table-col">
				<div class="fitem">	 
		 <form:label path="endtime">结束时间</form:label>
					 <form:select path="endtime" cssClass="easyui-validatebox" disabled="true" >
					 <form:option value="0">0</form:option>
		             <form:option value="1">1</form:option>
		             <form:option value="2">2</form:option>
		             <form:option value="3">3</form:option>
		             <form:option value="4">4</form:option>
		             <form:option value="5">5</form:option>
		             <form:option value="6">6</form:option>
		             <form:option value="7">7</form:option>
		             <form:option value="8">8</form:option>
		             <form:option value="9">9</form:option>
		             <form:option value="10">10</form:option>
		             <form:option value="11">11</form:option>
		             <form:option value="12">12</form:option>
		             <form:option value="13">13</form:option>
		             <form:option value="14">14</form:option>
		             <form:option value="15">15</form:option>
		             <form:option value="16">16</form:option>
		             <form:option value="17">17</form:option>
		             <form:option value="18">18</form:option>
		             <form:option value="19">19</form:option>
		             <form:option value="20">20</form:option>
		             <form:option value="21">21</form:option>
		             <form:option value="22">22</form:option>
		             <form:option value="23">23</form:option>
		             <form:option value="24">24</form:option>
		 </form:select>
	     </div>
			    </div>
		  </div>	  
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="price">单价 </form:label>
					<form:input path="price" />
				</div>
			</div>
		</div>
			
		<div class="div-table-row">
			<div class="div-table-col">
				<div class="fitem">
					<form:label path="comment">备注</form:label>
					<form:input path="comment" />
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="isnew" name="isnew" value="${isnew}" />
</form:form>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
		onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-remove"
		onclick="<portlet:namespace/>remove()">删除</a> <a href="#"
		class="easyui-linkbutton" iconCls="icon-back"
		onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
</div>
<script>
function <portlet:namespace/>saveForm() {
	var url = '<portlet:resourceURL id="submitEnergypriceForm"></portlet:resourceURL>';
	$("#energyprice").form('submit', {
		url: url,
		onSubmit : function() {
			return $(this).form('validate');
		},
		success: function(result){
			var result = eval('('+result+')');
			if (result.success){
				if(isnew=='true') {
					var redirect = $("#<portlet:namespace/>redirect").val();
					redirect += "&<portlet:namespace/>action=editEnergypriceForm&<portlet:namespace/>priceid="+result.msg; 
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
   * 获取能源列表
   */
$("#energydict\\.energydictId").combogrid({
	panelWidth:200,
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
		{field:'energydictName',title:'能源名称',width:200}
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
  
	function <portlet:namespace/>resetForm() {
		$('#energyprice').form('clear');
	}

	/**
	* 设置价格类型
	*/
	function setPricetype(){

		var pricetypevalue0 = [{pricetypevalue:0,pricetypetext:'基础价格'}];
		var pricetypevalue1 = [{pricetypevalue:0,pricetypetext:'基础价格'},{pricetypevalue:11,pricetypetext:'峰谷价格'},{pricetypevalue:12,pricetypetext:'峰顶价格'}];
		var pricetypevalue2 = [{pricetypevalue:0,pricetypetext:'基础价格'},{pricetypevalue:23,pricetypetext:'第二档价格'},{pricetypevalue:24,pricetypetext:'第三档价格'}];
		
		var pricetypes = [{pricetype:0,pricetypevalue:pricetypevalue0},{pricetype:1,pricetypevalue:pricetypevalue1},{pricetype:2,pricetypevalue:pricetypevalue2}];

		 $("#pricetype").change(function(){
				var currVal = $(this).val();
				$("#pricetypevalue").empty();
				
				$.each(pricetypes,function(index,obj){
					if(obj.pricetype==currVal) {
						$.each(obj.pricetypevalue,function(index,opt){
						    $("<option />").attr("value",opt.pricetypevalue).text(opt.pricetypetext).appendTo("#pricetypevalue");
						    if(obj.pricetype==1){
						    	begintime.disabled=false;
						    	endtime.disabled=false;
							}
						    else{
						    	begintime.disabled=true;
						    	endtime.disabled=true;
							    }
						});
					}
				});
			 });
		} 

	function <portlet:namespace/>remove() {
		if($("#isnew").val()=="false") {
			$.messager.confirm('Confirm','你确定要删除此数据吗?',function(r){
				 if (r){
					var removeUrl = "<portlet:resourceURL id='removeEnergyprice'></portlet:resourceURL>";
					$.post(removeUrl,{priceid:'${energyprice.priceid}'},function(result){
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

	$(function(){
		begintime.value = 0;
		endtime.value = 24;
		setPricetype();
	});
	
</script>