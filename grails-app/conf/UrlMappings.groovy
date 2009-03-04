class UrlMappings {
	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"/home"(controller:'cms',action:'index')
		"500"(view:'/error')
	}
}
