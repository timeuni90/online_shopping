
$(".j_category.category-con").mouseleave(function() {
	$(".pannel-con.j_CategoryMenuPannel").css("display", "none");
	$(".j_MenuNav.nav-item").removeClass("selected");
});

$(".j_MenuNav.nav-item").mouseenter(function() {
	$(".j_MenuNav.nav-item").removeClass("selected");
	$(".pannel-con.j_CategoryMenuPannel").css("display", "none");
	$(this).addClass("selected");
	var index = + $(this).attr("class").match(/\d{1,}/);
	var variety_id = $(this).attr("data-spm");
	$.each($(".content-con.j_categoryContent").children(), function(i, n) {
		if(i == index) {
			$(n).css("display", "block");
			if($(n).attr("class").search("category-loaded") == -1) {
				$.ajax({
					type: "GET",
					url: APP_PATH + "/indexclass/" + variety_id,
					success: function(msg) {
						$(n).addClass("category-loaded");
						var str = "";
						$.each(msg, function(i, n) {
							str += "<div class='hot-word-line'><div class='line-title'><div class='title-text'>"+n[0].name+
							"</div><i class='oi icon' data-glyph='chevron-right'></i></div><div class='line-con'>";
							$.each(n, function(i, n) {
								if(i != 0) 
									str += "<a class='hot-word highlight' href='#'>"+n.name+"</a>";
							});
							str += "<div class='seprate clearfix'></div></div></div>";
						});
						$(n).append("<div class='pannel-"+index+"'><div class='hot-word-con'>"+str+"</div></div>");
					}
				});
			}
			return false;
		}
	});
});
