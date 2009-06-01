<%@ page import="com.synergyj.codice.content.Content" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Lista de Contenido</title>
    </head>
    <body>
        <div class="body">
            <h1>All the content</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="title" title="Titulo" />
                        
                   	        <g:sortableColumn property="allowComments" title="Comentarios" />
                   	    
                   	        <g:sortableColumn property="contentType" title="Tipo" />

							<g:sortableColumn property="created" title="Creado" />
                        
							<g:sortableColumn property="publish" title="Publicar" />
							
							<g:ifAnyGranted role="ROLE_ADMIN,ROLE_MANAGER">
								<g:sortableColumn property="priority" title="Priority" />
							</g:ifAnyGranted>
							
							<g:ifAnyGranted role="ROLE_ADMIN,ROLE_MANAGER">
								<g:sortableColumn property="user" title="Created by..." />
							</g:ifAnyGranted>
							
							<th class="sortable">
								Actions
							</th>
							
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contentInstanceList}" status="i" var="contentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	
                            <td><g:link action="show" id="${contentInstance.id}">${fieldValue(bean:contentInstance, field:'title')}</g:link></td>
                        
                            <td>
								<g:if test="${contentInstance.allowComments}">
									<span class="allow">Yes</span>
								</g:if>
								<g:else>
									<span class="disallow">No</span>
								</g:else>
							</td>
                        
                            <td>${fieldValue(bean:contentInstance, field:'contentType')}</td>

							<td>
								<g:dateFormat format="dd-MM-yyyy" date="${contentInstance.created}" />
							</td>
                        
							<td>
								<g:if test="${contentInstance.publish}">
									<span class="allow">Yes</span>
								</g:if>
								<g:else>
									<span class="disallow">No</span>
								</g:else>
							</td>
							
							<g:ifAnyGranted role="ROLE_ADMIN,ROLE_MANAGER">
								<td>${fieldValue(bean:contentInstance, field:'priority')}</td>
							</g:ifAnyGranted>
							
							<g:ifAnyGranted role="ROLE_ADMIN,ROLE_MANAGER">
								<td>
									<avatar:gravatar email="${fieldValue(bean:contentInstance, field:'user.email')}" size="15"/>
									${fieldValue(bean:contentInstance, field:'user.username')}
								</td>
							</g:ifAnyGranted>
							
							<td>
								<g:link controller="content" action="edit" id="${contentInstance.id}"><img src="${createLinkTo(dir:'images/skin',file:'database_edit.png')}" border="0" /></g:link>
								<g:link controller="content" action="delete" id="${contentInstance.id}"><img src="${createLinkTo(dir:'images/skin',file:'database_delete.png')}" border="0" /></g:link>
							</td>
							
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>