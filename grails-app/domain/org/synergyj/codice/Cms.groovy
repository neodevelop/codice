package org.synergyj.codice

import org.synergyj.auth.User

class Cms {
	String name
	String domain
	String slogan
	User admin
	
	static constraints ={
		name blank:false,unique:true,size:5..50
		domain blank:false,unique:true,size:5..50
	}
}
