package com.synergyj.codice.content

class Tag {
	String name
	
	static belongsTo = Content
	static hasMany = [contents:Content]
}
