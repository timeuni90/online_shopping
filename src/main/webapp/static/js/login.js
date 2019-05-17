
$("#login_button").click(function() {
	loginValidation();
});

$("#pwd_input").keydown(function(eve) {
	if(eve.keyCode == 13) {
		loginValidation();
	}
});

function loginValidation() {
	var params = $("#login_form").serialize();
	$.ajax({
		method: "POST",
		url: APP_PATH + "/user_validation",
		data: params,
		success: function(data) {
			if(data.isPassed) {
				window.location.href = APP_PATH + data.message;
			} else {
				var html = `<p class="m-form-error">
		        				<i class="icomoon icon-fault"></i>
		        				<span class="m-error-message">` + data.message + `</span>
		        			</p>`;
				$(".m-form-group.login-error").empty();
				$(".m-form-group.login-error").append(html);
			}
		}
	});
}