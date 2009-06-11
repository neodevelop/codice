package com.synergyj.codice

class MenuItem {
	
	String title
	String description
	String ruta
	Integer priority

    static constraints = {
		title nullable:false,blank:false
		description()
		ruta nullable:false,blank:false,url:true
		priority range:-5..5
    }
}
