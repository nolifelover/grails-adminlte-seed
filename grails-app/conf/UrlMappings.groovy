class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
				"/dashboard"(view:"/dashboard")
        "500"(view:'/error')
	}
}
