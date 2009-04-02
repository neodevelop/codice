package com.synergyj.codice.content

import com.synergyj.auth.User
import com.synergyj.codice.content.Content
import com.synergyj.codice.Cms

class ContentController{

	def authenticateService

	def index = { redirect(action:list,params:params) }

	// the delete, save and update actions only accept POST requests
	static allowedMethods = [delete:'POST', save:'POST', update:'POST']

	def list = {
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		[ contentInstanceList: Content.list( params ), contentInstanceTotal: Content.count() ]
	}

	def show = { 
		def contentInstance = Content.get( params.id )
		if(!contentInstance) {
			flash.message = "Content not found !!!"
			redirect(controller:'cms')
		}
		else {
			def commentInstance = new CommentCommand(contentId:contentInstance.id)
			return [ contentInstance : contentInstance, commentInstance:commentInstance ] 
		}
	}
	
	def myContent = {
		def contentList =  Content.findAllByUser(authenticateService.userDomain())
		[ contentInstanceList:contentList ]
	}

	def delete = {
		def contentInstance = Content.get( params.id )
		if(contentInstance) {
			try {
				contentInstance.delete()
				flash.message = "Content ${params.id} deleted"
				redirect(action:list)
			}
			catch(org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "Content ${params.id} could not be deleted"
				redirect(action:show,id:params.id)
			}
		}
		else {
			flash.message = "Content not found with id ${params.id}"
			redirect(action:list)
		}
	}

	def edit = {
		def contentInstance = Content.get( params.id )

		if(!contentInstance) {
			flash.message = "Content not found with id ${params.id}"
			redirect(action:list)
		}
		else {
			def contentCommand = new ContentCommand()
			bindData(contentCommand,contentInstance.properties)
			contentCommand.tagList = contentInstance.tags.join(',')
			contentCommand.email = contentInstance.user.email
			contentCommand.author = contentInstance.user.userRealName
			return [ contentInstance : contentCommand ]
		}
	}

	def create = { 
		def cmd = new ContentCommand()
		if(params.contentType){
			cmd.contentType = params.contentType
		}else{
			cmd.contentType = "Cms entry"
		}
		cmd.author = authenticateService.userDomain().userRealName
		cmd.email = authenticateService.userDomain().email
		[contentInstance:cmd]
	}

	def save = { ContentCommand cmd ->
		def contentInstance = Content.get(cmd.id)
		if(contentInstance){
			//println "the content exist we must update"
			bindData(contentInstance,cmd.properties)
			contentInstance.lastUpdated = new Date()
			def tags = cmd.tagList.tokenize(',')
			def tagsAdd = tags-contentInstance.tags
			tagsAdd.each{ tag ->
				contentInstance.addTag(tag)
			}
			def tagsRemove = contentInstance.tags-tags
			tagsRemove.each{ tag ->
				contentInstance.removeTag(tag)
			}
			if(!contentInstance.hasErrors() && contentInstance.save()){
				//println "we must check content.optimistic.locking.failure"
				flash.message = "The content with the title '${contentInstance.title}' was sucesfully updated"
				redirect(action:show,id:contentInstance.id)
			}
			else{
				contentInstance.validate()
				render(view:'edit',model:[contentInstance:cmd])
			}
			//the content exist we must update
		}
		else{
			//is a new content so we must create
			if(!cmd.hasErrors()){
				//println "Cmd is correct now the bind..."
				contentInstance = new Content()
				bindData(contentInstance,cmd.properties)
				contentInstance.created = new Date()
				contentInstance.lastUpdated = new Date()
				contentInstance.user = User.findByEmail(cmd.email)
				//Save the entry in the cms, at the moment this is hard code
				Cms cms = Cms.get(1)
				contentInstance.cms = cms
				if(!contentInstance.hasErrors() && contentInstance.save()){
					contentInstance.parseTags(cmd.tagList)
					flash.message = "Your content with the title '${contentInstance.title}' was sucesfully created"
					redirect(action:show,id:contentInstance.id)
				}
				else{
					render(view:'create',model:[contentInstance:cmd])
				}
			}
			else{
				println "validation incorrect..."
				render(view:'create',model:[contentInstance:cmd])
			}
			//is a new content so we must create
		}
	}
}
