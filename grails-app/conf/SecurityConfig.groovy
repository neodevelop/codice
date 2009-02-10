security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "org.synergyj.auth.User"
	authorityDomainClass = "org.synergyj.auth.Role"
	requestMapClass = "org.synergyj.auth.RequestMap"
	
	defaultRole = 'ROLE_USER'
	
	/** use RequestMap from DomainClass */
	useRequestMapDomainClass = true
	
	/**
	requestMapString = """
		CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
		PATTERN_TYPE_APACHE_ANT

		/login/**=IS_AUTHENTICATED_ANONYMOUSLY
		/cms/**=ROLE_USER
		/content/**=ROLE_SUPERVISOR
		/**=IS_AUTHENTICATED_ANONYMOUSLY
	"""
	**/
	
}
