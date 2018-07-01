$(function() {

	$('[data-toggle="tooltip"]').tooltip();

	$('#addToCart').on(
			'show.bs.modal',
			function(e) {
				var btn = $(e.relatedTarget);
				$(".alert").alert('close');
				$('#addToCart h3').text(
						btn.parents(".article").find(".article-title").text());
				$('#addToCart p').html(
						btn.parents(".article").find(".description").html());
				$('#aid').val(btn.data('aid'));
				$('#precio').val(btn.parents(".article").find(".price-tag > span").text());
			});

	$('#addToCart').on('hide.bs.modal', function(e) {
		$('#addToCart h3').text("{nombre}");
		$('#addToCart p').text("{descripcion}");
		$('#addToCart input[name=cantidad]').val(1);
		$('#aid').val('');
	});

	$('#addItemToCart').on('submit', function(e) {
		e.preventDefault();
		var item = {
			aid : parseInt($('input[name=aid]').val()),
			nombre: $('#addToCart h3').text(),
			cant : parseInt($('input[name=cantidad]').val()),
			precio: parseFloat($('input[name=precio]').val())
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
		// TODO Actualizar el total del carrito cuando se elimina un elemento.-
		$('#cart').find("#aid-" + $this.data('aid')).remove();
		$('#removeFromCart').modal('hide');
	});
	
	if($('#cart').length > 0 ){
		if (typeof (Storage) !== "undefined") {
			if (sessionStorage.dvlCart) {
				var $cart = JSON.parse(sessionStorage.dvlCart);
				var $table = $('#cart .table tbody');
				var subtotal = 0;
				for (var i = 0; i < $cart.length; i++) {
					var fila = '<tr class="cart-item" id="aid-'+$cart[i].id+'">';
					fila += '<td class="item-title">'+$cart[i].nombre+'</td>';
					fila += '<td class="item-price text-center">$'+$cart[i].precio.toFixed(2)+'</td>';
					fila += '<td class="item-quantity text-center">'+$cart[i].cant+'</td>';

//					fila += '<td class="item-quantity text-center"><input type="number" step="1" min="1" value="'+$cart[i].cant+'" class="form-control" /></td>';
					fila += '<td class="item-subtotal text-center">$'+($cart[i].precio * $cart[i].cant).toFixed(2)+'</td>';
					fila += '<td class="text-center"><a class="item-remove" href="#" data-aid="1" data-toggle="modal" data-target="#removeFromCart"><i class="fas fa-trash-alt"></i></a></td></tr>';
					subtotal += ($cart[i].precio * $cart[i].cant);
					$table.append(fila);
				}
				$('#cart-subtotal').text(subtotal.toFixed(2));
			}
		}
	}

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
		showAlert('Su carrito ha sido actualizado! <a href="'+getBaseUrl()+'/admin/cart.jsp">Ver carrito</a>');
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

function showAlert(message){
	var alert = '<div class="alert alert-success alert-dismissible fade show" role="alert">';
	alert += '<span class="alert-message">'+message+'</span>';
	alert += '<button type="button" class="close" data-dismiss="alert" aria-label="Close">';
	alert += '<span aria-hidden="true">&times;</span>';
	alert += '</button></div>';
	
	$(alert).insertBefore('section > .title');
	
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
