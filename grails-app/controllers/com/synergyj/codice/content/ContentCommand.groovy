package com.synergyj.codice.content

import com.synergyj.auth.User
import com.synergyj.codice.content.*
import com.synergyj.codice.Cms


class ContentCommand{
	
	String email
	String title
	String body
	Boolean allowComments
	Boolean publish
	Boolean showInMainPage
	String tagList
	
	static constraints = {
		email nullable:false,blank:false,email:true
		title nullable:false,size:5..128,blank:false
		body nullable:false,maxSize:10000,blank:false
	}
}
