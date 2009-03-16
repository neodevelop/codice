class SimpleTagLib {
	def dateFormat = { attrs, body ->
		out << new java.text.SimpleDateFormat(attrs.format).format(attrs.date)
	}
}
