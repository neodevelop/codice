package com.synergyj.codice.content

import com.synergyj.auth.User
import com.synergyj.codice.content.*
import com.synergyj.codice.Cms


class Content implements Serializable{
	
	User user
	String title
	String body
	Date created
	Date lastUpdated
	Boolean allowComments
	Boolean publish
	Boolean showInMainPage
	String contentType
	String tags
	
	static constraints = {
		title nullable:false,size:5..128
		body nullable:false,maxSize:10000
		contentType inList:['Content','Blog','News']
	}
}
