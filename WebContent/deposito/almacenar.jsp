<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<section id="deposito">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Dep�sito</a></li>
			<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/deposito/index.jsp">Almac�n</a></li>
			<li class="breadcrumb-item active" aria-current="page">Almacenar art��culo</li>
		</ol>
	</nav>
	<h2 class="title text-muted">Almacenar art��culo</h2>
	<form method="post" action="almacenar.jsp"
		enctype="multipart/form-data">
		<div class="form-row">
			<div class="form-group col-md-9">
				<label for="articulo">Art��culo</label> <select name="articulo"
					class="form-control">
					<option>Seleccione...</option>
					<option value="00">Articulo 1 (id: 00)</option>
					<option value="01">Articulo 2 (id: 01)</option>
				</select>
			</div>
			<div class="form-group col-md-3">
				<label for="cantidad">Cantidad</label> <input class="form-control"
					type="number" step="1" min="1" name="cantidad" />
			</div>
		</div>
		<hr />
		<div class="d-flex justify-content-end">
			<a class="btn btn-secondary mr-3" href="<%=request.getContextPath()%>/deposito/index.jsp">Volver
				al almac�n</a> <a class="btn btn-primary" href="#">Almacenar art��culo</a>
		</div>
	</form>
</section>
</main>
<jsp:include page="../includes/footer.jsp" />
