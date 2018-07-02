<%@page import="edu.uade.apd.tpo.repository.dto.ReposicionDTO"%>
<%@page import="java.util.List"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.DepositoDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="deposito">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Depósito</a></li>
			<li class="breadcrumb-item active" aria-current="page">Almacén</li>
		</ol>
	</nav>
	<h2 class="title text-muted">Almacén Reposición</h2>
	<!--div class="d-flex">
		<div class="mr-auto p-2">
			
		</div>

		<div class="p-2">
			<a class="btn btn-info float-right" href="#">Retirar artículo</a>
		</div>
		<div class="p-2">
			<a class="btn btn-success float-right" href="<%=request.getContextPath()%>/deposito/almacenar.jsp">Almacenar artí­culo</a>
		</div>
		
	</div-->
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
				<tr class="d-flex">
					<th scope="col" class="col-2">Código</th>
					<th scope="col" class="col-6">Artí­culo</th>
					<th scope="col" class="col-1 text-center">Cantidad</th>
					<th scope="col" class="col-2 text-center">Estado</th>
					<th scope="col" class="col-1 text-center">Acción</th>
				</tr>
			</thead>
			<tbody>
			<% 
			List<ReposicionDTO> items = DepositoDelegate.getInstance().obtenerItemsReposicion(); 
			if(items != null){
				for(ReposicionDTO item : items){
			%>
				<tr class="d-flex almacen-item" id="repoId-<%=item.getId()%>">
					<td class="col-2 item-id"><%=item.getId()%></td>
					<td class="col-6 item-article"><%=item.getOrdenCompra().getItem().getArticulo().getNombre()%></td>
					<td class="col-1 item-quantity text-center"><%=item.getCantidad()%></td>
					<td class="col-2 item-status text-center">
					<%if(item.getEstado() == 'P') {%>
					<span class="badge badge-pill badge-warning">Pendiente</span>
					<%} else if(item.getEstado() == 'C') {%>
					<span class="badge badge-pill badge-success">Completo</span>
					<%}  %>
					</td>
					<td class="item-action col-1 text-center">
					<%if(item.getEstado() == 'P'){ %>
					<a class="item-open text-secondary" data-id="<%=item.getId()%>"
						href="#"><i class="far fa-check-square fa-lg"></i></a>
						<%}else{ %>
						<span class="text-success"><i class="fas fa-check-square fa-lg"></i></span>
						<%} %>
						</td>
				</tr>
			<%
				}
			} 
			%>
			</tbody>
		</table>
	</div>
</section>
<!-- Modal -->
<div class="modal fade" id="showItemReposicion" tabindex="-1" role="dialog"
	aria-labelledby="showItemReposicionTitle" aria-hidden="true">
	<form id="reponerItemForm" method="post" action="?" class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="showItemReposicionTitle">Reponer <span class="article-title"></span></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Cerrar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<div class="form-group">
			<label for="cantidad">Seleccione la cantidad de <span class="article-title text-muted"></span> a reponer:</label>
			<input class="form-control" name="cant" type="number" step="1" min="1" value="1"/>
			<input type="hidden" name="repoId" value=""/>
			</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
				<input type="submit" class="btn btn-primary" value="Guardar"/>
			</div>
		</div>
	</form>
</div>
</main>
<jsp:include page="../includes/footer.jsp" />
