class MyUrlMappingsTests extends grails.test.GrailsUrlMappingsTestCase {
	
	static mappings = [UrlMappings]
	
	void testHomeMapping() {
		assertForwardUrlMapping('/home',controller:'cms',action:'index')
	}
	
	void testRegisterMapping(){
		assertForwardUrlMapping('/register',controller:'register',action:'index')
	}
	
}