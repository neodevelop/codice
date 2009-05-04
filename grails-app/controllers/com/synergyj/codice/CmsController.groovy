package com.synergyj.codice

import com.synergyj.codice.content.*

class CmsController {
    
    def index = { 

		params.max = Math.min( params.max ? params.max.toInteger() : 5,  100)
		params.order = 'desc'
		params.sort = 'created'
		
		servletContext['listTags'] = Content.allTags		
		
		//here goes a criteria search
		def criteria = Content.createCriteria()
		def lastContent = criteria.list {
			eq('publish',true)
			firstResult(params.offset?.toInteger() ?: 0)
			maxResults(3)
			order('priority','asc')
			order('created','desc')
		}
		def totalContents = Content.countByPublish(true)
        [ lastContent: lastContent,totalContents:totalContents ]
	}
}
