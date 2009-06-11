package com.synergyj.codice

import com.synergyj.codice.content.*

class CmsController {
	
	def scaffold = Cms
    
    def index = { 
		
		//we obtain the tags
		def allTags = Content.allTags
		def contentTags = [:]
		allTags.each{ tag ->
			contentTags.put(tag,Content.countByTag(tag).toInteger()*5)
		}
		
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
	
	def error = {
		def message = """
		Page not found....<br/>
		Details:<br/>
		Error ${request.'javax.servlet.error.status_code'}: ${request.'javax.servlet.error.message'.encodeAsHTML()}<br/>
		Servlet: ${request.'javax.servlet.error.servlet_name'}<br/>
		URI:</strong> ${request.'javax.servlet.error.request_uri'}<br/>
		"""
		if(exception){
			println "${exception.message}"
		}
		flash.message = message
		redirect(action:'index',params:params)
	}
}
