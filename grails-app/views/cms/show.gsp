
<%@ page import="com.synergyj.codice.Cms" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Cms</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Cms List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Cms</g:link></span>
        </div>
        <div class="body">
            <h1>Show Cms</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cmsInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cmsInstance, field:'name')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Domain:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cmsInstance, field:'domain')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Admin:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${cmsInstance?.admin?.id}">${cmsInstance?.admin?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Slogan:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cmsInstance, field:'slogan')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${cmsInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
