
<%@ page import="com.synergyj.codice.content.Content" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Content List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Content</g:link></span>
        </div>
        <div class="body">
            <h1>Content List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                   	        <g:sortableColumn property="textBody" title="Text Body" />
                        
                   	        <g:sortableColumn property="allowComments" title="Allow Comments" />
                        
                   	        <th>Cms</th>
                   	    
                   	        <g:sortableColumn property="contentType" title="Content Type" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contentInstanceList}" status="i" var="contentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${contentInstance.id}">${fieldValue(bean:contentInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:contentInstance, field:'title')}</td>
                        
                            <td>${fieldValue(bean:contentInstance, field:'textBody')}</td>
                        
                            <td>${fieldValue(bean:contentInstance, field:'allowComments')}</td>
                        
                            <td>${fieldValue(bean:contentInstance, field:'cms')}</td>
                        
                            <td>${fieldValue(bean:contentInstance, field:'contentType')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${contentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
