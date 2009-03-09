

package com.synergyj.codice.content

class ContentController {
    
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
        else { return [ contentInstance : contentInstance ] }
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
            return [ contentInstance : contentInstance ]
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

    def create = { ContentCommand cmd ->
        cmd.properties = params
        return ['contentInstance':cmd]
    }

    def save = {
        def contentInstance = new Content(params)
        if(!contentInstance.hasErrors() && contentInstance.save()) {
            flash.message = "Content ${contentInstance.id} created"
            redirect(action:show,id:contentInstance.id)
        }
        else {
            render(view:'create',model:[contentInstance:contentInstance])
        }
    }
}
