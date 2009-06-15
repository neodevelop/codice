package com.synergyj.codice

class MenuItem {
	
	String title
	String description
	String url
	Integer priority = 0
	Menu menu

    static constraints = {
		title nullable:false,blank:false
		description()
		url nullable:false,blank:false,url:true
		priority range:-5..5
    }

	String toString(){
		title
	}
}
