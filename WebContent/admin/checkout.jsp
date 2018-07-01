
<jsp:include page="../includes/header.jsp" />

<main role="main" class="container">

<section id="checkout">
	<h2 class="title">Su pedido</h2>
	<form id="checkout-form" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/pedidos" class="needs-validation" novalidate="">
		<input type="hidden" name="action" value="crear-pedido">
		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Su carrito</span> <span id="cantTotalItems"
						class="badge badge-secondary badge-pill"></span>
				</h4>
				<ul id="mini-cart" class="list-group mb-3">
				</ul>

			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">Dirección de enví­o</h4>


				<div class="mb-3">
					<label for="address">Calle y número</label> <input type="text"
						class="form-control" id="address"
						placeholder="Calle Principal 123" required="">
					<div class="invalid-feedback">Por favor, indique su dirección
						de enví­o.</div>
				</div>

				<div class="mb-3">
					<label for="address2">Piso y Departamento <span
						class="text-muted">(Opcional)</span></label> <input type="text"
						class="form-control" id="address2" placeholder="20 H">
				</div>

				<div class="row">
					<div class="col-md-5 mb-3">
						<label for="country">Provincia</label> <select
							class="custom-select d-block w-100" id="country" required="">
							<option value="">Seleccione...</option>
							<option>Ciudad Autónoma de Buenos Aires</option>
						</select>
						<div class="invalid-feedback">Por favor, seleccione una
							provincia válida.</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="state">Ciudad</label> <select
							class="custom-select d-block w-100" id="state" required="">
							<option value="">Seleccione...</option>
							<option>Ciudad Autónoma de Buenos Aires</option>
						</select>
						<div class="invalid-feedback">Por favor, seleccione una
							ciudad válida.</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="zip">Código Postal</label> <input type="text"
							class="form-control" id="zip" placeholder="" required="">
						<div class="invalid-feedback">El código postal es requerido.</div>
					</div>
				</div>
				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit">Confirmar
					pedido</button>

			</div>
		</div>
	</form>
</section>

</main>
<jsp:include page="../includes/footer.jsp" />
