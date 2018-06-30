<%@page import="edu.uade.apd.tpo.repository.dto.ArticuloDTO"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.DepositoDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="article">
<% ArticuloDTO art = DepositoDelegate.getInstance().findArticuloById(Long.parseLong(request.getParameter("id"))); %>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Catálogo</a></li>
			<li class="breadcrumb-item"><a
				href="<%=request.getContextPath()%>/catalogo/articulos.jsp">Listado de artículos</a></li>
			<li class="breadcrumb-item active" aria-current="page">Ver Artículo #<span class="oc-id"><%=art.getId()%></span>
			</li>
		</ol>
	</nav>
	<h2 class="title text-muted">Artículo #<span class="oc-id"><%=art.getId()%></span></h2>
	<ul class="list-group">
		<li class="list-group-item"><strong>Nombre: </strong><%=art.getNombre()%></li>
		<li class="list-group-item"><strong>Código de barras: </strong><%=art.getCodigoBarras()%></li>
		<li class="list-group-item"><strong>Presentación: </strong><%=art.getPresentacion()%></li>
		<li class="list-group-item"><strong>Tamaño: </strong><%=art.getTamano()%></li>
		<li class="list-group-item"><strong>Precio: </strong>$<%=art.getPrecio()%></li>
		<li class="list-group-item"><strong>Unidad: </strong><%=art.getUnidad()%></li>
	</ul>
	<hr />
	<div class="d-flex justify-content-end">
		<div class="p-2">
			<a class="btn btn-primary float-right" href="<%=request.getContextPath()%>/catalogo/articulos.jsp">Volver al catálogo</a>
		</div>
		<div class="p-2">
			<a class="btn btn-success float-right" href="#">Comprar</a>
		</div>
	</div>
	
	
</section>
</main>
<jsp:include page="../includes/footer.jsp" />