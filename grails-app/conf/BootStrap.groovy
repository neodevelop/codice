import com.synergyj.auth.User
import com.synergyj.auth.Role
import com.synergyj.auth.RequestMap
import org.grails.plugins.springsecurity.service.AuthenticateService
import com.synergyj.codice.Cms
import com.synergyj.codice.Menu
import com.synergyj.codice.MenuItem
import com.synergyj.codice.content.Content
import com.synergyj.codice.content.Comment
 
class BootStrap {

	def authenticateService

	def init = { servletContext ->
		if(User.count() == 0){

			User admin = new User( username:'admin',
			userRealName:'José Juan Reyes Zuñiga',
			email:'jjuan.reyes@synergyj.com',
			passwd:authenticateService.passwordEncoder('root'),
			enabled:true,
			emailShow:true )

			User registeredUser = new User(username:'user',
			userRealName:'Domingo Suarez Torres',
			email:'domingo.suarez@synergyj.com',
			passwd:authenticateService.passwordEncoder('codice'),
			enabled:true,
			emailShow:true )

			User registeredUser2 = new User(username:'marko',
			userRealName:'Marco A. Mu�iz Ochoa',
			email:'marco.muniz.ochoa@gmail.com',
			passwd:authenticateService.passwordEncoder('chicharo'),
			enabled:true,
			emailShow:true )

			Role userRole = new Role(authority:'ROLE_USER',description:'User CMS')
			userRole.save()

			Role managerRole = new Role(authority:'ROLE_MANAGER',description:'Manager CMS')
			managerRole.save()

			Role adminRole = new Role(authority:'ROLE_ADMIN',description:'Admin CMS')
			adminRole.save()

			new Role(authority:'IS_AUTHENTICATED_ANONYMOUSLY',description:'Anonymous user').save()
			new RequestMap(url:'/**',configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
			new RequestMap(url:'/createContent/**',configAttribute:'ROLE_USER').save()
			new RequestMap(url:'/editContent/**',configAttribute:'ROLE_USER').save()
			new RequestMap(url:'/deleteContent/**',configAttribute:'ROLE_ADMIN').save()
			new RequestMap(url:'/administerContent/**',configAttribute:'ROLE_ADMIN').save()
			new RequestMap(url:'/administerContent/**',configAttribute:'ROLE_MANAGER').save()
			new RequestMap(url:'/requestMap/**',configAttribute:'ROLE_ADMIN').save()
			new RequestMap(url:'/user/**',configAttribute:'ROLE_ADMIN').save()
			new RequestMap(url:'/role/**',configAttribute:'ROLE_ADMIN').save()
			new RequestMap(url:'/cms/**',configAttribute:'ROLE_ADMIN').save()
			new RequestMap(url:'/cms/search/**',configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
			new RequestMap(url:'/menu/**',configAttribute:'ROLE_MANAGER').save()
			new RequestMap(url:'/menuItem/**',configAttribute:'ROLE_MANAGER').save()

			admin
			.addToAuthorities(userRole)
			.addToAuthorities(managerRole)
			.addToAuthorities(adminRole)
			.save(flush:true)

			registeredUser
			.addToAuthorities(userRole)
			.save(flush:true)
			registeredUser2.
			addToAuthorities(userRole)
			.save(flush:true)

		}

		if(Content.count() == 0){
			println "Generating first content..."

			User user = User.findByUsername('admin')

			if(user){
				def cms = new Cms(name:'Grails.org.mx',
					domain:'http://grails.org.mx',
					slogan:'Armas contra la complejidad de JEE',
					admin:user,
					primaryLinks:new Menu(
						title:'main',priority:0,menuItems:[
							new MenuItem(title:'Home',description:'Main link',url:'http://grails.org.mx',priority:-5).save(),
							new MenuItem(title:'Other',description:'Main link',url:'http://grails.org.mx',priority:-4).save()
						]
					).save()).save()
			}else{
				println "There's not user to create content.."
			}
		}
	}
	def destroy = {
	}
} 
