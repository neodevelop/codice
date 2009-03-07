import com.synergyj.auth.User
import com.synergyj.auth.Role
import com.synergyj.auth.RequestMap
import org.grails.plugins.springsecurity.service.AuthenticateService
import com.synergyj.codice.Cms
import com.synergyj.codice.content.Content
import com.synergyj.codice.content.Tag

class BootStrap {

	def authenticateService

	def init = { servletContext ->
		if(User.count() == 0){
			User admin = new User(username:'admin',userRealName:'José Juan Reyes Zuñiga',email:'jjuan.reyes@synergyj.com',passwd:authenticateService.passwordEncoder('root'),enabled:true,emailShow:true)
			User registeredUser = new User(username:'user',userRealName:'Domingo Suarez Torres',email:'domingo.suarez@synergyj.com',passwd:authenticateService.passwordEncoder('codice'),enabled:true,emailShow:true)
			Role userRole = new Role(authority:'ROLE_USER',description:'User CMS')
			userRole.save()
			Role managerRole = new Role(authority:'ROLE_MANAGER',description:'Manager CMS')
			managerRole.save()
			Role adminRole = new Role(authority:'ROLE_ADMIN',description:'Admin CMS')
			adminRole.save()
			new Role(authority:'IS_AUTHENTICATED_ANONYMOUSLY',description:'Anonymous user').save()
			new RequestMap(url:'/**',configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
			new RequestMap(url:'/content/create',configAttribute:'ROLE_USER').save()

			admin
				.addToAuthorities(userRole)
				.addToAuthorities(managerRole)
				.addToAuthorities(adminRole)
				.save(flush:true)
			registeredUser
				.addToAuthorities(userRole)
				.save(flush:true)
			new Cms(name:'grails.org.mx',domain:'http://grails.org.mx',slogan:'Grails en tu idioma',admin:admin).save()
		}

		if(Content.count() == 0){
			println "Generating first content..."
			User user = User.findByUsername('user')
			if(user){
				def content = new Content(user:user,title:'Welcome to Codice!!!',allowComments:true,publish:true,showInMainPage:true)
				content.body = """
					Codice is a Content Management System, is made in grails and you can use it
					to generate your own contents, in a future this CMS will support Blogs, Timeline,
					Forums and more...
				"""
				content
					.addToTags(new Tag(name:'sample'))
					.addToTags(new Tag(name:'first'))
				content.save(flush:true)
			}else{
				println "There's not user to create content.."
			}
		}

	}
	def destroy = {
	}
} 