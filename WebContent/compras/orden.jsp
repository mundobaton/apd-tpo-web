<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.uade.apd.tpo.repository.dto.OrdenCompraDTO"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.ComprasDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="compras">

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Compras</a></li>
			<li class="breadcrumb-item"><a
				href="<%=request.getContextPath()%>/compras/index.jsp">Órdenes
					de Compra</a></li>
			<li class="breadcrumb-item active" aria-current="page">Ver Orden
				#<span class="oc-id"><%=request.getParameter("oid")%></span>
			</li>
		</ol>
	</nav>
	<h2 class="title text-muted">
		Orden de Compra #<span class="oc-id"><%=request.getParameter("oid")%></span>
	</h2>
	<%
		OrdenCompraDTO oc = ComprasDelegate.getInstance().obtenerPorId(Long.parseLong(request.getParameter("oid")));
		if (oc != null) {
			SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
	%>
	<ul class="list-group">
		<li class="list-group-item"><strong>Fecha: </strong><%=f.format(oc.getFechaCreacion())%></li>
		<li class="list-group-item"><strong>Artí­culo: </strong><a
			id="article-ajax"
			href="<%=request.getContextPath()%>/catalogo/articulo.jsp?id=<%=oc.getItem().getArticulo().getId()%>"
			data-aid="<%=oc.getItem().getArticulo().getId()%>" target="_blank"><%=oc.getItem().getArticulo().getNombre()%></a></li>
		<li class="list-group-item"><strong>Cantidad: </strong><%=oc.getItem().getArticulo().getCantCompra()%></li>
		<li class="list-group-item"><strong>Proveedor: </strong>{proveedor}</li>
		<li class="list-group-item"><strong>ID pedido origen: </strong><%=oc.getPedido().getId()%></li>
		<li class="list-group-item"><strong>Estado: </strong> <%
 	if (oc.getEstado() == 'P') {
 %> <span class="badge badge-pill badge-warning">Pendiente</span> <%
 	} else if (oc.getEstado() == 'C') {
 %> <span class="badge badge-pill badge-success">Completa</span> <%
 	}
 %></li>
	</ul>

	<hr />
	<div class="d-flex justify-content-end">
		<div class="p-2">
			<a class="btn btn-secondary float-right"
				href="<%=request.getContextPath()%>/compras/index.jsp">Volver al
				listado</a>
		</div>
		<%
			if (oc.getEstado() == 'P') {
		%>
		<div class="p-2">
			<a class="btn btn-primary float-right"
				href="<%=request.getContextPath()%>/compras?action=procesar-oc&oid=<%=request.getParameter("oid")%>">Procesar
				Órden de Compra</a>
		</div>
		<%
			}
		%>
	</div>
	<%
		}
	%>
</section>
<!-- Modal -->
<div class="modal fade" id="showArticle" tabindex="-1" role="dialog"
	aria-labelledby="showArticleTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="showArticleTitle">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Cerrar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<ul class="list-group">
					<li class="list-group-item"><strong>Nombre: </strong><span
						class="article-title"></span></li>
					<li class="list-group-item"><strong>Código de barras:
					</strong><span class="article-codigo"></span></li>
					<li class="list-group-item"><strong>Presentación: </strong><span
						class="article-presentacion"></span></li>
					<li class="list-group-item"><strong>Tamaño: </strong><span
						class="article-tamano"></span></li>
					<li class="list-group-item"><strong>Precio: </strong><span
						class="price-tag">$<span></span></span></li>
					<li class="list-group-item"><strong>Unidad: </strong><span
						class="article-unidad"></span></li>
					<li class="list-group-item"><strong>Cantidad de
							compra: </strong><span class="article-compra"></span></li>
				</ul>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>
</main>
<jsp:include page="../includes/footer.jsp" />
