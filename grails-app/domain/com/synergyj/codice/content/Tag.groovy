package com.synergyj.codice.content

class Tag {
	String name
	
	static belongsTo = [content:Content]
	
	static constraints = {
		name blank:false,unique:true
		content nullable:true
	}
}
