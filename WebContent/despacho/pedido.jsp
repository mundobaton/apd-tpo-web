<%@page import="edu.uade.apd.tpo.repository.dto.ItemPedidoDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.uade.apd.tpo.repository.dto.EstadoPedidoDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.PedidoDTO"%>
<%@page
	import="edu.uade.apd.tpo.repository.delegate.AdministracionDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="deposito-pedido">
	<%
		PedidoDTO pedido = AdministracionDelegate.getInstance()
				.findPedidoById(Long.parseLong(request.getParameter("pid")));
		if (pedido != null) {
			SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
	%>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Despacho</a></li>
			<li class="breadcrumb-item"><a
				href="<%=request.getContextPath()%>/despacho/index.jsp">Pedidos
					a Despachar</a></li>
			<li class="breadcrumb-item active" aria-current="page">Ver
				Pedido #<span class="id"><%=pedido.getId()%></span>
			</li>
		</ol>
	</nav>
	<%
		if (request.getParameter("result").equals("success")) {
	%>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
		<span class="alert-message">El pedido #<%=pedido.getId()%> ha sido despachado correctamente.</span>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Cerrar">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		}
	%>
	<h2 class="title text-muted">
		Pedido #<span class="pid"><%=pedido.getId()%></span>
		<%
			if (pedido.getEstado() == EstadoPedidoDTO.GENERADO
						|| pedido.getEstado() == EstadoPedidoDTO.PREAPROBADO) {
		%>
		<span class="badge badge-info"><%=pedido.getEstado().getName()%></span>
		<%
			} else if (pedido.getEstado() == EstadoPedidoDTO.SALDO_INSUFICIENTE
						|| pedido.getEstado() == EstadoPedidoDTO.RECHAZADO) {
		%>
		<span class="badge badge-danger"><%=pedido.getEstado().getName()%></span>
		<%
			} else if (pedido.getEstado() == EstadoPedidoDTO.PENDIENTE
						|| pedido.getEstado() == EstadoPedidoDTO.A_FACTURAR) {
		%>
		<span class="badge badge-warning"><%=pedido.getEstado().getName()%></span>
		<%
			} else if (pedido.getEstado() == EstadoPedidoDTO.COMPLETO
						|| pedido.getEstado() == EstadoPedidoDTO.FACTURADO) {
		%>
		<span class="badge badge-success"><%=pedido.getEstado().getName()%></span>
		<%
			}
		%>
	</h2>
	<ul class="list-group">
		<li class="list-group-item"><strong>Fecha de realización: </strong><%=f.format(pedido.getFechaPedido())%></li>
		<%if(pedido.getFechaDespacho() != null) {%>		
		<li class="list-group-item"><strong>Fecha de despacho: </strong><%=f.format(pedido.getFechaDespacho())%></li>
		<li class="list-group-item"><strong>Transportista: </strong>saraza</li>
		<%} %>
		<li class="list-group-item"><strong>Cliente: </strong><%=pedido.getCliente().getNombre()%></li>
		<li class="list-group-item"><strong>Domicilio: </strong> <%=pedido.getDomicilio().getCalle()%>
			<%=pedido.getDomicilio().getNumero()%> - (<%=pedido.getDomicilio().getCodigoPostal()%>)
			<%=pedido.getDomicilio().getLocalidad()%>, <%=pedido.getDomicilio().getProvincia()%>.</li>
		<li class="list-group-item">
			<table class="table table-striped">
				<tfoot>
					<tr>
						<th colspan="4">Total bruto</th>
						<th>$<%=pedido.getPrecioBruto()%></th>
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
							for (ItemPedidoDTO item : pedido.getItems()) {
								cantItems++;
					%>
					<tr>
						<th scope="row"><%=cantItems%></th>
						<td><%=item.getArticulo().getNombre()%></td>
						<td class="text-center">$<%=item.getArticulo().getPrecio()%></td>
						<td class="text-center"><%=item.getCantidad()%></td>
						<td class="text-center">$<%=(item.getArticulo().getPrecio() * item.getCantidad())%></td>
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
		<a class="btn btn-secondary mr-3"
			href="<%=request.getContextPath()%>/despacho/index.jsp">Volver al
			listado</a>
		<%
			if (pedido.getEstado() == EstadoPedidoDTO.COMPLETO) {
		%>
		<a class="btn btn-primary"
			href="<%=request.getContextPath()%>/despacho?action=despachar&pid=<%=pedido.getId()%>">Despachar
			Pedido</a>
		<%
			}
		%>
	</div>
	<%
		}
	%>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
