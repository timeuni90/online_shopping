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
		<div class="modal-dialog">
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
						
					</section>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</section>
<!-- /.content -->
