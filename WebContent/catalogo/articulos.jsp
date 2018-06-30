<%@page import="edu.uade.apd.tpo.repository.dto.ArticuloDTO"%>
<%@page import="java.util.List"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.DepositoDelegate"%>
<jsp:include page="../includes/header.jsp" />

<main role="main" class="container">

<section id="articles-section">
	<h2 class="title">Catálogo de Artículos</h2>
	<div class="row">

		<%
			List<ArticuloDTO> articulos = DepositoDelegate.getInstance().getArticulos();
			for (ArticuloDTO art : articulos) {
		%>
		<div class="col-xs-12 col-sm-6 col-lg-3 article py-4">
			<h3 class="article-title"><%=art.getNombre()%></h3>
			<p class="description">
				<small>Código de barras: <%=art.getCodigoBarras()%><br/>
				Presentación: <%=art.getPresentacion()%><br/>
				Tamaño: <%=art.getTamano()%><br/>
				Unidad: <%=art.getUnidad()%></small>
			</p>
			<p class="price-tag">$<%=art.getPrecio()%></p>
			<p>
				<a class="btn btn-primary" href="<%=request.getContextPath()%>/catalogo/articulo.jsp?id=<%=art.getId()%>"><i class="fas fa-eye"></i></a>
				<a class="btn btn-success" href="#" data-aid="1" data-toggle="modal" data-target="#addToCart" role="button">Comprar</a>
			</p>
		</div>
		<%
			}
		%>

	</div>
</section>

</main>

<!-- Modal -->
<div class="modal fade" id="addToCart" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
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
					<form method="get" action="addtocart.jsp"
						enctype="multipart/form-data">
						<div class="row">
							<div class="col-xs-12">
								<h3>{nombre}</h3>
								<p>{descripcion}</p>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-xs-12 col-sm-2 pl-0" for="cantidad">Cantidad</label>
							<div class="col-xs-12 col-sm-10">
								<input class="form-control" type="number" name="cantidad"
									min="1" step="1" value="1" /> <input id="aid" type="hidden"
									name="aid" value="" />
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
				<button type="button" class="btn btn-primary">Agregar</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../includes/footer.jsp" />
