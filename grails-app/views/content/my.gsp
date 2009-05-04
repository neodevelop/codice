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
							
							<g:ifAnyGranted role="ROLE_ADMIN,ROLE_MANAGER">
								<g:sortableColumn property="priority" title="Priority" />
							</g:ifAnyGranted>
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
								<g:dateFormat format="dd-MM-yyyy hh:mm a" date="${contentInstance.created}" />
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
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>