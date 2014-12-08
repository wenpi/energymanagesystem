<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../init.jsp"%>

<div class="login-box">
	<img src="${pageContext.request.contextPath}/public/images/body-bg.png" width="100%" height="100%" style="margin-top: -58px;"/>
</div>
<div class="rightWidth right-time">
	<div class="loginLeftTime time pull-left">16:23</div>
	<div class="loginDate date pull-right">
		<div class="loginWeek describe">星期三</div>
		<div class="loginTime describe_value">2014-12-03</div>
	</div>
</div>
<div class="login-title">Light能源管理系统登录</div>
<div class="land-box">
	<form name='login_form' action="#" method='POST' id="login_form">
		<div class="yhdl">用户登录</div>

		<div class="yhma">
			<div class="user-name">
				<div class=""></div>
				<input id="username" type="text" class="user-input" />
			</div>
			<div class="password-name">
				<input id="password" type="password" class="password-input" />
			</div>
		</div>
		<div class="anniu">
			<a href="javascript:submitForm();">登 录</a>
		</div>
	</form>
</div>