

package com.synergyj.codice

class MenuController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ menuInstanceList: Menu.list( params ), menuInstanceTotal: Menu.count() ]
    }

    def show = {
        def menuInstance = Menu.get( params.id )

        if(!menuInstance) {
            flash.message = "Menu not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ menuInstance : menuInstance ] }
    }

    def delete = {
        def menuInstance = Menu.get( params.id )
        if(menuInstance) {
            try {
                menuInstance.delete(flush:true)
                flash.message = "Menu ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Menu ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Menu not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def menuInstance = Menu.get( params.id )

        if(!menuInstance) {
            flash.message = "Menu not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ menuInstance : menuInstance ]
        }
    }

    def update = {
        def menuInstance = Menu.get( params.id )
        if(menuInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(menuInstance.version > version) {
                    
                    menuInstance.errors.rejectValue("version", "menu.optimistic.locking.failure", "Another user has updated this Menu while you were editing.")
                    render(view:'edit',model:[menuInstance:menuInstance])
                    return
                }
            }
            menuInstance.properties = params
            if(!menuInstance.hasErrors() && menuInstance.save()) {
                flash.message = "Menu ${params.id} updated"
                redirect(action:show,id:menuInstance.id)
            }
            else {
                render(view:'edit',model:[menuInstance:menuInstance])
            }
        }
        else {
            flash.message = "Menu not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def menuInstance = new Menu()
        menuInstance.properties = params
        return ['menuInstance':menuInstance]
    }

    def save = {
        def menuInstance = new Menu(params)
        if(!menuInstance.hasErrors() && menuInstance.save()) {
            flash.message = "Menu ${menuInstance.id} created"
            redirect(action:show,id:menuInstance.id)
        }
        else {
            render(view:'create',model:[menuInstance:menuInstance])
        }
    }
}
