<%@ page import="com.synergyj.codice.content.ContentCommand" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Content</title>         
    </head>
    <body>
        <resource:richTextEditor type="advanced" />
        <div class="body">
            <h1>Create Content</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${contentInstance}">
            <div class="errors">
                <g:renderErrors bean="${contentInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:contentInstance,field:'title','errors')}">
                                    <input type="text" maxlength="128" id="title" name="title" value="${fieldValue(bean:contentInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="allowComments">Allow Comments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:contentInstance,field:'allowComments','errors')}">
                                    <g:checkBox name="allowComments" value="${contentInstance?.allowComments}" ></g:checkBox>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="publish">Publish:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:contentInstance,field:'publish','errors')}">
                                    <g:checkBox name="publish" value="${contentInstance?.publish}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="showInMainPage">Show In Main Page:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:contentInstance,field:'showInMainPage','errors')}">
                                    <g:checkBox name="showInMainPage" value="${contentInstance?.showInMainPage}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">Author:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:contentInstance,field:'email','errors')}">
									<g:loggedInUserInfo field="username"/> - <g:loggedInUserInfo field="email"/>
									<input type="hidden" name="email" id="email" value="<g:loggedInUserInfo field='email'/>">
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">Tags:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:contentInstance,field:'tagList','errors')}">
									<g:textField name="tagList" value="${contentInstance?.tagList}" size="50"></g:textField>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
					<table>
					<tr class="prop">
                        <td valign="top" class="name">
                            <label for="body">Body:</label>
                        </td>
					</tr>
					<tr>
                        <td valign="top" class="value ${hasErrors(bean:contentInstance,field:'body','errors')}">
							<richui:richTextEditor name="body" value="${contentInstance?.body}" width="700" height="500" />
                        </td>
                    </tr>
					</table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
