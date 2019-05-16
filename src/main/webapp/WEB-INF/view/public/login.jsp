<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" href="${APP_PATH }/static/css/login/style.css">
		<link rel="stylesheet" href="${APP_PATH }/static/css/login/pt_p-login.css">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="renderer" content="webkit">
		<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
	</head>
	<body>
		<div id="app" style="display: block;">
			<div class="m-i18n-provider locale-zh_CN">
				<div id="bg">

					<div class="g-doc">
						<div class="m-body">
							<div class="g-body">
								<div class="container">
									<div class="m-plogin">

										<div class="login_container">
											<form class="login-form m-form">
												<h2 class="title" style="font-size: 20px;">网易云登录</h2>

												<div class="m-form-group">
													<div class="m-input-group ">
														<input type="text" placeholder="网易云账号/网易邮箱账号" class="m-input m-input-large account-input" name="account">
														<div class="m-input-in-icon">
														</div>
														<i class="icomoon icon-user"></i>
													</div>
												</div>
												<div class="m-form-group">
													<div class="m-input-group m-password-group ">
														<input type="password" placeholder="登录密码" class="m-input m-input-large password-input" name="password">
														<div class="m-input-in-icon">
															<i class="icomoon icon-open-eye"></i>
														</div>
														<i class="icomoon icon-password"></i>
													</div>
												</div>
												<div class="m-form-group login-error">
												</div>
												<div class="m-form-group m-form-group-small">
													<button class="m-btn m-btn-primary m-btn-large m-btn-submit">登&nbsp;&nbsp;录</button>
												</div>
												<div class="f-clearfix">
													<div class="f-sm-font f-fl">
														还没有账号？
														<a rel="noopener noreferrer" target="_blank" href="/register?referrer=https://console.163yun.com&amp;h=wyygw" class="link">免费注册</a>
													</div>
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
	</body>
	<script type="text/javascript" src="${APP_PATH }/static/js/login.js"></script>
</html>