<h2>
	Contenido
	<g:if test="${contents?.results}">
		<g:each in="${contents.results}" var="content">
			<br/><h4>${content.title}</h4>
		</g:each>
	</g:if>
</h2>
<h2>
	Comentario
</h2>
