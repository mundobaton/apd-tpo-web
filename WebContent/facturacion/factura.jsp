<%@page import="edu.uade.apd.tpo.repository.delegate.FacturacionDelegate"%>
<%@page import="edu.uade.apd.tpo.repository.dto.ItemPedidoDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.FacturaDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.ClienteDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.AdministracionDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="factura">
	<%
		if (request.getParameter("fid") != null){
			FacturaDTO factura = FacturacionDelegate.getInstance().obtenerFacturaPorId(Long.parseLong(request.getParameter("fid")));
			SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
			if(factura != null){
	%>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Facturaci�n</a></li>
			<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/facturacion/facturas.jsp">Facturas Emitidas</a></li>
			<li class="breadcrumb-item active" aria-current="page">Ver Factura #<%=factura.getId()%></li>
		</ol>
	</nav>
	<h2 class="title text-muted">
		Factura #<span class="fid"><%=factura.getId()%></span> 
		<%if(factura.getEstado() == 'P') {%>
		<span class="badge badge-warning">Pendiente</span>
		<%} else if(factura.getEstado() == 'C'){%>
		<span class="badge badge-success">Paga</span>
		<%} %>
	</h2>
	<ul class="list-group">
		<li class="list-group-item"><strong>Factura Tipo: </strong><%=factura.getTipo()%></li>
		<li class="list-group-item"><strong>Fecha: </strong><%=f.format(factura.getFecha())%></li>
		<li class="list-group-item">
			<table class="table table-striped">
				<tfoot>
					<tr>
						<th colspan="4">Total</th>
						<th class="text-center">$<%=factura.getTotal()%></th>
					</tr>
				</tfoot>
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Art�culo</th>
						<th scope="col" class="text-center">Precio</th>
						<th scope="col" class="text-center">Cantidad</th>
						<th scope="col" class="text-center">Subtotal</th>
					</tr>
				</thead>
				<tbody>
					<%
						int cantItems = 0;
							for (ItemPedidoDTO item : factura.getPedido().getItems()) {
								cantItems++;
					%>
					<tr>
						<th scope="row"><%=cantItems%></th>
						<td><%=item.getArticulo().getNombre()%></td>
						<td class="text-center">$<%=item.getArticulo().getPrecio()%></td>
						<td class="text-center"><%=item.getCantidad()%></td>
						<td class="text-center">$<%=Math.round(item.getArticulo().getPrecio() * item.getCantidad()*100.00)/100.00%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</li>
	</ul>
	<hr />
	<div class="d-flex justify-content-end">
		<a class="btn btn-primary" href="<%=request.getContextPath()%>/facturacion/facturas.jsp">Volver al listado</a>
	</div>
	<%
		}}
	%>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
