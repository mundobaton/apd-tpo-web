<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="compras">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Compras</a></li>
			<li class="breadcrumb-item"><a href="/compras/index.jsp">Órdenes
					de Compra</a></li>
			<li class="breadcrumb-item active" aria-current="page">Ver Orden
				#<span class="oc-id">{}</span>
			</li>
		</ol>
	</nav>
	<h2 class="title text-muted">
		Orden de Compra #<span class="oc-id">{}</span>
	</h2>
	<ul class="list-group">
		<li class="list-group-item"><strong>Fecha: </strong>{fecha}</li>
		<li class="list-group-item"><strong>Artículo: </strong><a
			href="/catalogo/articulo.jsp?aid=1" target="_blank">{nombre_articulo}</a></li>
		<li class="list-group-item"><strong>Cantidad: </strong>{cantidad}</li>
		<li class="list-group-item"><strong>Proveedor: </strong>{proveedor}</li>
		<li class="list-group-item"><strong>ID pedido origen: </strong>{pid}</li>
		<li class="list-group-item"><strong>Estado: </strong><span
			class="badge badge-pill badge-success">Ejecutada</span></li>
	</ul>
	<hr />
	<a class="btn btn-primary float-right" href="/compras/index.jsp">Volver
		al listado</a>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
