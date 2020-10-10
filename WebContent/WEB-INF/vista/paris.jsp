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
			<p style="display: none" id="ciudadActual">paris</p>
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
					<h3>Paris</h3>
				</div>
				<div class="city-info">
					<b>Siempre nos quedará París.</b>
					<p>Situada en el centro norte de Francia, París es una de las
						ciudades más visitadas del mundo, además de ser cuna de algunos
						movimientos vanguardistas. Su larga historia y su rico patrimonio
						cultural, gastronómico y social hace que sea el destino preferido
						por miles de turistas, atraídos por fantásticos monumentos como el
						Arco del Triunfo, la Catedral de Notre Dame o la Torre Eiffel,
						entre otros, así como por las obras de arte que posee el Museo del
						Louvre. París es también conocida por todos como la Ciudad de la
						Luz, ya que la capital francesa fue la primera que dotó sus calles
						de luz eléctrica. Por otro lado suele ser denominada la Ciudad del
						Amor, debido al encanto y romanticismo que desprende pasear por
						sus calles.</p>
				</div>
			</div>
		</div>

	</div>
	<!---End-content---->
	<script
		src="${pageContext.request.contextPath}/recursos/js/slideshow.js"></script>


</body>
</html>

