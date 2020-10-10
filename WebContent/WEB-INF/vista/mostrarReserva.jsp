<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
	href="${pageContext.request.contextPath}/recursos/css/mostrarReservaStyle.css"
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

				<li class="active"><a href="/Aerolinea">Vuelos</a></li>
				<li><a href="#">Destinos</a>
					<ul class="submenu-destinos">
						<li><a href="/Aerolinea/destinos/cancun">Cancun</a></li>
						<li><a href="/Aerolinea/destinos/londres">Londres</a></li>
						<li><a href="/Aerolinea/destinos/paris">Paris</a></li>
						<li><a href="/Aerolinea/destinos/roma">Roma</a></li>
					</ul></li>
				<li><a href="/Aerolinea/reserva/buscarReserva">Reserva</a></li>
				<%
					if (session.getAttribute("us") == null) {
						out.print("<li><a href='/Aerolinea/sesion/iniciarSesion'>Iniciar Sesion</a></li>");
					} else {
						out.print(
								"<li><a href='/Aerolinea/sesion/sesionIniciada'>Sesion</a><ul class='submenu-destinos'><li><a href='/Aerolinea/sesion/perfil'>Perfil</a></li><li><a href='/Aerolinea/sesion/cerrarSesion'>Cerrar Sesion</a></li></ul></li>}");
					}
				%>
			</ul>
		</nav>


	</header>


	<div class="clear"></div>

	<div class="reserva-confirmada-contenedor">


		<button class="regresarInicio" id="regresarInicio">Seguir
			viendo vuelos</button>

		<h1>Reserva</h1>

		<div class="datos-reserva">
			<h2>
				Hola <b>${reservas[0].cliente.nombre_cliente}
					${reservas[0].cliente.apellido_cliente}</b>, gracias por reservar con
				GinAir.
			</h2>
			<h3>
				Codigo de Reserva: <span style="font-size: 2rem;">${reservas[0].codigo_reservacion}</span>
			</h3>
		</div>
		<div class="vuelos-seleccionados">

			<c:choose>
				<c:when test="${numReservas>1}">

					<h4>Vuelos reservados</h4>
					<br />
				</c:when>
				<c:otherwise>
					<h4>Vuelo reservado</h4>
					<br />
				</c:otherwise>
			</c:choose>

			<table>
				<thead>
					<tr>

						<th>Desde</th>
						<th>Hora Despegue</th>
						<th>Hacia</th>
						<th>Hora Aterrizaje</th>
						<th>Equipaje</th>
						<th>Precio pagados</th>
					</tr>

				</thead>

				<tbody>
					<c:forEach items="${reservas}" var="reserva">

						<tr>

							<td>${reserva.vuelo.aeropuerto_origen.ciudad},
								${reserva.vuelo.aeropuerto_origen.pais}.
								(${reserva.vuelo.aeropuerto_origen.siglas_aeropuerto})</td>
							<td>${reserva.vuelo.fecha_despegue }</td>
							<td>${reserva.vuelo.aeropuerto_destino.ciudad },
								${reserva.vuelo.aeropuerto_destino.pais}.
								(${reserva.vuelo.aeropuerto_destino.siglas_aeropuerto})</td>
							<td>${reserva.vuelo.fecha_aterrizaje }</td>
							<td>${reserva.numero_maletas }</td>
							<td>&euro;${reserva.precio_pagado_euros }</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>










	<script
		src="${pageContext.request.contextPath}/recursos/js/regresarInicioButton.js"></script>


</body>
</html>