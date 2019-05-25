<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="layout-header" id="layoutHeader" style="z-index: 1000;">
	<div class="mzcontainer">
		<div class="layout-header-logo">
			<a  href="${APP_PATH }"
				class="layout-header-logo-link" 
				data-mtype="wmz_public_yt_logo" data-bh="click_wmz_public_yt_logo">
				<img
				src="${APP_PATH }/static/images/sys_logo/cluvio-logo-full_color-on_light.svg"
				style="max-width: 125px; margin-top: 28px;">
			</a>
		</div>
		<ul class="layout-header-service">
			<li
				class="layout-header-service-item layout-header-service-search mz-autocomlete"
				id="layoutHeaderSearch"><input id="search_input" class="mz-autocomlete-input"
				placeholder="搜索商品"><img class="layout-img-search"
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAAA4VJREFUSA21Vz1oU1EU7ntNGweldZWiiyB0KaHVgD+LS0HrJtZBpCC0aZMsaju42Mkh1ilpTDrVn8XiIupQIVsdktihS0EQQaiVLkKxQ9KGxO97vvO4L76bJnnpg+Sec+453/neub/P6GryicfjwUqlcqFarQ7UarVTDDMMY9s0za1AIFBIJpPlJqE83QxPq2KMRCJjSD6BpKMgcFzpckT07aFvFaSWM5nMB6ejBUFLBAT49s+AdbkFPLquoUL30+l0sZU4TyJTU1MRgCTxlgEVDG++CX0D9m3aoXOIhqAPUpcH9grkeDabzYjtsPY/IiDxFMAPJRCgZegpvGUGb/lN7Go7MzNzFvMnAt8YfIPSB30BZGZFb9S6iLASAHquBOR7enrGFxcXfyg2rRiNRs8cHBy8gUNYnEBmupnKOEQ4J0DiM37WcADgbW9v751WVwNX1/7+/mvg3CQZ4FTwu4RJXBByXq0pRk5MIQFbvh0SxCJxxhKDOjHtSU9V+1gVsZfoe3qBfRnz4Vyzw6FD5jBh3nwFEWvOYGnfaLS0rYpwnxBABKb8kiAWMYgluGoOsamtyTFFFUbFyNUhst9WxWIO5tJhmty2wdzaMeG8qVuiOoBGdmIRkz7MwVw6fxMlG1A6NxS5U6KDWZfLhW+CqXWA0QrZ2jFdHj4VFVPNVQ/rLN/6jqPQMUw1Ha6JTqcKkJ3q6AJatddh/tLFY3mbW0rnkCJ3SnQw63K58E0ssQJY79GKMRzkAeby8KEQi5iEYA7m0sGZ3JLhvCoOPEVF9tuqWMzR6NyyJitKtixJwTzG7Vn0dltiEEviIb8Q2au1iNhnwBodwDzIo7zRLugFpNoYSwxiKfbZycnJ04ruEp3li6o8AGverPiEeZS3Q4YxjCWGhWT/gdQViBu484yrdpGd+wgNR3ExAoF3eMnraANOUsN42dfXF0skEn/E1i0C2/X19S8jIyM8dy7adn46TA8PD/eHw+HvxWLxt213NVwdoVDoEXxfocOZX6jwwtLS0j3Ef4J8FX0n7cChUql0C/Y8cv6kzVUR28mqDOSOXp7n5uZO7O7upkD2ruThVID+GGSfeBKho5/PCc433dUQuLdx+PFe3C+E0I5piYiTfXubAPuOfWBx9QCP91pOYD6HE/nn19U1Pz9/bGdn5zyPcgBYZxLA2v7kXFlZ6c7lcteAVcXQfPwLwMHO9PXwzvQAAAAASUVORK5CYII="></li>
			<li class="layout-header-service-item" id="layoutHeaderUser"><a
				class="layout-header-service-link"
				href="#"
				data-mtype="wmz_public_yt_mycenter"
				data-bh="click_wmz_public_yt_mycenter">
				<img id="user_image"
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAAAXNSR0IArs4c6QAABNdJREFUaAXtWjlLNEsUvfPcxQXENXEXXHALFMFExC1VBDVR0MjAwMC/YWKgiYKJigiGLohoYKLgikvgnrjvouL2vXcKqqjnN+1Uj9UzODMXerqm+i7n9K2uvlUztj//CXmR/ONFXBlVH2FPz7gvw74Me9gd8Loh7e+KBH58fNDq6io7jo6O6O7ujoWNjIykpKQkKigoYIefn5/lcGxWFx4gOjY2RhcXF9+SiYmJofr6ekb8W8UfXrSMMAq48fFxmpqaMgWxurqaamtryWazmbJTVbZsSH8lGxwcTFVVVZSfn0/IJgRZX1tbo+npaXp5eWF9/AbV1dWx77o/LMkwhnFvb6/AmpmZSS0tLRQVFSX65Mb19TUNDg7Szs6O6G5vb7dkeGufpTFB4ZnlArKdnZ2GZKGHGwEd6HKBD/jSLdoJI7t8gsIwRmZVBbqwgcAHfOkWSwhzkHhmjYYx15HP0IUNl19BGO9ZLpigzIpsI/sy68dIX3uGeVGBgHw2Ngpur1+2kX3Z03WmTzthZ0C40kY74YiICIHfmQzJNrIv4fSHDe2E4+PjBaS9vT3RVm3INrIvVXtHetoJy+/SjY0NR/H/ui7byL7+UnSyQzvh3NxcUQfjtSIPUUcYoctfRail4Uu3aCccGxtLWVlZDCcqpYmJCWXM0OXVFXzAl27RThgAKysrBc75+XlSeZ9CB7pcZB+8T8fZEsLZ2dlsVQSAn5+f1NfXRw8PD4Z4cQ060IWg+IAPK8QSwgDa0NBAISEhDDNWQ93d3YTzV/l6DTawtUosWR5ysNvb29TT0yOey9DQUMICPy8vj6msr6+zDYKnpyf2HVs8HR0dYg7gfnSeLSUMoEtLS2yt+/b29i3ugIAAtrIqKir6Vu+nFy0nDIAHBwc0MDBA5+fndvFiNm5tbaWUlBS713V2uoQwAGOPa3FxkVZWVujk5IRxSEhIoMLCQiouLhbvbp3k7PlyGWF7wd3RZ9ks7Q4yKjF9hFXu0m/W8boMa92Iv7y8JBQbOLDriJIRx/v7u9Kg8Pf3p/DwcHZgqwcLCBzR0dFK9ipKWmZprGEnJydpd3dXJaZpnfT0dKqpqdGyXPwR4bOzM1ZQHB4emibhjEFycjIrUOLi4pwxZzZOE15YWKCRkRF6fX0VwVEe5uTksGGYmppK+Dk0LCyMVH8GxVr48fGRbRrs7++zR2Nzc5PksjQwMJAaGxuptLRUxDXTcIrw3NwcDQ8PizggWlFRQeXl5aR74+3+/p5mZ2dpZmbmf8SbmpqorKxMYFBtmCaM8hB1Mf8/W2JiIrW1tZEVG24yidPTU+rv76fj42PWjS0g1N8oS82IqdcS9pyGhoYE2YyMDOrq6rKcLAjhhiIWYkJww4HFzJ4Z7EwRHh0dpefnZ9gxAFi74plylSAWYvLRBCzAZEaUCd/e3tLy8jLzjeHU3NxMQUFBZmJp0UVMxOb/EAAmYFMVZcJ4dvmeE2bitLQ01Rja9RAbGCDABGyqokx4a2tL+CwpKRFtdzVkDDI2R3iUCV9dXQlf+KuRu0XGIGNzhEuZ8M3NjfBl5kduYaS5IWOQsTkKo0xYrnZQ5LtbZAwyNke4lAk7cvRbrnsdYdOl5W/JpBFOr8uwj7DRUPCUfl+GPSWTRjx8GTa6M57S/y9uIe/cMMw11wAAAABJRU5ErkJggg=="
					alt=" " class="layout-header-service-avatar">
			</a></li>
			<li class="layout-header-service-item layout-header-service-cart"
				id="layoutHeaderCart"><a
				class="layout-header-service-link service-cart"
				href="${APP_PATH }/cart" data-mtype="wmz_public_yt_cart"
				data-bh="click_wmz_public_yt_cart"> <img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAAAXNSR0IArs4c6QAABAxJREFUaAXtWbtLNDEQn1NPQcG3lS9UxAcWiiAIlnaCYCFW/hn+FXbCIdhfeQiKoPZiIaeg4At8gKjgs7BQFPX7fqsJ2d3snbsbd7PeTrOTSTKZX2aSTLKJz/9EBURFBYTVgBoD/usejz0ce/iPzUAc0n/MoTY4BefhEusUrK+v0/LyMr2+vlqreHl8fJzGxsZ4OUqMzcMrKys5wQLczs5OlDCabLUB7u3tNTWQFS4uLuj+/l5Wpb0sYb084C5xfn4u9fL8/Dw9Pz8boCYnJ2l0dFR7gFYDbWs4kUhQW1ubtZ1R7uvro62tLYNHWEcRsC2kpUi/hQMDA7z69PSUnp6eeDkqjM3DuQyHh5PJJL29vdHHxwdtbGyQOAm5+gZVhwitqqqisrIy6ZC2NSxtJQhTqRTt7u4KEv1YgO7v76epqSmqqakxGegqpNFTN4+a0HwXsPFij5mbm7Ntvq4BI6yjQldXV5TNZk3mulrD6FlZWUmNjY10eXlpKBoZGSFkXroQvLuwsEAnJyeGScgZhoeHuXmuAaMnkhMGGGc2Ngmd6OHhgZtTXV3NeTCuQxqdenp68DEIwHU6nnBcPj4+MvOoq6uL82A8Ae7s7KSSkq/gQAgdHByYlIZZENdsfX09tba2mszxBLi0tJQ6Ojq4ov39fc6HzYiABwcHbeZ4AgwtYlgfHh7aFIchsIazUsDirQpr5vr6OgyMpjFF78rCGY09e7ilpYUqKir4gDqsYxGwzLu+ACN96+7u1gbwT8LZF2B0Ftfx8fExvb+/8wkImhG96xTOsMlzSKOzuI5fXl7o7OwM4lBIBOwUzjDMF+C6ujpqaGjgAMM6nn4azr4BQ4EY1mFtXKJ3c4WzEsBiWCOvZm9eUB4UiYBzhTPs8RXSUIBctajoSw1eQY6OjiAOjNyEM4zyDbi8vNyUrwa9jkXv5gtnJYChRFzHe3t7hAtFEIRjUAScL5xhk28PQ4k4EO6ii4uLvw4ak5rJZExXwaGhIZiTkzw9AFg1NjU1GV5mu/Ta2hptb29Tc3MzISNTTdgr8JJxd3fHVePRDnbkI9evlk4K8etldnbWNONObVXLa2traWZmhvDNR8oAY6CbmxtKp9MU5HUR+8f09DQhCfoJKQXMBsRRgTTz9vb2V/Lr4uJiI8Nrb293/C3EbLF+fwWwdRCdykp2aZ0A5bMlBpxvhqJer+QcFicB2c/S0hJtbm4aYrz6488ENhoV5Fe/csAAu7q6yrExfmJigsv8MH71K1/DzLMiKJlMrHfDy3TJZE46lQN2GkgXuXLA4p86BlImY3VuvzJdMpmTXuVrmP06ZWEGY5jMyQg3cqbLq/4403Iz21Fsq3wN6z4JMWDdPeTXvtjDfmdQ9/4F5+F/nGyFQiUTZpsAAAAASUVORK5CYII="
					alt=" " class="layout-font-cart"> <span
					class="layout-header-service-cart-num" style="line-height: 15px;">0</span>
			</a></li>
		</ul>
		<ul class="layout-header-nav" id="layoutHeaderNav">
			<li id="login_block" class="layout-header-nav-item">
				<a
					href="${APP_PATH }/login"
					class="layout-header-nav-link" data-mtype="store_index_dh_0"
					data-bh="store_index_dh_0">
					登录
				</a>
			</li>
			<li class="layout-header-nav-item">
				<a
					href="${APP_PATH }/orders"
					class="layout-header-nav-link" data-mtype="store_index_dh_0"
					data-bh="store_index_dh_0">
					我的订单
				</a>
			</li>
			<li class="layout-header-nav-item">
				<a
					href="${APP_PATH }/collect"
					class="layout-header-nav-link" data-mtype="store_index_dh_0"
					data-bh="store_index_dh_0">
					个人中心
				</a>
			</li>
			<li class="layout-header-nav-item">
				<a
					href="#"
					class="layout-header-nav-link" data-mtype="store_index_dh_0"
					data-bh="store_index_dh_0">
					地址管理
				</a>
			</li>
			<li class="layout-header-nav-item">
				<a
					href="${APP_PATH }/backstage"
					class="layout-header-nav-link" data-mtype="store_index_dh_0"
					data-bh="store_index_dh_0">
					后台登录
				</a>
			</li>
		</ul>
	</div>
</header>
<script type="text/javascript">
	/* 获取用户和购物车数量 */
	$.ajax({
		method: "GET",
		url: "${APP_PATH }/header",
		success: function(data) {
			if(data.isLogined) {
				$("#user_image").attr("src", data.user.profilePhoto);
				$(".layout-header-service-cart-num").text(data.cartCount);
				$("#login_block").remove();
				var quit_li = `<li class="layout-header-nav-item">
									<a href="${APP_PATH }/quit" class="layout-header-nav-link">
										退出登录
									</a>
								</li>`;
				$("#layoutHeaderNav").append(quit_li);
			}
		}
	});
	
	/* 搜索 */
	function searchProduct() {
		var key = $("#search_input").val().trim();
		if(key == null || key == "") {
			return;
		}
		window.location.href = "${APP_PATH}/search_products?key=" + key;
	}
	$("#search_input").keydown(function(eve) {
		if(eve.keyCode == 13) {
			searchProduct();
		}
	});
	$(".layout-img-search").click(function() {
		searchProduct();
	});
</script>





