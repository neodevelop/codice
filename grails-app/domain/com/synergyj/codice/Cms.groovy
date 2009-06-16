/*
 * Copyright 2002-2008 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.synergyj.codice

import com.synergyj.auth.User
import com.synergyj.codice.content.*

class Cms {
	String name
	String domain
	String slogan
	User admin
	Menu primaryLinks
	
	static hasMany = [contents:Content]
	
	static constraints ={
		name blank:false,unique:true,size:5..50
		domain blank:false,unique:true,size:5..50
	}
}
