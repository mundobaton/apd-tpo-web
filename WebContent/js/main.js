$(function() {

	$('[data-toggle="tooltip"]').tooltip();

	$('#addToCart').on(
			'show.bs.modal',
			function(e) {
				var btn = $(e.relatedTarget);
				$('#addToCart h3').text(
						btn.parents(".article").find(".article-title").text());
				$('#addToCart p').text(
						btn.parents(".article").find(".description").text());
				$('#aid').val(btn.data('aid'));
			});
	$('#addToCart').on('hide.bs.modal', function(e) {
		$('#addToCart h3').text("{nombre}");
		$('#addToCart p').text("{descripcion}");
		$('#aid').val('');
	});

	$('#removeFromCart').on(
			'show.bs.modal',
			function(e) {
				var $this = $(e.relatedTarget);
				$('#removeFromCart .article-name').text(
						$this.parents('tr.cart-item').find('.item-title')
								.text());
				$('#removeFromCart #removeConfirm').data('aid',
						$this.data('aid'));
			});

	$('#removeConfirm').on('click', function(e) {
		e.preventDefault();
		var $this = $(e.target);
		// TODO Actualizar el total del carrito cuando se elimina un elemento.-
		$('#cart').find("#aid-" + $this.data('aid')).remove();
		$('#removeFromCart').modal('hide');
	});	

});

function getBaseUrl() {
	var getUrl = window.location;
	return getUrl.protocol + "//" + getUrl.host + "/"
			+ getUrl.pathname.split('/')[1];
}
