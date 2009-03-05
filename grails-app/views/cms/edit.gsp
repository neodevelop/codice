
<%@ page import="com.synergyj.codice.Cms" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Cms</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Cms List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Cms</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Cms</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cmsInstance}">
            <div class="errors">
                <g:renderErrors bean="${cmsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${cmsInstance?.id}" />
                <input type="hidden" name="version" value="${cmsInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cmsInstance,field:'name','errors')}">
                                    <input type="text" maxlength="50" id="name" name="name" value="${fieldValue(bean:cmsInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="domain">Domain:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cmsInstance,field:'domain','errors')}">
                                    <input type="text" maxlength="50" id="domain" name="domain" value="${fieldValue(bean:cmsInstance,field:'domain')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="admin">Admin:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cmsInstance,field:'admin','errors')}">
                                    <g:select optionKey="id" from="${com.synergyj.auth.User.list()}" name="admin.id" value="${cmsInstance?.admin?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="slogan">Slogan:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cmsInstance,field:'slogan','errors')}">
                                    <input type="text" id="slogan" name="slogan" value="${fieldValue(bean:cmsInstance,field:'slogan')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
