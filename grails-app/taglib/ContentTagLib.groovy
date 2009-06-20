import com.synergyj.codice.content.*
import java.text.SimpleDateFormat

class ContentTagLib {
	
	def news = { attrs, body ->
		def lastContent = Content.withCriteria{
			not{
				like("textBody","%<pre class=\"brush:%\">%")
			}
			firstResult 0
			maxResults 5
			order "created","desc"
		}
		Content.list()
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
		def lastComments = Comment.withCriteria{
			firstResult 0
			maxResults 5
			order "creationDate","desc"
		}
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
	
	def shortVersion = { attrs,body ->
		def keyword = attrs.keyword.replace('*','')
		def longVersion = attrs.longVersion
		def offset = longVersion.indexOf(keyword)
		def maxSize = attrs.maxSize.toInteger()
		def output
		if(offset>=maxSize && ((offset+maxSize)<longVersion.size()))
			output = longVersion.getAt(offset-maxSize..offset+maxSize)
		else if( ((offset+maxSize)>longVersion.size()) && (longVersion.size()>maxSize) )
			output = longVersion.getAt((offset-maxSize)..(longVersion.size()-1))
		else if(longVersion.size()<maxSize)
			output = longVersion
		else
			output = longVersion.getAt(0..offset+maxSize)
		out << "..." + output + "..."
	}
}
