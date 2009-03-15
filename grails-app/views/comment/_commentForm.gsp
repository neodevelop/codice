<resource:richTextEditor/>
<g:hasErrors bean="${comment}">
<div id="commentErrors" class="errors">
	<g:renderErrors bean="${comment}" as="list" />
</div>
</g:hasErrors>

<div class="commentForm">
<g:form controller="comment" action="save" method="post" >

	<div class="dialog">
		<h1>Comment this entry</h1>

		<div class="prop">
			<div class="name">
				<b>Author:</b>
			</div>
			<div class="value ${hasErrors(bean:comment,field:'author','errors')}">
				<input type="text" maxlength="128" id="author" name="author" value="${comment?.author}" size="40"/>
			</div>
		</div>

		<div class="prop">
			<div class="name">
				<b>Mail:</b>
			</div>
			<div class="value ${hasErrors(bean:comment,field:'mail','errors')}">
				<input type="text" id="mail" name="mail" value="${comment?.mail}" size="40"/>
			</div>
		</div>

		<input type="hidden" name="contentId" id="contentId" value="${comment?.contentId}" />

		<div class="prop">
			<div class="name">
				<b>Body:</b>
			</div>
			<div class="value ${hasErrors(bean:comment,field:'body','errors')}">
				<richui:richTextEditor name="body" value="${comment?.body}" width="300" height="200" />
			</div>
		</div>
		
		<div class="prop">
			<div class="name">
				<b>Notify Responses:</b>
			</div>
			<div class="value ${hasErrors(bean:comment,field:'notifyResponses','errors')}">
				<g:checkBox name="notifyResponses" value="${comment?.notifyResponses}" ></g:checkBox>
			</div>
		</div>
		
	</div>
	
	<div class="buttons">
		<span class="button"><input type="submit" value="Send comment" class="save"/></span>
	</div>

</g:form>
</div>