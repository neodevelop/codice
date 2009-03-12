<head>
	<meta name="layout" content="home" />
	<title>. : Welcome to Codice - the Grails CMS : .</title>
</head>

<body>
	<g:if test='${flash.message}'>
		<div class='message'>${flash.message}</div>
	</g:if>
	<g:each in="${lastContent}" status="i" var="content">
		<h2><g:link action="show" controller="content" id="${content.id}">${content?.title}</g:link></h2>
		<h5><div class="date1">Created ${fieldValue(bean:content, field:'created')} by ${content?.user?.username}</div></h5>
		<h4><div class="tag">Tags: ${content?.tags}</div></h4>
		<div class="textBody">
			${content?.textBody}
		</div>
		<h6><div class="comments1">${content?.comments?.size()} Comments</div></h6>
		<br/>
	</g:each>
	<!--
	<ul>
      <g:each var="c" in="${grailsApplication.controllerClasses}">
            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
      </g:each>
    </ul>
	-->
</body>