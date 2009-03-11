<%@ page import="com.synergyj.codice.content.ContentCommand" %>
<resource:richTextEditor type="full" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Content</title>         
    </head>
    <body>
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

                            <div class="prop">
                                <div class="name">
                                    <label for="title">Title:</label>
                                </div>
                                <div class="value ${hasErrors(bean:contentInstance,field:'title','errors')}">
                                    <input type="text" size="90" id="title" name="title" value="${fieldValue(bean:contentInstance,field:'title')}"/>
                                </div>
                            </div> 

							<div class="prop">
                                <div class="name">
                                    <label for="title">Body:</label>
                                </div>
                                <div class="value ${hasErrors(bean:contentInstance,field:'title','errors')}">
                                    <richui:richTextEditor name="textBody" value="${contentInstance?.textBody}" width="700" height="400" />
                                </div>
                            </div>

							<div class="prop">
                                <div class="name">
                                    <label for="user">Tags:</label>
                                </div>
                                <div class="value ${hasErrors(bean:contentInstance,field:'tagList','errors')}">
									<g:textField name="tagList" value="${contentInstance?.tagList}" size="90"></g:textField>
                                </div>
                            </div>
							
                            <div class="prop">
                                <div class="name">
                                    <label for="allowComments">Allow Comments:</label>
                                </div>
                                <div class="value ${hasErrors(bean:contentInstance,field:'allowComments','errors')}">
                                    <g:checkBox name="allowComments" value="${contentInstance?.allowComments}" ></g:checkBox>
                                </div>
                            </div>
                        
                            <div class="prop">
                                <div class="name">
                                    <label for="publish">Publish:</label>
                                </div>
                                <div class="value ${hasErrors(bean:contentInstance,field:'publish','errors')}">
                                    <g:checkBox name="publish" value="${contentInstance?.publish}" ></g:checkBox>
                                </div>
                            </div> 
                        
                            <div class="prop">
                                <div class="name">
                                    <label for="showInMainPage">Show In Main Page:</label>
                                </div>
                                <div class="value ${hasErrors(bean:contentInstance,field:'showInMainPage','errors')}">
                                    <g:checkBox name="showInMainPage" value="${contentInstance?.showInMainPage}" ></g:checkBox>
                                </div>
                            </div> 
                        
                            <div class="prop">
                                <div class="name">
                                    <label for="user">Author:</label>
                                </div>
                                <div class="value ${hasErrors(bean:contentInstance,field:'email','errors')}">
									<g:loggedInUserInfo field="username"/> - <g:loggedInUserInfo field="email"/>
									<input type="hidden" name="email" id="email" value="<g:loggedInUserInfo field='email'/>">
                                </div>
                            </div>

                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
