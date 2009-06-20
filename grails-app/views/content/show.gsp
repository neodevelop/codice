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
		
		<div class="actionBox">
			<g:isLoggedIn>
				<g:if test="${(contentInstance.user.email == loggedInUserInfo(field:'email'))}">
					<span class="edit"><g:link controller="content" action="edit" id="${contentInstance.id}">
						Editar este contenido
					</g:link></span>
				</g:if>
			</g:isLoggedIn>
		</div>

		<h1>${fieldValue(bean:contentInstance, field:'title')}</h1>
		
		<div class="content">
			<div class="dateStyle1">
				<div class="date1">Creado <g:dateFormat format="dd-MM-yyyy hh:mm a" date="${contentInstance?.created}" /> por ${contentInstance?.user?.username}</div>
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
				<div class="date2">Ultima actualizaci&oacute;n <g:dateFormat format="dd-MM-yyyy hh:mm a" date="${contentInstance?.lastUpdated}" /></div>
			</div>
		</div>
		<br/>
		
		<g:if test="${contentInstance.allowComments}">
		<div class="commentsActions">
			<a href="#commentForm"><div class="comments1">Agregar un nuevo comentario</div></a>
		</div>
		<g:render template="/comment/commentList" model="[comments:contentInstance?.comments]" />
		<g:render template="/comment/commentForm" model="[comment:commentInstance]" />
		</g:if>
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
