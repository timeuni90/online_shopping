<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="my_loading" class="mz-loading-mask" style="display: none;">
	<div class="mz-loading spinner">
		<div class="mz-bounce mz-bounce1"></div>
		<div class="mz-bounce mz-bounce2"></div>
		<div class="mz-bounce mz-bounce3"></div>
	</div>
</div>
<script type="text/javascript">
	$("#my_loading").css({
		"width" : screen.width - 40,
		"height" : screen.availHeight
	});
</script>