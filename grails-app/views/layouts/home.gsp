<html>
<head>
	<title><g:layoutTitle default=". : Codice CMS : ." /></title>
	<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
	<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'style.css')}" />
	<!--Syntax highlight-->
	<link type="text/css" rel="stylesheet" href="http://alexgorbatchev.com/pub/sh/current/styles/shCore.css" /> 
	<link type="text/css" rel="stylesheet" href="http://alexgorbatchev.com/pub/sh/current/styles/shThemeDefault.css" /> 
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shCore.js"></script> 
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushJScript.js"></script> 
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushCss.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushGroovy.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushJava.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushPlain.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushSql.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushXml.js"></script>
	<script type="text/javascript">
		SyntaxHighlighter.all();
	</script>
	<!--Syntax highlight-->
	<link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <g:layoutHead />
    <g:javascript library="application" />
	<feed:meta kind="rss" version="2.0" controller="feed" action="content"/>
</head>
<body>
	<!--header start -->
	<!--menu authorities-->
	<div id="header">
		
		<cms:primaryLinks>
			<g:isLoggedIn>
				<li>
					<a href="${createLink(controller:'content',action:'create',params:[contentType:'News'])}">Send news</a>
				</li>
				<li>
					<a href="${createLink(controller:'content',action:'create',params:[contentType:'Entry'])}">Post one entry</a>
				</li>
				<li>
					<a href="${createLink(controller:'content',action:'my')}">My content</a>
				</li>
			</g:isLoggedIn>
			
			<li class="last"></li>
		</cms:primaryLinks>
		
		<a href="${createLinkTo(dir:'')}">
			<img src="${createLinkTo(dir:'images', file:'logo.jpg')}"  class="logo" border="0" />
		</a>

		<h1>Bienvenido a la comunidad de desarrolladores G/G</h1>
		<p>herramientas para el desarrollo <span class="txt1">agil</span> de software basado en Java con <span class="txt1">Groovy</span> y <span class="txt1">Grails</span></p>
		<p class="topText">Nos gusta el desarrollo de software, y por eso compartimos el conocimiento contigo a traves de :<span class="smallTxt">podcast, articulos, screencast, foros</span></p>
		<g:isLoggedIn>
			<a href="${createLink(controller:'register')}" class="readMore">
				<avatar:gravatar email="${loggedInUserInfo(field:'email')}" size="40"/>
			</a>
		</g:isLoggedIn>
	</div>
	<!--header end -->
	<!--body start -->
	<div id="body">
		<!--left panel start -->
		<div id="left">
			<!--left1 start -->
			<div id="left1">
				<p class="pic1"></p>
				<p class="boxTxt1">
					<span>Podcast</span>
					<b>Escucha </b>los podcast donde hablamos de Groovy y por supuesto Grails, suscribete al <a href="http://podcast.springhispano.org/grails.xml">feed aqui...</a></p>
				<br class="spacer" />
			</div>
			<!--left1 end -->
			<!--left2 start -->
			<div id="left2">
				<p class="pic2"></p>
				<p class="boxTxt2">
					<span>Screencast</span>
					<b>Observa </b> como crear una aplicación con grails, puedes comenzar con el primer screencast <a href="http://springhispano.org/?q=node/202">aquí...</a></p>
				<br class="spacer" />
			</div>
			<!--left2 end -->
			<!--left3 start -->
			<div id="left3">
				<p class="pic3"></p>
				<p class="boxTxt3">
					<span>Mas informaci&oacute;n</span>
					<b>Descarga</b> e <b>instala</b> Grails y empieza a conocer como puedes desarrollar mejores aplicaciones...</p>
				<!--left3 end -->
				<br class="spacer" />
			</div>
			<!--left end -->
			<!-- br class="spacer" / -->
			<!-- left Tags start -->
			<div id="leftTags">
				<richui:tagCloud values="${application['contentTags']}" controller="tag" action="list" />
				<br class="spacer" />
			</div>
			<!-- left Tags end -->	

		</div>
		<!--left panel end -->
		
		
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
			<g:news>
			</g:news>
		</div>
		<!--news end -->
		<!--services start -->
		<div id="service">
			<h2>Ultimos Comentarios</h2>
			<g:comments>
			</g:comments>
			<br class="spacer" />
		</div>
		<!--services end -->
		<!--member start -->
		
		<g:isNotLoggedIn>
		<div id="member" name="member">
			<h2>Login de Usuario</h2>
			<form action="/codice/j_spring_security_check" method="post" name="member_log_in" id="member_log_in">
				<label>Usuario:</label>
				<input type="text" name="j_username" class="txtBox" />
				<label>Password:</label>
				<input type="password" name="j_password" class="txtBox" />
				<!--
				<label>Remember me:</label>
				<input type='checkbox' name='_spring_security_remember_me' id='remember_me'
				<g:if test='${hasCookie}'>checked='checked'</g:if> />
				-->
				<a href="/codice/register/index">Ya te registraste?</a>
				<input type="submit" name="go" value="" class="go" />
				<br class="spacer" />
			</form>
			<br class="spacer" />
		</div>
		</g:isNotLoggedIn>
		
		<g:isLoggedIn>
		<div id="member">
			<h2>. : Welcome : .</h2>
			<form action="#">
				<div class="login">
					<center><b><g:loggedInUserInfo field="username"/></b></center>
					<g:if test="${loggedInUserInfo(field:'emailShow')}">
						<div class="mail"><g:loggedInUserInfo field="email"/></div>
					</g:if>
					<div class="date1">
						<b>Last login:</b><br/>
						<g:dateFormat format="dd-MM-yyyy hh:mm a" date="${loggedInUserInfo(field:'lastLogin')}" />
					</div>
				</div>
				<g:link controller="logout">Logout</g:link>
				<br class="spacer" />
			</form>
			<br class="spacer" />
		</div>
		</g:isLoggedIn>
		
		<br class="spacer" />
		<!--member end -->
	</div>
	<!--bodyBottom end -->
	<!--footer start -->
	<div id="footer">
		<ul>
			<li><a href="${createLinkTo(dir:'')}" class="hover">Home</a>|</li>
			<li><a href="#">¿como participar?</a>|</li>
			<li><a href="#">¿quienes somos?</a>|</li>
			<li><a href="http://groups.google.com.mx/group/grailsencastellano">Grupo en Google</a></li>
		</ul>
		<p class="copyright">&copy;Jet 30. All rights reserved.</p>
		<a href="${createLink(controller:'feed',action:'content')}" class="Subscribe">Subscribe</a>
		<a href="http://validator.w3.org/check?uri=referer" target="_blank" class="xht"></a>
		<a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank" class="cs"></a>
		<a href="index.html"><img src="${createLinkTo(dir:'images',file:'bottom_logo.gif')}" alt="Jet 30" title="Jet 30" width="84" height="26" border="0" /></a>
		<p class="design">Designed By : <a href="http://www.templateworld.com">Template World</a></p></div>
		<!--footer end -->
	</body>
	</html>
