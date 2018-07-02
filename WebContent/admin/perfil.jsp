<%@page import="edu.uade.apd.tpo.repository.dto.EstadoPedidoDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.uade.apd.tpo.repository.dto.PedidoDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.ClienteDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.ArticuloDTO"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.DepositoDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="perfil">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Mi Cuenta</a></li>
			<li class="breadcrumb-item active" aria-current="page">Perfil</li>
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
		ClienteDTO cliente = (ClienteDTO) request.getSession().getAttribute("cliente");
		if (cliente != null) {
			
	%>
	<h2 class="title text-muted">
		Perfil de <span class="client-name"><%=cliente.getNombre()%></span>
	</h2>
	<div class="row mb-5">
		<div class="col">
			<h3>Datos Personales</h3>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><strong>Email: </strong>
					<%%></li>
				<li class="list-group-item"><strong>CUIT: </strong><%=cliente.getCuit()%></li>
				<li class="list-group-item"><strong>Condición IVA: </strong>{condicion_iva}</li>
				<li class="list-group-item"><strong>Domicilio: </strong><%=cliente.getDomicilio().getCalle()%>
					<%=cliente.getDomicilio().getNumero()%> - (<%=cliente.getDomicilio().getCodigoPostal()%>)
					<%=cliente.getDomicilio().getLocalidad()%>, <%=cliente.getDomicilio().getProvincia()%></li>
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
							<th scope="col" class="text-center">Nro. de Pedido</th>
							<th scope="col" class="text-center">Estado</th>
							<th scope="col" class="text-center">Ver</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (cliente.getPedidos() != null) {
								SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
									for (PedidoDTO p : cliente.getPedidos()) {
										if (p != null) {
						%>
						<tr>
						
							<td scope="col">
							<%if(p.getFechaPedido() != null) {%>
							<%=f.format(p.getFechaPedido())%>
							<%}else{ %>
							Pendiente de Aprobación
							<%} %>
							</td>
							<td scope="col" class="text-center"><%=p.getId()%></td>
							<td scope="col" class="text-center">
								<%
									if (p.getEstado() == EstadoPedidoDTO.GENERADO
															|| p.getEstado() == EstadoPedidoDTO.PREAPROBADO) {
								%> <span class="badge badge-pill badge-info"><%=p.getEstado().getName()%></span>
								<%
									} else if (p.getEstado() == EstadoPedidoDTO.SALDO_INSUFICIENTE
															|| p.getEstado() == EstadoPedidoDTO.RECHAZADO) {
								%> <span class="badge badge-pill badge-danger"><%=p.getEstado().getName()%></span>
								<%
									} else if (p.getEstado() == EstadoPedidoDTO.PENDIENTE
															|| p.getEstado() == EstadoPedidoDTO.A_FACTURAR) {
								%> <span class="badge badge-pill badge-warning"><%=p.getEstado().getName()%></span>
								<%
									} else if (p.getEstado() == EstadoPedidoDTO.COMPLETO
															|| p.getEstado() == EstadoPedidoDTO.FACTURADO) {
								%> <span class="badge badge-pill badge-success"><%=p.getEstado().getName()%></span>
								<%
									}
								%>
							</td>
							<td scope="col" class="text-center"><a class="text-success"
								href="<%=request.getContextPath()%>/admin/pedido.jsp?pid=<%=p.getId()%>"><i
									class="fas fa-eye"></i></a></td>
						</tr>
						<%
							}
									}
								}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%
		}
	%>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />