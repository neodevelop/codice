
<%@ page import="com.synergyj.codice.content.Content" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Content</title>
    </head>
    <body>
        <div class="body">
			<div class="actionBox">
				<span class="show"><g:link controller="content" action="show" id="${contentInstance.id}">Show this content</g:link></span>
			</div>
            <h1>Edit Content</h1>
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
