<head>
	<meta name="layout" content="home" />	
	<title>. : Welcome to Codice - the Grails CMS : .</title>
</head>

<body>
	<g:if test='${flash.message}'>
		<div class='message'>${flash.message}</div>
	</g:if>
	
	<g:each in="${contentInstanceList}" status="i" var="content">
		<h2><g:link action="show" controller="content" id="${content.id}">${content?.title}</g:link></h2>
		<div class="dateStyle3">
			<div class="date3">
				Creado <g:dateFormat format="dd-MM-yyyy hh:mm a" date="${content?.created}" /> 
				por ${content?.user?.username}
			</div>
		</div>
		<div class="tags">
			<g:each in="${content?.tags}" var="tag">
				<span class="tag"><g:link action="list" controller="tag" id="${tag}">${tag}</g:link></span>
			</g:each>
		</div>
		<div class="textBody">
			${content?.textBody}
		</div>
		<div class="comments">
			<div class="commentsActions">${content?.comments?.size()} Comments</div>
		</div>
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