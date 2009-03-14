<resource:richTextEditor/>
<g:hasErrors bean="${comment}">
<div id="commentErrors" class="errors">
	<g:renderErrors bean="${comment}" as="list" />
</div>
</g:hasErrors>
<g:form controller="comment" action="save" method="post" >

<label for="author">Author:</label>

<div class="value ${hasErrors(bean:comment,field:'author','errors')}">
	<input type="text" maxlength="128" id="author" name="author" value="${comment?.author}"/>
</div>

<label for="mail">Mail:</label>

<div class="value ${hasErrors(bean:comment,field:'mail','errors')}">
	<input type="text" id="mail" name="mail" value="${comment?.mail}"/>
</div>

<input type="hidden" name="contentId" id="contentId" value="${comment?.contentId}" />

<label for="notifyResponses">Notify Responses:</label>

<div class="value ${hasErrors(bean:comment,field:'notifyResponses','errors')}">
	<g:checkBox name="notifyResponses" value="${comment?.notifyResponses}" ></g:checkBox>
</div>


<label for="body">Body:</label>
<div class="value ${hasErrors(bean:comment,field:'body','errors')}">
	<richui:richTextEditor name="body" value="${comment?.body}" width="300" height="200" />
</div>



<div class="buttons">
	<span class="button">
		<input class="save" type="submit" value="Create" />
	</span>
</div>
</g:form>