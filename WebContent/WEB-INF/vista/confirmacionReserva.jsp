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
	href="${pageContext.request.contextPath}/recursos/css/registroCliente.css"
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

	<div class="confirmacion-contenedor">
		<form:form id="formularioCliente" class="formulario-cliente"
			action="mostrarReserva" modelAttribute="elCliente"
			onsubmit="return confirm('¿Estas seguro?')">
			<div class="vuelos-seleccionados">
				<h4>Vuelos Seleccionados</h4>
				<table class="tabla-vuelos-seleccionados-equipaje">
					<thead>
						<tr>
							<th></th>
							<th>Desde</th>
							<th>Hacia</th>
							<th>Despegue</th>
							<th>Precio</th>
							<th>Equipaje</th>
						</tr>
					</thead>

					<tbody>
						<%!int numVuelos = 0;%>
						<c:forEach items="${vuelosSeleccionados}" var="vuelo">
							<%
								numVuelos++;
							%>
							<tr>
								<td></td>
								<td>${vuelo.aeropuerto_origen.ciudad},
									${vuelo.aeropuerto_origen.pais}.
									(${vuelo.aeropuerto_origen.siglas_aeropuerto})</td>
								<td>${vuelo.aeropuerto_destino.ciudad },
									${vuelo.aeropuerto_destino.pais}.
									(${vuelo.aeropuerto_destino.siglas_aeropuerto})</td>
								<td>${vuelo.fecha_despegue }</td>
								<td>&euro;<span id="precioVuelo<%=numVuelos%>">${vuelo.precio_euros}</span><input
									type="hidden" id="inputPrecioVuelo<%=numVuelos%>"
									name="precioVuelo<%=numVuelos%>" value="${vuelo.precio_euros}"></td>
								<td><select name="equipaje_vuelo<%=numVuelos%>"
									id="equipaje_vuelo<%=numVuelos%>" required>
										<option value="1" selected>1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
								</select></td>
							</tr>

						</c:forEach>
						<%
							numVuelos = 0;
						%>
					</tbody>
				</table>
				<input type="hidden" name="precioTotal" id="precioTotal" value="">
			</div>



			<div class="pasajero-head">
				<h5>Datos del pasajero</h5>
			</div>
			<div class="datos-cliente">
				<p name="a">
				<table class="datos-cliente-confirmar">
					<tr>
						<td>Nombre</td>
						<td><span>${elCliente.nombre_cliente}</span>
							<div class="messageError">
								<form:errors path="nombre_cliente" style="color:red"></form:errors>
							</div></td>

						<td>Apellidos:</td>
						<td><span>${elCliente.apellido_cliente}</span>
							<div class="messageError">
								<form:errors path="apellido_cliente" style="color:red"></form:errors>
							</div></td>

					</tr>
					<tr>
						<td>Pasaporte</td>
						<td><span>${elCliente.pasaporte}</span><br>
							<div class="messageError">
								<form:errors path="pasaporte" style="color:red"></form:errors>
							</div></td>
						<td>Email</td>
						<td><span>${elCliente.email}</span>
							<div class="messageError">
								<form:errors path="email" style="color:red"></form:errors>
							</div></td>
					</tr>
					<tr>
						<td>Telefono</td>
						<td><span>${elCliente.telefono}</span>
							<div class="messageError">
								<form:errors path="telefono" style="color:red"></form:errors>
							</div></td>
						<td>Fecha de Nacimiento</td>
						<td><span>${elCliente.fecha_nacimiento}</span>
							<div class="messageError">
								<form:errors path="fecha_nacimiento" style="color:red"></form:errors>
							</div></td>
					</tr>
					<tr class="hidden">

						<td colspan="4"><input type="submit" id="submit"
							class="submit" name="submit" value="Confirmar y Pagar"></td>
					</tr>
				</table>

			</div>







		</form:form>

	</div>










	<script
		src="${pageContext.request.contextPath}/recursos/js/precioTotal.js"></script>


</body>
</html>

