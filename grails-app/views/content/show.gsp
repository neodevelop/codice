
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
			<h5><div class="date1">Created ${fieldValue(bean:contentInstance, field:'created')} by ${contentInstance?.user?.username}</div></h5>
			<h4><div class="tag">Tags: ${contentInstance?.tags}</div></h4>
			<div class="textBody">
				${contentInstance?.textBody}
			</div>
			<h5><div class="date2">Last update ${fieldValue(bean:contentInstance, field:'lastUpdated')}</div></h5>
            
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
