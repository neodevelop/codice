package com.synergyj.codice

import com.synergyj.codice.content.*

class CmsController {
    
    def index = { 
		params.max = Math.min( params.max ? params.max.toInteger() : 5,  100)
		params.order = 'desc'
		params.sort = 'created'
        [ lastContent: Content.list( params ) ]
	}
}
