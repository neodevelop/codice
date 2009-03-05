
<%@ page import="com.synergyj.codice.Cms" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Cms List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Cms</g:link></span>
        </div>
        <div class="body">
            <h1>Cms List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="domain" title="Domain" />
                        
                   	        <th>Admin</th>
                   	    
                   	        <g:sortableColumn property="slogan" title="Slogan" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cmsInstanceList}" status="i" var="cmsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${cmsInstance.id}">${fieldValue(bean:cmsInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:cmsInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:cmsInstance, field:'domain')}</td>
                        
                            <td>${fieldValue(bean:cmsInstance, field:'admin')}</td>
                        
                            <td>${fieldValue(bean:cmsInstance, field:'slogan')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cmsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
