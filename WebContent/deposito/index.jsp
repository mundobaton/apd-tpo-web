<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="deposito">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Dep�sito</a></li>
			<li class="breadcrumb-item active" aria-current="page">Almac�n</li>
		</ol>
	</nav>
	<div class="d-flex">
		<div class="mr-auto p-2">
			<h2 class="title text-muted">Almac�n</h2>
		</div>
		<div class="p-2">
			<a class="btn btn-info float-right" href="#">Retirar art�culo</a>
		</div>
		<div class="p-2">
			<a class="btn btn-success float-right" href="<%=request.getContextPath()%>/deposito/almacenar.jsp">Almacenar art�culo</a>
		</div>
	</div>
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col" class="col-md-2">C�digo</th>
					<th scope="col" class="col-md-6">Art�culo</th>
					<th scope="col" class="col-md-2 text-center">Cantidad</th>
					<th scope="col" class="col-md-2 text-center">Estado</th>
				</tr>
			</thead>
			<tbody>
				<tr class="almacen-item">
					<td class="item-id">ABC123</td>
					<td class="item-article">(vac�o)</td>
					<td class="item-quantity text-center">0</td>
					<td class="item-status text-center"><span
						class="badge badge-pill badge-success">Disponible</span></td>
				</tr>
				<tr class="almacen-item">
					<td class="item-id">DEF234</td>
					<td class="item-article">Art�culo 7</td>
					<td class="item-quantity text-center">222</td>
					<td class="item-status text-center"><span
						class="badge badge-pill badge-danger">Ocupada</span></td>
				</tr>
			</tbody>
		</table>
	</div>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
