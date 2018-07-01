<jsp:include page="../includes/header.jsp" />

<main role="main" class="container">

<section id="cart">
	<h2 class="title">Su carrito</h2>
	<div class="row">
		<div class="table-responsive">
			<table class="table">
				<tfoot>
					<tr>
						<th scope="row" colspan="4">Subtotal</th>
						<th scope="row" class="text-center">$<span id="cart-subtotal"></span></th>
					</tr>
				</tfoot>
				<thead class="thead-light">
					<tr>
						<th scope="col" class="col-md-4">Artí­culo</th>
						<th scope="col" class="col-md-2 text-center">Precio</th>
						<th scope="col" class="col-md-1 text-center">Cantidad</th>
						<th scope="col" class="col-md-2 text-center">Subtotal</th>
						<th scope="col" class="col-md-1 text-center">Eliminar</th>
					</tr>
				</thead>
				<tbody>
					<!-- aca van los items del carrito -->
				</tbody>
			</table>
		</div>
	</div>
	<hr class="mb-4">
	<div class="d-flex justify-content-end">
		<div class="p-2">
			<a class="btn btn-primary"
				href="<%=request.getContextPath()%>/catalogo/articulos.jsp">Seguir comprando</a>
		</div>
		<div class="p-2">
			<button class="btn btn-success" disabled="disabled"
				href="<%=request.getContextPath()%>/admin/checkout.jsp">Continuar
				al checkout</button>
		</div>
	</div>



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
					¿Está seguro que desea eliminar el artículo <span
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
<jsp:include page="../includes/footer.jsp" />
