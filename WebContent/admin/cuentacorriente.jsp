<%@page import="edu.uade.apd.tpo.repository.delegate.AdministracionDelegate"%>
<%@page import="edu.uade.apd.tpo.repository.dto.FacturaDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.NotaDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.uade.apd.tpo.repository.dto.ClienteDTO"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="cuentaCorriente">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Mi Cuenta</a></li>
			<li class="breadcrumb-item active" aria-current="page">Cuenta
				Corriente</li>
		</ol>
	</nav>
	<%
		ClienteDTO loggedIn = (ClienteDTO) request.getSession().getAttribute("cliente");
	
		if (loggedIn != null) {
			ClienteDTO cliente = AdministracionDelegate.getInstance().findClienteById(loggedIn.getId());

			if (cliente != null) {
	%>
	<h2 class="title text-muted">Cuenta Corriente</h2>
	<div class="row mb-5">
		<div class="col">
			<h3>Estado de Cuenta</h3>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><strong>Saldo: </strong>$<%=cliente.getCuentaCorriente().getSaldo()%></li>
				<li class="list-group-item"><strong>Límite de crédito:
				</strong>$<%=cliente.getCuentaCorriente().getCredito()%></li>
			</ul>
		</div>
	</div>
	<%
		if (cliente.getCuentaCorriente().getNotas() != null
						&& !cliente.getCuentaCorriente().getNotas().isEmpty()) {
	%>
	<div class="row mb-5">
		<div class="col">
			<h3>Novedades del administrador</h3>
			<ul class="list-group">
				<%
					for (NotaDTO nota : cliente.getCuentaCorriente().getNotas()) {
				%>
				<li class="list-group-item"><span class="text-muted">Pedido
						#<%=nota.getPedido().getId()%>:
				</span><%=nota.getMensaje()%></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
	<%
		}
	%>
	<div class="row mb-5">
		<div class="col">
			<h3>Facturas emitidas</h3>
			<%
				if (cliente.getCuentaCorriente().getFacturas() != null) {
							SimpleDateFormat fdate = new SimpleDateFormat("dd-MM-yyyy");
			%>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<th>Nro. Factura</th>
						<th>Fecha</th>
						<th>Estado</th>
						<th>Nro. Pedido</th>
						<th>Importe</th>
						<th>Ver</th>
					</thead>
					<tbody>
						<%
							for (FacturaDTO f : cliente.getCuentaCorriente().getFacturas()) {
						%>
						<tr>
							<td><%=f.getId()%></td>
							<td>
								<%
									if (f.getFecha() != null) {
								%> <%=fdate.format(f.getFecha())%></td>
							<%
								}
							%>
							<td>
								<%
									if (f.getEstado() == 'P') {
								%> <span class="badge badge-pill badge-warning">Pendiente</span>
								<%
									} else if (f.getEstado() == 'C') {
								%> <span class="badge badge-pill badge-success">Paga</span> <%
 	}
 %>
							</td>
							<td><a
								href="<%=request.getContextPath()%>/admin/pedido.jsp?pid=<%=f.getPedido().getId()%>"><%=f.getPedido().getId()%></a></td>
							<td>$<%=Math.round(f.getTotal() * 100.00) / 100.00%></td>
							<td><a class="item-open text-success"
								href="<%=request.getContextPath()%>/admin/factura.jsp?fid=<%=f.getId()%>"><i
									class="fas fa-eye"></i></a></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<%
		}
		}
	%>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />