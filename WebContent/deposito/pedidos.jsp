<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="deposito-pedidos">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Depósito</a></li>
			<li class="breadcrumb-item active" aria-current="page">Pedidos a
				Completar</li>
		</ol>
	</nav>
	<h2 class="title text-muted">Pedidos a Completar</h2>
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col" class="col-md-1">ID</th>
					<th scope="col" class="col-md-2">Estado</th>
					<th scope="col" class="col-md-2">Fecha</th>
					<th scope="col" class="col-md-6">Cliente</th>
					<th scope="col" class="col-md-1 text-center">Ver</th>
				</tr>
			</thead>
			<tbody>
				<tr class="cart-item">
					<td class="item-id">1</td>
					<td class="item-status"><span
						class="badge badge-pill badge-info">Verificado</span></td>
					<td class="item-date">10/06/2018</td>
					<td class="item-consumer">Juan Pérez</td>

					<td class="text-center"><a class="item-open text-success"
						href="/deposito/pedido.jsp?pid=1"><i class="fas fa-eye"></i></a></td>
				</tr>
				<tr class="cart-item">
					<td class="item-id">2</td>
					<td class="item-status"><span
						class="badge badge-pill badge-info">Verificado</span></td>
					<td class="item-date">10/06/2018</td>
					<td class="item-consumer">Roberta Gómez</td>

					<td class="text-center"><a class="item-open text-success"
						href="/deposito/pedido.jsp?pid=2"><i class="fas fa-eye"></i></a></td>
				</tr>
			</tbody>
		</table>
	</div>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
