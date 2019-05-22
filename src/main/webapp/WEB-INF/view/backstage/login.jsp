<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台登录</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/dist/css/AdminLTE.min.css">

<script
	src="${APP_PATH }/static/backstage/bower_components/jquery/dist/jquery.min.js"></script>
</head>

<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#"><b>Admin</b>CLUVIO</a>
		</div>
		<div class="login-box-body">
			<p class="login-box-msg">登录你的账号</p>
			<form id="login_form">
				<div class="form-group has-feedback">
					<input type="text" name="username" class="form-control" placeholder="账号">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input id="login_enter" name="password" type="password" class="form-control" placeholder="密码">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div id="message" class="col-xs-8" style="color: red"></div>
					<div class="col-xs-4">
						<button id="login_btn" type="button" class="btn btn-primary btn-block btn-flat">登录</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	/* 登录 */
	function login() {
		var params = $("#login_form").serialize();
		$.ajax({
			method: "POST",
			url: "${APP_PATH}/backstage/login_validation",
			data: params,
			success: function(data) {
				if(data.isPassed) {
					window.location.href = "${APP_PATH}" + data.message;
				} else {
					$("#message").text(data.message);
				}
			}
		});
	}
	/* 回车登录 */
	$("#login_enter").keydown(function(eve) {
		if(eve.keyCode == 13) {
			login();
		}
	})
	/* 按钮登录 */
	$("#login_btn").click(function() {
		login();
	});
</script>
</html>