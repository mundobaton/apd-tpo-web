<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="compras">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Compras</a></li>
			<li class="breadcrumb-item active" aria-current="page">Órdenes
				de Compra</li>
		</ol>
	</nav>
	<h2 class="title text-muted">Órdenes de Compra</h2>
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col" class="col-md-1">ID</th>
					<th scope="col" class="col-md-8">Artículo</th>
					<th scope="col" class="col-md-2 text-center">Estado</th>
					<th scope="col" class="col-md-1 text-center">Ver</th>
				</tr>
			</thead>
			<tbody>
				<tr class="cart-item">
					<td class="item-id">1</td>
					<td class="item-article">Artículo 1</td>
					<td class="item-status text-center"><span
						class="badge badge-pill badge-warning">Pendiente</span></td>
					<td class="text-center"><a class="item-open text-success"
						href="<%=request.getContextPath()%>/compras/orden.jsp?oid=1"><i class="fas fa-eye"></i></a></td>
				</tr>
				<tr class="cart-item">
					<td class="item-id">2</td>
					<td class="item-article">Artículo 5</td>
					<td class="item-status text-center"><span
						class="badge badge-pill badge-success">Ejecutada</span></td>
					<td class="text-center"><a class="item-open text-success"
						href="<%=request.getContextPath()%>/compras/orden.jsp?oid=2"><i class="fas fa-eye"></i></a></td>
				</tr>
				<tr class="cart-item">
					<td class="item-id">3</td>
					<td class="item-article">Artículo 7</td>
					<td class="item-status text-center"><span
						class="badge badge-pill badge-danger">Cancelada</span></td>
					<td class="text-center"><a class="item-open text-success"
						href="<%=request.getContextPath()%>/compras/orden.jsp?oid=3"><i class="fas fa-eye"></i></a></td>
				</tr>
			</tbody>
		</table>
	</div>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
