<%@page
	import="edu.uade.apd.tpo.repository.delegate.FacturacionDelegate"%>
<%@page import="edu.uade.apd.tpo.repository.dto.ItemPedidoDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.FacturaDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.ClienteDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page
	import="edu.uade.apd.tpo.repository.delegate.AdministracionDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="factura">
	<%
		if (request.getParameter("fid") != null) {
			FacturaDTO factura = FacturacionDelegate.getInstance()
					.obtenerFacturaPorId(Long.parseLong(request.getParameter("fid")));
			SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
			if (factura != null) {
	%>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Facturación</a></li>
			<li class="breadcrumb-item"><a
				href="<%=request.getContextPath()%>/facturacion/facturas.jsp">Facturas
					Emitidas</a></li>
			<li class="breadcrumb-item active" aria-current="page">Ver
				Factura #<%=factura.getId()%></li>
		</ol>
	</nav>
	<%
		if (request.getParameter("result") !=null && request.getParameter("result").equals("success")) {
	%>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
		<span class="alert-message">La factura #<%=factura.getId()%> ha sido pagada correctamente.</span>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Cerrar">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		}
	%>
	<h2 class="title text-muted">
		Factura #<span class="fid"><%=factura.getId()%></span>
		<%
			if (factura.getEstado() == 'P') {
		%>
		<span class="badge badge-warning">Pendiente</span>
		<%
			} else if (factura.getEstado() == 'C') {
		%>
		<span class="badge badge-success">Paga</span>
		<%
			}
		%>
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
						<th scope="col">Artículo</th>
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
						<td class="text-center">$<%=Math.round(item.getArticulo().getPrecio() * item.getCantidad() * 100.00) / 100.00%></td>
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
		<a class="btn btn-primary"
			href="<%=request.getContextPath()%>/facturacion/facturas.jsp">Volver
			al listado</a>
		<%
			if (factura.getEstado() == 'P') {
		%>
		<a class="btn btn-success" href="#" data-toggle="modal"
			data-target="#pagarFactura" role="button">Pagar Total</a>
		<%
			}
		%>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="pagarFactura" tabindex="-1" role="dialog"
		aria-labelledby="pagarFacturaLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<form action="<%=request.getContextPath()%>/facturacion" method="get" class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="pagarFacturaLabel">Pagar Factura #<%=factura.getId()%></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Cerrar">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<div class="form-group">
					<label for="importe">Ingrese el importe a abonar:</label>
					<input type="text" name="importe" value="<%=factura.getTotal()%>"/>
					<input type="hidden" name="fid" value="<%=factura.getId()%>"/>
					<input type="hidden" name="cid" value="<%=factura.getPedido().getCliente().getId()%>"/>
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Pagar Total</button>
				</div>
			</form>
		</div>
	</div>
	<%
		}
		}
	%>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
