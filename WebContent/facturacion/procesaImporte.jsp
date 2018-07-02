<%@page import="edu.uade.apd.tpo.repository.dto.ClienteDTO"%>
<%@page
	import="edu.uade.apd.tpo.repository.delegate.AdministracionDelegate"%>
<%@page import="edu.uade.apd.tpo.repository.dto.FacturaDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.EstadoPedidoDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page
	import="edu.uade.apd.tpo.repository.delegate.FacturacionDelegate"%>
<%@page import="edu.uade.apd.tpo.repository.dto.PedidoDTO"%>
<%@page import="java.util.List"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="facturacion">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Facturación</a></li>
			<li class="breadcrumb-item active" aria-current="page">Procesar
				Pago Importe</li>
		</ol>
	</nav>
	<%
		if (request.getParameter("result") != null && request.getParameter("result").equals("success")) {
	%>
	<div class="alert alert-success alert-dismissible fade show"
		role="alert">
		<span class="alert-message">El pago se ha procesado
			exitosamente!</span>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Cerrar">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		}
	%>
	<h2 class="title text-muted">Procesar Pago Importe</h2>
	<div class="d-flex justify-content-end mb-2">
		<form method="get" action="?" class="form-inline my-2 my-lg-0 mr-auto">
			<input name="cid" class="form-control mr-sm-2" type="search"
				placeholder="Buscar cliente por mail" aria-label="Buscar">
			<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Buscar
				Cliente</button>
		</form>
	</div>
	<hr />
	<div class="row">
		<div class="col">
			<h3 class="h3 mb-3">Resultado de la búsqueda</h3>
			<%
				if (request.getParameter("cid") != null && !request.getParameter("cid").equals("")) {
					Long clienteId = Long.parseLong(request.getParameter("cid"));
					ClienteDTO cliente = AdministracionDelegate.getInstance().findClienteById(clienteId);
					if (cliente != null) {
			%>
			<h4 class="h4 mb-3">Cliente: <%=cliente.getNombre()%></h4>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><strong>CUIT: </strong><%=cliente.getCuit()%></li>
				<li class="list-group-item"><strong>Condición IVA: </strong><%=cliente.getCondicionIva()%></li>
				<li class="list-group-item"><strong>Email: </strong><%=cliente.getEmail()%></li>
				<%
					if (cliente.getCuentaCorriente().getFacturas() != null
									&& !cliente.getCuentaCorriente().getFacturas().isEmpty()) {
								SimpleDateFormat fdate = new SimpleDateFormat("dd-MM-yyyy");
				%>
				<li class="list-group-item"><strong>Facturas impagas:
				</strong>
					<ul>
						<%
							for (FacturaDTO f : cliente.getCuentaCorriente().getFacturas()) {
											if (f.getEstado() == 'P') {
						%>
						<li><%=fdate.format(f.getFecha())%> | #<%=f.getId()%> <span
							class="text-muted">$<%=f.getTotal()%></span></li>
						<%
							}
										}
						%>
					</ul></li>
				<%
					}
				%>
			</ul>
			<hr/>
			<h4 class="h4 mb-3">Procesar Pago de Importe</h4>
			<form class="form-inline" action="<%=request.getContextPath()%>/facturacion" method="get">
				<div class="form-group">
					<label class="mr-2" for="importe">Importe a abonar:</label> 
					<input class="form-control" type="text" name="importe" required /> 
					<input type="hidden" name="cid" value="<%=cliente.getId()%>" />
				</div>
				<input class="btn btn-primary ml-3" type="submit" value="Procesar Pago"/>
			</form>
			<%
				}
				} else {
			%>
			<p>No se han encontrado resultados.</p>
			<%
				}
			%>
		</div>
	</div>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
