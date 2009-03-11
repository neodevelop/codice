package com.synergyj.codice.content

import grails.test.*
import com.synergyj.auth.*
import com.synergyj.codice.Cms

class ContentTests extends GrailsUnitTestCase {
	
    protected void setUp() {
        super.setUp()
		mockDomain(Content)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testTitleConstraint() {		
		def c = new Content()
		assertFalse c.validate()
		assertEquals c.errors.title,'nullable'
		c.title = "Hi!"
		assertFalse c.validate()
		assertEquals c.errors.title,'size'
		c.title = "Hi! this is my first post..."
    }

	void testBodyContent() {
		def c = new Content(title:'Hi! this is the title...')
		assertFalse c.validate()
		assertEquals c.errors.body,'nullable'
	}
	
}
