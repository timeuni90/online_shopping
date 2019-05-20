
/* 评论模态框 */
$(".comment-btn").click(function() {
	$("#modal_comment").data("orderid", $(this).data("orderid"));
	$("#modal_comment").data("commodityid", $(this).data("commodityid"));
	/* 获取历史评论 */
	$.ajax({
		method: "GET",
		url: APP_PATH + "/comments?orderId=" + $("#modal_comment").data("orderid") + "&commodityId=" + $("#modal_comment").data("commodityid"),
		success: function(data) {
			
		}
	});
});

/* 确认收货 */
$(".confirm_receive").click(function() {
	var cur = this;
	var order_id = $(this).data("orderid"); 
	$.confirm({
		title: '收货提示',
	    content: '确认收货吗？',
	    confirmButton: '确认',
	    cancelButton: '取消',
	    confirm: function(){
	    	$.ajax({
	    		method: "POST",
	    		url: APP_PATH + "/confirm_receive",
	    		data: "orderId=" + order_id,
	    		success: function(data) {
	    			if(data > 0) {
	    				window.location.href = APP_PATH + "/orders";
	    			}
	    		}
	    	});
	    }
	});
});

/* 删除订单 */
$(".remove_order").click(function() {
	var cur = this;
	var order_id = $(this).data("orderid"); 
	$.confirm({
		title: '删除提示',
	    content: '确认删除吗？',
	    confirmButton: '确认',
	    cancelButton: '取消',
	    confirm: function(){
	    	$.ajax({
	    		method: "POST",
	    		url: APP_PATH + "/remove_order",
	    		data: "orderId=" + order_id,
	    		success: function(data) {
	    			if(data > 0) {
	    				window.location.href = APP_PATH + "/orders";
	    			}
	    		}
	    	});
	    }
	});
});

/* 添加评论图片 */
function addImage(cur) { 
	if($(cur).find("input:file").val() == null || $(cur).find("input:file").val() == "") {
		$(cur).find("input:file")[0].click();
	}
}
$(".images-upload li").click(function(eve) {
	addImage(this);
});
/* 阻止事件冒泡 */
$(".images-upload li input:file").click(function(eve) {
	eve.stopPropagation();
});

/* 图片内容发生变化 */
function changeImage(cur) {
	if($(cur).parent().find("input:file").val() == null || $(cur).parent().find("input:file").val() == "") {
		return;
	}
	var file = $(cur)[0].files[0];
	var url = null;
	if (window.createObjcectURL != undefined) {
        url = window.createOjcectURL(file);
    } else if (window.URL != undefined) {
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) {
        url = window.webkitURL.createObjectURL(file);
    }
	$(cur).parent().find(".my-icon").css("display", "none");
	$(cur).parent().find("img").attr("src", url);
	$(cur).parent().find("img").css("display", "inline");
	$(cur).parent().append('<i title="删除" class="fa fa-fw fa-remove my-remove-image"></i>');
	if($(".images-upload li").length < 5) {
		var html = `<li>
			<div class="my-icon"></div>
			<img style="display: none;">
			<input name="images" type="file" accept="image/*">
		</li>`;
		$(cur).parent().parent().append(html);
	}
	/* 绑定打开文件选择器 */
	$(cur).parent().parent().find("li").last().click(function() {
		addImage(this);
	});
	/* 绑定图片变化 */
	$(cur).parent().parent().find("li").last().find("input:file").change(function() {
		changeImage(this);
	});
	/* 移除图片 */
	$(cur).parent().find(".my-remove-image").click(function(eve) {
		eve.stopPropagation();
		if($(".images-upload li").length < 2) {
			$(this).parent().find("input:file").val("");
			$(this).parent().find("img").attr("src", "");
			$(this).parent().find("img").css("display", "none");
			$(this).parent().find(".my-icon").css("display", "block");
			$(this).remove();
		} else {
			$(this).parent().remove();
		}
	});
}
$(".images-upload li input:file").change(function() {
	changeImage(this);
});

/* 评论上传 */
$("#comment_btn").click(function() {
	if($("#comment").val().trim() == "") {
		return;
	}
	var formData = new FormData();
	formData.append("commentContent", $("#comment").val().trim());
	formData.append("orderId", $("#modal_comment").data("orderid"));
	formData.append("commodityId", $("#modal_comment").data("commodityid"));
	$.each($(".images-upload input:file"), function(i, n) {
		formData.append("images", $(n)[0].files[0]);
	});
	$.ajax({
		method: "POST",
		url: APP_PATH + "/comment",
		data: formData,
		processData: false,
		contentType: false,
		success: function(data) {
			if(data > 0) {
				$("#comment").val("");
				/* 删除添加图片，只保留一个 */
				$.each($(".images-upload li"), function(i, n) {
					if($(".images-upload li").length > 1) {
						$(n).remove();
					}
				});
				$(".images-upload li").find("input:file").val("");
				$(".images-upload li").find("img").attr("src", "");
				$(".images-upload li").find("img").css("display", "none");
				$(".images-upload li").find(".my-icon").css("display", "block");
				$(".images-upload li").find(".my-remove-image").remove();
				$("#modal_comment").modal("hide");
				$.scojs_message('评论完成', $.scojs_message.TYPE_OK);
			}
		}
	});
});
