package com.synergyj.codice.content

class FeedController {

    def content = {
		//render "${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/feedContents/"
		
		render(feedType:"rss", feedVersion:"2.0") {
			title = "The Codice's Feed"
			link = "${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/feedContent/"
			description = "The funky Codice news feed"

			Content.list().sort { c1,c2 -> c2.id - c1.id }.each() { content -> 
				entry(content.title) { 
					link = "${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/showContent/${content.id}" 
					content.textBody // return the content 
				} 
			}
		}
		
	}
	
	def comment = {
		//render "${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/feedContents/"
		
		render(feedType:"rss", feedVersion:"2.0") {
			title = "The Codice's Feed for Comments"
			link = "${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/feedComments/"
			description = "The funky Codice news feed"

			Comment.list().sort { c1,c2 -> c2.id - c1.id }.each() { comment -> 
				entry(comment.content.title) { 
					link = "${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/showContent/${comment.content.id}" 
					author = comment.author
					comment.textComment // return the content 
				} 
			}
		}
		
	}
}
