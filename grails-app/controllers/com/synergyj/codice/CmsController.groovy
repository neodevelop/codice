package com.synergyj.codice

import com.synergyj.codice.content.*

class CmsController {
    
    def index = { 
/*
<<<<<<< HEAD:grails-app/controllers/com/synergyj/codice/CmsController.groovy
		//added by markitox
		servletContext['listTags'] = Content.allTags
=======
*/		
		//we obtain the tags
		def allTags = Content.allTags
		def contentTags = [:]
		allTags.each{ tag ->
			contentTags.put(tag,Content.countByTag(tag).toInteger()*5)
		}
//>>>>>>> 072488f75f686631e065be2c8c69536252c21317:grails-app/controllers/com/synergyj/codice/CmsController.groovy
		
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
        [ lastContent: lastContent,totalContents:totalContents,contentTags:contentTags ]
	}
}
