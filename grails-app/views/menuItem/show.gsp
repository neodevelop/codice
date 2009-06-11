
<%@ page import="com.synergyj.codice.MenuItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show MenuItem</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">MenuItem List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New MenuItem</g:link></span>
        </div>
        <div class="body">
            <h1>Show MenuItem</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:menuItemInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:menuItemInstance, field:'title')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:menuItemInstance, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Url:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:menuItemInstance, field:'url')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Priority:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:menuItemInstance, field:'priority')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Menu:</td>
                            
                            <td valign="top" class="value"><g:link controller="menu" action="show" id="${menuItemInstance?.menu?.id}">${menuItemInstance?.menu?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${menuItemInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
