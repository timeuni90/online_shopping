
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
