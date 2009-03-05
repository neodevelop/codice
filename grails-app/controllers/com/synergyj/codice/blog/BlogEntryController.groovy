

package com.synergyj.codice.blog

class BlogEntryController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ blogEntryInstanceList: BlogEntry.list( params ), blogEntryInstanceTotal: BlogEntry.count() ]
    }

    def show = {
        def blogEntryInstance = BlogEntry.get( params.id )

        if(!blogEntryInstance) {
            flash.message = "BlogEntry not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ blogEntryInstance : blogEntryInstance ] }
    }

    def delete = {
        def blogEntryInstance = BlogEntry.get( params.id )
        if(blogEntryInstance) {
            try {
                blogEntryInstance.delete()
                flash.message = "BlogEntry ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "BlogEntry ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "BlogEntry not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def blogEntryInstance = BlogEntry.get( params.id )

        if(!blogEntryInstance) {
            flash.message = "BlogEntry not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ blogEntryInstance : blogEntryInstance ]
        }
    }

    def update = {
        def blogEntryInstance = BlogEntry.get( params.id )
        if(blogEntryInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(blogEntryInstance.version > version) {
                    
                    blogEntryInstance.errors.rejectValue("version", "blogEntry.optimistic.locking.failure", "Another user has updated this BlogEntry while you were editing.")
                    render(view:'edit',model:[blogEntryInstance:blogEntryInstance])
                    return
                }
            }
            blogEntryInstance.properties = params
            if(!blogEntryInstance.hasErrors() && blogEntryInstance.save()) {
                flash.message = "BlogEntry ${params.id} updated"
                redirect(action:show,id:blogEntryInstance.id)
            }
            else {
                render(view:'edit',model:[blogEntryInstance:blogEntryInstance])
            }
        }
        else {
            flash.message = "BlogEntry not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def blogEntryInstance = new BlogEntry()
        blogEntryInstance.properties = params
        return ['blogEntryInstance':blogEntryInstance]
    }

    def save = {
        def blogEntryInstance = new BlogEntry(params)
        if(!blogEntryInstance.hasErrors() && blogEntryInstance.save()) {
            flash.message = "BlogEntry ${blogEntryInstance.id} created"
            redirect(action:show,id:blogEntryInstance.id)
        }
        else {
            render(view:'create',model:[blogEntryInstance:blogEntryInstance])
        }
    }
}
