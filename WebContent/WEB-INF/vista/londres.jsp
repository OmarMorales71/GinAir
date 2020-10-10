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
			<p style="display: none" id="ciudadActual">londres</p>
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
					}else {
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
					<h3>Londres</h3>
				</div>
				<div class="city-info">
					<b>En Londres hay todo lo que la vida puede permitir.</b>
					<p>Londres es la capital de Inglaterra y del Reino Unido, y la
						mayor ciudad y área urbana de Gran Bretaña. Situada a orillas del
						río Támesis, Londres es un importante asentamiento humano desde
						que fue fundada por los romanos con el nombre de Londinium hace
						casi dos milenios. El núcleo antiguo de la urbe, la City de
						Londres, conserva básicamente su perímetro medieval de una milla
						cuadrada. Desde el siglo XIX el nombre «Londres» también hace
						referencia a toda la metrópolis desarrollada alrededor de este
						núcleo. El grueso de esta región forma la región de Londres y el
						área administrativa del Gran Londres, gobernado por el alcalde y
						la asamblea de Londres. Londres es una ciudad global, uno de los
						centros neurálgicos en el ámbito de las artes, el comercio, la
						educación, el entretenimiento, la moda, las finanzas, los medios
						de comunicación, la investigación, el turismo o el transporte. Es
						el principal centro financiero del mundo y una de las áreas
						metropolitanas con mayor PIB. Londres es también una capital
						cultural mundial, la ciudad más visitada considerando el número de
						visitas internacionales y tiene el mayor sistema aeroportuario del
						mundo según el tráfico de pasajeros.</p>
				</div>
			</div>
		</div>

	</div>
	<!---End-content---->

	<script
		src="${pageContext.request.contextPath}/recursos/js/slideshow.js"></script>

</body>
</html>

