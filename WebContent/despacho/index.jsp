<%@page import="edu.uade.apd.tpo.repository.dto.EstadoPedidoDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.PedidoDTO"%>
<%@page import="java.util.List"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.DespachoDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="deposito-pedidos">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Despacho</a></li>
			<li class="breadcrumb-item active" aria-current="page">Pedidos a
				Despachar</li>
		</ol>
	</nav>
	<h2 class="title text-muted">Pedidos a Despachar</h2>
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
				<tr class="d-flex">
					<th scope="col" class="col-1">ID</th>
					<th scope="col" class="col-2">Estado</th>
					<th scope="col" class="col-2">Fecha</th>
					<th scope="col" class="col-6">Cliente</th>
					<th scope="col" class="col-1 text-center">Ver</th>
				</tr>
			</thead>
			<tbody>
			<% List<PedidoDTO> pedidos = DespachoDelegate.getInstance().obtenerPedidosCompletos();
			if(pedidos != null){
				for(PedidoDTO pedido : pedidos){
			%>
				<tr class="d-flex cart-item">
					<td class="col-1 item-id"><%=pedido.getId()%></td>
					<td class="col-2 item-status">
					<%if(pedido.getEstado() == EstadoPedidoDTO.COMPLETO){ %>
					<span class="badge badge-pill badge-success">Completo</span>
					<%} %>
					</td>
					<td class="col-2 item-date"><%=pedido.getFechaPedido()%></td>
					<td class="col-6 item-consumer"><%=pedido.getCliente().getNombre()%></td>
					<td class="col-1 text-center"><a class="item-open text-success"
						href="<%=request.getContextPath()%>/despacho/pedido.jsp?pid=1"><i class="fas fa-eye"></i></a></td>
				</tr>
				<%}} %>
			</tbody>
		</table>
	</div>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
