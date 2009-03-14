<div class="commentsShowed">
	<table>
		<g:each var="comment" in="${comments}" status="i">
		<tr width="40">
			<td width="40"><img src="http://www.ohloh.net/images/anon/anon80.gif" width="40" height="40"></td>
			<td class="commentType${i%3}">
				<div class="dateComment">Commented in ${comment.creationDate} by ${comment.author}</div>
				${comment.body}
			</td>
		</tr>
		</g:each>
	</table>
</div>