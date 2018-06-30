<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="deposito-pedido">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Depósito</a></li>
			<li class="breadcrumb-item"><a href="/deposito/pedidos.jsp">Pedidos
					a Completar</a></li>
			<li class="breadcrumb-item active" aria-current="page">Ver
				Pedido #<span class="id">{}</span>
			</li>
		</ol>
	</nav>
	<h2 class="title text-muted">
		Pedido #<span class="pid">{numero}</span> <span
			class="badge badge-info">Verificado</span>
	</h2>
	<ul class="list-group">
		<li class="list-group-item"><strong>Fecha: </strong>{fecha}</li>
		<li class="list-group-item"><strong>Cliente: </strong>{cliente}</li>
		<li class="list-group-item"><strong>Domicilio: </strong> {calle}
			{numero} - ({cp}) {ciudad}, {provincia}.</li>
		<li class="list-group-item">
			<table class="table table-striped">
				<tfoot>
					<tr>
						<th colspan="4">Total</th>
						<th>$110</th>
					</tr>
				</tfoot>
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Artículo</th>
						<th scope="col">Precio</th>
						<th scope="col">Cantidad</th>
						<th scope="col">Subtotal</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Articulo 1</td>
						<td>$10</td>
						<td>1</td>
						<td>$10</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Articulo 2</td>
						<td>$20</td>
						<td>2</td>
						<td>$40</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Articulo 20</td>
						<td>$30</td>
						<td>2</td>
						<td>$60</td>
					</tr>
				</tbody>
			</table>
		</li>
	</ul>
	<hr />
	<div class="d-flex justify-content-end">
		<a class="btn btn-secondary mr-3" href="/deposito/pedidos.jsp">Volver
			al listado</a> <a class="btn btn-primary" href="#">Completar Pedido</a>
	</div>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
