
/* 删除收藏 */
$(".icon-del.j-icon-del").click(function() {
	var commodityId = $(this).data(commodityId);
	$.confirm({
		title: '删除提示',
	    content: '确认删除吗？',
	    confirmButton: '确认',
	    cancelButton: '取消',
	   /* confirm: function(){
	    	$.ajax({
	    		method: "POST",
	    		url: APP_PATH + "/collect",
	    		data: "_method=delete&commodityId=" + commodityId,
	    		success: function(data) {
	    			if(data > 0) {
	    				window.location.href = APP_PATH + "/orders";
	    			}
	    		}
	    	});
	    }*/
	});
});