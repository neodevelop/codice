<html>
<head>
	<title><g:layoutTitle default=". : Codice CMS : ." /></title>
	<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
	<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'style.css')}" />
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
			<li><a href="#">¿como participar?</a></li>
			<li><a href="#">¿quienes somos?</a></li>
			<li><a href="#">¿A donde vamos?</a></li>
			<li class="last"><a href="http://groups.google.com.mx/group/grailsencastellano">Grupo en Google</a></li>
		</ul>
		
		<a href="#">
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
					<b>Duis iaculis lobortis leo</b>,venenatis dignissim. Nam massa lorem, suscipit nonummy,</p>
				<br class="spacer" />
			</div>
			<!--left1 end -->
			<!--left2 start -->
			<div id="left2">
				<p class="pic2"></p>
				<p class="boxTxt2">
					<span>Screencast</span>
					<b>Duis iaculis lobortis leo</b>,venenatis dignissim. Nam massa lorem, suscipit nonummy,</p>
				<br class="spacer" />
			</div>
			<!--left2 end -->
			<!--left3 start -->
			<div id="left3">
				<p class="pic3"></p>
				<p class="boxTxt3">
					<span>Mas informacion</span>
					<b>Phasellus dapibus odio eu</b>,ipsum ac turpis. Integer ac libero eu orci pharetra eges</p>
				<!--left3 end -->
				<br class="spacer" />
			</div>
			<!--left end -->
			<!-- br class="spacer" / -->
			<!-- left Tags start -->
			<div id="leftTags">
				<!-- p class="boxTxt1" -->
					<g:each in="${application['listTags']}" status="iTag" var="tag">
						<g:link action="list" controller="tag" id="${tag}">${tag}</g:link> 
					</g:each>
				<!-- /p -->
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
			
				<!-- div class="tags">
					<g:each in="${content?.tags}" var="tag">
						<span class="tag"><g:link action="list" controller="tag" id="${tag}">${tag}</g:link></span>
					</g:each>
				</div -->
			<g:each in="${lastContent}" status="i" var="content">
				<h3 style="margin-bottom: 5px;"> 
					<span>
						<g:dateFormat format="dd-MM-yyyy hh:mm a" date="${content?.created}" />
					</span> 
				</h3>
				<span><g:link action="show" controller="content" id="${content.id}">${content.title}</g:link> </span>
				<g:if test="${content.textBody.length() > 130}" >
					${content.textBody.substring(0,135)}...
				</g:if>
				<g:else>
					${content.textBody}
				</g:else>
				<div class="comments">
					<div class="commentsActions" style="text-align: right;">${content?.comments?.size()} Comments</div>
				</div>
			<br class="spacer" />
			</g:each>
			
			
		</div>
		<!--news end -->
		<!--services start -->
		<div id="service">
			<h2>Ultimos Comentarios</h2>
			<h3>Nombre de Usuario</h3>
			<ul>
				<li><a href="#">Comentario reccortado</a></li>
			</ul>
			<h3>Nombre de Usuario</h3>
			<ul>
				<li><a href="#">Comentario reccortado</a></li>
			</ul>
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
					<center>·!¦[·<g:loggedInUserInfo field="username"/>·]¦!·</center>
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
