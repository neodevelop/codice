security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "com.synergyj.auth.User"
	authorityDomainClass = "com.synergyj.auth.Role"
	requestMapClass = "com.synergyj.auth.RequestMap"
	
	defaultRole = 'ROLE_USER'
	
	/** use RequestMap from DomainClass */
	useRequestMapDomainClass = true
	
}
