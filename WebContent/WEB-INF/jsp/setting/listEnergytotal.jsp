 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../init.jsp" %>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-20 上午09:57:42
	LastModified Date:
	Description: 建筑设备运行数据报表
 -->

<div class="fitem">
		选择建筑：<select id="buildId" name="buildId" "></select>
		选择能耗类型：<select id="energyItemcode" name="energyItemcode" "></select>  
		报表类型：<select name="sty" id="sty" style="height:25px" onchange="settime()" >
         <option value="0"></option>
         <option value="1">日报表</option>
         <option value="2">周报表</option>
         <option value="3">月报表</option>
              </select>
		时间：
<!-- 	<input id="startdate" name="startdate" class="easyui-datebox" /> -->	
        <input type="text" size="10"
							name="startdate" id="startdate"/>
		<select name="startxs" id="startxs" style="height:25px" >
             <option value="0">00:00</option>
             <option value="1">01:00</option>
             <option value="2">02:00</option>
             <option value="3">03:00</option>
             <option value="4">04:00</option>
             <option value="5">05:00</option>
             <option value="6">06:00</option>
             <option value="7">07:00</option>
             <option value="8">08:00</option>
             <option value="9">09:00</option>
             <option value="10">10:00</option>
             <option value="11">11:00</option>
             <option value="12">12:00</option>
             <option value="13">13:00</option>
             <option value="14">14:00</option>
             <option value="15">15:00</option>
             <option value="16">16:00</option>
             <option value="17">17:00</option>
             <option value="18">18:00</option>
             <option value="19">19:00</option>
             <option value="20">20:00</option>
             <option value="21">21:00</option>
             <option value="22">22:00</option>
             <option value="23">23:00</option>
         </select>
                                          至                           
 <!--            <p> &nbsp &nbsp &nbsp&nbsp &nbsp
          &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp<input id="enddate" name="enddate" class="easyui-datebox"/> --> 
          <input type="text" size="10"
							name="enddate" id="enddate"/>
         <select name="endxs" id="endxs" style="height:25px" >
             <option value="0">00:00</option>
             <option value="1">01:00</option>
             <option value="2">02:00</option>
             <option value="3">03:00</option>
             <option value="4">04:00</option>
             <option value="5">05:00</option>
             <option value="6">06:00</option>
             <option value="7">07:00</option>
             <option value="8">08:00</option>
             <option value="9">09:00</option>
             <option value="10">10:00</option>
             <option value="11">11:00</option>
             <option value="12">12:00</option>
             <option value="13">13:00</option>
             <option value="14">14:00</option>
             <option value="15">15:00</option>
             <option value="16">16:00</option>
             <option value="17">17:00</option>
             <option value="18">18:00</option>
             <option value="19">19:00</option>
             <option value="20">20:00</option>
             <option value="21">21:00</option>
             <option value="22">22:00</option>
             <option value="23">23:00</option>
        </select>                                
	<a href="javascript:<portlet:namespace/>search();" class="easyui-linkbutton" iconCls="icon-search"  plain="true">查看</a></span>
</div>

<tr style="vertical-align: top;">
		<td colspan="3">
			<table width="100%">
				<tr valign="top">
					<td><section class="portlet"> <header
							class="portlet-topper">
						<h1 class="portlet-title">
							<span class="portlet-title-text">能耗统计</span>
						</h1>
						</header>
						<div class="portlet-content">
							<div class=" portlet-content-container" style="">
								<div class="portlet-body">
							<table id="<portlet:namespace/>QueryTotalresult" class="easyui-datagrid"
							>
							<thead>
								<tr>
									<th field="time" width="240">时间</th>
									<th field="val" width="200">耗能量(kw/a)</th>
									<th field="price" width="200">单价(元)</th>
									<th field="total" width="200">合计(元)</th>
								</tr>
							</thead>
						</table>
								</div>
							</div>
						</div>
						</section></td>
				</tr>
			</table>
		</td>
	</tr>

<script language="javascript">
	$(function() {
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

		$("#energyItemcode").combogrid({
			panelWidth : 500,
			value : $("#energyItemcode").val(),
			idField : 'energyItemcode',
			textField : 'energyItemname',
			pagination : true,//是否分页  
			rownumbers : true,
			fit : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50 ],
			url : '<portlet:resourceURL id="getEnergyitemdictsByType"></portlet:resourceURL>',
			columns : [ [ {
				field : 'energyItemcode',
				title : '编号',
				width : 100
			}, {
				field : 'energyItemname',
				title : '名称',
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
					$('#energyItemcode').combogrid("grid").datagrid("reload", {
						'keyword' : q
					});
					$('#energyItemcode').combogrid("setValue", q);
				}
			}
		});

		/**
		 * 起始日期
		 
		$("#startdate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2,
			onSelect : function(selectedDate) {
				
			}
		});
		
		/**
		 * 结束日期
		 
		$("#enddate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2,
			onSelect : function(selectedDate) {
				$("#startdate").datepicker("option", "maxDate", selectedDate);
			}
		});
		*/
		/**
		 * 起始日期
		 */
		$("#startdate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1,
			onSelect : function(selectedDate) {
				$("#enddate").datepicker("option", "minDate", selectedDate);
				$("#enddate").datepicker("option", "maxDate", "+1m+1d");
				$("#queryType").val("usage");
			}
		});
		/**
		 * 结束日期
		 */
		$("#enddate").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1,
			onSelect : function(selectedDate) {
				$("#startdate").datepicker("option", "maxDate", selectedDate);
			}
		});
});
	function settime(){
		var st = sty.value;
		if(st=="1"){
			enddate.disabled=false;
			startxs.disabled = false;
			endxs.disabled = false;
		}
		if(st=="2"){
			enddate.disabled=true;
			startxs.disabled = true;
			endxs.disabled = true;
		}
		if(st=="3"){
			enddate.disabled=false;
			startxs.disabled = true;
			endxs.disabled = true;
		}
	}
	function <portlet:namespace/>search() {
	var id = $('#buildId').combogrid("getValue");
	var nh = $('#energyItemcode').combogrid("getValue");
	var sd = $('#startdate').val();
	var ed = $('#enddate').val();
	var sxs = startxs.value;
	var exs = endxs.value;
	var st = sty.value;
	if(id==""){
		alert("请选择建筑");
		return;
	}
	if(nh==""){
	    alert("请选择能耗类型");
	    return;
	}
	if(st=="0"){
		alert("请选择报表类型");
		return;
	}
	if(sd==""){
		alert("请选择开始时间");
		return;
	}
	if(st=="1"){
         if(ed==""){
        	 alert("请选择结束时间");
     		  return;
         }
         else{
        	 if(sd==ed){
	    		 if(parseInt(sxs)>parseInt(exs)){
		    		 alert("开始时间不能大于结束时间,请重新选择时间");
		    		 return;
	    	} 
          }
		}
	}
	if(st=="3"){
			 if(ed==""){
	        	 alert("请选择结束时间");
	     		  return;
	   }
	}
	 $.post('<portlet:resourceURL id="getCircuit"></portlet:resourceURL>',
				{id:id,nh:nh,sd:sd,st:st,ed:ed,sxs:sxs,exs:exs},function(data){
				$("#<portlet:namespace/>QueryTotalresult").datagrid('loadData',data);
	 });
	}
</script>