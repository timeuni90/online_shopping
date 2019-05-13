<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="content-header">
	<h1>
		订单信息 <small>维护</small>
	</h1>

</section>

<!-- Main content -->
<section class="content container-fluid">

	<!--------------------------
        | Your Page Content Here |
        -------------------------->
	<br>
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">历史订单列表</h3>
					<div class="box-tools">
						<div class="input-group input-group-sm" style="width: 150px;">
							<input type="text" name="table_search"
								class="form-control pull-right" placeholder="Search">

							<div class="input-group-btn">
								<button type="submit" class="btn btn-default">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<thead>
							<tr>
								<td><input type="checkbox"></td>
								<td>#</td>
								<td>订单编号</td>
								<td>时间</td>
								<td>状态</td>
								<td>买家</td>
								<td>总付款</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
				<!-- /.box-body -->
				<div class="box-footer clearfix">
					<ul class="pagination pagination-sm no-margin pull-right">
						<li><a href="#">上一页</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">下一页</a></li>
					</ul>
				</div>
			</div>
			<!-- /.box -->
		</div>
	</div>
	<div class="modal fade" id="modal-order-detail" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">订单详情</h4>
				</div>
				<div class="modal-body">
					<section class="invoice">
						<!-- title row -->
						<div class="row">
							<div class="col-xs-12">
								<h2 class="page-header">
									<i class="fa fa-globe"></i> AdminLTE, Inc. <small
										class="pull-right">Date: 2/10/2014</small>
								</h2>
							</div>
							<!-- /.col -->
						</div>
						<!-- info row -->
						<div class="row invoice-info">
							<div class="col-sm-4 invoice-col">
								From
								<address>
									<strong>Admin, Inc.</strong><br> 795 Folsom Ave, Suite 600<br>
									San Francisco, CA 94107<br> Phone: (804) 123-5432<br>
									Email: info@almasaeedstudio.com
								</address>
							</div>
							<!-- /.col -->

							<!-- /.col -->
							<div class="col-sm-4 invoice-col">
								<b>Invoice #007612</b><br> <br> <b>Order ID:</b>
								4F3S8J<br> <b>Payment Due:</b> 2/22/2014<br> <b>Account:</b>
								968-34567
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<!-- Table row -->
						<div class="row">
							<div class="col-xs-12 table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<td>商品</td>
											<td>参数</td>
											<td>单价</td>
											<td>数量</td>
											<td>小计</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Call of Duty</td>
											<td>455-981-221</td>
											<td>El snort testosterone trophy driving gloves handsome</td>
											<td>$64.50</td>
										</tr>
										<tr>
											<td>1</td>
											<td>Need for Speed IV</td>
											<td>247-925-726</td>
											<td>Wes Anderson umami biodiesel</td>
											<td>$50.00</td>
										</tr>
										<tr>
											<td>1</td>
											<td>Monsters DVD</td>
											<td>735-845-642</td>
											<td>Terry Richardson helvetica tousled street art master</td>
											<td>$10.70</td>
										</tr>
										<tr>
											<td>1</td>
											<td>Grown Ups Blue Ray</td>
											<td>422-568-642</td>
											<td>Tousled lomo letterpress</td>
											<td>$25.99</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<div class="row">
							<!-- accepted payments column -->

							<!-- /.col -->
							<div class="col-xs-6 col-xs-offset-6">
								<p class="lead">Amount Due 2/22/2014</p>

								<div class="table-responsive">
									<table class="table">
										<tbody>
											<tr>
												<th style="width: 50%">Subtotal:</th>
												<td>$250.30</td>
											</tr>
											<tr>
												<th>Tax (9.3%)</th>
												<td>$10.34</td>
											</tr>
											<tr>
												<th>Shipping:</th>
												<td>$5.80</td>
											</tr>
											<tr>
												<th>Total:</th>
												<td>$265.24</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<!-- this row will not appear when printing -->
						<div class="row no-print">
							<div class="col-xs-12">
								<a href="invoice-print.html" target="_blank"
									class="btn btn-default"><i class="fa fa-print"></i> Print</a>

							</div>
						</div>
					</section>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</section>
<!-- /.content -->
