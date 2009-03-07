<head>
	<meta name="layout" content="home" />
	<title>. : Welcome to Codice - the Grails CMS : .</title>
</head>

<body>
	<g:if test='${flash.message}'>
		<div class='message'>${flash.message}</div>
	</g:if>
	<g:each in="${lastContent}" status="i" var="content">
		${content.title}
	</g:each>
	<h2>About Jet 30</h2>
	<p class="rightTxt1">Jet 30 is a <span>free, tableless, W3C-compliant</span> web design layout by Template World. This template has been tested and proven compatible with all major browser environments and operating systems. You are free to modify the design to suit your tastes in any way you like.</p>
	<p class="rightTxt1">We only ask you to not remove "Design by Template World" and the link http://www.templateworld.com from the footer of the template.<br /><br /> <span>These templates are licensed under a Creative Commons Attribution 2.5 License.</span> This means that you are free to modify the design to suit your tastes in any way you like, but you must include the provided link back to Template World.</p>
</body>