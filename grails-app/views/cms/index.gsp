<head>
	<meta name="layout" content="home" />
	<title>. : Welcome to Codice - the Grails CMS : .</title>
</head>

<body>
	<g:if test='${flash.message}'>
		<div class='message'>${flash.message}</div>
	</g:if>
	<g:each in="${lastContent}" status="i" var="content">
		<h2>${content?.title}</h2>
		<h5>Created ${fieldValue(bean:content, field:'created')} by ${content?.user?.username}</h5>
		<h4><div class="tag">Tags: ${content?.tags}</div></h4>
		<div class="textBody">
			${content?.textBody}
		</div>
		<h5>Last update: ${fieldValue(bean:content, field:'lastUpdated')}</h5>
		</br>
	</g:each>
	<!--
	<ul>
      <g:each var="c" in="${grailsApplication.controllerClasses}">
            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
      </g:each>
    </ul>
	-->
</body>