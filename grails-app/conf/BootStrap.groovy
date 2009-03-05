import com.synergyj.auth.Role
import com.synergyj.auth.RequestMap

class BootStrap {

	def init = { servletContext ->
		new Role(authority:'ROLE_USER',description:'User CMS').save()
		new Role(authority:'ROLE_MANAGER',description:'Manager CMS').save()
		new Role(authority:'ROLE_ADMIN',description:'Admin CMS').save()
		new Role(authority:'IS_AUTHENTICATED_ANONYMOUSLY',description:'Anonymous user').save()
		new RequestMap(url:'/**',configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new RequestMap(url:'/content/create',configAttribute:'ROLE_USER').save()
	}
	def destroy = {
	}
} 