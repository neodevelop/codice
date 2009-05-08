<html>
<head>
	<title><g:layoutTitle default=". : Codice CMS : ." /></title>
	<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
	<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'contentStyle.css')}" />
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
</head>
<body>
	<!--header start -->
	<!--menu authorities-->
	<div id="header">
		<ul>
			<li><a href="${createLinkTo(dir:'')}" class="hover">Home</a></li>
			<li><a href="#">como participar?</a></li>
			<li><a href="#">quienes somos?</a></li>
			<li><a href="http://groups.google.com.mx/group/grailsencastellano">Grupo en Google</a></li>
			
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
			
		</ul>

		<a href="${createLinkTo(dir:'')}">
			<img src="${createLinkTo(dir:'images',file:'logo_mini.gif')}"  class="logo" border="0" />
		</a>

		<a href="${createLinkTo(dir:'')}">
			<h1>grails.org.mx</h1>
		</a>
		
	</div>
	<!--header end -->
	<!--body start -->
	<div id="body">

		<!-- Start Here maybe a little menu-->
		<!-- This menu depends on the User Role and Authorities-->
		<div id="menu" class="menu">
		<g:ifAnyGranted role="ROLE_ADMIN,ROLE_MANAGER,ROLE_USER">
		<div id="left1" class="left1">
			<h2>.: <g:loggedInUserInfo field="username"/> :.</h2>
			<ul>
				<li>
					<div class="news">
						<a href="${createLink(controller:'content',action:'create',params:[contentType:'News'])}">Send news</a>
					</div>
				</li>
				<li>
					<div class="entry">
						<a href="${createLink(controller:'content',action:'create',params:[contentType:'Entry'])}">Post one entry</a>
					</div>
				</li>
				<li>
					<div class="contents">
						<a href="${createLink(controller:'content',action:'my')}">View my content</a>
					</div>
				</li>
				<g:ifAllGranted role="ROLE_ADMIN">
				<li>
					<div class="administer">
						<a href="${createLink(controller:'content',action:'administer')}">Administer</a>
					</div>
				</li>
				</g:ifAllGranted>
				<li>
					<div class="logout">
						<g:link controller="logout">Logout</g:link>
					</div>
				</li>
			</ul>
		</div>
		<br/>
		</g:ifAnyGranted>
		<g:isNotLoggedIn>
		<div id="left2" class="left2">
			<h2>.: Start :.</h2>
			<ul>
				<li>
					<div class="loginMenu">
						<a href="#member">Login</a>
					</div>
				</li>
				<li>
					<div class="register">
						<g:link controller="register">Register</g:link>
					</div>
				</li>
			</ul>
		</div>
		</g:isNotLoggedIn>
		<!-- This will not showed until 0.2 or 0.3 version :P
		<div id="left3" class="left3">
			<h2>.: Search :.</h2>
			<ul>
				<li><a href="#">» Tag cloud</a></li>
				<li><a href="#">» Advanced Search</a></li>
				<li><a href="#">» Search</a></li>
			</ul>
		</div>
		-->
		<br/>
		<div id="left4" class="left4">
			<h2>.: Resources :.</h2>
			<ul>
				<li><a href="http://grails.org/Download">Download</a></li>
				<li><a href="http://grails.org/Installation">Install</a></li>
				<li><a href="http://grails.org/Documentation">Documentation</a></li>
				<li><a href="http://podcast.springhispano.org/grails.xml">Podcast</a></li>
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
		<a href="#" class="subscribe">Subscribe</a>
		<a href="http://validator.w3.org/check?uri=referer" target="_blank" class="xht"></a>
		<a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank" class="cs"></a>
		<a href="index.html"><img src="${createLinkTo(dir:'images',file:'bottom_logo.gif')}" alt="Jet 30" title="Jet 30" width="84" height="26" border="0" /></a>
		<p class="design">Designed By : <a href="http://www.templateworld.com">Template World</a></p></div>
		<!--footer end -->
	</body>
	</html>
