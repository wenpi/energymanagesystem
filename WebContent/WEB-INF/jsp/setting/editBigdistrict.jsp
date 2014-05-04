<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>
<!-- HTML START -->
<!-- 
	AUTHOR: CHENPING
	Created Date: 2012-8-31 上午09:41:01
	LastModified Date:
	Description: 编辑气候区信息
 -->
<div class="ftitle">
	<span>气候区设置</span> <span class="title-back"><a
		href="<portlet:renderURL portletMode="view"></portlet:renderURL>">«返回</a>
	</span>
</div>
<div id="tab-container" class="easyui-tabs" style="width: 960px;">
	<div title="气候区信息" style="padding: 10px;">
		<%@ include file="editBigdistrictTab.jsp"%>

		<c:if test="${!empty bigdistrictinfo.bigdistrictId}">
			<%@ include file="editBigdistrictrelainfoTab.jsp"%>
		</c:if>


		<div id="buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="<portlet:namespace/>saveForm()">保存</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-remove"
				onclick="<portlet:namespace/>remove()">删除</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-back"
				onclick="location.href='<portlet:renderURL portletMode="view"></portlet:renderURL>'">取消</a>
		</div>
	</div>



</div>
