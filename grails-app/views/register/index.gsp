<head>
	<meta name="layout" content="main" />
	<title>Registro Usuario</title>
</head>

<body>
	<div class="body">
		<h1>Registro Usuario</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${person}">
		<div class="errors">
			<g:renderErrors bean="${person}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save">
		<div class="dialog">
		<table>
		<tbody>
			<tr class='prop'>
				<td valign='top' class='name'><label for='username'>Nombre Usuario:</label></td>
				<td valign='top' class='value ${hasErrors(bean:person,field:'username','errors')}'>
					<input type="text" name='username' value="${person?.username?.encodeAsHTML()}"/>
				</td>
			</tr>

			<tr class='prop'>
				<td valign='top' class='name'><label for='userRealName'>Nombre Completo:</label></td>
				<td valign='top' class='value ${hasErrors(bean:person,field:'userRealName','errors')}'>
					<input type="text" name='userRealName' value="${person?.userRealName?.encodeAsHTML()}"/>
				</td>
			</tr>

			<tr class='prop'>
				<td valign='top' class='name'><label for='passwd'>Password:</label></td>
				<td valign='top' class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
					<input type="password" name='passwd' value="${person?.passwd?.encodeAsHTML()}"/>
				</td>
			</tr>

			<tr class='prop'>
				<td valign='top' class='name'><label for='enabled'>Confirmar Password:</label></td>
				<td valign='top' class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
					<input type="password" name='repasswd' value="${person?.passwd?.encodeAsHTML()}"/>
				</td>
			</tr>

			<tr class='prop'>
				<td valign='top' class='name'><label for='email'>Email:</label></td>
				<td valign='top' class='value ${hasErrors(bean:person,field:'email','errors')}'>
					<input type="text" name='email' value="${person?.email?.encodeAsHTML()}"/>
				</td>
			</tr>

			<tr class='prop'>
				<td valign='bottom' class='name'><label for='code'>Ingrese el codigo: </label></td>
				<td valign='top' class='name'>
					<input type="text" name="captcha" size="8"/>
					<img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
				</td>
			</tr>

		</tbody>
		</table>
		</div>

		<div class="buttons">
			<span class="formButton">
				<input class='save' type="submit" value="Crear Usuario"></input>
			</span>
		</div>

		</g:form>
	</div>
</body>
