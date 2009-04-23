package com.synergyj.codice

import com.synergyj.codice.content.*

class CmsController {
    
    def index = { 
		//here goes a criteria search
		def criteria = Content.createCriteria()
		def lastContent = criteria.list {
			eq('publish',true)
			maxResults(5)
			order('priority','asc')
			order('created','desc')
		}
        [ lastContent: lastContent ]
	}
}
