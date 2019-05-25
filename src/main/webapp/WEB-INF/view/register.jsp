<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css"
	href="${APP_PATH }/static/css/register/style.css">
<link rel="stylesheet"
	href="${APP_PATH }/static/css/register/pt_register.css">

<link rel="stylesheet"
	href="${APP_PATH }/static/css/myorder/layout-a2ae44047d.css">

<!-- image-upload -->
<link rel="stylesheet"
	href="${APP_PATH }/static/css/image_upload/image_upload.css">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/view/public/header.jsp"%>
	<div id="app" style="display: block;">
		<div class="m-i18n-provider locale-zh_CN">
			<div id="bg">
				<div class="g-doc">
					<div class="m-body">
						<div class="g-body">
							<div class="container">
								<div class="m-pRegister">
									<div class="m-form">
										<form id="register_form">
											<div class="m-form-group">
												<label>用户名</label>
												<div class="m-input-group m-password-group ">
													<input name="name" type="text" placeholder="设置用户名"
														class="m-input m-input-large password">
												</div>
											</div>
											<div class="m-form-group">
												<label>登录账号</label>
												<div class="m-input-group m-password-group ">
													<input name="username" type="text" placeholder="设置登录账号"
														class="m-input m-input-large password">
												</div>
											</div>
											<div class="m-form-group">
												<label>登录密码</label>
												<div class="m-input-group m-password-group ">
													<input name="password" type="password" placeholder="设置登录密码"
														class="m-input m-input-large password">
												</div>
											</div>
											<div class="m-form-group">
												<label>确认密码</label>
												<div class="m-input-group m-password-group ">
													<input id="pwd_input" name="confirmPassword" type="password" placeholder="确认登录密码"
														class="m-input m-input-large password">
												</div>
											</div>
											<div class="m-form-group login-error"></div>
											<div class="m-form-group">
												<button id="register_button" type="button"
													class="m-btn m-btn-primary m-btn-large m-btn-submit m-form-nolabel">注册</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<style>
#meizu-footer {
	position: relative;
}
</style>
	<%@ include file="/WEB-INF/view/public/footer.jsp"%>
</body>
<script type="text/javascript">
	var APP_PATH = '${APP_PATH}';
</script>
<script type="text/javascript" src="${APP_PATH }/static/js/register.js"></script>
</html>