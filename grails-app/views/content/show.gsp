
<%@ page import="com.synergyj.codice.content.Content" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Content</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Content List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Content</g:link></span>
        </div>
        <div class="body">
            <h1>Show Content</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:contentInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:contentInstance, field:'title')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Body:</td>
                            
                            <td valign="top" class="value">${contentInstance.body}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Allow Comments:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:contentInstance, field:'allowComments')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Cms:</td>
                            
                            <td valign="top" class="value"><g:link controller="cms" action="show" id="${contentInstance?.cms?.id}">${contentInstance?.cms?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
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
                    
                        <tr class="prop">
                            <td valign="top" class="name">Content Type:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:contentInstance, field:'contentType')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:contentInstance, field:'created')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:contentInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Publish:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:contentInstance, field:'publish')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Show In Main Page:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:contentInstance, field:'showInMainPage')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Tags:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                ${contentInstance?.tags}
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">User:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${contentInstance?.user?.id}">${contentInstance?.user?.encodeAsHTML()}</g:link></td>
                            
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
