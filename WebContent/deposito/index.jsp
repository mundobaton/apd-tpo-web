<%@page import="edu.uade.apd.tpo.repository.dto.ReposicionDTO"%>
<%@page import="java.util.List"%>
<%@page import="edu.uade.apd.tpo.repository.delegate.DepositoDelegate"%>
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="deposito">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Dep�sito</a></li>
			<li class="breadcrumb-item active" aria-current="page">Almac�n</li>
		</ol>
	</nav>
	<div class="d-flex">
		<div class="mr-auto p-2">
			<h2 class="title text-muted">Almac�n Reposici�n</h2>
		</div>
		<div class="p-2">
			<a class="btn btn-info float-right" href="#">Retirar art�culo</a>
		</div>
		<div class="p-2">
			<a class="btn btn-success float-right" href="<%=request.getContextPath()%>/deposito/almacenar.jsp">Almacenar art�culo</a>
		</div>
	</div>
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
				<tr class="d-flex">
					<th scope="col" class="col-2">C�digo</th>
					<th scope="col" class="col-6">Art�culo</th>
					<th scope="col" class="col-2 text-center">Cantidad</th>
					<th scope="col" class="col-2 text-center">Estado</th>
				</tr>
			</thead>
			<tbody>
			<% 
			List<ReposicionDTO> items = DepositoDelegate.getInstance().obtenerItemsReposicion(); 
			if(items != null){
				for(ReposicionDTO item : items){
			%>
				<tr class="d-flex almacen-item">
					<td class="col-2 item-id"><%=item.getId()%></td>
					<td class="col-6 item-article"><%=item.getItemPedido().getArticulo().getNombre()%></td>
					<td class="col-2 item-quantity text-center"><%=item.getCantidad()%></td>
					<td class="col-2 item-status text-center">
					<%if(item.getEstado() == 'P') {%>
					<span class="badge badge-pill badge-warning">Pendiente</span>
					<%} else if(item.getEstado() == 'C') {%>
					<span class="badge badge-pill badge-success">Completo</span>
					<%}  %>
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
</main>
<jsp:include page="../includes/footer.jsp" />
