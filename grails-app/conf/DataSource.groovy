dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "root"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			//url = "jdbc:mysql://localhost:3306/codice_dev"
			url = "jdbc:hsqldb:file:devDb;shutdown=true"
			username = "sa"
			password = ""
			driverClassName = "org.hsqldb.jdbcDriver"
			
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "codice"
			password = "c0d1c3"
			url = "jdbc:mysql://localhost:3306/codice"
		}
	}
}