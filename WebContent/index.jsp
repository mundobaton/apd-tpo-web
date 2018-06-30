
<jsp:include page="includes/header.jsp" />
<div class="jumbotron">
	<div class="container-fluid">
		<div class="container">
			<h1 class="display-4">¡Bienvenidos!</h1>
			<p class="lead">
				En Das Verrúckte Lagerhaus usted podrá encontrar todos los
				artí­culos que necesita para satisfacer las necesidades de su
				empresa.<br /> <a href="<%=request.getContextPath()%>/login.jsp">Inicie
					sesión</a> con su usuario, realice su pedido y pronto lo estará
				recibiendo en el domicilio de su elección.<br /> ¡Agradecemos que
				nos haya elegido y esperamos que disfrute su compra!
			</p>
			<hr class="my-4">
			<p>
				Si usted aún no cuenta con un usuario, comuníquese telefónicamente
				con nuestro área de Administración para solicitar la generación del
				mismo o escrí­banos a <a
					href="mailto:administracion@dasverrucktelagerhaus.com">administracion@dasverrucktelagerhaus.com</a>.
			</p>
		</div>
	</div>
</div>

<main role="main" class="container">

<section id="articles">
	<h2 class="title">Novedades</h2>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-lg-3">
			<h3 class="article-title">Articulo 1</h3>
			<p class="description">Descripcion del articulo completa</p>
			<p class="price-tag">$99.00</p>
			<p>
				<a class="btn btn-secondary"
					href="<%=request.getContextPath()%>/catalogo/articulo.jsp?id=[aid]"
					role="button">Ver más »</a>
			</p>
		</div>
		<div class="col-xs-12 col-sm-6 col-lg-3">
			<h3 class="article-title">Articulo 2</h3>
			<p class="description">Descripcion del articulo completa</p>
			<p class="price-tag">$99.00</p>
			<p>
				<a class="btn btn-secondary"
					href="<%=request.getContextPath()%>/catalogo/articulo.jsp?id=[aid]"
					role="button">Ver más »</a>
			</p>
		</div>
		<div class="col-xs-12 col-sm-6 col-lg-3">
			<h3 class="article-title">Articulo 3</h3>
			<p class="description">Descripcion del articulo completa</p>
			<p class="price-tag">$99.00</p>
			<p>
				<a class="btn btn-secondary"
					href="<%=request.getContextPath()%>/catalogo/articulo.jsp?id=[aid]"
					role="button">Ver más »</a>
			</p>
		</div>
		<div class="col-xs-12 col-sm-6 col-lg-3">
			<h3 class="article-title">Articulo 4</h3>
			<p class="description">Descripcion del articulo completa</p>
			<p class="price-tag">$99.00</p>
			<p>
				<a class="btn btn-secondary"
					href="<%=request.getContextPath()%>/catalogo/articulo.jsp?id=[aid]"
					role="button">Ver más »</a>
			</p>
		</div>
	</div>
	<hr>
	<div class="d-flex flex-row-reverse">
		<a class="btn btn-primary"
			href="<%=request.getContextPath()%>/catalogo/articulos.jsp"
			role="button">Ver todos »</a>
	</div>
</section>
<section id="clientes">
	<h2 class="title">Nuestros clientes</h2>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-lg-3">
			<img src="<%=request.getContextPath()%>/img/sponsor-1_300.png"
				class="img-thumbnail">
		</div>
		<div class="col-xs-12 col-sm-6 col-lg-3">
			<img src="<%=request.getContextPath()%>/img/sponsor-2_300.png"
				class="img-thumbnail">
		</div>
		<div class="col-xs-12 col-sm-6 col-lg-3">
			<img src="<%=request.getContextPath()%>/img/sponsor-3_300.png"
				class="img-thumbnail">
		</div>
		<div class="col-xs-12 col-sm-6 col-lg-3">
			<img src="<%=request.getContextPath()%>/img/sponsor-4_300.png"
				class="img-thumbnail">
		</div>
	</div>
</section>

</main>
<jsp:include page="includes/footer.jsp" />
