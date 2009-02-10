package org.synergyj.auth

import org.synergyj.auth.Role

/**
 * User domain class.
 */
class User {
	static transients = ['pass']
	static hasMany = [authorities: Role]
	static belongsTo = Role

	/** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd
	/** enabled */
	Boolean enabled = true

	String email
	Boolean emailShow

	/** description */
	String description = ''

	/** plain password to create a MD5 password */
	String pass = ''
	
	Date created = new Date()
	Date lastLogin = new Date()

	static constraints = {
		username(blank: false, unique: true)
		userRealName(blank: false)
		passwd(blank: false)
		enabled()
	}
}
