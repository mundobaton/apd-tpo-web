<jsp:include page="../includes/header.jsp" />

<main role="main" class="container">

<section id="congrats">
	<h2 class="title">¡Felicidades!</h2>
	<div class="row">
		<div class="col">
		<p>Su pedido ha sido generado con el número #<span class="pedido-id"><%=request.getParameter("pedidoId")%></span>, y ha quedado pendiente de aprobación por parte del área de Administración.</p>
		<p>Ante cualquier consulta, escríbanos a <a href="mailto:administracion@dasverrucktelagerhaus.com">administracion@dasverrucktelagerhaus.com</a>.</p>
		<p>¡Muchas gracias por confiar en nosotros!</p>
		</div>
	</div>
</section>

</main>
<jsp:include page="../includes/footer.jsp" />
