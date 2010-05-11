	<h2>.:Contents:.</h2>
	<g:if test="${contents?.results}">
		<gui:accordion bounce="true" multiple="true">
		<g:each in="${contents.results}" var="content">
			<gui:accordionElement
				title="${content.title.getAt(0..(content.title.size()<45 ? content.title.size()-1 :45 ))}...">
				<p><g:shortVersion longVersion="${content.textBody}" keyword="${q}" maxSize="500" /></p>
				<br/><br/><g:link controller="content" action="show" id="${content.id}">Read more...</g:link>
			</gui:accordionElement>
		</g:each>
		</gui:accordion>
	</g:if>
	<g:else>
		<h3>No content found with that criteria...</h3>
	</g:else>
	<!-- Comentario agregado... -->