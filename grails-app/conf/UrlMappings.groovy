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
		"/logout"(controller:'logout',action:'index')
		/***
		Content mapping
		***/
		"/createContent/$contentType?"(controller:'content',action:'create')
		"/showContent/$id"(controller:'content',action:'show')
		"/editContent/$id"(controller:'content',action:'edit')
		"/deleteContent/$id"(controller:'content',action:'delete')
		"/saveContent"(controller:'content',action:'save')
		"/myContent"(controller:'content',action:'my')
		"/administerContent"(controller:'content',action:'administer')
		"/feedContents"(controller:'feed',action:'content')
		//Added by markitox...
		"/tagList/$id"(controller:'tag',action:'list')
		"/tagList"(controller:'cms',action:'index')
		//Added by markitox...
		/***
		Commment mapping
		***/
		"/commentSave"(controller:'comment',action:'save')
		"/feedComments"(controller:'feed',action:'comment')
		/***
		Error mapping
		***/
		"500"(view:'/error')
		"404"(controller:'cms',action:'error')
	}
}
