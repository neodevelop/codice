package com.synergyj.codice

import com.synergyj.codice.content.*

class CmsController {
    
    def index = { 
		//here goes a criteria search
		def lastContent = Content.withCriteria {
			eq('publish',true)
			maxResults(5)
			order('priority','asc')
			order('created','desc')
		}
        [ lastContent: lastContent ]
	}
}
