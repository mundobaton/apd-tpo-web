
<jsp:include page="includes/header.jsp" />

<main role="main" class="container">

<section id="checkout">
	<h2 class="title">Su pedido</h2>
	<div class="row">
		<div class="col-md-4 order-md-2 mb-4">
			<h4 class="d-flex justify-content-between align-items-center mb-3">
				<span class="text-muted">Su carrito</span> <span
					class="badge badge-secondary badge-pill">3</span>
			</h4>
			<ul class="list-group mb-3">
				<li
					class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h6 class="my-0">Articulo 1</h6>
						<small class="text-muted">Cantidad: <span class="quantity">10</span></small>
					</div> <span class="text-muted">$12</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h6 class="my-0">Articulo 2</h6>
						<small class="text-muted">Cantidad: <span class="quantity">10</span></small>
					</div> <span class="text-muted">$8</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h6 class="my-0">Articulo 3</h6>
						<small class="text-muted">Cantidad: <span class="quantity">10</span></small>
					</div> <span class="text-muted">$5</span>
				</li>
				<li class="list-group-item d-flex justify-content-between"><span>Total
						(AR$)</span> <strong>$20</strong></li>
			</ul>

		</div>
		<div class="col-md-8 order-md-1">
			<h4 class="mb-3">Dirección de envío</h4>
			<form class="needs-validation" novalidate="">

				<div class="mb-3">
					<label for="address">Calle y número</label> <input type="text"
						class="form-control" id="address"
						placeholder="Calle Principal 123" required="">
					<div class="invalid-feedback">Por favor, indique su
						dirección de envío.</div>
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
						<div class="invalid-feedback">El código postal es
							requerido.</div>
					</div>
				</div>
				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit">Confirmar
					pedido</button>
			</form>
		</div>
	</div>
</section>

</main>
<jsp:include page="includes/footer.jsp" />
