<html>
<head>
	<title><g:layoutTitle default=". : Codice CMS : ." /></title>
	<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
	<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'contentStyle.css')}" />
	<link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	<g:layoutHead />
	<g:javascript library="application" />
</head>
<body>
	<!--header start -->
	<!--menu authorities-->
	<div id="header">
		<ul>
			<li><a href="#" class="hover">Home</a></li>
			<li><a href="#">About Us</a></li>
			<li><a href="#">News</a></li>
			<li><a href="#">Testimonials</a></li>
			<li class="last"><a href="#">Contact Us</a></li>
		</ul>

		<g:link controller='cms' action='index'>
			<img src="${createLinkTo(dir:'images',file:'logo_mini.gif')}"  class="logo" border="0" />
		</g:link>

		<h1>grails.org.mx</h1>

	</div>
	<!--header end -->
	<!--body start -->
	<div id="body">

		<!-- Start Here maybe a little menu-->
		<!-- This menu depends on the User Role and Authorities-->
		<div id="menu" class="menu">
		<div id="left1" class="left1">
			<h2>.: Username :.</h2>
			<ul>
				<li><a href="#">» My Blog</a></li>
				<li><a href="#">» Send news</a></li>
				<li><a href="#">» Post one entry</a></li>
				<li><a href="#">» Forums</a></li>
				<li><a href="#">» Administer</a></li>
				<li><a href="#">» Close Session</a></li>
			</ul>
		</div>
		<br/>
		<div id="left2" class="left2">
			<h2>.: Feed :.</h2>
			<ul>
				<li><a href="#">» News 1</a></li>
				<li><a href="#">» News 2</a></li>
				<li><a href="#">» News 3</a></li>
			</ul>
		</div>
		<br/>
		<div id="left3" class="left3">
			<h2>.: Search :.</h2>
			<ul>
				<li><a href="#">» Tag cloud</a></li>
				<li><a href="#">» Advanced Search</a></li>
				<li><a href="#">» Search</a></li>
			</ul>
		</div>
		<br/>
		<div id="left4" class="left4">
			<h2>.: Resources :.</h2>
			<ul>
				<li><a href="#">» Download</a></li>
				<li><a href="#">» Install</a></li>
				<li><a href="#">» Documentation</a></li>
				<li><a href="#">» Podcast</a></li>
			</ul>
		</div>
		</div>
		<!-- End Here maybe a little menu-->

		<!--right panel start -->
		<div id="right">
			<p class="rightTop"></p>
			<!--Start content body-->
			<g:layoutBody />
			<!--End content body-->
			<p class="rightBottom"></p>
			<br class="spacer" />
		</div>
		<!--right panel end -->
		<br class="spacer" />
	</div>
	<!--body end -->
	<!--bodyBottom start -->
	<div id="bodyBottom">
		<!--news start -->
		<div id="news">
			<h2>Notas Recientes</h2>
			<h3>Fecha de Publicación</h3>
			<p><span>Titulo de la noticia</span>contenido de la noticia recortado</p>
			<p><span>Titulo de la otra noticia</span>contenido de la noticia recortado</p>
			<br class="spacer" />
		</div>
		<!--news end -->
		<!--services start -->
		<div id="service">
			<h2>Ultimos Comentarios</h2>
			<h3>Nombre de Usuario</h3>
			<ul>
				<li><a href="#">Comentario reccortado</a></li>
			</ul>
			<br class="spacer" />
		</div>
		<!--services end -->
		<!--member start -->
		<!--member end -->
		<div id="member">
			<h2>Login de Usuario</h2>
			<form action="#" method="post" name="member_log_in" id="member_log_in">
				<label>Usuario:</label>
				<input type="text" name="name" class="txtBox" />
				<label>Password:</label>
				<input type="password" name="name2" class="txtBox" />
				<a href="#">Ya te registraste?</a>
				<input type="submit" name="go" value="" class="go" />
				<br class="spacer" />
			</form>
			<br class="spacer" />
		</div>
		<br class="spacer" />
	</div>
	<!--bodyBottom end -->
	<!--footer start -->
	<div id="footer">
		<ul>
			<li><a href="#">Home</a>|</li>
			<li><a href="#">About Us</a>|</li>
			<li><a href="#">Services</a>|</li>
			<li><a href="#">Support</a>|</li>
			<li><a href="#">Communication</a>|</li>
			<li><a href="#">Why Choose Us</a>|</li>
			<li><a href="#">News</a>|</li>
			<li><a href="#">Testimonials</a>|</li>
			<li><a href="#">Contact Us</a></li>
		</ul>
		<p class="copyright">&copy;Jet 30. All rights reserved.</p>
		<a href="#" class="subscribe">Subscribe</a>
		<a href="http://validator.w3.org/check?uri=referer" target="_blank" class="xht"></a>
		<a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank" class="cs"></a>
		<a href="index.html"><img src="${createLinkTo(dir:'images',file:'bottom_logo.gif')}" alt="Jet 30" title="Jet 30" width="84" height="26" border="0" /></a>
		<p class="design">Designed By : <a href="http://www.templateworld.com">Template World</a></p></div>
		<!--footer end -->
	</body>
	</html>
