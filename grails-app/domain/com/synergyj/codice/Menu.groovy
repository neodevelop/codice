package com.synergyj.codice

class Menu {
	
	String title
	Integer priority = 0
	
	static hasMany = [menuItems:MenuItem]

    static constraints = {
		title nullable:false,blank:false
    }

	String toString(){
		title
	}
}
