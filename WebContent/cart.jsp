<jsp:include page="includes/header.jsp" />

<main role="main" class="container">

<section id="cart">
	<h2 class="title">Su carrito</h2>
	<form action="confirmCart.jsp" method="post"
		enctype="multipart/form-data" class="row">
		<div class="table-responsive">
			<table class="table">
				<tfoot>
					<tr>
						<th scope="row" colspan="4">Total</th>
						<th scope="row" class="text-center">$110.00</th>
					</tr>
				</tfoot>
				<thead class="thead-light">
					<tr>
						<th scope="col" class="col-md-4">Artículo</th>
						<th scope="col" class="col-md-2 text-center">Precio</th>
						<th scope="col" class="col-md-1 text-center">Cantidad</th>
						<th scope="col" class="col-md-2 text-center">Subtotal</th>
						<th scope="col" class="col-md-1 text-center">Eliminar</th>
					</tr>
				</thead>
				<tbody>
					<tr class="cart-item" id="aid-1">
						<td class="item-title">Artículo 1</td>
						<td class="item-price text-center">$99.00</td>
						<td class="item-quantity text-center"><input type="number"
							step="1" min="1" value="1" class="form-control" /></td>
						<td class="item-subtotal text-center">$99.00</td>
						<td class="text-center"><a class="item-remove" href="#"
							data-aid="1" data-toggle="modal" data-target="#removeFromCart"><i
								class="fas fa-trash-alt"></i></a></td>
					</tr>
					<tr class="cart-item" id="aid-2">
						<td class="item-title">Artículo 2</td>
						<td class="item-price text-center">$11.00</td>
						<td class="item-quantity text-center"><input type="number"
							step="1" min="1" value="1" class="form-control" /></td>
						<td class="item-subtotal text-center">$11.00</td>
						<td class="text-center"><a class="item-remove" href="#"
							data-aid="2" data-toggle="modal" data-target="#removeFromCart"><i
								class="fas fa-trash-alt"></i></a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<hr class="mb-4">
	<a class="btn btn-primary btn-lg btn-block" href="/checkout.jsp">Continuar
		al checkout</a>
</section>
<!--Modal-->
<div class="modal fade" id="removeFromCart" tabindex="-1" role="dialog"
	aria-labelledby="modalTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalTitle">Eliminar item</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Cerrar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>
					¿Está seguro que desea eliminar el articulo <span
						class="article-name text-muted">{articulo}</span> del carrito?
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
				<button id="removeConfirm" type="button" class="btn btn-primary"
					data-aid="">Confirmar</button>
			</div>
		</div>
	</div>
</div>

</main>
<jsp:include page="includes/footer.jsp" />
