<%@ page import="com.synergyj.codice.content.Content" %>
<%@ page import="com.synergyj.codice.content.Comment" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main" />
	<title>${fieldValue(bean:contentInstance, field:'title')}</title>
</head>
<body>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>

		<h1>${fieldValue(bean:contentInstance, field:'title')}</h1>
		<div class="content">
			<div class="dateStyle1">
				<div class="date1">Created ${fieldValue(bean:contentInstance, field:'created')} by ${contentInstance?.user?.username}</div>
			</div>
			<div class="tags">
				<g:each in="${contentInstance?.tags}" var="tag">
					<span class="tag">${tag}</span>
				</g:each>
			</div>
			<div class="textBody">
				${contentInstance?.textBody}
			</div>
			<div class="dateStyle2">
				<div class="date2">Last update ${fieldValue(bean:contentInstance, field:'lastUpdated')}</div>
			</div>
		</div>
		<br/>
		<div class="commentsActions">
			<div class="comments1">Add a new comment</div>
		</div>
		
		<g:render template="/comment/commentList" model="[comments:contentInstance?.comments]" />

		<!--
		<div class="buttons">
			<g:form>
				<input type="hidden" name="id" value="${contentInstance?.id}" />
				<span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
				<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
			</g:form>
		</div>
		-->
	</div>
</body>
</html>
