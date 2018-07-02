<%@page import="edu.uade.apd.tpo.repository.dto.UbicacionDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.ItemLoteDTO"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.DepositoDelegate"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.AdministracionDelegate"%>
<%@page import="edu.uade.apd.tpo.repository.dto.ArticuloDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.uade.apd.tpo.repository.dto.EstadoPedidoDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.PedidoDTO"%>
<%@page import="java.util.List"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.DespachoDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="almacen">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Deposito</a></li>
			<li class="breadcrumb-item active" aria-current="page">Almacén</li>
		</ol>
	</nav>
	<h2 class="title text-muted">Almacén</h2>
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
				<tr class="d-flex">
					<th scope="col" class="col-1">#</th>
					<th scope="col" class="col-5">Artículo</th>
					<th scope="col" class="col-1 text-center">Stock</th>
					<th scope="col" class="col-1 text-center">Compra</th>
					<th scope="col" class="col-4 text-center">Posiciones</th>
				</tr>
			</thead>
			<tbody>
			<% 
			List<ArticuloDTO> articulos = DepositoDelegate.getInstance().getArticulos();
			if(articulos != null){
				int order = 0;
				for(ArticuloDTO art : articulos){
					order++;
			%>
				<tr class="d-flex cart-item">
					<td class="col-1"><%=order%></td>
					<td class="col-5"><a href="#" class="article-ajax" data-aid="<%=art.getId()%>"><%=art.getNombre()%></a></td>
					<td class="col-1 text-center"><%=art.getStock()%></td>
					<td class="col-1 text-center"><%=art.getCantCompra()%></td>
					<td class="col-4 text-center">
					<% 
					if(art.getItems() != null){
						for(ItemLoteDTO lote : art.getItems()) {
							%>
							<span class="badge badge-pill badge-primary">L#<%=lote.getCodigo()%></span> 
							<%
							if(lote.getUbicaciones() != null){
								for(UbicacionDTO ubicacion : lote.getUbicaciones()){
									%>
									<span class="badge badge-pill badge-info"><%=ubicacion.getCodigo()%></span>
									<%
								}
							}
							%>
							<br/>
							<%
						}
					}
					%>
					</td>
				</tr>
				<%}} %>
			</tbody>
		</table>
	</div>
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
					<li class="list-group-item"><strong>Stock: </strong><span class="article-stock"></span></li>
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
