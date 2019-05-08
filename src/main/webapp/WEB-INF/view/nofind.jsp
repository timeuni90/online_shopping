<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>该页面不存在</title>

<link rel="stylesheet" href="${APP_PATH }/static/css/nofind/reset.css">
<link rel="stylesheet" href="${APP_PATH }/static/css/nofind/404.css">
<script src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="auto">
	<div class="container">
		<div class="settings">
			<i class="icon"></i>
			<h4>很抱歉！没有找到您要访问的页面！</h4>
			<!--<p><span id="num">5</span> 秒后将自动跳转到首页</p>-->
			<div>
				<a href="${APP_PATH }" title="返回首页">返回首页</a>
				<a href="javascript:;" title="上一步" id="reload-btn">上一步</a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	//返回按钮单击事件
	var reloadPage = $("#reload-btn");
	reloadPage.click(function(e){
		console.log("a");
		window.history.back();
	});
	
	//倒计时跳转到首页的js代码
	/*var $_num=$("#num");
	var num=parseInt($_num.html());
	var numId=setInterval(function(){
		num--;
		$_num.html(num);
		if(num===0){
			//跳转地址写在这里
			window.location.href="http://www.17sucai.com";
		}
	},1000);*/
</script>
</body></html>