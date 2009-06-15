package com.synergyj.codice.content

import java.text.SimpleDateFormat

class FeedController {

    def content = {
		//render "${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/feedContents/"
		
		render(feedType:"rss", feedVersion:"2.0") {
			title = "The Codice's Feed"
/*
		Check this proposal
			link = g.createLink(controller:'feed', action:'content', absolute: true)
*/
			link = "${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/feedContent/"
			description = "The funky Codice news feed"

			Content.list().sort { c1,c2 -> c2.id - c1.id }.each() { content -> 
				entry(content.title) { 
					publishedDate = content.created
/*{
		Check this proposal
			link = g.createLink(controller:'content', action:'show', id:"${content.id}", absolute: true)
*/
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
/*
		Check this proposal
			link = g.createLink(controller:'feed', action:'comment', absolute: true)
*/
			link = "${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/feedComments/"
			description = "The funky Codice news feed"

			Comment.list().sort { c1,c2 -> c2.id - c1.id }.each() { comment -> 
				entry(comment.content.title) { 
					publishedDate = comment.creationDate
/*{
		Check this proposal
			link = g.createLink(controller:'content', action:'show', id:"${content.id}", absolute: true)
*/
					link = "${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/showContent/${comment.content.id}" 
					author = comment.author
					comment.textComment // return the content 
				} 
			}
		}
		
	}
}
