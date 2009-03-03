package com.synergyj.codice.content

import com.synergyj.auth.User

class Content implements Serializable{
	
	User user
	String title
	String body
	Date created = new Date()
	Date lastUpdated =  new Date()
	Boolean allowComments
	
	static hasMany = [comments:Comment,tags:Tag]
	
	static constraints = {
		title nullable:false,size:5..128
		body nullable:false,maxSize:10000
	}
}
