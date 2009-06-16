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
				def menu = new Menu(title:'Main Menu',priority:-5,).save()
				def menuItem = new MenuItem(title:'Home',description:'Home menu',url:'http://grails.org.mx/codice/',priority:-5,menu:menu).save()
				def cms = new Cms(name:'grails.org.mx',
						domain:'http://grails.org.mx',
						slogan:'Grails en tu idioma',admin:user,primaryLinks:menu).save(flush:true)
				
				println "Creating first post"
				
				def content = new Content(user:user,
						title:'Now, You can post content...', 
						allowComments:true,
						publish:true,
						contentType:'Entry',
						created:new Date()-1)
						
				content.textBody = """
					<p>The <b>CMS</b> is up and running, now you can post new contents and that will be 
					showed here in the main page, you can put tags to your new content and edit them
					when you want, remember that we have content only...Thks for use Codice :D</p>
					<p>Aenean vel tortor et ipsum pharetra tempus. Aliquam fermentum mi sit amet risus. 
					Aenean neque odio, dictum eu, varius in, ultrices eget, orci. Mauris porttitor mauris a felis. 
					Nam pulvinar tristique turpis. Morbi feugiat mi id mauris cursus feugiat. Sed non elit. Vivamus 
					mollis urna vel metus. Quisque feugiat. Donec facilisis dapibus massa. Nam dictum velit nec metus 
					luctus rutrum. Nullam varius pharetra massa. Pellentesque pellentesque, lacus sed varius vulputate, 
					odio sapien suscipit libero, fermentum tempus dui purus sit amet sapien. Duis luctus risus egestas nibh.
					 Morbi vel risus. Vestibulum dui. Praesent vitae turpis nec sapien aliquam ultricies. </p>
				"""
				cms.addToContents(content)
				content.save(flush:true)
				content
					.addTag("new")
					.addTag("sample")
				
				def comment = new Comment(author:'anonymous',
						body:'<p>Cool application the <b>CMS</b> is starting</p>',
						mail:'josejuan09830@yahoo.com',
						notifyResponses:true,
						content:content )
				comment.save(flush:true)
				
				def comment2 = new Comment(author:'mystic',mail:'josejuan09830@yahoo.com',notifyResponses:true,content:content)
				comment2.textComment = """
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been 
				the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of 
				type and scrambled it to make a type specimen book. It has survived not only five centuries, but also 
				the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s 
				with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop 
				publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
				"""
				comment2.save(flush:true)
				
				def content2 = new Content(user:user,title:'Welcome to Codice!!!',allowComments:true,publish:true,contentType:'Entry')
				content2.textBody = """
					<p>Codice is a Content Management System, is made in grails and you can use it
					to generate your own contents, in a future this CMS will support <b>Blogs, Timeline,
					Forums and more...</b></p>
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