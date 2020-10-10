<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>GinAir - Buscador de Vuelos</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link
	href="${pageContext.request.contextPath}/recursos/css/tableDesign.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/recursos/css/style.css"
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

	<form class="formulario-buscador-vuelos" accept-charset="utf-8"
		method="get" action="informacioncliente">
		<c:choose>
			<c:when test="${numVuelosIda>-1}">

				<div class="buscador-vuelos">


					<h3>Vuelo de ida</h3>

					<h4>De ${vueloCliente.ciudadOrigen} a
						${vueloCliente.ciudadDestino}, ${vueloCliente.fechaIda}</h4>

				</div>
				<div class="clear"></div>
				<c:choose>
					<c:when test="${numVuelosIda!=0}">
						<table>
							<thead>
								<tr>
									<th></th>
									<th>Desde</th>
									<th>Hora Despegue</th>
									<th>Hacia</th>
									<th>Hora Aterrizaje</th>
									<th>Precio</th>
								</tr>

							</thead>
							<tbody id="ContenedorVuelosIda">
								<c:forEach items="${vuelosIda}" var="vuelo">
									<tr>

										<td><input type="radio" id="vuelosIda"
											class="vuelos-ida-radio" style="display: none"
											name="vueloElegidoIda" value="${vuelo.id_vuelo}" required></td>
										<td>${vuelo.aeropuerto_origen.nombre_aeropuerto}</td>
										<td>${vuelo.fecha_despegue}</td>
										<td>${vuelo.aeropuerto_destino.nombre_aeropuerto}</td>
										<td>${vuelo.fecha_aterrizaje}</td>
										<td>${vuelo.precio_euros}</td>

									</tr>

								</c:forEach>
							</tbody>
						</table>

						<br />
					</c:when>
					<c:otherwise>
						<h5>Ruta no disponible para fecha seleccionada</h5>
					</c:otherwise>
				</c:choose>
				<br />
			</c:when>
			<c:otherwise>
				<input type="text" style="display: none" name="vueloElegidoIda"
					value="0">
				<br />
			</c:otherwise>
		</c:choose>


		<!-- 		Tabla de Vuelos de Regreso -->




		<c:choose>
			<c:when test="${numVuelosRegreso>-1}">

				<div class="buscador-vuelos">


					<h3>Vuelo de regreso</h3>

					<h4>De ${vueloCliente.ciudadDestino} a
						${vueloCliente.ciudadOrigen}, ${vueloCliente.fechaRegreso}</h4>

				</div>
				<div class="clear"></div>

				<c:choose>
					<c:when test="${numVuelosRegreso!=0}">
						<table>
							<thead>
								<tr>
									<th></th>
									<th>Desde</th>
									<th>Hora Despegue</th>
									<th>Hacia</th>
									<th>Hora Aterrizaje</th>
									<th>Precio</th>
								</tr>

							</thead>
							<tbody id="ContenedorVuelosRegreso">
								<c:forEach items="${vuelosRegreso}" var="vuelo">
									<tr>

										<td><input type="radio" id="vuelosRegreso"
											class="vuelos-regreso-radio" style="display: none"
											name="vueloElegidoRegreso" value="${vuelo.id_vuelo}" required></td>
										<td>${vuelo.aeropuerto_origen.nombre_aeropuerto}</td>
										<td>${vuelo.fecha_despegue}</td>
										<td>${vuelo.aeropuerto_destino.nombre_aeropuerto}</td>
										<td>${vuelo.fecha_aterrizaje}</td>
										<td>${vuelo.precio_euros}</td>

									</tr>

								</c:forEach>
							</tbody>
						</table>
						<br />
					</c:when>
					<c:otherwise>
						<h5>Ruta no disponible para fecha seleccionada</h5>
					</c:otherwise>
				</c:choose>
				<br />
			</c:when>
			<c:otherwise>
				<input type="text" style="display: none" name="vueloElegidoRegreso"
					value="0">
				<br />
			</c:otherwise>
		</c:choose>





		<c:choose>
			<c:when test="${numVuelosIda==0 || numVuelosRegreso==0}">
				<div id="regresar_vuelos" class="regresar" name="regresar_vuelos">Regresar</div>

				<br />
			</c:when>
			<c:otherwise>
				<input type="submit" id="submit_vuelos" class="submit"
					name="submit_vuelos" value="Siguiente">
				<br />
			</c:otherwise>
		</c:choose>

	</form>

	<script
		src="${pageContext.request.contextPath}/recursos/js/activarRadioVuelo.js"></script>

</body>
</html>
