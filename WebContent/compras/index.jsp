<%@page import="edu.uade.apd.tpo.repository.delegate.ComprasDelegate"%>
<%@page import="edu.uade.apd.tpo.repository.dto.OrdenCompraDTO"%>
<%@page import="java.util.List"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="compras">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Compras</a></li>
			<li class="breadcrumb-item active" aria-current="page">Órdenes
				de Compra</li>
		</ol>
	</nav>
	<h2 class="title text-muted">Órdenes de Compra</h2>
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
				<tr class="d-flex">
					<th scope="col" class="col-1">ID</th>
					<th scope="col" class="col-8">Artículo</th>
					<th scope="col" class="col-2 text-center">Estado</th>
					<th scope="col" class="col-1 text-center">Ver</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<OrdenCompraDTO> ocs = ComprasDelegate.getInstance().obtenerOrdenesCompra();
					for (OrdenCompraDTO oc : ocs) {
						/*
						*/
				%>
				<tr class="d-flex cart-item">
					<td class="col-1 item-id"><%=oc.getId()%></td>
					<td class="col-8 item-article"><%=oc.getItem().getArticulo().getNombre()%></td>
					<td class="col-2 item-status text-center">
					<%if(oc.getEstado() == 'P') {%>
					<span class="badge badge-pill badge-warning">Pendiente</span>
					<%} else if(oc.getEstado() == 'C') {%>
					<span class="badge badge-pill badge-success">Completa</span>
					<%}  %>
					</td>
					<td class="col-1 text-center"><a
						class="item-open text-success"
						href="<%=request.getContextPath()%>/compras/orden.jsp?oid=<%=oc.getId()%>"><i
							class="fas fa-eye"></i></a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
