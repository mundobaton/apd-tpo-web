<%@page import="edu.uade.apd.tpo.repository.dto.EstadoPedidoDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.FacturacionDelegate"%>
<%@page import="edu.uade.apd.tpo.repository.dto.PedidoDTO"%>
<%@page import="java.util.List"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="facturacion">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Facturación</a></li>
			<li class="breadcrumb-item active" aria-current="page">Facturas Emitidas</li>
		</ol>
	</nav>
	<h2 class="title text-muted">Facturas Emitidas</h2>
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
				<tr class="d-flex">
					<th scope="col" class="col-1">Nro.</th>
					<th scope="col" class="col-2">Fecha</th>
					<th scope="col" class="col-1">Estado</th>
					<th scope="col" class="col-6">Cliente</th>
					<th scope="col" class="col-1">Importe</th>
					<th scope="col" class="col-1 text-center">Ver</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
