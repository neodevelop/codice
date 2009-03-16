import grails.test.*

class SimpleTagLibTests extends TagLibUnitTestCase {
	
    protected void setUp() {
        super.setUp()
		mockTagLib(SimpleTagLib)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testDateFormat() {
		def taglib = new SimpleTagLib()
		//taglib.dateFormat([format:"dd-MM-yyyy",date:"${new Date()}"],[])
    }
}
