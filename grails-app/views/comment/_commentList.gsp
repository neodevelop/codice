<div class="commentsShowed">
	<table>
		<g:each var="comment" in="${comments.sort { c1,c2 -> c2.creationDate - c1.creationDate }}" status="i">
		<tr width="40">
			<td width="40"><avatar:gravatar email="${comment?.mail}" size="40"/></td>
			<td class="commentType${i%3}">
				<div class="dateComment">Comentado el <g:dateFormat format="dd-MM-yyyy hh:mm a" date="${comment.creationDate}" /> por ${comment.author}</div>
				${comment.textComment}
			</td>
		</tr>
		</g:each>
	</table>
</div>