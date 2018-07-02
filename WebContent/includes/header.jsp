<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="edu.uade.apd.tpo.repository.dto.RolDTO"%>
<%@page import="edu.uade.apd.tpo.repository.dto.UsuarioDTO"%>
<html class="no-js" lang="es">

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Das Verrückte Lagerhaus</title>
  <meta name="description" content="TPO de la materia Aplicaciones Distribuidas.">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="shortcut icon" href="<%= request.getContextPath() %>/favicon.ico" type="image/x-icon">
  <link rel="icon" href="<%= request.getContextPath() %>/favicon.ico" type="image/x-icon">
  <link rel="manifest" href="<%= request.getContextPath() %>/site.webmanifest">
  <link rel="apple-touch-icon" href="<%= request.getContextPath() %>/icon.png">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/normalize.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/fontawesome/css/all.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">
</head>

<body>
  <!--[if lte IE 9]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
    <![endif]-->
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
      <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp"><img src="<%= request.getContextPath() %>/img/logo_150x46.png" width="150" height="46"/></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu" aria-controls="menu" aria-expanded="false" aria-label="Desplegar menÃÂº">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="menu">
        <ul class="navbar-nav mr-auto">
        <% if(request.getSession().getAttribute("usuario") == null) { %>
          <li class="nav-item active">
            <a class="nav-link" href="<%= request.getContextPath() %>/index.jsp">Inicio</a>
          </li>
          <% if(request.getSession().getAttribute("cliente") != null) { %>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarCliente" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Mi Cuenta
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarCliente">
              <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/perfil.jsp">Mi Perfil</a>
              <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/cuentacorriente.jsp">Cuenta Corriente</a>
            </div>
          </li>
          <%} %>
          <li class="nav-item">
            <a class="nav-link" href="<%= request.getContextPath() %>/catalogo/articulos.jsp">Catálogo</a>
          </li>
        <% } else { %>
        <% if(((UsuarioDTO)request.getSession().getAttribute("usuario")).getRol() == RolDTO.COMPRAS || ((UsuarioDTO)request.getSession().getAttribute("usuario")).getRol() == RolDTO.ADMINISTRACION) { %>
          <!-- menu administradores -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarCompras" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Compras
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarCompras">
              <a class="dropdown-item" href="<%= request.getContextPath() %>/compras/index.jsp">Órdenes de Compra</a>
              <a class="dropdown-item" href="<%= request.getContextPath() %>/compras/procesar.jsp">Procesar Pendientes</a>
            </div>
          </li>
          <% } if(((UsuarioDTO)request.getSession().getAttribute("usuario")).getRol() == RolDTO.ADMINISTRACION) { %>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDeposito" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Depósito
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDeposito">
              <a class="dropdown-item" href="<%= request.getContextPath() %>/deposito/index.jsp">Almacén Reposición</a>
            </div>
          </li>
          <% } if(((UsuarioDTO)request.getSession().getAttribute("usuario")).getRol() == RolDTO.DESPACHO || ((UsuarioDTO)request.getSession().getAttribute("usuario")).getRol() == RolDTO.ADMINISTRACION) { %>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDespacho" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Despacho
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDespacho">
              <a class="dropdown-item" href="<%= request.getContextPath() %>/despacho/index.jsp">Pedidos a Despachar</a>
            </div>
          </li>
          <% } if(((UsuarioDTO)request.getSession().getAttribute("usuario")).getRol() == RolDTO.FACTURACION || ((UsuarioDTO)request.getSession().getAttribute("usuario")).getRol() == RolDTO.ADMINISTRACION) { %>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarFacturacion" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Facturación
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarFacturacion">
              <a class="dropdown-item" href="<%= request.getContextPath() %>/facturacion/index.jsp">Pedidos a Facturar</a>
              <div class="dropdown-divider"></div>               
              <a class="dropdown-item" href="<%= request.getContextPath() %>/facturacion/facturas.jsp">Facturas Emitidas</a>
              <a class="dropdown-item" href="<%= request.getContextPath() %>/facturacion/procesaFactura.jsp">Procesar Pago Factura</a>
              <a class="dropdown-item" href="<%= request.getContextPath() %>/facturacion/procesaImporte.jsp">Procesar Pago Importe</a>
            </div>
          </li>
          <% } %>
          <% } %>
          <!-- /menu administradores-->
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
          <% if(request.getSession().getAttribute("cliente") == null && request.getSession().getAttribute("usuario") == null) { %>
            <a class="nav-link" href="<%= request.getContextPath() %>/admin/login.jsp"><span class="d-md-none">Ingresar</span><i class="fas fa-user-circle fa-2x d-none d-md-block"></i></a>
          <% } else { %>
          <a class="nav-link" href="<%= request.getContextPath() %>/administracion?action=logout"><span class="d-md-none">Cerrar Sesión</span><i class="fas fa-sign-out-alt fa-2x d-none d-md-block""></i></a>
          <% } %>
          </li>
          <% if(request.getSession().getAttribute("cliente") != null) { %>
          <li id="cart-link" class="nav-item" style="display:none;">
            <a class="nav-link" href="<%= request.getContextPath() %>/admin/cart.jsp"><span class="d-md-none">Carrito</span><i class="fas fa-shopping-cart fa-2x d-none d-md-block"></i><span class="badge badge-pill badge-primary" style="display:none;">0</span></a>
          </li>
          <% } %>
        </ul>
      </div>
    </nav>