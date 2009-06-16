package com.synergyj.codice.content

class Comment {
	
	static searchable = [only:['textComment']]
	
	String author
	String textComment
	String mail
	Date creationDate = new Date()
	Boolean notifyResponses
	
	static belongsTo = [content:Content]
	
	static constraints = {
		author blank:false,maxSize:128
		textComment blank:false,maxSize:10000
		mail email:true,blank:false
	}
}
