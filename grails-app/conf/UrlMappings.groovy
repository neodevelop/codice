class UrlMappings {
	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"/"(controller:'cms',action:'index')
		"/home"(controller:'cms',action:'index')
		"/register"(controller:'register',action:'index')
		"500"(view:'/error')
	}
}
