
<%@ page import="com.synergyj.codice.content.Comment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Comment</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Comment List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Comment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${commentInstance}">
            <div class="errors">
                <g:renderErrors bean="${commentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author">Author:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'author','errors')}">
                                    <input type="text" maxlength="128" id="author" name="author" value="${fieldValue(bean:commentInstance,field:'author')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="body">Body:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'body','errors')}">
                                    <textarea rows="5" cols="40" name="body">${fieldValue(bean:commentInstance, field:'body')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mail">Mail:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'mail','errors')}">
                                    <input type="text" id="mail" name="mail" value="${fieldValue(bean:commentInstance,field:'mail')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content">Content:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'content','errors')}">
                                    <g:select optionKey="id" from="${com.synergyj.codice.content.Content.list()}" name="content.id" value="${commentInstance?.content?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="creationDate">Creation Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'creationDate','errors')}">
                                    <g:datePicker name="creationDate" value="${commentInstance?.creationDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notifyResponses">Notify Responses:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commentInstance,field:'notifyResponses','errors')}">
                                    <g:checkBox name="notifyResponses" value="${commentInstance?.notifyResponses}" ></g:checkBox>
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
