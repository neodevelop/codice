package com.synergyj.codice.content

import com.synergyj.auth.User
import com.synergyj.codice.content.*
import com.synergyj.codice.Cms


class ContentCommand{
	
	Long id
	String author
	String email
	String title
	String textBody
	Boolean allowComments = true
	Boolean publish = true
	Boolean showInMainPage = true
	String tagList
	String contentType
	Integer priority
	
	static constraints = {
		email nullable:false,blank:false,email:true
		title nullable:false,size:5..128,blank:false
		textBody nullable:false,maxSize:10000,blank:false
		priority min:-5,max:5
	}
}
