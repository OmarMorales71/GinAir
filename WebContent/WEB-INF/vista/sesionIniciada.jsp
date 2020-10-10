

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%

if(session.getAttribute("us")==null){
	
	response.sendRedirect("iniciarSesion");
}else{
%>
<!DOCTYPE HTML>
<html>
<head>
<title>GinAir</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="${pageContext.request.contextPath}/recursos/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.request.contextPath}/recursos/css/sesionStyle.css"
	rel="stylesheet" type="text/css" media="all" />

<link href='//fonts.googleapis.com/css?family=Roboto' rel='stylesheet'
	type='text/css'>
<link href='//fonts.googleapis.com/css?family=PT+Sans+Narrow'
	rel='stylesheet' type='text/css'>


</head>
<body>
	<header>
		<nav class="navegacion">
			<div class="logo">
				<a href="/Aerolinea"><img alt="logo"
					src="${pageContext.request.contextPath}/recursos/images/logo.png"></a>
			</div>
			<ul class="main-menu">

				<li><a href="/Aerolinea">Vuelos</a></li>
				<li><a href="#">Destinos</a>
					<ul class="submenu-destinos">
						<li><a href="/Aerolinea/destinos/cancun">Cancun</a></li>
						<li><a href="/Aerolinea/destinos/londres">Londres</a></li>
						<li><a href="/Aerolinea/destinos/paris">Paris</a></li>
						<li><a href="/Aerolinea/destinos/roma">Roma</a></li>
					</ul></li>
				<li ><a href="/Aerolinea/reserva/buscarReserva">Reserva</a></li>
				<li class="active"><a href='/Aerolinea/sesion/sesionIniciada'>Sesion</a>
				
				<ul class="submenu-destinos">
						<li><a href="/Aerolinea/sesion/perfil">Perfil</a></li>
						<li><a href="/Aerolinea/sesion/cerrarSesion">Cerrar Sesion</a></li>
					</ul></li>
			</ul>
		</nav>


	</header>


	<div class="clear"></div>


<div class="sesion-container" id="sesion-container">



		<h1>Sesion de ${us.username }</h1>
		
		<div>
		<h2>Bienvenido <span>${us.cliente.nombre_cliente } ${us.cliente.apellido_cliente }</span>.</h2>
		
		<h3>Pasaporte vinculado: <span>${us.cliente.pasaporte }</span></h3>
		
		<h3>Email vinculado: <span>${us.cliente.email }</span></h3>
		</div>
		
		
		<button class="regresarInicio" id="regresarInicio">Seguir
			viendo vuelos</button>
	</div>
	
		<script
		src="${pageContext.request.contextPath}/recursos/js/regresarInicioButton.js"></script>
	

</body>
</html>
<% }%>