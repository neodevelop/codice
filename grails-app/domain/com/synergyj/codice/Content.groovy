package com.synergyj.codice

import org.grails.comments.*
import org.grails.taggable.*

class Content implements Commentable,Taggable{
	
	User user
	String title
	String textBody
	Date created = new Date()
	Date lastUpdated =  new Date()
	Boolean allowComments
	Boolean publish
	//String contentType
	Integer priority = 0
	
	static constraints = {
		title nullable:false,size:5..128
		textBody nullable:false,maxSize:10000
		priority range:-5..5
	}
}
