import java.text.SimpleDateFormat

class SimpleTagLib {
	def dateFormat = { attrs, body ->
		if(attrs.date instanceof java.sql.Timestamp){
			out << new SimpleDateFormat(attrs.format).format(attrs.date)
		}
		if(attrs.date instanceof String){
			if(attrs.date =~ /^[A-Za-z]/){
				out << new SimpleDateFormat(attrs.format).format(new Date())
			}else{
				def sdf = new SimpleDateFormat('yyyy-MM-dd H:m:s.S').parse(attrs.date)
				out << new SimpleDateFormat(attrs.format).format(sdf)
			}
		}
	}
}
