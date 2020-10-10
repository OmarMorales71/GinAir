<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>GinAir</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="${pageContext.request.contextPath}/recursos/css/style.css"
	rel="stylesheet" type="text/css" media="all" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/recursos/css/slideshowStyle.css">

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
			<p style="display: none" id="ciudadActual">cancun</p>
			<p style="display: none" id="rutaContexto">${pageContext.request.contextPath}</p>
			<ul class="main-menu">

				<li><a href="/Aerolinea">Vuelos</a></li>
				<li class="active"><a href="#">Destinos</a>
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


	<div class="slideshow-principal" id="slideshow-principal">
		<div id="progress-bar-container" class="progress-bar-container">
			<div id="progress-bar" class="progress-bar"></div>
		</div>
		<div id="slideshow" class="slideshow">
			<img class="img1" id="img1" src="" alt=""> <img class="img2"
				id="img2" src="" alt="">
		</div>

		<div id="indicadores" class="indicadores"></div>
	</div>
	<div class="clear"></div>

	<!---start-content---->
	<div class="text-content">
		<div class="wrap">
			<div class="city-container">
				<div class="city-header">
					<h3>Cancún</h3>
				</div>
				<div class="city-info">
					<b>El corazón de la Riviera Maya.</b>
					<p>Cancún se ubica en Quintana Roo, México, y las claras aguas
						del Caribe la rodean. Lo caracterizan sus hermosas playas cuya
						arena de coral es fina y blanca. Su mar de aguas transparentes
						posee un matiz impresionante de azules que va desde el esmeralda
						hasta el turquesa y que te hará repensar lo que significa la
						claridad. Podrás encontrar ruinas donde tendrás un atisbo de la
						cultura maya, como la zona arqueológica El Rey o el Templo del
						Alacrán (Yamil Lu’um) o disfrutar del espectáculo natural del agua
						en Xel-Ha, considerado un acuario natural. Visitar el Río Secreto
						te hará reconocer el paso del tiempo y sentir en carne propia el
						Xibalbá. Xcaret, entre la selva maya y el mar Caribe, te ofrece el
						parque eco-arqueológico más importante del país. Por tal motivo,
						Trip Advisor nombró a Cancún como el 2do destino más atractivo
						para vacacionar en verano en 2016. Su vida nocturna, una de las
						más candentes del país, junto con el pacífico contraste del museo
						subacuático de arte al que puedes acceder buceando, son una
						pequeña muestra del abanico de opciones que te ofrece.</p>
				</div>
			</div>
		</div>

	</div>
	<!---End-content---->


	<script
		src="${pageContext.request.contextPath}/recursos/js/slideshow.js"></script>


</body>
</html>