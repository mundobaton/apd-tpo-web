<%@page import="edu.uade.apd.tpo.repository.dto.ArticuloDTO"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.DepositoDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="perfil">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active" aria-current="page">Mi Perfil</li>
		</ol>
	</nav>
	<%
		/*
		private Long id;
		private String email;
		private String password;
		private CuentaCorriente cuentaCorriente;
		private Domicilio domicilio;
		private List<Pedido> pedidos;
		*/
	%>
	<h2 class="title text-muted">
		Perfil de <span class="client-name">{nombre_cliente}</span>
	</h2>
	<div class="row mb-5">
		<div class="col">
			<h3>Datos Personales</h3>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><strong>Email: </strong>{email}</li>
				<li class="list-group-item"><strong>CUIT: </strong>{cuit}</li>
				<li class="list-group-item"><strong>Condición IVA: </strong>{condicion_iva}</li>
				<li class="list-group-item"><strong>Domicilio: </strong>{domicilio}</li>
			</ul>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col">
			<h3>Pedidos</h3>
			<div class="table-responsive">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th scope="col">Fecha</th>
							<th scope="col">Nro. de Pedido</th>
							<th scope="col" class="text-center">Estado</th>
							<th scope="col" class="text-center">Ver</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="col">05/05/2018</th>
							<th scope="col">1234</th>
							<th scope="col" class="text-center"><span
								class="badge badge-pill badge-warning">Pendiente</span></th>
							<th scope="col" class="text-center"><a class="text-success"
								href="<%=request.getContextPath()%>/admin/pedido.jsp"><i
									class="fas fa-eye"></i></a></th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />