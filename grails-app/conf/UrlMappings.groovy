class UrlMappings {
	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		/***
		Home and Register URL's
		***/
		"/"(controller:'cms',action:'index')
		"/home"(controller:'cms',action:'index')
		"/register"(controller:'register',action:'index')
		/***
		Content mapping
		***/
		"/createContent"(controller:'content',action:'create')
		"/showContent/$id"(controller:'content',action:'show')
		/***
		Error mapping
		***/
		"500"(view:'/error')
	}
}
