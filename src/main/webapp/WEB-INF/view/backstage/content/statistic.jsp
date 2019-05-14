<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="content-header">
	<h1>
		商品销量统计 <small>信息</small>
	</h1>

</section>

<section class="content container-fluid">
	<div class="row">
		<div class="col-sm-offset-1 col-sm-8">
			<br> <br> <br>
			<canvas id="my_canvas"></canvas>
		</div>
	</div>
</section>
<script>
	var colors =  [ 'rgba(255, 99, 132, 0.6)',
		'rgba(54, 162, 235, 0.6)', 'rgba(255, 206, 86, 0.6)',
		'rgba(75, 192, 192, 0.6)', 'rgba(153, 102, 255, 0.6)',
		'rgba(255, 159, 64, 0.6)', 'rgba(255, 99, 132, 0.6)',
		'rgba(54, 162, 235, 0.6)', 'rgba(255, 206, 86, 0.6)',
		'rgba(75, 192, 192, 0.6)', 'rgba(153, 102, 255, 0.6)' ];
	function generateChart(data, labels, backgroundColor) {
		var barChart = new Chart($("#my_canvas"), {
			type : 'bar',
			data : {
				labels : labels,
				datasets : [{
					data: data,
					backgroundColor: backgroundColor
				}]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : true,
					text : "销量统计"
				},
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	}
	$.ajax({
		method: "GET",
		url: APP_PATH + "/backstage/salequantity",
		success: function(list) {
			var backgroundColors = new Array();
			var data = new Array();
			var labels = new Array();
			$.each(list, function(i, n) {
				data.push(n.saleQuantity);
				labels.push(n.title.substring(0, 10));
				backgroundColors.push(colors[i%colors.length]);
			});
			console.log(backgroundColors);
			generateChart(data, labels, backgroundColors);
		}
	});
</script>