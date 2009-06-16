package com.synergyj.codice.content

import com.synergyj.auth.User
import com.synergyj.codice.content.*
import com.synergyj.codice.Cms
import org.grails.taggable.*

class Content implements Taggable{
	
	static searchable = [only:['title']]
	
	User user
	String title
	String textBody
	Date created = new Date()
	Date lastUpdated =  new Date()
	Boolean allowComments
	Boolean publish
	String contentType
	Integer priority = 0
	
	static hasMany = [comments:Comment]
	static belongsTo = [cms:Cms]
	
	static constraints = {
		title nullable:false,size:5..128
		textBody nullable:false,maxSize:10000
		priority range:-5..5
	}
}
