security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "org.synergyj.auth.User"
	authorityDomainClass = "org.synergyj.auth.Role"
	requestMapClass = "org.synergyj.auth.RequestMap"
	
	defaultRole = 'ROLE_USER'
	
	/** use RequestMap from DomainClass */
	useRequestMapDomainClass = true
	
}
