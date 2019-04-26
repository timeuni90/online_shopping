

/* 给property-value类绑定点击事件 */
var selected_property_value = null;
$(".property-value").click(function() {
	if($(this).hasClass("tb-selected")) {
		$(this).removeClass("tb-selected");
	} else {
		var children = $($(this).parent()).children();
		$(children).removeClass("tb-selected");
		$(this).addClass("tb-selected");
	}
	if($(".tb-prop.tm-sale-prop.tm-clear").length == $(".tb-key .tb-skin .tb-sku .tb-selected").length) {
		var rowsString = $($(".tb-key .tb-skin .tb-sku .tb-selected")[0]).attr("data-rows");
		var rows = rowsString.split(",");
		$.each($(".tb-key .tb-skin .tb-sku .tb-selected"), function(i, n) {
			var other_rows = $(n).attr("data-rows").split(",");
			$.each(rows, function(i, n) {
				if(other_rows.indexOf(n) == -1) {
					rows.splice(i, 1);
				}
			});
			if(rows.length == 1)
				return false;
		});
		console.log(rows[0]);
	}
});