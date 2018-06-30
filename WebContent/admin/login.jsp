
<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<div class="row">
	<div
		class="col-xs-12 col-sm-12 col-md-6 offset-md-3 col-lg-4 offset-lg-4 col-xl-4 offset-xl-4 align-self-center">
		<form class="form-signin text-center">
			<a href="<%=request.getContextPath()%>/index.jsp"> <img class="" src="<%=request.getContextPath()%>/img/logo_circle_100.png"
				alt="Logo Das Verrückte Lagerhaus" width="100" height="100">
			</a>
			<h1 class="h3 my-4 font-weight-normal">Inicie sesión</h1>
			<div class="form-group">
				<label for="inputEmail" class="sr-only">Email</label> <input
					type="email" id="inputEmail" class="form-control"
					placeholder="Correo electrónico" required autofocus>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="sr-only">Password</label> <input
					type="password" id="inputPassword" class="form-control"
					placeholder="Contraseña" required>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
		</form>
		<div class="text-right">
			<hr>
			<a class="link" href="<%=request.getContextPath()%>/admin/admlogin.jsp">Acceso empleados</a>
		</div>
	</div>
</div>
</main>
<jsp:include page="../includes/footer.jsp" />