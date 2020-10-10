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
	href="${pageContext.request.contextPath}/recursos/css/formularioStyle.css"
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
				<li class="active"><a href="/Aerolinea/reserva/buscarReserva">Reserva</a></li>
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



	<div class="reserva-formulario-contenedor">
		<form:form id="formularioBusqueda" class="formulario-busqueda"
			action="busquedaMostrarReserva" modelAttribute="laBusqueda">
			<h1>Reserva</h1>

			<div class="input-container">

				<label for="codigoReserva">Codigo de Reserva</label>
				<form:input type="text" id="codigoReserva" class="codigoReserva"
					path="codigoReserva" />
				<div class="messageError">
					<form:errors path="codigoReserva"></form:errors>
				</div>

				<label for="correo">Email</label>
				<form:input type="email" id="correo" class="correo" path="email" />
				<div class="messageError">
					<form:errors path="email"></form:errors>
				</div>




				<input type="submit" name="submit" id="submit" class="submit"
					value="Buscar">


			</div>
		</form:form>
		<c:if test="${resNotFound==true }">
			<span class="notFound" id="notFound">Codigo de reserva no
				encontrado o email incorrecto.</span>
		</c:if>
	</div>


	<script>
		const notFound = document.getElementById('notFound')
		
		if('notFound'){
			
			notFound.addEventListener('click', ()=>{
				notFound.remove()
				
			})
		}
	</script>







	<!-- 	<script -->
	<%-- 		src="${pageContext.request.contextPath}/recursos/js/regresarInicioButton.js"></script> --%>


</body>
</html>