
<%@ page import="com.synergyj.codice.MenuItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>MenuItem List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New MenuItem</g:link></span>
        </div>
        <div class="body">
            <h1>MenuItem List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="url" title="Url" />
                        
                   	        <g:sortableColumn property="priority" title="Priority" />
                        
                   	        <th>Menu</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${menuItemInstanceList}" status="i" var="menuItemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${menuItemInstance.id}">${fieldValue(bean:menuItemInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:menuItemInstance, field:'title')}</td>
                        
                            <td>${fieldValue(bean:menuItemInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:menuItemInstance, field:'url')}</td>
                        
                            <td>${fieldValue(bean:menuItemInstance, field:'priority')}</td>
                        
                            <td>${fieldValue(bean:menuItemInstance, field:'menu')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${menuItemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
