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
            flash.message = "Content not found with id ${params.id}"
            redirect(action:list)
        }
        else { 
			def commentInstance = new CommentCommand(contentId:contentInstance.id)
			return [ contentInstance : contentInstance, commentInstance:commentInstance ] 
		}
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

    def update = {
        def contentInstance = Content.get( params.id )
        if(contentInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(contentInstance.version > version) {
                    
                    contentInstance.errors.rejectValue("version", "content.optimistic.locking.failure", "Another user has updated this Content while you were editing.")
                    render(view:'edit',model:[contentInstance:contentInstance])
                    return
                }
            }
            contentInstance.properties = params
            if(!contentInstance.hasErrors() && contentInstance.save()) {
                flash.message = "Content ${params.id} updated"
                redirect(action:show,id:contentInstance.id)
            }
            else {
                render(view:'edit',model:[contentInstance:contentInstance])
            }
        }
        else {
            flash.message = "Content not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = { 
		def cmd = new ContentCommand()
		cmd.author = authenticateService.userDomain().userRealName
		cmd.email = authenticateService.userDomain().email
		[contentInstance:cmd]
    }

    def save = { ContentCommand cmd ->
		if(!cmd.hasErrors()){
			//println "Cmd is correct now the bind..."
			def contentInstance = new Content()
			bindData(contentInstance,cmd.properties)
			contentInstance.created = new Date()
			contentInstance.lastUpdated = new Date()
			contentInstance.user = User.findByEmail(cmd.email)
			contentInstance.contentType = 'Page entry'
			//Save the entry in the cms, at the moment this is hard code
			Cms cms = Cms.get(1)
			contentInstance.cms = cms
			if(!contentInstance.hasErrors() && contentInstance.save()){
				contentInstance.parseTags(cmd.tagList)
				flash.message = "Your content with the title '${contentInstance.title}' was sucesfully created"
				redirect(action:show,id:contentInstance.id)
			}else{
				render(view:'create',model:[contentInstance:cmd])
			}
		}
		else{
			println "validation incorrect..."
			render(view:'create',model:[contentInstance:cmd])
		}
    }
}

