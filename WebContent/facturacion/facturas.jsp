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
			<li class="breadcrumb-item active" aria-current="page">Facturas
				Emitidas</li>
		</ol>
	</nav>
	<h2 class="title text-muted">Facturas Emitidas</h2>
	<div class="d-flex justify-content-end mb-2">
		<span class="text-muted py-2">Filtrar: </span> <a
			class="btn btn-info ml-3"
			href="<%=request.getContextPath()%>/admin/facturas.jsp">Ver todas</a>
		<a class="btn btn-success ml-3"
			href="<%=request.getContextPath()%>/admin/facturas.jsp?show=pagas">Ver
			pagas</a> <a class="btn btn-danger ml-3"
			href="<%=request.getContextPath()%>/admin/facturas.jsp?show=impagas">Ver
			impagas</a>
	</div>
	<hr />
	<div class="row">
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
					<%
						List<FacturaDTO> facturas = FacturacionDelegate.getInstance().obtenerFacturas();
						if (facturas != null && !facturas.isEmpty()) {
							String ver = "";
							SimpleDateFormat fdate = new SimpleDateFormat("dd-MM-yyyy");
							if (request.getParameter("show") != null) {
								ver = request.getParameter("show");
							}
							for (FacturaDTO f : facturas) {
								if((f.getEstado() == 'P' && ver.equals("impagas")) || (f.getEstado() == 'C' && ver.equals("pagas")) || (ver.equals(""))){
					%>
					<tr>
						<td><%=f.getId()%></td>
						<td><%=fdate.format(f.getFecha())%></td>
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
						<td><%=f.getPedido().getCliente().getNombre()%></td>
						<td>$<%=Math.round(f.getTotal() * 100.00) / 100.00%></td>
						<td><a class="item-open text-success"
							href="<%=request.getContextPath()%>/facturacion/factura.jsp?fid=<%=f.getId()%>"><i
								class="fas fa-eye"></i></a></td>
					</tr>
					<%	}
						}
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
