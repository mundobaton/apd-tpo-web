$(function() {

	if (typeof (Storage) !== "undefined") {
		$cartLink = $('#cart-link');
		if (!sessionStorage.dvlCart) {
			$cartLink.hide();
		} else {
			if (sessionStorage.dvlTotalItems) {
				$cartLink.find('.badge').text(sessionStorage.dvlTotalItems)
						.show();
			}
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
	
	$('#deposito .item-open').on('click', function(e){
		e.preventDefault();
		var $modal = $('#showItemReposicion');
		var $this = $(this);
		var $id = $this.data('id');		
		$modal.find('.article-title').text($this.parents('tr').find('.item-article').text());
		$modal.find('input[name=cant]').val($this.parents('tr').find('.item-quantity').text());
		$modal.find('input[name=repoId]').val($id);
		$modal.modal('show');
	});
	
	$('#reponerItemForm').on('submit', function(e){
		e.preventDefault();
		var $form = $(this).serialize();
		var $repoId = $(this).find('input[name=repoId]').val();
		var $submit = $(this).find('input[type=submit]');
		$submit.attr('disabled', 'disabled');
		$('<i class="fas fa-spinner fa-spin"></i>').insertAfter($submit)

		$.ajax({
			url: getBaseUrl() + "/deposito?action=reponer",
			data: $form,
			dataType: 'text',
			success : function(r, textStatus, xhr){
				showAlert('La reposici&oacute;n se ejecut&oacute; exitosamente!', 'success');
				$('#deposito #repoId-'+$repoId).find('.badge').removeClass('badge-warning').addClass('badge-success').text('Completo');
				$('#deposito #repoId-'+$repoId).find('.item-action a.item-open').remove();
				$('#deposito #repoId-'+$repoId).find('.item-action').append('<span class="text-success"><i class="fas fa-check-square fa-lg"></i></span>');
			},
			error: function (request, status, error) {
				showAlert('Error: '+request.responseText, 'danger');
		    },
		    complete: function(){
		    	$submit.removeAttr('disabled');
		    	$('.fa-spinner').remove();
				$('#showItemReposicion').modal('hide');
		    }
		})
	});
	
	$('#article-ajax').on('click', function(e){
		e.preventDefault();
		var $id = $(this).data('aid');
		$.ajax({
			url: getBaseUrl() + "/articulos?action=view&aid="+ $id,
			dataType: 'json',
			success : function(r){
				//console.log(r);
				var $modal = $('#showArticle');
				$modal.find('#showArticleTitle').text('Articulo #'+r.id);
				$modal.find('.article-title').text(r.nombre);
				$modal.find('.article-codigo').text(r.codigoBarras);
				$modal.find('.article-presentacion').text(r.presentacion);
				$modal.find('.article-tamano').text(r.tamano);
				$modal.find('.price-tag > span').text(r.precio.toFixed(2));
				$modal.find('.article-unidad').text(r.unidad);
				$modal.find('.article-compra').text(r.cantCompra);
				$modal.modal('show');
			},
			error : function(){
				
			}
		});
	})

});

function addItemToCart(cartItem) {
	$('#cart-link').show();
	if (typeof (Storage) !== "undefined") {
		var CART_ITEMS_NR = 0;
		if (sessionStorage.dvlTotalItems) {
			CART_ITEMS_NR = sessionStorage.dvlTotalItems;
		}

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
				CART_ITEMS_NR++;
			}
			sessionStorage.setItem("dvlCart", JSON.stringify(oldCart));
		} else {
			var items = [];
			items.push(cartItem);
			sessionStorage.setItem("dvlCart", JSON.stringify(items));
			CART_ITEMS_NR++;
		}
		$('#cart-link .badge').text(CART_ITEMS_NR).show();
		sessionStorage.setItem("dvlTotalItems", CART_ITEMS_NR);
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
			sessionStorage.setItem("dvlTotalItems", cantItems);
			$('#cart-link .badge').text(sessionStorage.dvlTotalItems);

			if (cantItems == 0) {
				sessionStorage.clear();
				$('#cart-link, #cart-link .badge').hide();
				showAlert('Su carrito est&aacute; vac&iacute;o! <a href="' + getBaseUrl()
						+ '/catalogo/articulos.jsp">Volver al cat&aacute;logo</a>',
						'danger');
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
	var $alert = $('<div class="alert alert-dismissible fade show" role="alert"><span class="alert-message"></span><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
	$alert.addClass('alert-'+type);
	$alert.find('.alert-message').html(message);
	$alert.insertBefore('section > .title');
}

function getBaseUrl() {
	var getUrl = window.location;
	return getUrl.protocol + "//" + getUrl.host + "/"
			+ getUrl.pathname.split('/')[1];
}
