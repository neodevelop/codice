package org.synergyj.auth

class User {
	String userName
	String password
	String fullName
	String mail
	Date created = new Date()
	Date lastLogin = new Date()
	
	static constraints = {
		userName blank:false,unique:true,size:5..50
		password blank:false,size:5..50
		fullName blank:false,size:5..100
		mail email:true,blank:false
	}
	
	String toString(){
		userName
	}
}
