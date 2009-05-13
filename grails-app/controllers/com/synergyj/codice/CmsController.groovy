package com.synergyj.codice

import com.synergyj.codice.content.*

class CmsController {
    
    def index = { 
	
		//we obtain the tags
		def allTags = Content.allTags
		def contentTags = [:]
		allTags.each{ tag ->
			contentTags.put(tag,Content.countByTag(tag).toInteger()*5)
		}
		servletContext['contentTags'] = contentTags
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
