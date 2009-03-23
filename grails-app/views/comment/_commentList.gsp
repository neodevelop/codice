<div class="commentsShowed">
	<table>
		<g:each var="comment" in="${comments}" status="i">
		<tr width="40">
			<td width="40"><avatar:gravatar email="${comment?.mail}" size="40"/></td>
			<td class="commentType${i%3}">
				<div class="dateComment">Commented in <g:dateFormat format="dd-MM-yyyy hh:mm a" date="${comment.creationDate}" /> by ${comment.author}</div>
				${comment.textComment}
			</td>
		</tr>
		</g:each>
	</table>
</div>