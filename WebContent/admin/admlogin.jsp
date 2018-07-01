<jsp:include page="../includes/header.jsp" />
<main role="main" class="container">
<div class="row">
	<div
		class="col-xs-12 col-sm-12 col-md-6 offset-md-3 col-lg-4 offset-lg-4 col-xl-4 offset-xl-4 align-self-center">
		<form method="post" action="<%=request.getContextPath()%>/administracion" class="form-signin text-center">
			<a href="<%=request.getContextPath()%>/index.jsp"> <img class="" src="<%=request.getContextPath()%>/img/logo_circle_100.png"
				alt="Logo Das VerrÃ¼ckte Lagerhaus" width="100" height="100">
			</a>
			<h1 class="h3 my-4 font-weight-normal">Acceso empleados</h1>
			<div class="form-group">
				<label for="inputEmail" class="sr-only">Legajo</label> <input
					type="text" id="inputLegajo" class="form-control" name="legajo"
					placeholder="Legajo" required autofocus>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="sr-only">Password</label> <input
					type="password" id="inputPassword" class="form-control" name="password"
					placeholder="Contraseña" required>
			</div>
			<input class="btn btn-lg btn-primary btn-block" type="submit" value="Aceptar">
			<input type="hidden" name="action" value="login-usuario">
		</form>
	</div>
</div>
</main>
<jsp:include page="../includes/footer.jsp" />
