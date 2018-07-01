$(function() {

	if (typeof (Storage) !== "undefined") {
		$cartLink = $('#cart-link');
		if (!sessionStorage.dvlCart) {
			$cartLink.hide();
		} else {
			$cartLink.show();
		}
	}

	$('[data-toggle="tooltip"]').tooltip();

	$('#addToCart').on(
			'show.bs.modal',
			function(e) {
				var btn = $(e.relatedTarget);
				$(".alert").alert('close');
				$('#addToCart .article-title').text(
						btn.parents(".article").find(".article-title").text());
				$('#addToCart .article-description').html(
						btn.parents(".article").find(".description").html());
				$('#aid').val(btn.data('aid'));
				$('#precio').val(
						btn.parents(".article").find(".price-tag > span")
								.text());
			});

	$('#addToCart').on('hide.bs.modal', function(e) {
		$('#addToCart .article-title').text("{nombre}");
		$('#addToCart .article-description').text("{descripcion}");
		$('#addToCart input[name=cantidad]').val(1);
		$('#aid').val('');
	});

	$('#addItemToCart').on('submit', function(e) {
		e.preventDefault();
		var item = {
			aid : parseInt($('input[name=aid]').val()),
			nombre : $('#addToCart .article-title').text(),
			cant : parseInt($('input[name=cantidad]').val()),
			precio : parseFloat($('input[name=precio]').val())
		}
		addItemToCart(item);
		$('#addToCart').modal('hide');
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
		-$('#cart').find("#aid-" + $this.data('aid')).remove();
		removeItemFromCart(parseInt($this.data('aid')));
		$('#removeFromCart').modal('hide');
	});

	if ($('#cart').length > 0) {
		if (typeof (Storage) !== "undefined") {
			if (sessionStorage.dvlCart) {
				var $cart = JSON.parse(sessionStorage.dvlCart);
				var $table = $('#cart .table tbody');
				var subtotal = 0;

				for (var i = 0; i < $cart.length; i++) {
					if ($cart[i]) {
						var fila = '<tr class="cart-item" id="aid-'
								+ $cart[i].aid + '">';
						fila += '<td class="item-title">' + $cart[i].nombre
								+ '</td>';
						fila += '<td class="item-price text-center">$'
								+ $cart[i].precio.toFixed(2) + '</td>';
						fila += '<td class="item-quantity text-center">'
								+ $cart[i].cant + '</td>';
						// fila += '<td class="item-quantity text-center"><input
						// type="number" step="1" min="1"
						// value="'+$cart[i].cant+'"
						// class="form-control" /></td>';
						fila += '<td class="item-subtotal text-center">$'
								+ ($cart[i].precio * $cart[i].cant).toFixed(2)
								+ '</td>';
						fila += '<td class="text-center"><a class="item-remove" href="#" data-aid="'
								+ $cart[i].aid
								+ '" data-toggle="modal" data-target="#removeFromCart"><i class="fas fa-trash-alt"></i></a></td></tr>';
						subtotal += ($cart[i].precio * $cart[i].cant);
						$table.append(fila);
					}
				}
				$('#cart-subtotal').text(subtotal.toFixed(2));
				$('#cart .btn-success').removeAttr('disabled');
			}
		}
	}

	if ($('#checkout').length > 0) {
		if (typeof (Storage) !== "undefined") {
			if (sessionStorage.dvlCart) {
				var $cart = JSON.parse(sessionStorage.dvlCart);
				var cantItems = 0;
				var subtotal = 0;
				var miniCart = $('#mini-cart');
				for (var i = 0; i < $cart.length; i++) {
					if ($cart[i]) {
						var fila = '<li class="list-group-item d-flex justify-content-between lh-condensed">';
						fila += '<div><h6 class="my-0">' + $cart[i].nombre
								+ '</h6>';
						fila += '<small class="text-muted">Cantidad: <span class="quantity">'
								+ $cart[i].cant + '</span></small>';
						fila += '</div> <span class="text-muted">'
								+ $cart[i].precio.toFixed(2) + '</span>';
						fila += '<input type="hidden" name="articulos" value="'
								+ $cart[i].aid + ',' + $cart[i].cant + '"/>';
						fila += '</li>';
						subtotal += ($cart[i].precio * $cart[i].cant);
						miniCart.append(fila);
						cantItems++;
					}
				}
				if (cantItems != 0) {
					$('#cantTotalItems').text(cantItems);
				}
				if (subtotal != 0) {
					miniCart
							.append($('<li class="list-group-item d-flex justify-content-between"><span>Total (AR$)</span> <strong>$'
									+ subtotal.toFixed(2) + '</strong></li>'));
				}
			}
		}
	}

	if ($('#congrats').length > 0) {
		if (typeof (Storage) !== "undefined") {
			if (sessionStorage.dvlCart) {
				sessionStorage.clear();
				$('#cart-link').hide();
			}
		}
	}

	$('#checkout-form').on('submit', function() {
		$(this).find('input[type=submit]').attr('disabled', 'disabled');
	})

});

function addItemToCart(cartItem) {
	$('#cart-link').show();

	if (typeof (Storage) !== "undefined") {
		if (sessionStorage.dvlCart) {
			var oldCart = JSON.parse(sessionStorage.dvlCart);
			var newItem = true;
			for (var i = 0; i < oldCart.length; i++) {
				if (oldCart[i]) {
					if (oldCart[i].aid == cartItem.aid) {
						newItem = false;
						oldCart[i].cant = parseInt(oldCart[i].cant)
								+ parseInt(cartItem.cant);
					}
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
		showAlert('Su carrito ha sido actualizado! <a href="' + getBaseUrl()
				+ '/admin/cart.jsp">Ver carrito</a>', 'success');
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
			var subtotal = 0;
			var cantItems = 0;
			for (var i = 0; i < oldCart.length; i++) {
				if (oldCart[i]) {
					if (oldCart[i].aid == articleId) {
						delete oldCart[i];
					} else {
						subtotal += (oldCart[i].precio * oldCart[i].cant);
						cantItems++;
					}
				}
			}
			
			$('#cart-subtotal').text(subtotal.toFixed(2));
			
			if (cantItems == 0) {
				sessionStorage.clear();
				showAlert('Su carrito esta vacio! <a href="' + getBaseUrl()
						+ '/catalogo/articulos.jsp">Volver al catalogo</a>', 'danger');
				$('#cart .btn-success').attr('disabled', 'disabled');
			} else {
				sessionStorage.setItem("dvlCart", JSON.stringify(oldCart));
				
				var carrito = JSON.parse(sessionStorage.dvlCart);
				console.log(carrito);
			}
		}

	} else {
		console.log("Sin soporte para session storage");
	}
}

function showAlert(message, type) {
	var alert = '<div class="alert alert-' + type
			+ ' alert-dismissible fade show" role="alert">';
	alert += '<span class="alert-message">' + message + '</span>';
	alert += '<button type="button" class="close" data-dismiss="alert" aria-label="Close">';
	alert += '<span aria-hidden="true">&times;</span>';
	alert += '</button></div>';

	$(alert).insertBefore('section > .title');

}

function getBaseUrl() {
	var getUrl = window.location;
	return getUrl.protocol + "//" + getUrl.host + "/"
			+ getUrl.pathname.split('/')[1];
}
