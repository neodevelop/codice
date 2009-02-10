package org.synergyj.codice.content

class Comment {
	String author
	String body
	String mail
	Date creationDate = new Date()
	Boolean notifyResponses
	
	static belongsTo = [content:Content]
	
	static constraints = {
		author blank:false,maxSize:128
		body blank:false,maxSize:10000
		mail email:true,blank:false
	}
}
