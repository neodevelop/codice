

package com.synergyj.codice

class MenuItemController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ menuItemInstanceList: MenuItem.list( params ), menuItemInstanceTotal: MenuItem.count() ]
    }

    def show = {
        def menuItemInstance = MenuItem.get( params.id )

        if(!menuItemInstance) {
            flash.message = "MenuItem not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ menuItemInstance : menuItemInstance ] }
    }

    def delete = {
        def menuItemInstance = MenuItem.get( params.id )
        if(menuItemInstance) {
            try {
                menuItemInstance.delete(flush:true)
                flash.message = "MenuItem ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "MenuItem ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "MenuItem not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def menuItemInstance = MenuItem.get( params.id )

        if(!menuItemInstance) {
            flash.message = "MenuItem not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ menuItemInstance : menuItemInstance ]
        }
    }

    def update = {
        def menuItemInstance = MenuItem.get( params.id )
        if(menuItemInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(menuItemInstance.version > version) {
                    
                    menuItemInstance.errors.rejectValue("version", "menuItem.optimistic.locking.failure", "Another user has updated this MenuItem while you were editing.")
                    render(view:'edit',model:[menuItemInstance:menuItemInstance])
                    return
                }
            }
            menuItemInstance.properties = params
            if(!menuItemInstance.hasErrors() && menuItemInstance.save()) {
                flash.message = "MenuItem ${params.id} updated"
                redirect(action:show,id:menuItemInstance.id)
            }
            else {
                render(view:'edit',model:[menuItemInstance:menuItemInstance])
            }
        }
        else {
            flash.message = "MenuItem not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def menuItemInstance = new MenuItem()
        menuItemInstance.properties = params
        return ['menuItemInstance':menuItemInstance]
    }

    def save = {
        def menuItemInstance = new MenuItem(params)
        if(!menuItemInstance.hasErrors() && menuItemInstance.save()) {
            flash.message = "MenuItem ${menuItemInstance.id} created"
            redirect(action:show,id:menuItemInstance.id)
        }
        else {
            render(view:'create',model:[menuItemInstance:menuItemInstance])
        }
    }
}
