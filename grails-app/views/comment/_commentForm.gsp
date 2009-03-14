<resource:richTextEditor/>
<g:hasErrors bean="${comment}">
<div id="commentErrors" class="errors">
    <g:renderErrors bean="${comment}" as="list" />
</div>
</g:hasErrors>
<g:form controller="comment" action="save" method="post" >
    <div class="dialog">
        <table>
            <tbody>
            
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="author">Author:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:comment,field:'author','errors')}">
                        <input type="text" maxlength="128" id="author" name="author" value="${comment?.author}"/>
                    </td>
                </tr> 
            
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="mail">Mail:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:comment,field:'mail','errors')}">
                        <input type="text" id="mail" name="mail" value="${comment?.mail}"/>
                    </td>
                </tr> 
            
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="content">Content:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:comment,field:'content','errors')}">
						<g:textField name="contentId" value="${comment?.contentId}" />
                    </td>
                </tr> 
            
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="notifyResponses">Notify Responses:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:comment,field:'notifyResponses','errors')}">
                        <g:checkBox name="notifyResponses" value="${comment?.notifyResponses}" ></g:checkBox>
                    </td>
                </tr>

				<tr class="prop">
                    <td valign="top" class="name">
                        <label for="body">Body:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:comment,field:'body','errors')}">
						<richui:richTextEditor name="body" value="${comment?.body}" width="300" height="200" />
                    </td>
                </tr>
            
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <span class="button">
			<g:submitToRemote action="save" class="save" value="Send comment" update="commentErrors" />
			<input class="save" type="submit" value="Create" />
		</span>
    </div>
</g:form>