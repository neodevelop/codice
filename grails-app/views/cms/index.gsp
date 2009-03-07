<head>
	<meta name="layout" content="home" />
	<title>. : Welcome to Codice - the Grails CMS : .</title>
</head>

<body>
	<g:if test='${flash.message}'>
		<div class='message'>${flash.message}</div>
	</g:if>
	<g:each in="${lastContent}" status="i" var="content">
		
	
	<h2>${content.title}</h2>
	<p class="rightTxt1">
		${content.body}
	</p>
	</g:each>
	
	<ul>
      <g:each var="c" in="${grailsApplication.controllerClasses}">
            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
      </g:each>
    </ul>
</body>