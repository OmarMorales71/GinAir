<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<title>GinAir</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
			<p style="display: none" id="ciudadActual">roma</p>
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
					<h3>Roma</h3>
				</div>
				<div class="city-info">
					<b>Roma un museo al aire libre.</b>
					<p>La ciudad de Roma es la capital de Italia y cuenta
						actualmente con una población cercana a los 4.000.000 de
						habitantes. La ciudad de Roma alberga el Vaticano,considerado el
						Estado más pequeño donde se concentra uno de los poderes
						religiosos y políticos más influyentes de la historia. El Vaticano
						es reconocido como Estado independiente por el Gobierno Italiano
						en 1929 por el Pacto de Letrán. Roma habría sido fundada el año
						753 a. de C. y es sede del jefe del Estado, del Parlamento, del
						Gobierno y de los máximos órganos judiciales y organismos
						internacionales además de innumerables instituciones artísticas y
						culturales. Una de las bases de su economía está dada por el
						turismo, pero también otros sectores han experimentado un notable
						desarrollo: confección, textil, cinematográfico, vidrio, tabaco,
						mecánica, alimentación etc.</p>
				</div>
			</div>
		</div>

	</div>
	<!---End-content---->
	<script
		src="${pageContext.request.contextPath}/recursos/js/slideshow.js"></script>


</body>
</html>
