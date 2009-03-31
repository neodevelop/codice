<%@ page import="com.synergyj.codice.content.Content" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Content List</title>
    </head>
    <body>
        <div class="body">
            <h1>Content List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
        </div>
    </body>
</html>