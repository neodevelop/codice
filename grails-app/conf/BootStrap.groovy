import com.synergyj.auth.User
import com.synergyj.auth.Role
import com.synergyj.auth.RequestMap
import org.grails.plugins.springsecurity.service.AuthenticateService
import com.synergyj.codice.Cms
import com.synergyj.codice.content.Content

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
			new RequestMap(url:'/createContent',configAttribute:'ROLE_USER').save()

			admin
				.addToAuthorities(userRole)
				.addToAuthorities(managerRole)
				.addToAuthorities(adminRole)
				.save(flush:true)
			registeredUser
				.addToAuthorities(userRole)
				.save(flush:true)
		}

		if(Content.count() == 0){
			println "Generating first content..."
			User user = User.findByUsername('admin')
			if(user){
				def cms = new Cms(name:'grails.org.mx',domain:'http://grails.org.mx',slogan:'Grails en tu idioma',admin:user)
				cms.save(flush:true)
				println "Creating first post"
				def content = new Content(user:user,title:'Now, You can post content...',allowComments:true,publish:true,showInMainPage:true,contentType:'content')
				content.textBody = """
					The CMS is up and running, now you can post new contents and that will be 
					showed here in the main page, you can put tags to your new content and edit them
					when you want, remember that we have content only...Thks for use Codice :D
				"""
				cms.addToContents(content)
				content.save(flush:true)
				content
					.addTag("new")
					.addTag("sample")
				content.save(flush:true)
				println content.tags
				
				
				println "Creating second post"
				def content2 = new Content(user:user,title:'Welcome to Codice!!!',allowComments:true,publish:true,showInMainPage:true,contentType:'content')
				content2.textBody = """
					Codice is a Content Management System, is made in grails and you can use it
					to generate your own contents, in a future this CMS will support Blogs, Timeline,
					Forums and more...
				"""
				
				cms.addToContents(content2)
				content2.save(flush:true)
				
				content2
					.addTag("first")
					.addTag("sample")
				content2.save(flush:true)
				println content2.tags
				
				println "Posts created..."
			}else{
				println "There's not user to create content.."
			}
		}

	}
	def destroy = {
	}
} 