
<%@ page import="com.synergyj.codice.content.Content" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Content</title>
    </head>
    <body>
        <div class="body">
			<g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <h1>${fieldValue(bean:contentInstance, field:'title')}</h1>
			<h5>Created ${fieldValue(bean:contentInstance, field:'created')} by ${contentInstance?.user?.username}</h5>
			<h4>Tags: ${contentInstance?.tags}</h4>
			
			<div class="textbody">
				${contentInstance?.textBody}
			</div>

			<h5>Last update: ${fieldValue(bean:contentInstance, field:'lastUpdated')}</h5>
            
            <div class="dialog">
                <table>
                    <tbody>

                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name">Comments:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="c" in="${contentInstance.comments}">
                                    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${contentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
