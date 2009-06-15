
<%@ page import="com.synergyj.codice.Menu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Menu</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Menu List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Menu</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Menu</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${menuInstance}">
            <div class="errors">
                <g:renderErrors bean="${menuInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${menuInstance?.id}" />
                <input type="hidden" name="version" value="${menuInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:menuInstance,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:menuInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="menuItems">Menu Items:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:menuInstance,field:'menuItems','errors')}">
                                    
<ul>
<g:each var="m" in="${menuInstance?.menuItems?}">
    <li><g:link controller="menuItem" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="menuItem" params="['menu.id':menuInstance?.id]" action="create">Add MenuItem</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="priority">Priority:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:menuInstance,field:'priority','errors')}">
                                    <input type="text" id="priority" name="priority" value="${fieldValue(bean:menuInstance,field:'priority')}" />
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
