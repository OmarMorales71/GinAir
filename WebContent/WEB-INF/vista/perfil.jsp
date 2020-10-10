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
	href="${pageContext.request.contextPath}/recursos/css/userRegisterStyle.css"
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
				<li><a href="/Aerolinea/reserva/buscarReserva">Reserva</a></li>
				<li class="active"><a href='/Aerolinea/sesion/sesionIniciada'>Sesion</a>
				
				<ul class="submenu-destinos">
						<li><a href="/Aerolinea/sesion/perfil">Perfil</a></li>
						<li><a href="/Aerolinea/sesion/cerrarSesion">Cerrar Sesion</a></li>
					</ul></li>
			</ul>
		</nav>


	</header>


	<div class="clear"></div>



	<div class="usuario-formulario-contenedor">

		<h1>Perfil de Usuario</h1>
		
		<form:form id="usuario-formulario" class="usuario-formulario"
			name="usuarioFormulario" method="POST" modelAttribute="thisUser"
			action="updateUser" onsubmit="return confirm('Estas seguro sobre actualizar tus datos?')">
		<input type=hidden name="confirmarUsername" value=${thisUser.username }>
			<table>
				<tbody>
					<tr>
						<td>Username</td>
						<td><form:input path="username" />
							<div class="messageError">
								<form:errors path="username" style="color:red"></form:errors>
							</div></td>
						<td>Email</td>
						<td><form:input type="email" path="cliente.email" required="true"/>
							<div class="messageError">
								<form:errors path="cliente.email" style="color:red"></form:errors>
							</div></td>
					</tr>
					
					<tr>
						<td>Nombre</td>
						<td><form:input type="text" path="cliente.nombre_cliente" required="true"/>
							<div class="messageError">
								<form:errors path="cliente.nombre_cliente" style="color:red"></form:errors>
							</div></td>
						<td>Apellido</td>
						<td><form:input type="text" path="cliente.apellido_cliente" required="true"/>
							<div class="messageError">
								<form:errors path="cliente.apellido_cliente" style="color:red"></form:errors>
							</div></td>
					</tr>
					<form:input type="hidden" path="password" required="true"/>
					<form:input type="hidden" path="cliente.id_cliente" required="true"/>
					<tr>
						<td>Pasaporte</td>
						<td><form:input type="text" path="cliente.pasaporte" required="true"/>
							<div class="messageError">
								<form:errors path="cliente.pasaporte" style="color:red"></form:errors>
							</div></td>
						<td>Telefono</td>
						<td><form:input type="text" path="cliente.telefono" required="true"/>
							<div class="messageError">
								<form:errors path="cliente.telefono" style="color:red"></form:errors>
							</div></td>
					</tr>
					<tr>
						<td>Fecha de Nacimiento</td>
						<td><form:input type="date" value="1997-10-20"
								path="cliente.fecha_nacimiento" required="true" />
							<div class="messageError">
								<form:errors path="cliente.fecha_nacimiento" style="color:red"></form:errors>
							</div></td>
						<td colspan="2"><input type="submit" id="submit"
							class="submit" name="submit" value="Guardar"></td>

					</tr>
				</tbody>
			</table>


		</form:form>
	
<div class="password-container" id="passwordContainer"></div>

<button class= "restore-password" id="restorePassword" name="restorePassword">Restaurar Contraseña</button>
	</div>

<c:choose>
         
         <c:when test = "${aviso == 1}">
            <script >
            alert('Su perfil ha sido actualizado exitosamente.')
            </script>
         </c:when>
         
         <c:when test = "${aviso == 2}">
            <script >
            alert('Su contraseña ha sido restaurada exitosamente.')
            </script>
         </c:when>
         
      </c:choose>
			<input type="hidden" value=${pageContext.request.contextPath} id="raiz">
			<script src="${pageContext.request.contextPath}/recursos/js/restaurarContrasenaForm.js"></script>
			<script src="${pageContext.request.contextPath}/recursos/js/validarContrasena.js"></script>

</body>
</html>

<%} %>