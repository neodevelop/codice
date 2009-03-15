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
				<g:isLoggedIn>
					<g:loggedInUserInfo field="userRealName"/>
					<input type="hidden" name="author" id="author" value="<g:loggedInUserInfo field='userRealName'/>" />
				</g:isLoggedIn>
				<g:isNotLoggedIn>
					<input type="text" maxlength="128" id="author" name="author" value="${comment?.author}" size="40"/>
				</g:isNotLoggedIn>
			</div>
		</div>

		<div class="prop">
			<div class="name">
				<b>Mail:</b>
			</div>
			<div class="value ${hasErrors(bean:comment,field:'mail','errors')}">
				<g:isLoggedIn>
					<g:loggedInUserInfo field="email"/>
					<input type="hidden" name="mail" id="mail" value="<g:loggedInUserInfo field='email'/>" />
				</g:isLoggedIn>
				<g:isNotLoggedIn>
					<input type="text" id="mail" name="mail" value="${comment?.mail}" size="40"/>
				</g:isNotLoggedIn>
			</div>
		</div>

		<input type="hidden" name="contentId" id="contentId" value="${comment?.contentId}" />

		<div class="prop">
			<div class="name">
				<b>Your comment:</b>
			</div>
			<div class="value ${hasErrors(bean:comment,field:'textComment','errors')}">
				<richui:richTextEditor name="textComment" value="${comment?.textComment}" width="300" height="200" />
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
		<span class="button"><input type="submit" value="Send comment" class="addComment"/></span>
	</div>

</g:form>
</div>