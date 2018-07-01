<%@page import="edu.uade.apd.tpo.repository.dto.ArticuloDTO"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.DepositoDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="article">
	<%
		ArticuloDTO art = DepositoDelegate.getInstance()
				.findArticuloById(Long.parseLong(request.getParameter("id")));
	%>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Catálogo</a></li>
			<li class="breadcrumb-item"><a
				href="<%=request.getContextPath()%>/catalogo/articulos.jsp">Listado
					de artículos</a></li>
			<li class="breadcrumb-item active" aria-current="page">Ver
				Artículo #<span class="oc-id"><%=art.getId()%></span>
			</li>
		</ol>
	</nav>
	<h2 class="title text-muted">
		Artículo #<span class="oc-id"><%=art.getId()%></span>
	</h2>
	<div class="article">

		<ul class="list-group">
			<li class="list-group-item"><strong>Nombre: </strong><span
				class="article-title"><%=art.getNombre()%></span></li>
			<li class="list-group-item"><strong>Código de barras: </strong><%=art.getCodigoBarras()%></li>
			<li class="list-group-item"><strong>Presentación: </strong><%=art.getPresentacion()%></li>
			<li class="list-group-item"><strong>Tamaño: </strong><%=art.getTamano()%></li>
			<li class="list-group-item"><strong>Precio: </strong><span
				class="price-tag">$<span><%=art.getPrecio()%></span></span></li>
			<li class="list-group-item"><strong>Unidad: </strong><%=art.getUnidad()%></li>
		</ul>
		<hr />
		<div class="d-flex justify-content-end">
			<div class="p-2">
				<a class="btn btn-primary float-right"
					href="<%=request.getContextPath()%>/catalogo/articulos.jsp">Ir
					al catálogo</a>
			</div>
			<div class="p-2">
				<a class="btn btn-success float-right" href="#"
					data-aid="<%=art.getId()%>" data-toggle="modal"
					data-target="#addToCart" role="button">Comprar</a>
			</div>
		</div>
	</div>
</section>
</main>

<!-- Modal -->
<div class="modal fade" id="addToCart" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<form class="modal-dialog modal-dialog-centered" role="document"
		id="addItemToCart" method="get" action="?"
		enctype="multipart/form-data">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Agregar al
					carrito</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Cerrar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<p>
								¿Qué cantidad de <span class="article-title"></span> desea
								agregar al carrito?
							</p>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-xs-12 col-sm-2 pl-0" for="cantidad">Cantidad</label>
						<div class="col-xs-12 col-sm-10">
							<input id="cantidad" class="form-control" type="number"
								name="cantidad" min="1" step="1" value="1" /> <input id="aid"
								type="hidden" name="aid" value="" /> <input id="precio"
								type="hidden" name="precio" value="" />
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
				 <% if(request.getSession().getAttribute("cliente") != null) { %>
						<input type="submit" class="btn btn-primary" id="addItemToCartBtn" value="Agregar" />
						<%} else { %>
						<a href="<%= request.getContextPath() %>/admin/login.jsp" class="btn btn-info">Inicie sesión para comprar</a>
						<% } %>
			</div>
		</div>
	</form>
</div>
<jsp:include page="../includes/footer.jsp" />