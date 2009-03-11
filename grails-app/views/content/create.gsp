<%@ page import="com.synergyj.codice.content.ContentCommand" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main" />
	<title>. : New Entry : .</title>         
</head>
<body>
	<div class="body">
		<h1>Create Content</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${contentInstance}">
	<div class="errors">
		<g:renderErrors bean="${contentInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:render template="/content/contentForm" />
	
</div>
</body>
</html>
