<head>
	<meta name="layout" content="main" />
	<title>User Profile</title>
</head>

<body>

	<div class="body">
		<h1>User Profile</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="dialog">
		<table>
		<tbody>

			<tr class="prop">
				<td valign="top" class="name">Login Name:</td>
				<td valign="top" class="value">${person.username?.encodeAsHTML()}</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name">Full Name:</td>
				<td valign="top" class="value">${person.userRealName?.encodeAsHTML()}</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name">Enabled:</td>
				<td valign="top" class="value">
					<g:if test="${person.enabled}">
						<span class="allow">Yes</span>
					</g:if>
					<g:else>
						<span class="disallow">No</span>
					</g:else>
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name">Email:</td>
				<td valign="top" class="value">${person.email?.encodeAsHTML()}</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name">Show Email:</td>
				<td valign="top" class="value">
					<g:if test="${person.emailShow}">
						<span class="allow">Yes</span>
					</g:if>
					<g:else>
						<span class="disallow">No</span>
					</g:else>
				</td>
			</tr>
			
		</tbody>
		</table>
		</div>

		<div class="buttons">
		<g:form>
			<input type="hidden" name="id" value="${person.id}" />
			<span class="button"><g:actionSubmit class='edit' value="Edit" /></span>
		</g:form>
		</div>

	</div>
</body>
