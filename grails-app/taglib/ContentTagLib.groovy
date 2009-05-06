import com.synergyj.codice.content.*
import java.text.SimpleDateFormat

class ContentTagLib {
	
	def news = { attrs, body ->
		def lastContent = Content.list(offset:0,max:5,sort:"created",order:"desc")
		lastContent.each{
			out << "<h3>"
			out << "	Publicado: ${new SimpleDateFormat("E, dd-MMM-yyyy").format(it?.created)}"
			out << "</h3>"
			out << "<span><a href='showContent/${it.id}'>${it.title}</a> </span>"
			
			if(it.textBody.length() > 200){
				out << "${it.textBody.substring(0,205)}..."
			}else{
				out << "${it.textBody}"
			}
		}
	}
	
	def comments = { attrs, body ->
		def lastComments = Comment.list(offset:0,max:5,sort:"creationDate",order:"desc")
		lastComments.each{
			out << "<h3>"
			out << "	Autor: ${it.author} -  ${new SimpleDateFormat("dd/MMM/yyyy hh:mm").format(it?.creationDate)}"
			out << "</h3>"
			if(it.textComment.length() > 200){
				out << "${it.textComment.substring(0,205)}..."
			}else{
				out << "${it.textComment}"
			}
		}
	}
}
