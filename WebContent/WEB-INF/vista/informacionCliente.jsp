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

	<div class="registro-cliente">


		<div class="vuelos-seleccionados">
			<h4>Vuelos Seleccionados</h4>
			<table>
				<thead>
					<tr>
						<th></th>
						<th>Desde</th>
						<th>Hacia</th>
						<th>Despegue</th>
						<th>Precio</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${vuelosSeleccionados}" var="vuelo">
						<tr>
							<td></td>
							<td>${vuelo.aeropuerto_origen.ciudad},
								${vuelo.aeropuerto_origen.pais}.
								(${vuelo.aeropuerto_origen.siglas_aeropuerto})</td>
							<td>${vuelo.aeropuerto_destino.ciudad },
								${vuelo.aeropuerto_destino.pais}.
								(${vuelo.aeropuerto_destino.siglas_aeropuerto})</td>
							<td>${vuelo.fecha_despegue }</td>
							<td>&euro;${vuelo.precio_euros}</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
		<form:form id="formularioCliente" class="formulario-cliente"
			action="confirmacionReserva" modelAttribute="elCliente">

			<div class="pasajero-head">
				<h5>Datos del pasajero</h5>
			</div>
			<div class="datos-cliente">

				<table>
					<tr>
						<td>Nombre</td>
						<td><form:input path="nombre_cliente" />
							<div class="messageError">
								<form:errors path="nombre_cliente" style="color:red"></form:errors>
							</div></td>

						<td>Apellidos:</td>
						<td><form:input path="apellido_cliente" />
							<div class="messageError">
								<form:errors path="apellido_cliente" style="color:red"></form:errors>
							</div></td>

					</tr>
					<tr>
						<td>Pasaporte</td>
						<td><form:input path="pasaporte" /><br>
							<div class="messageError">
								<form:errors path="pasaporte" style="color:red"></form:errors>
							</div></td>
						<td>Email</td>
						<td><form:input path="email" />
							<div class="messageError">
								<form:errors path="email" style="color:red"></form:errors>
							</div></td>
					</tr>
					<tr>
						<td>Telefono</td>
						<td><form:input path="telefono" />
							<div class="messageError">
								<form:errors path="telefono" style="color:red"></form:errors>
							</div></td>
						<td>Fecha de Nacimiento</td>
						<td><form:input type="date" id="fechaNacimiento"
								path="fecha_nacimiento" value="2000-01-01" />
							<div class="messageError">
								<form:errors path="fecha_nacimiento" style="color:red"></form:errors>
							</div></td>
					</tr>
					<tr>
						<td class="hidden"></td>
						<td class="hidden"></td>
						<td class="hidden"></td>
						<td><input type="submit" id="submit" class="submit"
							name="submit" value="Buscar"></td>
					</tr>
				</table>

			</div>




<c:choose>
		<c:when test="${sesionStatus==true}">
		<script>
		let input = document.querySelectorAll("input");
		for(let i=0; i<6;i++){
			input[i].setAttribute('readonly', true);
		}
		
		</script>
		<form:input type='hidden' path="id_cliente" />
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>


		</form:form>




	</div>

	


	<script
		src="${pageContext.request.contextPath}/recursos/js/fechaInput.js"></script>



</body>
</html>

