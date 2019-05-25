<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理</title>
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
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/dist/css/skins/skin-blue.min.css">

<!-- 新增style -->
<link rel="stylesheet"
	href="${APP_PATH }/static/backstage/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<!-- 消息提示 -->
<link rel="stylesheet" href="${APP_PATH }/static/css/sco.message.css">
<!-- 确认框 -->
<link rel="stylesheet"
	href="${APP_PATH }/static/css/jquery-confirm.min.css">
<!-- combobox -->
<link rel="stylesheet" href="${APP_PATH }/static/css/combobox/jquery-ui.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/combobox/combobox.css">
<!-- image-upload -->
<link rel="stylesheet" href="${APP_PATH }/static/css/image_upload/image_upload.css">

<style>
/*td {
	text-align: center;
}

tr {
	line-height:;
}*/

thead td {
	font-weight: bolder;
}
</style>

<script
	src="${APP_PATH }/static/backstage/bower_components/jquery/dist/jquery.min.js"></script>
<script>
	var APP_PATH = '${APP_PATH}';
</script>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>CLUVIO</b>admin</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->
						<li class="dropdown messages-menu">
							<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span
								id="message_tip" class="label label-danger"></span>
						</a>
							<ul class="dropdown-menu"  id="message_dropdown">
								<li class="header">消息提示中心</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										
									</ul>
								</li>
								<li class="footer"><a href="#">未读消息</a></li>
							</ul>
						</li>

						
						<!-- User Account Menu -->
						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button --> 
							<a href="#" class="dropdown-toggle">
								<img
								src="${APP_PATH }/static/backstage/dist/img/user2-160x160.jpg"
								class="user-image" alt="User Image"> <!-- hidden-xs hides the username on small devices so only the image appears. -->
								<span class="hidden-xs">管理员</span>
						</a>
							
						</li>
					 
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel">
					<div class="pull-left image">
						<img
							src="${APP_PATH }/static/backstage/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>管理员</p>
						<!-- Status -->
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- Sidebar Menu -->
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">列表</li>
					<!-- Optionally, you can add icons to the links -->
					<li class="active" id="my_order_opener"><a href="#"><i
							class="fa fa-link"></i> <span>订单中心</span></a></li>
					<li id="commodity_center_opener"><a href="#"><i
							class="fa fa-link"></i> <span>商品中心</span></a></li>
					<li id="my_sale_quantity_statistic"><a href="#"><i
							class="fa fa-link"></i> <span>销量统计</span></a></li>
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->

			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>

	<div class="modal fade" id="chat_modal" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="row">
					<div class="col-md-12">
						<!-- DIRECT CHAT PRIMARY -->
						<div class="box box-primary direct-chat direct-chat-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Chat</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button class="btn btn-box-tool" data-toggle="tooltip"
										title="Contacts" data-widget="chat-pane-toggle">
										<i class="fa fa-comments"></i>
									</button>
									<button class="btn btn-box-tool" data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<!-- Contacts are loaded here -->
								<div class="direct-chat-contacts">
									<ul class="contacts-list">
										<li><a href="#"> <img class="contacts-list-img"
												src="../dist/img/user1-128x128.jpg" alt="Contact Avatar">
												<div class="contacts-list-info">
													<span class="contacts-list-name"> Count Dracula <small
														class="contacts-list-date pull-right">2/28/2015</small>
													</span> <span class="contacts-list-msg">How have you been?
														I was...</span>
												</div> <!-- /.contacts-list-info -->
										</a></li>
										<!-- End Contact Item -->
									</ul>
									<!-- /.contatcts-list -->
								</div>
								<!-- /.direct-chat-pane -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<div class="input-group">
										<input type="text" name="message"
											placeholder="输入消息 ..." class="form-control">
										<span id="chat_send"
											class="input-group-btn">
											<button type="button" class="btn btn-primary btn-flat">发送</button>
										</span>
									</div>
							</div>
							<!-- /.box-footer-->
						</div>
						<!--/.direct-chat -->
					</div>
					<!-- /.col -->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<script
		src="${APP_PATH }/static/backstage/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/static/backstage/dist/js/adminlte.min.js"></script>

	<script src="${APP_PATH }/static/js/sco.message.js"></script>

	<script src="${APP_PATH }/static/js/jquery-confirm.min.js"></script>

	<script src="${APP_PATH }/static/js/Chart.min.js"></script>

	<script src="${APP_PATH }/static/js/starter.js"></script>
	
</body>

</html>
