$(function() {

	$('[data-toggle="tooltip"]').tooltip();

	$('#addToCart').on(
			'show.bs.modal',
			function(e) {
				var btn = $(e.relatedTarget);
				$('#addToCart h3').text(
						btn.parents(".article").find(".article-title").text());
				$('#addToCart p').html(
						btn.parents(".article").find(".description").html());
				$('#aid').val(btn.data('aid'));
			});

	$('#addToCart').on('hide.bs.modal', function(e) {
		$('#addToCart h3').text("{nombre}");
		$('#addToCart p').text("{descripcion}");
		$('#aid').val('');
	});

	$('#addItemToCart').on('submit', function(e) {
		e.preventDefault();
		var item = {
			aid : $('input[name=aid]').val(),
			cant : $('input[name=cantidad]').val(),
		}
		addItemToCart(item);
	})

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

function addItemToCart(cartItem) {

	if (typeof (Storage) !== "undefined") {
		if (sessionStorage.dvlCart) {
			var oldCart = JSON.parse(sessionStorage.dvlCart);
			var newItem = true;
			for (var i = 0; i < oldCart.length; i++) {
				if (oldCart[i].aid == cartItem.aid) {
					newItem = false;
					oldCart[i].cant = parseInt(oldCart[i].cant) + parseInt(cartItem.cant);
				}
			}
			if (newItem) {
				oldCart.push(cartItem);
			}
			sessionStorage.setItem("dvlCart", JSON.stringify(oldCart));
		} else {
			var items = [];
			items.push(cartItem);
			sessionStorage.setItem("dvlCart", JSON.stringify(items));
		}

		var carrito = JSON.parse(sessionStorage.dvlCart);
		console.log(carrito);

	} else {
		console.log("Sin soporte para session storage");
	}
}

function updateCartItem(cartItem) {

	if (typeof (Storage) !== "undefined") {
		if (sessionStorage.dvlCart) {
			var oldCart = JSON.parse(sessionStorage.dvlCart);
			for (var i = 0; i < oldCart.length; i++) {
				if (oldCart[i].aid == cartItem.aid) {
					oldCart[i].cant = parseInt(cartItem.cant);
				}
			}
			sessionStorage.setItem("dvlCart", JSON.stringify(oldCart));
		}
		var carrito = JSON.parse(sessionStorage.dvlCart);
		console.log(carrito);

	} else {
		console.log("Sin soporte para session storage");
	}
}

function removeItemFromCart(articleId) {

	if (typeof (Storage) !== "undefined") {
		if (sessionStorage.dvlCart) {
			var oldCart = JSON.parse(sessionStorage.dvlCart);
			for (var i = 0; i < oldCart.length; i++) {
				if (oldCart[i].aid == articleId) {
					oldCart[i].cant = 0;
				}
			}
			sessionStorage.setItem("dvlCart", JSON.stringify(oldCart));
		}

		var carrito = JSON.parse(sessionStorage.dvlCart);
		console.log(carrito);

	} else {
		console.log("Sin soporte para session storage");
	}
}

function getBaseUrl() {
	var getUrl = window.location;
	return getUrl.protocol + "//" + getUrl.host + "/"
			+ getUrl.pathname.split('/')[1];
}
