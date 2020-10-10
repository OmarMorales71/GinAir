<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

	<div class="buscador-vuelos">
		<form class="formulario-vuelos" accept-charset="utf-8" method="get"
			action="vuelos/buscador">

			<h3>Vuelo</h3>
			<div class="tipo-viaje">

				<label><input type="radio" name="tipo_viaje"
					value="ida-vuelta" onfocus="return idaYVuelta(true)"> Ida y
					vuelta</label> <label><input type="radio" name="tipo_viaje"
					value="ida" checked onfocus="return idaYVuelta(false)"> Ida</label>



			</div>
			<div class="contenedor-ruta">

				<div class="container">
					<h2>De</h2>

					<div class="select-box">
						<div class="options-container" id="sourcecity-container">
							<div class="option">
								<input type="radio" class="radio" id="cancun" name="sourcecity"
									value="Cancun" required /> <label for="cancun">Cancun</label>
							</div>

							<div class="option">
								<input type="radio" class="radio" id="londres" name="sourcecity"
									value="Londres" required /> <label for="londres">Londres</label>
							</div>

							<div class="option">
								<input type="radio" class="radio" id="paris" name="sourcecity"
									value="Paris" required /> <label for="paris">Paris</label>
							</div>

							<div class="option">
								<input type="radio" class="radio" id="roma" name="sourcecity"
									value="Roma" required /> <label for="roma">Roma</label>
							</div>

						</div>

						<div class="selected">Seleccionar ciudad de origen</div>
					</div>
				</div>

				<div class="switch-button">
					<img id="switchButton" alt="switch"
						src="${pageContext.request.contextPath}/recursos/images/guid.png">
				</div>

				<div class="container2">
					<h2>Hacia</h2>

					<div class="select-box2">
						<div class="options-container2" id="destcity-container">
							<div class="option2">
								<input type="radio" class="radio2" id="cancun2" name="destcity"
									value="Cancun" required /> <label for="cancun2">Cancun</label>
							</div>

							<div class="option2">
								<input type="radio" class="radio2" id="londres2" name="destcity"
									value="Londres" required /> <label for="londres2">Londres</label>
							</div>

							<div class="option2">
								<input type="radio" class="radio2" id="paris2" name="destcity"
									value="Paris" required /> <label for="paris2">Paris</label>
							</div>

							<div class="option2">
								<input type="radio" class="radio2" id="roma2" name="destcity"
									value="Roma" required /> <label for="roma2">Roma</label>
							</div>

						</div>

						<div class="selected2">Seleccionar ciudad de destino</div>
					</div>
				</div>

				<div class="dates-contenedor" id="dates_contenedor">
					<label>Vuelta <input type="date" id="fecha_ida"
						class="input-fecha fecha-ida" name="fecha_ida" value="2020-05-01"
						min="2020-05-01" max="2020-05-31" required></label> <label
						id="regreso-container" class="regreso-container"
						style="display: none;">Regreso <input type="date"
						id="fecha_regreso" class="input-fecha fecha-regreso"
						name="fecha_regreso" value="2020-05-01" min="2020-05-01"
						max="2020-05-31" required>
					</label>
				</div>

				<input type="submit" id="submit" class="submit" name="submit"
					value="Buscar">
			</div>


		</form>
	</div>



	<script
		src="${pageContext.request.contextPath}/recursos/js/switchButton.js"></script>
	<script
		src="${pageContext.request.contextPath}/recursos/js/activarRadioButton.js"></script>

	<script
		src="${pageContext.request.contextPath}/recursos/js/contenedorCiudades.js"></script>
	<script
		src="${pageContext.request.contextPath}/recursos/js/radioIdaYVuelta.js"></script>

</body>
</html>

