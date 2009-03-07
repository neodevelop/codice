package com.synergyj.codice

import com.synergyj.codice.content.Content

class CmsController {
    
    def index = { 
		params.max = 3
		params.sort = 'created'
		params.order = 'desc'
		[lastContent:Content.list(params)]
	}

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ cmsInstanceList: Cms.list( params ), cmsInstanceTotal: Cms.count() ]
    }

    def show = {
        def cmsInstance = Cms.get( params.id )

        if(!cmsInstance) {
            flash.message = "Cms not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ cmsInstance : cmsInstance ] }
    }

    def delete = {
        def cmsInstance = Cms.get( params.id )
        if(cmsInstance) {
            try {
                cmsInstance.delete()
                flash.message = "Cms ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Cms ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Cms not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def cmsInstance = Cms.get( params.id )

        if(!cmsInstance) {
            flash.message = "Cms not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ cmsInstance : cmsInstance ]
        }
    }

    def update = {
        def cmsInstance = Cms.get( params.id )
        if(cmsInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(cmsInstance.version > version) {
                    
                    cmsInstance.errors.rejectValue("version", "cms.optimistic.locking.failure", "Another user has updated this Cms while you were editing.")
                    render(view:'edit',model:[cmsInstance:cmsInstance])
                    return
                }
            }
            cmsInstance.properties = params
            if(!cmsInstance.hasErrors() && cmsInstance.save()) {
                flash.message = "Cms ${params.id} updated"
                redirect(action:show,id:cmsInstance.id)
            }
            else {
                render(view:'edit',model:[cmsInstance:cmsInstance])
            }
        }
        else {
            flash.message = "Cms not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def cmsInstance = new Cms()
        cmsInstance.properties = params
        return ['cmsInstance':cmsInstance]
    }

    def save = {
        def cmsInstance = new Cms(params)
        if(!cmsInstance.hasErrors() && cmsInstance.save()) {
            flash.message = "Cms ${cmsInstance.id} created"
            redirect(action:show,id:cmsInstance.id)
        }
        else {
            render(view:'create',model:[cmsInstance:cmsInstance])
        }
    }
}
