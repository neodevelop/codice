class MyUrlMappingsTests extends grails.test.GrailsUrlMappingsTestCase {
	
	static mappings = [UrlMappings]
	
	void testHome() {
		assertForwardUrlMapping('/home',controller:'cms',action:'index')
	}
	
}