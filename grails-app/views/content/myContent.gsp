<%@ page import="com.synergyj.codice.content.Content" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Content List</title>
    </head>
    <body>
        <div class="body">
            <h1>My Content List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                   	        <g:sortableColumn property="allowComments" title="Comments" />
                   	    
                   	        <g:sortableColumn property="contentType" title="Type" />

							<g:sortableColumn property="created" title="Created" />
                        
							<g:sortableColumn property="publish" title="Published" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contentInstanceList}" status="i" var="contentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	
                            <td><g:link action="show" id="${contentInstance.id}">${fieldValue(bean:contentInstance, field:'title')}</g:link></td>
                        
                            <td>${fieldValue(bean:contentInstance, field:'allowComments')}</td>
                        
                            <td>${fieldValue(bean:contentInstance, field:'contentType')}</td>

							<td>${fieldValue(bean:contentInstance, field:'created')}</td>
                        
							<td>${fieldValue(bean:contentInstance, field:'publish')}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>