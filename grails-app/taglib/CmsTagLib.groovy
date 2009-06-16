import com.synergyj.codice.Cms

class CmsTagLib {

	static namespace = 'cms'
	
	def primaryLinks  = { attrs, body ->
		def cms = Cms.get(1)
		if(cms) {
			out << "<ul>"
			cms.primaryLinks.menuItems.sort { m1,m2 -> m1.priority - m2.priority }.each{ item ->
				out << "<li><a href='${item.url}'>${item.title}</a></li>"
			}
			out << body()
			out << "</ul>"
		}
		
	}
}
