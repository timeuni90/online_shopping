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