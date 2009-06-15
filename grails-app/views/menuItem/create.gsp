
<%@ page import="com.synergyj.codice.MenuItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create MenuItem</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">MenuItem List</g:link></span>
        </div>
        <div class="body">
            <h1>Create MenuItem</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${menuItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${menuItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:menuItemInstance,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:menuItemInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:menuItemInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:menuItemInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url">Url:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:menuItemInstance,field:'url','errors')}">
                                    <input type="text" id="url" name="url" value="${fieldValue(bean:menuItemInstance,field:'url')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="priority">Priority:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:menuItemInstance,field:'priority','errors')}">
                                    <g:select from="${-5..5}" id="priority" name="priority" value="${menuItemInstance?.priority}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="menu">Menu:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:menuItemInstance,field:'menu','errors')}">
                                    <g:select optionKey="id" from="${com.synergyj.codice.Menu.list()}" name="menu.id" value="${menuItemInstance?.menu?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
