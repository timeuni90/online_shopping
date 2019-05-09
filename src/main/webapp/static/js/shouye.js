
$(".j_category.category-con").mouseleave(function() {
	$(".pannel-con.j_CategoryMenuPannel").css("display", "none");
	$(".j_MenuNav.nav-item").removeClass("selected");
});

$(".j_MenuNav.nav-item").mouseenter(function() {
	$(".j_MenuNav.nav-item").removeClass("selected");
	$(".pannel-con.j_CategoryMenuPannel").css("display", "none");
	$(this).addClass("selected");
	var index = + $(this).attr("class").match(/\d{1,}/);
	var variety_id_string = $(this).attr("data-spm");
	var variety_ids = variety_id_string.split(",");
	var request_params = "";
	$.each(variety_ids, function(i, n) {
		request_params += "ids=" + n;
		if(i < variety_ids.length - 1) {
			request_params += "&";
		}
	});
	$.each($(".content-con.j_categoryContent").children(), function(i, n) {
		if(i == index) {
			$(n).css("display", "block");
			if($(n).attr("class").search("category-loaded") == -1) {
				$.ajax({
					type: "GET",
					url: APP_PATH + "/indexclass?" + request_params,
					success: function(msg) {
						$(n).addClass("category-loaded");
						var str = "";
						$.each(msg, function(i, n) {
							str += "<div class='hot-word-line'><div class='line-title'><div class='title-text'><a href='http://localhost:8080/online-shopping/products?varietyId=" + n[0].id + "'>"+n[0].name+
							"</a></div><i class='oi icon' data-glyph='chevron-right'></i></div><div class='line-con'>";
							$.each(n, function(i, n) {
								if(i != 0) 
									str += "<a class='hot-word highlight' href='http://localhost:8080/online-shopping/products?varietyId="+ n.id +"'>"+n.name+"</a>";
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


/* 点击切换图片 */
$(".slider-nav li").click(function() {
	$(".slider-nav li").removeClass("selected");
	$(this).addClass("selected");
	$(this).parent().parent().find(".main-banner.slider-pannel.j_tanxContainer").css("display", "none");
	$($(this).parent().parent().find(".main-banner.slider-pannel.j_tanxContainer")[$(this).data("num")]).css("display", "block");
});
