function registerValidation() {
	var params = $("#register_form").serialize();
	$.ajax({
		method: "POST",
		url: APP_PATH + "/register_validation",
		data: params,
		success: function(data) {
			if(data.isPassed) {
				window.location.href = APP_PATH + data.message;
			} else {
				var html = `<label></label>
							<p class="m-form-error">
		        				<i class="icomoon icon-fault"></i>
		        				<span class="m-error-message">` + data.message + `</span>
		        			</p>`;
				$(".m-form-group.login-error").empty();
				$(".m-form-group.login-error").append(html);
			}
		}
	});
}

$("#register_button").click(function() {
	registerValidation();
});

$("#pwd_input").keydown(function(eve) {
	if(eve.keyCode == 13) {
		registerValidation();
	}
});