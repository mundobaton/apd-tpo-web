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
	<ul class="list-group">
		<li class="list-group-item"><strong>Fecha: </strong>{fecha}</li>
		<li class="list-group-item"><strong>Artí­culo: </strong><a
			href="<%=request.getContextPath()%>/catalogo/articulo.jsp?aid=1"
			target="_blank">{nombre_articulo}</a></li>
		<li class="list-group-item"><strong>Cantidad: </strong>{cantidad}</li>
		<li class="list-group-item"><strong>Proveedor: </strong>{proveedor}</li>
		<li class="list-group-item"><strong>ID pedido origen: </strong>{pid}</li>
		<li class="list-group-item"><strong>Estado: </strong><span
			class="badge badge-pill badge-success">Ejecutada</span></li>
	</ul>
	<hr />
	<div class="d-flex justify-content-end">
		<div class="p-2">
			<a class="btn btn-secondary float-right"
				href="<%=request.getContextPath()%>/compras/index.jsp">Volver al
				listado</a>
		</div>
		<div class="p-2">
			<a class="btn btn-primary float-right"
				href="<%=request.getContextPath()%>/compras/procesar.jsp?oid=<%=request.getParameter("oid")%>">Procesar Órden de Compra</a>
		</div>
	</div>

</section>
</main>
<jsp:include page="../includes/footer.jsp" />
